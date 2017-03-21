From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Mar 2017 17:39:02 +0100
Subject: [Buildroot] [git commit] btrfs-progs: bump version to 4.10.1
Message-ID: <20170321164016.0F92A7F87B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1106771a414ede1d34c51a3309800f2df753e54b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop 0003-btrfs-progs-add-missing-limits-headers.patch since it's
already included in this release:
  https://github.com/kdave/btrfs-progs/commit/153d4e6c01b53855d01b5d0c99886ba31b48bad1

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...03-btrfs-progs-add-missing-limits-headers.patch | 43 ----------------------
 package/btrfs-progs/btrfs-progs.hash               |  2 +-
 package/btrfs-progs/btrfs-progs.mk                 |  2 +-
 3 files changed, 2 insertions(+), 45 deletions(-)

diff --git a/package/btrfs-progs/0003-btrfs-progs-add-missing-limits-headers.patch b/package/btrfs-progs/0003-btrfs-progs-add-missing-limits-headers.patch
deleted file mode 100644
index 4b72287..0000000
--- a/package/btrfs-progs/0003-btrfs-progs-add-missing-limits-headers.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 6b5e0ad992750e81c8eb9118b52179b8fad4426b Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Sun, 12 Mar 2017 19:46:52 +0200
-Subject: [PATCH] btrfs-progs: add missing limits headers
-
-Build under musl libc fails because of missing PATH_MAX and XATTR_NAME_MAX
-macro declarations. Add the required headers.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://github.com/kdave/btrfs-progs/pull/28
-
- convert/source-ext2.c | 1 +
- mkfs/common.c         | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/convert/source-ext2.c b/convert/source-ext2.c
-index 824d45d063d4..77ce0c66ac2a 100644
---- a/convert/source-ext2.c
-+++ b/convert/source-ext2.c
-@@ -16,6 +16,7 @@
- 
- #if BTRFSCONVERT_EXT2
- 
-+#include <linux/limits.h>
- #include "kerncompat.h"
- #include "disk-io.h"
- #include "transaction.h"
-diff --git a/mkfs/common.c b/mkfs/common.c
-index 1e6a32419b68..1e8f26ea4dda 100644
---- a/mkfs/common.c
-+++ b/mkfs/common.c
-@@ -18,6 +18,7 @@
- #include <uuid/uuid.h>
- #include <blkid/blkid.h>
- #include <fcntl.h>
-+#include <limits.h>
- #include "ctree.h"
- #include "disk-io.h"
- #include "volumes.h"
--- 
-2.11.0
-
diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
index 3d0f2db..be34aa5 100644
--- a/package/btrfs-progs/btrfs-progs.hash
+++ b/package/btrfs-progs/btrfs-progs.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
-sha256 44cbcca39af70dad5a8bf0343fca48f7aaa1aeae0eefac5003688452b3155cda  btrfs-progs-v4.10.tar.xz
+sha256 6c16b642f085d203fdcb3873f002a67a6cb839528b2a5ad7f2bd04c525101a1a  btrfs-progs-v4.10.1.tar.xz
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 5448bef..852c614 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BTRFS_PROGS_VERSION = 4.10
+BTRFS_PROGS_VERSION = 4.10.1
 BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = host-pkgconf e2fsprogs lzo util-linux zlib
