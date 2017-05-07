From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 May 2017 14:08:09 +0200
Subject: [Buildroot] [git commit] configs/galileo_defconfig: remove legacy
	binutils version selection
Message-ID: <20170507120958.0D5FC82555@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fcbb098a0c87337752afdd5cb76bd9714a9873eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Back when galileo_defconfig was added, an explicit binutils version was
used, because only binutils >= 2.25 had support for the
-momit-lock-prefix option, necessary to workaround a CPU issue.

Support for binutils 2.25 has now been removed from Buildroot, and
therefore the option no longer exists, causing a build failure. The
oldest binutils version that can be selected in Buildroot is binutils
2.26, which has support for -momit-lock-prefix. Therefore, we simply
remove the explicit binutils version selection.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/builds/15762201

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/galileo_defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/configs/galileo_defconfig b/configs/galileo_defconfig
index f0c308a..43639a4 100644
--- a/configs/galileo_defconfig
+++ b/configs/galileo_defconfig
@@ -1,8 +1,6 @@
 BR2_x86_x1000=y
 # Linux headers same as kernel, a 3.14 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
-# Binutils 2.25 is required as this enables stripping the LOCK prefix
-BR2_BINUTILS_VERSION_2_25_X=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
 BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
