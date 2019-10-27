From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 19:24:27 +0100
Subject: [Buildroot] [git commit] package/libsigrok: fix configure options
Message-ID: <20191027181820.BC9F88A403@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01b30e5d69f080853731736336298f6f0fdf24ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove --disable-glibtest (unrecognized option)
- Switch --{en,dis}able-xxx options by --{with,without}-xxx options

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsigrok/libsigrok.mk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index 5bca9ad518..c65d63eb2a 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -10,27 +10,27 @@ LIBSIGROK_LICENSE = GPL-3.0+
 LIBSIGROK_LICENSE_FILES = COPYING
 LIBSIGROK_INSTALL_STAGING = YES
 LIBSIGROK_DEPENDENCIES = libglib2 libzip host-pkgconf
-LIBSIGROK_CONF_OPTS = --disable-glibtest --disable-java --disable-python
+LIBSIGROK_CONF_OPTS = --disable-java --disable-python
 
 ifeq ($(BR2_PACKAGE_LIBSERIALPORT),y)
-LIBSIGROK_CONF_OPTS += --enable-libserialport
+LIBSIGROK_CONF_OPTS += --with-libserialport
 LIBSIGROK_DEPENDENCIES += libserialport
 else
-LIBSIGROK_CONF_OPTS += --disable-libserialport
+LIBSIGROK_CONF_OPTS += --without-libserialport
 endif
 
 ifeq ($(BR2_PACKAGE_LIBFTDI),y)
-LIBSIGROK_CONF_OPTS += --enable-libftdi
+LIBSIGROK_CONF_OPTS += --with-libftdi
 LIBSIGROK_DEPENDENCIES += libftdi
 else
-LIBSIGROK_CONF_OPTS += --disable-libftdi
+LIBSIGROK_CONF_OPTS += --without-libftdi
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
-LIBSIGROK_CONF_OPTS += --enable-libusb
+LIBSIGROK_CONF_OPTS += --with-libusb
 LIBSIGROK_DEPENDENCIES += libusb
 else
-LIBSIGROK_CONF_OPTS += --disable-libusb
+LIBSIGROK_CONF_OPTS += --without-libusb
 endif
 
 ifeq ($(BR2_PACKAGE_GLIBMM),y)
