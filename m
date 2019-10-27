From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 27 Oct 2019 18:49:47 +0100
Subject: [Buildroot] [PATCH 1/3] package/libsigrok: fix configure options
Message-ID: <20191027174949.13805-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove --disable-glibtest (unrecognized option)
- Switch --{en,dis}able-xxx options by --{with,without}-xxx options

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.23.0
