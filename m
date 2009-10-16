From: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
Date: Fri, 16 Oct 2009 13:55:30 +0200
Subject: [Buildroot] EFL in buildroot
In-Reply-To: <1255693819.28018.17.camel@coalu.atr>
References: <1255693819.28018.17.camel@coalu.atr>
Message-ID: <1255694130.28018.23.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[PATCH 5/6] Added libembryo package

Signed-off-by: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
---
 package/efl/Config.in              |    1 +
 package/efl/libembryo/Config.in    |    7 +++++++
 package/efl/libembryo/libembryo.mk |   17 +++++++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 package/efl/libembryo/Config.in
 create mode 100644 package/efl/libembryo/libembryo.mk

diff --git a/package/efl/Config.in b/package/efl/Config.in
index c542c00..7a89120 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -11,5 +11,6 @@ source "package/efl/libeina/Config.in"
 source "package/efl/libecore/Config.in"
 source "package/efl/libeet/Config.in"
 source "package/efl/libevas/Config.in"
+source "package/efl/libembryo/Config.in"
 
 endif # BR2_PACKAGE_EFL
diff --git a/package/efl/libembryo/Config.in b/package/efl/libembryo/Config.in
new file mode 100644
index 0000000..1014bfc
--- /dev/null
+++ b/package/efl/libembryo/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBEMBRYO
+	bool "libembryo"
+	help
+          Embryo is primarily a shared library that gives you an API
+          to load and control interpreted programs compiled into an
+          abstract machine bytecode that it understands.
+
diff --git a/package/efl/libembryo/libembryo.mk b/package/efl/libembryo/libembryo.mk
new file mode 100644
index 0000000..b28c64d
--- /dev/null
+++ b/package/efl/libembryo/libembryo.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# libembryo
+#
+#############################################################
+
+LIBEMBRYO_VERSION = 0.9.9.062
+LIBEMBRYO_SOURCE = embryo-$(LIBEMBRYO_VERSION).tar.bz2
+LIBEMBRYO_SITE = http://download.enlightenment.org/snapshots/2009-07-29/
+LIBEMBRYO_AUTORECONF = YES
+LIBEMBRYO_LIBTOOL_PATCH = YES
+LIBEMBRYO_INSTALL_STAGING = YES
+LIBEMBRYO_INSTALL_TARGET = YES
+
+LIBEMBRYO_DEPENDENCIES = host-pkgconfig uclibc
+
+$(eval $(call AUTOTARGETS,package,libembryo))
-- 
1.6.4.3
