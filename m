From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit@wsystem.com>
Date: Sat, 22 Aug 2015 22:01:25 +0200
Subject: [Buildroot] [PATCH 1/4] configs/raspberrypi: use EABIhf
In-Reply-To: <20150820143005.GA6441@ketchup.mtl.sfl>
References: <20150820143005.GA6441@ketchup.mtl.sfl>
Message-ID: <1440273688-92868-1-git-send-email-benoit@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The SoC of the Raspberry Pi 1 is an ARM1176JZF-S, which features a VFPv2
FPU, so use the EABIhf target ABI, which is more efficient than EABI.
This is also the default on Raspbian.

Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
---
 configs/raspberrypi_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index af702a3..2d47058 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -1,5 +1,6 @@
 BR2_arm=y
 BR2_arm1176jzf_s=y
+BR2_ARM_EABIHF=y
 
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 
-- 
2.1.4
