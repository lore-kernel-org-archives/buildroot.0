From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 21 Apr 2020 19:26:37 +0200
Subject: [Buildroot] [PATCHv2 03/12] configs/amarula_a64_relic_defconfig:
 remove BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT
In-Reply-To: <20200421172646.3340666-1-romain.naour@gmail.com>
References: <20200421172646.3340666-1-romain.naour@gmail.com>
Message-ID: <20200421172646.3340666-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This option is lost while loading the defconfig with:
make amarula_a64_relic_defconfig

This fixes the new defconfig check.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>
---
If android tools is really required for this defconfig,
BR2_PACKAGE_HOST_ANDROID_TOOLS must be selected first.
---
 configs/amarula_a64_relic_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/amarula_a64_relic_defconfig b/configs/amarula_a64_relic_defconfig
index f2e7e7f965..5a62fbf6c4 100644
--- a/configs/amarula_a64_relic_defconfig
+++ b/configs/amarula_a64_relic_defconfig
@@ -40,7 +40,6 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Amarula A64-Relic"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.25.3
