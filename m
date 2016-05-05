From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  5 May 2016 12:30:29 -0300
Subject: [Buildroot] [PATCH 2/3] configs/freescale_p1010rdb_pa: lock down
	binutils version
In-Reply-To: <1462462230-30078-1-git-send-email-gustavo@zacarias.com.ar>
References: <1462462230-30078-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1462462230-30078-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The used U-Boot version (2014.01) isn't too happy with newer (>= 2.25)
binutils versions, so keep it locked down until the config is updated
for a newer version.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/freescale_p1010rdb_pa_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/freescale_p1010rdb_pa_defconfig b/configs/freescale_p1010rdb_pa_defconfig
index 93096de..7f48248 100644
--- a/configs/freescale_p1010rdb_pa_defconfig
+++ b/configs/freescale_p1010rdb_pa_defconfig
@@ -27,6 +27,8 @@ BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 
 # Bootloader
+# Lock down binutils to <2.25 to avoid U-Boot build failure
+BR2_BINUTILS_VERSION_2_24_X=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="P1010RDB-PA_NOR"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-- 
2.7.3
