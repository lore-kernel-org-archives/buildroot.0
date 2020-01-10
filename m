From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Jan 2020 23:12:12 +0100
Subject: [Buildroot] [git commit] package/libsigrok: add optional
 bluez-utils dependency
Message-ID: <20200110220318.D12098900C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab390616eb74fcb982c886408b53489dc42179bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bluez-utils has been added since version 0.5.2 and
https://github.com/sigrokproject/libsigrok/commit/f085705f4888f8127c80539e0fcd1cb3974bdff2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsigrok/libsigrok.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index 971e90c94a..922011af7c 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -12,6 +12,16 @@ LIBSIGROK_INSTALL_STAGING = YES
 LIBSIGROK_DEPENDENCIES = libglib2 libzip host-pkgconf
 LIBSIGROK_CONF_OPTS = --disable-java --disable-python
 
+ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
+LIBSIGROK_CONF_OPTS += --with-libbluez
+LIBSIGROK_DEPENDENCIES += bluez_utils
+else ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
+LIBSIGROK_CONF_OPTS += --with-libbluez
+LIBSIGROK_DEPENDENCIES += bluez_utils5
+else
+LIBSIGROK_CONF_OPTS += --without-libbluez
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSERIALPORT),y)
 LIBSIGROK_CONF_OPTS += --with-libserialport
 LIBSIGROK_DEPENDENCIES += libserialport
