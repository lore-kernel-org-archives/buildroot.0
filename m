From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Apr 2019 22:46:49 +0200
Subject: [Buildroot] [git commit] configs/beaglebone: kernel build needs
 mkimage
Message-ID: <20190424204229.E5A4B8122E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80029da692300c5b62dd86114ff20122e89342e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following ffbe46a5295ce4e0442728f2ad3e19afa7eaa8ed ("linux: simplify
LINUX_BUILD_CMDS"), the Linux kernel build for beaglebone_defconfig
builds more things, including some .itb files, which require mkimage
with FIT support.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/199339433

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/beaglebone_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 2d9fba57dd..b4f152fd69 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -26,3 +26,5 @@ BR2_TARGET_UBOOT_SPL_NAME="MLO"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
