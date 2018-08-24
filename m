From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Aug 2018 23:50:58 +0200
Subject: [Buildroot] [git commit] btrfs-progs: bump to version 4.17.1
Message-ID: <20180907111603.4D9F180FBA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1db8f059377387a8e9c1a4caf3c32917d91649cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure script now detects toolchain support for the -std=gnu90
flag. This fixes build with gcc older than 4.5.

Should fix:
http://autobuild.buildroot.net/results/802/802dd4d7eec058c2eb23e033ed3a093b110f4eda/

Cc: Robert J. Heywood <robert.heywood@codethink.co.uk>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: "Robert J. Heywood" <robert.heywood@codethink.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/btrfs-progs/btrfs-progs.hash | 2 +-
 package/btrfs-progs/btrfs-progs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
index 71793d1c68..07d55ec332 100644
--- a/package/btrfs-progs/btrfs-progs.hash
+++ b/package/btrfs-progs/btrfs-progs.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
-sha256 013403fb67b17975b21408fa9eb7523b0ecf94f84f8a4397cf972e8e254d2246  btrfs-progs-v4.16.1.tar.xz
+sha256 bf0b34f1538c0b6e88f959937b0419678cadbf2ba7044336dcbfb2bcdc28cd74  btrfs-progs-v4.17.1.tar.xz
 # Locally computed
 sha256 0d5bf346df9e635a29dcdddf832dc5b002ca6cdc1c5c9c6c567d2a61bb0c5c15  COPYING
 sha256 3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  libbtrfsutil/COPYING
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 33a6be324f..585dcf364c 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BTRFS_PROGS_VERSION = 4.16.1
+BTRFS_PROGS_VERSION = 4.17.1
 BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = host-pkgconf lzo util-linux zlib
