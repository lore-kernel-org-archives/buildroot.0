From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 May 2016 22:18:56 +0200
Subject: [Buildroot] [git commit] configs/freescale_p1010rdb_pa: lock down
	binutils version
Message-ID: <20160505201945.7373E81F12@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1fdc8b7e7c371f55388a2ac83a8f60e9cae3ae0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The used U-Boot version (2014.01) isn't too happy with newer (>= 2.25)
binutils versions, so keep it locked down until the config is updated
for a newer version.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
