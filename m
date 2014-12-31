From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 31 Dec 2014 09:15:51 -0300
Subject: [Buildroot] [PATCH] btrfs-progs: bump to version 3.18
Message-ID: <1420028151-25584-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backtrace is disable by default now so remove the definition to avoid
duplicate warnings.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/btrfs-progs/btrfs-progs.hash | 2 +-
 package/btrfs-progs/btrfs-progs.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
index 4ef14a3..f3598a3 100644
--- a/package/btrfs-progs/btrfs-progs.hash
+++ b/package/btrfs-progs/btrfs-progs.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
-sha256	e7bd9ff8d95b515973d3a1255c17fd481bcd75e4420f00c6c9c99489d1ddac2c	btrfs-progs-v3.17.3.tar.xz
+sha256	f9a4ab0b2d66461ca78ffefd03ddd017164d0c6ad2d9532ac2baf8d79f61044d	btrfs-progs-v3.18.tar.xz
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 6a1b7ea..033506e 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-BTRFS_PROGS_VERSION = 3.17.3
+BTRFS_PROGS_VERSION = 3.18
 BTRFS_PROGS_SITE = https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = acl attr e2fsprogs lzo util-linux zlib
-BTRFS_PROGS_MAKE_FLAGS = DISABLE_DOCUMENTATION=1 \
-	$(if $(BR2_TOOLCHAIN_USES_UCLIBC),DISABLE_BACKTRACE=1)
+BTRFS_PROGS_MAKE_FLAGS = DISABLE_DOCUMENTATION=1
 BTRFS_PROGS_LICENSE = GPLv2
 BTRFS_PROGS_LICENSE_FILES = COPYING
 
-- 
2.0.5
