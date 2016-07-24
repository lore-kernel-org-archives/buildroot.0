From: Christian Stewart <christian@paral.in>
Date: Sun, 24 Jul 2016 14:10:27 -0700
Subject: [Buildroot] [PATCH v11 1/2] package/btrfs-progs: install to staging
	directory
Message-ID: <1469394628-19412-1-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Other packages when building against btrfs-progs require headers in the
staging directory under /usr/include/btrfs. This patch enables
installing btrfs-progs to the staging directory to enable other packages
to build against the btrfs-progs headers.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/btrfs-progs/btrfs-progs.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 2c3dc50..8d50eb4 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -11,6 +11,7 @@ BTRFS_PROGS_DEPENDENCIES = host-pkgconf e2fsprogs lzo util-linux zlib
 BTRFS_PROGS_CONF_OPTS = --disable-backtrace
 BTRFS_PROGS_LICENSE = GPLv2
 BTRFS_PROGS_LICENSE_FILES = COPYING
+BTRFS_PROGS_INSTALL_STAGING = YES
 
 # Doesn't autodetect static-only and tries to build both
 ifeq ($(BR2_STATIC_LIBS),y)
-- 
2.7.3
