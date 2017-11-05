From: Baruch Siach <baruch@tkos.co.il>
Date: Sun,  5 Nov 2017 20:24:17 +0200
Subject: [Buildroot] [PATCH] dbus: bump to version 1.12.0
Message-ID: <8ad470089db5ea9391181af416f64952559b76be.1509906257.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove --enable-abstract-sockets; dropped upstream. Remove
ac_cv_have_abstract_sockets that is dropped as well.

Remove --disable-selinux; we handle selinux as an optional dependency
below.

Remove --{enable,disable}-dnotify; this options has been removed in
version 1.7.6, broken since 2010.

Remove --with-init-scripts; dropped upstream.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/dbus/dbus.hash |  4 ++--
 package/dbus/dbus.mk   | 11 ++---------
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index b174391c1303..df1891b6d8b4 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://dbus.freedesktop.org/releases/dbus/dbus-1.10.24.tar.gz.asc
-sha256	71184eb27638e224579ffa998e88f01d0f1fef17a7811406e53350735eaecd1b  dbus-1.10.24.tar.gz
+# https://dbus.freedesktop.org/releases/dbus/dbus-1.12.0.tar.gz.asc
+sha256	39af0d9267391434b549c5c4adc001b735518c96f7630c3fe7162af1d13ef3c0  dbus-1.12.0.tar.gz
 # Locally calculated
 sha256	0e46f54efb12d04ab5c33713bacd0e140c9a35b57ae29e03c853203266e8f3a1  COPYING
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 6fa04962baf7..56a54e309c8c 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.10.24
+DBUS_VERSION = 1.12.0
 DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
 DBUS_LICENSE_FILES = COPYING
@@ -20,20 +20,15 @@ endef
 
 DBUS_DEPENDENCIES = host-pkgconf expat
 
-DBUS_CONF_ENV = ac_cv_have_abstract_sockets=yes
 DBUS_CONF_OPTS = \
 	--with-dbus-user=dbus \
 	--disable-tests \
 	--disable-asserts \
-	--enable-abstract-sockets \
-	--disable-selinux \
 	--disable-xml-docs \
 	--disable-doxygen-docs \
-	--disable-dnotify \
 	--with-xml=expat \
 	--with-system-socket=/var/run/dbus/system_bus_socket \
-	--with-system-pid-file=/var/run/messagebus.pid \
-	--with-init-scripts=none
+	--with-system-pid-file=/var/run/messagebus.pid
 
 ifeq ($(BR2_STATIC_LIBS),y)
 DBUS_CONF_OPTS += LIBS='-pthread'
@@ -109,11 +104,9 @@ HOST_DBUS_CONF_OPTS = \
 	--with-dbus-user=dbus \
 	--disable-tests \
 	--disable-asserts \
-	--enable-abstract-sockets \
 	--disable-selinux \
 	--disable-xml-docs \
 	--disable-doxygen-docs \
-	--enable-dnotify \
 	--without-x \
 	--with-xml=expat
 
-- 
2.14.2
