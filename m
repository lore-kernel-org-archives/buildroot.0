From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Feb 2020 09:04:37 +0100
Subject: [Buildroot] [git commit] configs/beaglebone_qt5_defconfig: kernel
 builds needs host-openssl
Message-ID: <20200227075236.824A78EC41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=128c57adb8f3a4e1af2b9e0fcfc612049cff6773
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to the fix for the base beaglebone defconfig in commit 38912a61be
(configs/beaglebone: kernel builds needs host-openssl), the qt5 variant uses
the same kernel, so also needs host-openssl.

Fixes:

914 scripts/extract-cert.c:21:25: fatal error: openssl/bio.h: No such file or directory
915  #include <openssl/bio.h>

https://gitlab.com/buildroot.org/buildroot/-/jobs/451176891

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/beaglebone_qt5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
index 99355e855c..6e07bc9ac0 100644
--- a/configs/beaglebone_qt5_defconfig
+++ b/configs/beaglebone_qt5_defconfig
@@ -15,6 +15,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/beaglebone/linux-sgx.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_FBV=y
 BR2_PACKAGE_QT5=y
 BR2_PACKAGE_QT5BASE_EXAMPLES=y
