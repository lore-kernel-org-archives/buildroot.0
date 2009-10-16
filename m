From: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
Date: Fri, 16 Oct 2009 13:53:41 +0200
Subject: [Buildroot] EFL in buildroot
In-Reply-To: <1255693819.28018.17.camel@coalu.atr>
References: <1255693819.28018.17.camel@coalu.atr>
Message-ID: <1255694021.28018.20.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[PATCH 2/6] Added libeet package

Signed-off-by: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
---
 package/efl/Config.in        |    1 +
 package/efl/libeet/Config.in |    9 +++++++++
 package/efl/libeet/libeet.mk |   19 +++++++++++++++++++
 3 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 package/efl/libeet/Config.in
 create mode 100644 package/efl/libeet/libeet.mk

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 1a05c4d..1e3d8ae 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -8,5 +8,6 @@ menuconfig BR2_PACKAGE_EFL
 if BR2_PACKAGE_EFL
 
 source "package/efl/libeina/Config.in"
+source "package/efl/libeet/Config.in"
 
 endif # BR2_PACKAGE_EFL
diff --git a/package/efl/libeet/Config.in b/package/efl/libeet/Config.in
new file mode 100644
index 0000000..fa1dd2a
--- /dev/null
+++ b/package/efl/libeet/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBEET
+	bool "libeet"
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBEINA
+	help
+	  Eet is a tiny library designed to write an arbitary set of
+	  chunks of data to a file and optionally compress each chunk
+	  (very much like a zip file).
diff --git a/package/efl/libeet/libeet.mk b/package/efl/libeet/libeet.mk
new file mode 100644
index 0000000..2e06fc7
--- /dev/null
+++ b/package/efl/libeet/libeet.mk
@@ -0,0 +1,19 @@
+#############################################################
+#
+# libeet
+#
+#############################################################
+
+LIBEET_VERSION = 1.2.2
+LIBEET_SOURCE = eet-$(LIBEET_VERSION).tar.bz2
+LIBEET_SITE = http://download.enlightenment.org/releases/
+LIBEET_AUTORECONF = YES
+LIBEET_LIBTOOL_PATCH = YES
+LIBEET_INSTALL_STAGING = YES
+LIBEET_INSTALL_TARGET = YES
+
+LIBEET_DEPENDENCIES = host-pkgconfig zlib jpeg libeina
+
+$(eval $(call AUTOTARGETS,package,libeet))
+
+
-- 
1.6.4.3
