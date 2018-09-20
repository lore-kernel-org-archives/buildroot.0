From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Sep 2018 00:06:36 +0200
Subject: [Buildroot] [git commit] xfsprogs: bump to version 4.18.0
Message-ID: <20180922164512.213C388811@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e587c31bd2cdfb5d7717ebe6fddd3fe603ddfafd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update second patch because crc32 moved from libxfs to libfrog:
  https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?id=973de649842b6f96db32e5060b62e8fbcc05f033
- Update XFSPROGS_LICENSE_FILES because doc/COPYING has been replaced by
  LICENSES/GPL-2.0 and LICENSES/LGPL-2.1, see:
  https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?id=959ef98176005b1aa69619dd76b1d46cf112dfc4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-libxfs-do-not-try-to-run-the-crc32selftest.patch         | 8 +++++---
 package/xfsprogs/xfsprogs.hash                                    | 7 +++++--
 package/xfsprogs/xfsprogs.mk                                      | 4 ++--
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/package/xfsprogs/0002-libxfs-do-not-try-to-run-the-crc32selftest.patch b/package/xfsprogs/0002-libxfs-do-not-try-to-run-the-crc32selftest.patch
index 372a5301bd..6778d069a1 100644
--- a/package/xfsprogs/0002-libxfs-do-not-try-to-run-the-crc32selftest.patch
+++ b/package/xfsprogs/0002-libxfs-do-not-try-to-run-the-crc32selftest.patch
@@ -17,14 +17,16 @@ Note that there's a remaining bug-in-hiding, because the crc32 table
 generator is natively built, but with the target CFLAGS.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Signed-off-by: "Fabrice Fontaine" <fontaine.fabrice@gmail.com>
+[Update for 4.18.0: crc32 has been moved from libxfs to libfrog]
 ---
  libxfs/Makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/libxfs/Makefile b/libxfs/Makefile
+diff --git a/libfrog/Makefile b/libxfs/Makefile
 index 62608bd..e021625 100644
---- a/libxfs/Makefile
-+++ b/libxfs/Makefile
+--- a/libfrog/Makefile
++++ b/libfrog/Makefile
 @@ -112,9 +112,9 @@ LTLIBS = $(LIBPTHREAD) $(LIBRT)
  # don't try linking xfs_repair with a debug libxfs.
  DEBUG = -DNDEBUG
diff --git a/package/xfsprogs/xfsprogs.hash b/package/xfsprogs/xfsprogs.hash
index 4df2e8d9e4..839f4add2d 100644
--- a/package/xfsprogs/xfsprogs.hash
+++ b/package/xfsprogs/xfsprogs.hash
@@ -1,3 +1,6 @@
 # From https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/sha256sums.asc
-sha256 3d5c2da46112b86cbd967fee43cea731d38a1b2aaf601b57674ed34e808652df  xfsprogs-4.16.1.tar.xz
-sha256 ee304b1b1da08b261f1d1f31d229fc70d2d0c552c7429e9e84c0fac878d94209  doc/COPYING
+sha256 397dc96f51aeeff73d021d3418d3172377b2685f2740ca60525096c070aa3df1  xfsprogs-4.18.0.tar.xz
+
+# Hash for license files
+sha256 7ae50a5344af14d6231aff6814632a220b3127da4099aea2c6070fd79c407c1a  LICENSES/GPL-2.0
+sha256 0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSES/LGPL-2.1
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index 814e0cf218..b5975d29e1 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-XFSPROGS_VERSION = 4.16.1
+XFSPROGS_VERSION = 4.18.0
 XFSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/fs/xfs/xfsprogs
 XFSPROGS_SOURCE = xfsprogs-$(XFSPROGS_VERSION).tar.xz
 XFSPROGS_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1 (libhandle, few headers)
-XFSPROGS_LICENSE_FILES = doc/COPYING
+XFSPROGS_LICENSE_FILES = LICENSES/GPL-2.0 LICENSES/LGPL-2.1
 
 XFSPROGS_DEPENDENCIES = util-linux
 
