From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 7 May 2020 22:59:38 +0200
Subject: [Buildroot] [git commit branch/2020.02.x]
 configs/amarula_a64_relic: add missing BR2_PACKAGE_HOST_ANDROID_TOOLS=y
Message-ID: <20200507214107.81B0F90EAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf929584c71fbc964d5b5181ea279945eac7410f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

board/amarula/a64-relic/readme.txt makes use the host fastboot utility
to flash the board. However, BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT
(which is enabled in the defconfig) has a dependency on
BR2_PACKAGE_HOST_ANDROID_TOOLS, which is not enabled in the
defconfig. Due to this, BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT=y is
lost when loading the defconfig.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>
[Thomas: change to add BR2_PACKAGE_HOST_ANDROID_TOOLS=y]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 016a1d80eab41f6f3e7b0a6b23aec250a7a1933f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/amarula_a64_relic_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/amarula_a64_relic_defconfig b/configs/amarula_a64_relic_defconfig
index f2e7e7f965..304a3ef824 100644
--- a/configs/amarula_a64_relic_defconfig
+++ b/configs/amarula_a64_relic_defconfig
@@ -40,6 +40,7 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Amarula A64-Relic"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_PACKAGE_HOST_ANDROID_TOOLS=y
 BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
