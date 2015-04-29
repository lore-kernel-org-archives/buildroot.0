From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Apr 2015 23:27:02 +0200
Subject: [Buildroot] [git commit] btrfs-progs: bump to version 4.0
Message-ID: <20150429213022.871107FDBC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=39270362ed7cc45f4d00660d4cad76643a4796e6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch SITE to use BR2_KERNEL_MIRROR as well.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/btrfs-progs/btrfs-progs.hash |    2 +-
 package/btrfs-progs/btrfs-progs.mk   |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
index 011af6f..86ab34c 100644
--- a/package/btrfs-progs/btrfs-progs.hash
+++ b/package/btrfs-progs/btrfs-progs.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
-sha256	248862a7e7e06188bb495bbaa05d3e0e34628b61a10ef03234b3b00698ce88db	btrfs-progs-v3.19.1.tar.xz
+sha256	179cf1acc1b0061548b8f1d9cf973a8338bf96f192cecad99ecdace9ae065a1f	btrfs-progs-v4.0.tar.xz
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 842531f..ce5c27e 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-BTRFS_PROGS_VERSION = 3.19.1
-BTRFS_PROGS_SITE = https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs
+BTRFS_PROGS_VERSION = 4.0
+BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = host-pkgconf acl attr e2fsprogs lzo util-linux zlib
 BTRFS_PROGS_CONF_OPTS = --disable-backtrace
