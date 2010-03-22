From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 22 Mar 2010 17:27:13 +0100
Subject: [Buildroot] [git commit master] package: add librsync
Message-ID: <20100322162748.D1CC077624@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a038602e8239bed895644bb0266542ae10ba8e69
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1303

[Peter: misc tweaks (whitespace, kconfig, sf.net URL)]

Signed-off-by: Chris Seawood <cls@seawood.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    3 +++
 package/Config.in            |    1 +
 package/librsync/Config.in   |   11 +++++++++++
 package/librsync/librsync.mk |   15 +++++++++++++++
 4 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 package/librsync/Config.in
 create mode 100644 package/librsync/librsync.mk

diff --git a/CHANGES b/CHANGES
index 1b90994..d7927cf 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,6 +5,8 @@
 
 	X.org updated to 7.5.
 
+	New packages: librsync
+
 	Updated/fixed packages: busybox, dosfstools, e2fsprogs, iperf,
 	libglib2, libpng, memstat, mtd-utils, pppd, setserial,
 	squashfs, wget
@@ -15,6 +17,7 @@
 	#1111: Bump wget to 1.12 and migrate to Makefile.autotools.in
 	#1129: Bump memstat to 0.8 and migrate to Makefile.package.in
 	#1273: BR2_INET_IPV6 does not enable IPv6 in pppd
+	#1303: Add librsync package
 	#1345: Bump pppd to 2.4.5 and convert to Makefile.autotools.in
 
 2010.02, Release February 26th, 2010:
diff --git a/package/Config.in b/package/Config.in
index 5dc7c8d..9f56c60 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -81,6 +81,7 @@ source "package/libiconv/Config.in"
 source "package/libidn/Config.in"
 source "package/liblockfile/Config.in"
 source "package/liboil/Config.in"
+source "package/librsync/Config.in"
 source "package/libsysfs/Config.in"
 source "package/lockfile-progs/Config.in"
 source "package/logrotate/Config.in"
diff --git a/package/librsync/Config.in b/package/librsync/Config.in
new file mode 100644
index 0000000..5dcdfc8
--- /dev/null
+++ b/package/librsync/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBRSYNC
+	bool "librsync"
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_POPT
+	help
+	  librsync implements the rolling-checksum algorithm of
+	  remote file synchronization that was popularized by the
+	  rsync utility and is used in rproxy.
+
+	  http://sourceforge.net/projects/librsync/
diff --git a/package/librsync/librsync.mk b/package/librsync/librsync.mk
new file mode 100644
index 0000000..3db4625
--- /dev/null
+++ b/package/librsync/librsync.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# librsync
+#
+#############################################################
+LIBRSYNC_VERSION:=0.9.7
+LIBRSYNC_SOURCE:=librsync-$(LIBRSYNC_VERSION).tar.gz
+LIBRSYNC_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/librsync/
+LIBRSYNC_INSTALL_STAGING = YES
+LIBRSYNC_INSTALL_TARGET = YES
+LIBRSYNC_CONF_OPT = --enable-shared
+
+LIBRSYNC_DEPENDENCIES = zlib bzip2 popt
+
+$(eval $(call AUTOTARGETS,package,librsync))
-- 
1.6.3.3
