From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 May 2017 13:44:54 +0200
Subject: [Buildroot] [git commit] configs/beaglebone_qt5_defconfig: fix
	kernel build
Message-ID: <20170507114510.B007E8286F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=028eb673c8f2c79fb26dfe7287d43bc237441035
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 4b2440b7dcc68369548c0f2be6984fe645fc6bb0 ("beaglebone: add DT
for BeagleBone Green"), both beaglebone_defconfig and
beaglebone_qt5_defconfig were updated to add "am335x-bonegreen" to the
list of Device Tree files to be produced.

However, beaglebone_qt5_defconfig uses an older kernel version than
beaglebone_defconfig, in which am335x-bonegreen doesn't exist.

Therefore, revert the change on beaglebone_qt5_defconfig.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/builds/15762182

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/beaglebone_qt5_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
index b65ca40..3406373 100644
--- a/configs/beaglebone_qt5_defconfig
+++ b/configs/beaglebone_qt5_defconfig
@@ -14,7 +14,7 @@ BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="52c4aa7cdb93d61f8008f380135beaf7b8fa6593"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/beaglebone/linux-4.1-sgx.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-evmsk"
 BR2_PACKAGE_FBV=y
 BR2_PACKAGE_QT5=y
 BR2_PACKAGE_QT5BASE_EXAMPLES=y
