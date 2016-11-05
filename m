From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 23:33:37 +0100
Subject: [Buildroot] [git commit] configs/kb9202_defconfig: remove defconfig
Message-ID: <20161105223406.C338F817B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8dc4d065123acb7e1a0763ae851b060b97a39db7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This configuration for the KwikByte KB9202 was added back in July 2008
(commit e27fef51834042a1b108e04927a2a91742a54327), and was never
updated since then. It still uses a 2.6.38 kernel, with the out of
tree patches from the former AT91 kernel maintainer. The board has
been discontinued according to its page at
http://www.kwikbyte.com/KB9202.html.

This defconfig no longer builds since the switch to gcc 5.x as the
default. Therefore, it's time to get rid of this defconfig.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/kb9202_defconfig | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
deleted file mode 100644
index 0aea0eb..0000000
--- a/configs/kb9202_defconfig
+++ /dev/null
@@ -1,17 +0,0 @@
-# Architecture
-BR2_arm=y
-BR2_arm920t=y
-
-# Filesystem
-BR2_TARGET_ROOTFS_TAR=y
-
-# Linux headers same as kernel, a 2.6 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_REALLY_OLD=y
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.38.8"
-BR2_LINUX_KERNEL_PATCH="http://maxim.org.za/AT91RM9200/2.6/2.6.38-at91.patch.gz"
-BR2_LINUX_KERNEL_USE_DEFCONFIG=y
-BR2_LINUX_KERNEL_DEFCONFIG="kb9202"
