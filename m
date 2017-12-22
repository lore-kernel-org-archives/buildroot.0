From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Dec 2017 15:31:10 +0100
Subject: [Buildroot] [git commit] xfsprogs: bump to version 4.14.0
Message-ID: <20171222144123.DBE5A804E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04502a27735a7bb0f3b1db49fad25f7879143d71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add licenses and hashes for these licenses.

Enabled build with musl; the non standard types have been removed
upstream. Fixes bug #10581.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xfsprogs/Config.in     | 5 ++---
 package/xfsprogs/xfsprogs.hash | 3 ++-
 package/xfsprogs/xfsprogs.mk   | 4 +++-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/xfsprogs/Config.in b/package/xfsprogs/Config.in
index fb603ad..9cd4aa3 100644
--- a/package/xfsprogs/Config.in
+++ b/package/xfsprogs/Config.in
@@ -1,11 +1,10 @@
-comment "xfsprogs needs a glibc or uClibc toolchain w/ threads"
+comment "xfsprogs needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_USES_MUSL || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_XFSPROGS
 	bool "xfsprogs"
 	depends on BR2_USE_MMU # fork()
-	depends on !BR2_TOOLCHAIN_USES_MUSL # missing __[u]int*_t
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
diff --git a/package/xfsprogs/xfsprogs.hash b/package/xfsprogs/xfsprogs.hash
index edb2933..886a8f1 100644
--- a/package/xfsprogs/xfsprogs.hash
+++ b/package/xfsprogs/xfsprogs.hash
@@ -1,2 +1,3 @@
 # From https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/sha256sums.asc
-sha256 c3a6d87b564d7738243c507df82276bed982265e345363a95f2c764e8a5f5bb2  xfsprogs-4.11.0.tar.xz
+sha256 b1b710b268bc95d6f45eca06e1262c29eb38865a19cd4404e48ba446e043b7ec  xfsprogs-4.14.0.tar.xz
+sha256 ee304b1b1da08b261f1d1f31d229fc70d2d0c552c7429e9e84c0fac878d94209  doc/COPYING
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index 2f708f1..e6e8493 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -4,9 +4,11 @@
 #
 ################################################################################
 
-XFSPROGS_VERSION = 4.11.0
+XFSPROGS_VERSION = 4.14.0
 XFSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/fs/xfs/xfsprogs
 XFSPROGS_SOURCE = xfsprogs-$(XFSPROGS_VERSION).tar.xz
+XFSPROGS_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1 (libhandle, few headers)
+XFSPROGS_LICENSE_FILES = doc/COPYING
 
 XFSPROGS_DEPENDENCIES = util-linux
 
