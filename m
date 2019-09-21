From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 21 Sep 2019 11:55:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/f2fs-tools: bump to version 0.12.0
Message-ID: <20190921095523.7232-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove patch (already in version)
- Change F2FS_TOOLS_SITE to get official tarball and drop 'v' prefix
  from F2FS_TOOLS_VERSION to match what is given by
  release-monitoring.org

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0001-configure-uclinux-is-also-linux.patch | 31 -------------------
 package/f2fs-tools/f2fs-tools.hash            |  2 +-
 package/f2fs-tools/f2fs-tools.mk              |  7 ++---
 3 files changed, 4 insertions(+), 36 deletions(-)
 delete mode 100644 package/f2fs-tools/0001-configure-uclinux-is-also-linux.patch

diff --git a/package/f2fs-tools/0001-configure-uclinux-is-also-linux.patch b/package/f2fs-tools/0001-configure-uclinux-is-also-linux.patch
deleted file mode 100644
index dc91b22c83..0000000000
--- a/package/f2fs-tools/0001-configure-uclinux-is-also-linux.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 67629fd736a8a4295a9f2acb96563953be22a3ae Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Wed, 13 Jun 2018 20:39:04 +0300
-Subject: [PATCH] configure: uclinux is also linux
-
-Linux systems on no-MMU platforms identify as uclinux. They are
-otherwise identical to plain Linux.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: sent to linux-f2fs-devel at lists.sourceforge.net
-
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index a3ff12bf3de9..2b13be5b09f9 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -166,7 +166,7 @@ build_mac=no
- 
- # Detect the target system
- case "${host_os}" in
--linux*)
-+linux*|uclinux*)
- 	build_linux=yes
- 	;;
- cygwin*|mingw*)
--- 
-2.17.1
-
diff --git a/package/f2fs-tools/f2fs-tools.hash b/package/f2fs-tools/f2fs-tools.hash
index 9b72ca8fc0..16fbb73f5a 100644
--- a/package/f2fs-tools/f2fs-tools.hash
+++ b/package/f2fs-tools/f2fs-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 25fb715be0b6a115cc6b7b0f6b8ad6c825a7b174f55c034b6f9da2df1c2c6d97  f2fs-tools-v1.11.0.tar.gz
+sha256 e2124e4dffaba865d41495d817bcb924d096adaec67ff777b8c7da99aa13f696  f2fs-tools-1.12.0.tar.gz
 sha256 662abb3a8a80b36ae7036c289dd1e03b361ee5dd2e6fd5211d0d8d029146449f  COPYING
diff --git a/package/f2fs-tools/f2fs-tools.mk b/package/f2fs-tools/f2fs-tools.mk
index ba16218bda..2cb4927c8a 100644
--- a/package/f2fs-tools/f2fs-tools.mk
+++ b/package/f2fs-tools/f2fs-tools.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-F2FS_TOOLS_VERSION = v1.11.0
-F2FS_TOOLS_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git
-F2FS_TOOLS_SITE_METHOD = git
+F2FS_TOOLS_VERSION = 1.12.0
+F2FS_TOOLS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/snapshot
 F2FS_TOOLS_CONF_ENV = ac_cv_file__git=no
 F2FS_TOOLS_DEPENDENCIES = host-pkgconf util-linux
 HOST_F2FS_TOOLS_DEPENDENCIES = host-pkgconf host-util-linux
-# GIT version, shipped without configure
+# Shipped without configure
 F2FS_TOOLS_AUTORECONF = YES
 F2FS_TOOLS_INSTALL_STAGING = YES
 F2FS_TOOLS_LICENSE = GPL-2.0
-- 
2.23.0
