From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 29 Apr 2015 16:17:20 -0300
Subject: [Buildroot] [PATCH] btrfs-progs: bump to version 4.0
Message-ID: <1430335040-3526-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch SITE to use BR2_KERNEL_MIRROR as well.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/btrfs-progs/btrfs-progs.hash | 2 +-
 package/btrfs-progs/btrfs-progs.mk   | 4 ++--
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
-- 
2.0.5
