From: Rafal Susz <rafal.susz@gmail.com>
Date: Tue, 13 Mar 2018 19:00:06 +0100
Subject: [Buildroot] [PATCH 2/2] configs/s6lx9_microboard_defconfig: purge
 custom dts boolean
In-Reply-To: <20180313180006.5364-1-rafal.susz@gmail.com>
References: <20180313142635.27423-1-rafal.susz@gmail.com>
 <20180313180006.5364-1-rafal.susz@gmail.com>
Message-ID: <20180313180006.5364-2-rafal.susz@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since custom dts files are unconditionally handled *KERNEL_USE_CUSTOM_DTS
is no longer available/needed.

Signed-off-by: Rafal Susz <rafal.susz@gmail.com>
---
 configs/s6lx9_microboard_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/s6lx9_microboard_defconfig b/configs/s6lx9_microboard_defconfig
index f77c80ba87..97b2d3fe79 100644
--- a/configs/s6lx9_microboard_defconfig
+++ b/configs/s6lx9_microboard_defconfig
@@ -10,5 +10,4 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/avnet/s6lx9_microboard/lx9_mmu_defconfig"
-BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/avnet/s6lx9_microboard/lx9_mmu.dts"
-- 
2.16.1
