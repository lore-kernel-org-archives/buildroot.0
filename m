From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Jun 2014 22:21:32 +0200
Subject: [Buildroot] [git commit] libnftnl: add uclinux configure patch
Message-ID: <20140603202150.363009CAF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=383f912ed27d67b98837d1b81ee593b3472090be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/848/848331218676b4e2be78f805ba3a74cfaf87c56f/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-configure-uclinux-is-also-linux-nommu.patch |   26 ++++++++++++++++++++
 package/libnftnl/libnftnl.mk                       |    2 +
 2 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/libnftnl/libnftnl-0001-configure-uclinux-is-also-linux-nommu.patch b/package/libnftnl/libnftnl-0001-configure-uclinux-is-also-linux-nommu.patch
new file mode 100644
index 0000000..52d81dd
--- /dev/null
+++ b/package/libnftnl/libnftnl-0001-configure-uclinux-is-also-linux-nommu.patch
@@ -0,0 +1,26 @@
+From 71773664f9e7c15bb71ca07fcf9be9efc95abe44 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 3 Jun 2014 16:42:45 -0300
+Subject: [PATCH] configure: uclinux is also linux (nommu)
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 255e457..35287f9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -35,7 +35,7 @@ AC_DISABLE_STATIC
+ LT_INIT
+ CHECK_GCC_FVISIBILITY
+ case "$host" in
+-*-*-linux*) ;;
++*-*-linux* | *-*-uclinux*) ;;
+ *) AC_MSG_ERROR([Linux only, dude!]);;
+ esac
+ 
+-- 
+1.8.5.5
+
diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index 1e054b5..c0e8b94 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -10,6 +10,8 @@ LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.bz2
 LIBNFTNL_LICENSE = GPLv2+
 LIBNFTNL_LICENSE_FILES = COPYING
 LIBNFTNL_INSTALL_STAGING = YES
+# For uclinux support patch
+LIBNFTNL_AUTORECONF = YES
 LIBNFTNL_DEPENDENCIES = host-pkgconf libmnl
 
 ifeq ($(BR2_PACKAGE_LIBNFTNL_JSON),y)
