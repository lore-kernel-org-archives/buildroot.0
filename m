From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Aug 2017 09:55:03 +0200
Subject: [Buildroot] [git commit] package/openocd: fix uclinux build
Message-ID: <20170817074909.C28507FA35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e5e4d4710ee0c20510e1976b8f30df2272e4dbe7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/cd3/cd3f5b7329f45c2b75ed319caef3c6aa0e94ee2e/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-configure-enable-build-on-uclinux.patch   | 26 ++++++++++++++++++++++
 package/openocd/openocd.mk                         |  3 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/package/openocd/0002-configure-enable-build-on-uclinux.patch b/package/openocd/0002-configure-enable-build-on-uclinux.patch
new file mode 100644
index 0000000..2f2d320
--- /dev/null
+++ b/package/openocd/0002-configure-enable-build-on-uclinux.patch
@@ -0,0 +1,26 @@
+From 11ea78c4d253bb90296e2dd8c3f7fbf59ba397b6 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Thu, 17 Aug 2017 06:30:31 +0200
+Subject: [PATCH] configure: enable build on uclinux
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index c680bda7..1a7980a0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -327,7 +327,7 @@ AC_ARG_ENABLE([sysfsgpio],
+   [build_sysfsgpio=$enableval], [build_sysfsgpio=no])
+ 
+ AS_CASE([$host_os],
+-  [linux*], [],
++  [linux*|uclinux*], [],
+   [
+     AS_IF([test "x$build_sysfsgpio" = "xyes"], [
+       AC_MSG_ERROR([sysfsgpio is only available on linux])
+-- 
+2.11.0
+
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 96f667b..9868121 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -7,7 +7,8 @@
 OPENOCD_VERSION = 0.10.0
 OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
 OPENOCD_SITE = http://sourceforge.net/projects/openocd/files/openocd/$(OPENOCD_VERSION)
-
+# 0002-configure-enable-build-on-uclinux.patch patches configure.ac
+OPENOCD_AUTORECONF = YES
 OPENOCD_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
 
 OPENOCD_CONF_OPTS = \
