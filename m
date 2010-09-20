From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 20 Sep 2010 22:05:39 +0200
Subject: [Buildroot] [git commit master 1/1] package: add xz-utils package
Message-ID: <20100920200706.EDF938B4FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d380d51427e90fd32fd2a72be4c2abf3b5085750
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    2 ++
 package/Config.in    |    1 +
 package/xz/Config.in |   14 ++++++++++++++
 package/xz/xz.mk     |   13 +++++++++++++
 4 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 package/xz/Config.in
 create mode 100644 package/xz/xz.mk

diff --git a/CHANGES b/CHANGES
index 7ae67d9..1127f89 100644
--- a/CHANGES
+++ b/CHANGES
@@ -15,6 +15,8 @@
 	Download handling reworked and support for git/svn downloads
 	added.
 
+	New packages: xz
+
 	Updated/fixed packages: alsa-lib, at, avahi, berkeleydb, bind,
 	bmon, bridge-utils, busybox, dbus, dmraid, docker, dropbear,
 	e2fsprogs, expat, freetype, gawk, gvfs, haserl, hostapd,
diff --git a/package/Config.in b/package/Config.in
index f9a0405..ce6057b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -13,6 +13,7 @@ source "package/gzip/Config.in"
 endif
 source "package/lzop/Config.in"
 source "package/lzma/Config.in"
+source "package/xz/Config.in"
 endmenu
 
 menu "Debugging, profiling and benchmark"
diff --git a/package/xz/Config.in b/package/xz/Config.in
new file mode 100644
index 0000000..50116f2
--- /dev/null
+++ b/package/xz/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_XZ
+	bool "xz-utils"
+	help
+	  XZ is the successor to the Lempel-Ziv/Markov-chain Algorithm
+	  compression format, which provides memory-hungry but powerful
+	  compression (often better than bzip2) and fast, easy decompression.
+
+	  This package provides the command line tools for working with XZ
+	  compression, including xz, unxz, xzcat, xzgrep, and so on. They can
+	  also handle the older LZMA format, and if invoked via appropriate
+	  symlinks will emulate the behavior of the commands in the lzma
+	  package.
+
+	  http://tukaani.org/xz/
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
new file mode 100644
index 0000000..7490f77
--- /dev/null
+++ b/package/xz/xz.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# xz-utils
+#
+#############################################################
+XZ_VERSION = 4.999.9beta
+XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
+XZ_SITE = http://tukaani.org/xz/
+XZ_INSTALL_STAGING = YES
+XZ_LIBTOOL_PATCH = NO
+
+$(eval $(call AUTOTARGETS,package,xz))
+$(eval $(call AUTOTARGETS,package,xz,host))
-- 
1.7.1
