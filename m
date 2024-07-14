Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB80C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 17:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1484960687;
	Sun, 14 Jul 2024 17:46:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bT4YMufE0VAm; Sun, 14 Jul 2024 17:46:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15CCB60644
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15CCB60644;
	Sun, 14 Jul 2024 17:46:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 74AFC1BF3F2
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 17:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D6AE405D0
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 17:46:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s1zX3QaaZ9sQ for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 17:46:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 325A0405C9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 325A0405C9
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 17:46:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27DF78691D; Sun, 14 Jul 2024 17:46:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 19:44:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b0a0c25e625a9736c38d0957956447e102ceec1e
X-Git-Newrev: b7dbdd3d775b8e94664c6f37b11afc8a6a352e35
X-Patchwork-Hint: ignore
Message-Id: <20240714174618.27DF78691D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/rock5b_defconfig: switch to
 mainline linux
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0235303401252818526=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0235303401252818526==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b7dbdd3d775b8e94664c6f37b11afc8a6a352e35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch switches the board support of the Radxa Rock 5B from
using a custom kernel to mainline linux 6.7.4. Thereby patches,
which became redundant, are removed, as well as device tree
modifications and no longer needed hash files. The needed ethernet
drivers are activated via the kernel config fragment file. Also the
board support is switched from using a uboot script and a uEnv file
to using extlinux.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/radxa/rock5b/boot.cmd                        |  3 -
 board/radxa/rock5b/extlinux.conf                   |  4 ++
 board/radxa/rock5b/genimage.cfg                    | 16 ------
 board/radxa/rock5b/linux.fragment                  |  5 +-
 .../patches/linux-headers/linux-headers.hash       |  1 +
 ...-Adjust-ether_addr-prototypes-to-silence-.patch | 64 ----------------------
 ...oc-fix-building-error-on-Werror-array-com.patch | 43 ---------------
 board/radxa/rock5b/patches/linux/linux.hash        |  2 +-
 board/radxa/rock5b/patches/uboot/uboot.hash        |  2 +-
 board/radxa/rock5b/post-build.sh                   |  5 ++
 board/radxa/rock5b/post-image.sh                   |  7 ---
 board/radxa/rock5b/readme.txt                      | 51 +----------------
 board/radxa/rock5b/rock5b.dts                      | 12 ----
 board/radxa/rock5b/rock5b.its                      | 46 ----------------
 configs/rock5b_defconfig                           | 58 +++++++++++---------
 15 files changed, 49 insertions(+), 270 deletions(-)

diff --git a/board/radxa/rock5b/boot.cmd b/board/radxa/rock5b/boot.cmd
deleted file mode 100644
index 9a3e73e003..0000000000
--- a/board/radxa/rock5b/boot.cmd
+++ /dev/null
@@ -1,3 +0,0 @@
-setenv bootargs root=/dev/mmcblk0p2 rw rootfstype=ext4 clkin_hz=(25000000) earlycon clk_ignore_unused earlyprintk console=ttyS2,1500000n8 rootwait
-fatload mmc 1:1 ${loadaddr} image.itb
-bootm ${loadaddr}
diff --git a/board/radxa/rock5b/extlinux.conf b/board/radxa/rock5b/extlinux.conf
new file mode 100644
index 0000000000..a1a531f038
--- /dev/null
+++ b/board/radxa/rock5b/extlinux.conf
@@ -0,0 +1,4 @@
+label Radxa Rock 5b Linux
+  kernel /boot/Image
+  devicetree /boot/rk3588-rock-5b.dtb
+  append root=/dev/mmcblk1p1 rw rootfstype=ext4 earlycon rootwait
diff --git a/board/radxa/rock5b/genimage.cfg b/board/radxa/rock5b/genimage.cfg
index 2943232fc3..138ec26e3a 100644
--- a/board/radxa/rock5b/genimage.cfg
+++ b/board/radxa/rock5b/genimage.cfg
@@ -1,15 +1,5 @@
 # SD card image for Radxa Rock 5b
 
-image boot.vfat {
-	vfat {
-		files = {
-			"image.itb",
-			"boot.scr"
-		}
-	}
-	size = 16M
-}
-
 image sdcard.img {
 	hdimage {
 		partition-table-type = "hybrid"
@@ -21,12 +11,6 @@ image sdcard.img {
 		offset = 32K
 	}
 
-	partition boot {
-		partition-type = "0xC"
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
 	partition rootfs {
 		partition-type = 0x83
 		image = "rootfs.ext2"
diff --git a/board/radxa/rock5b/linux.fragment b/board/radxa/rock5b/linux.fragment
index 28bb373ef2..90f2f291ba 100644
--- a/board/radxa/rock5b/linux.fragment
+++ b/board/radxa/rock5b/linux.fragment
@@ -1,5 +1,2 @@
 CONFIG_R8169=y
-# CONFIG_ROCKCHIP_FIQ_DEBUGGER is not set
-# Disable Rockchip specific WiFi drivers, as the kernel
-# code cannot be build with GCC 12 due to several Werrors
-# CONFIG_WL_ROCKCHIP is not set
+CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY=y
diff --git a/board/radxa/rock5b/patches/linux-headers/linux-headers.hash b/board/radxa/rock5b/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/radxa/rock5b/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/radxa/rock5b/patches/linux/0001-etherdevice-Adjust-ether_addr-prototypes-to-silence-.patch b/board/radxa/rock5b/patches/linux/0001-etherdevice-Adjust-ether_addr-prototypes-to-silence-.patch
deleted file mode 100644
index 5632c5a627..0000000000
--- a/board/radxa/rock5b/patches/linux/0001-etherdevice-Adjust-ether_addr-prototypes-to-silence-.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 2618a0dae09ef37728dab89ff60418cbe25ae6bd Mon Sep 17 00:00:00 2001
-From: Kees Cook <keescook@chromium.org>
-Date: Sat, 12 Feb 2022 09:14:49 -0800
-Subject: etherdevice: Adjust ether_addr* prototypes to silence
- -Wstringop-overead
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-With GCC 12, -Wstringop-overread was warning about an implicit cast from
-char[6] to char[8]. However, the extra 2 bytes are always thrown away,
-alignment doesn't matter, and the risk of hitting the edge of unallocated
-memory has been accepted, so this prototype can just be converted to a
-regular char *. Silences:
-
-net/core/dev.c: In function ‘bpf_prog_run_generic_xdp’: net/core/dev.c:4618:21: warning: ‘ether_addr_equal_64bits’ reading 8 bytes from a region of size 6 [-Wstringop-overread]
- 4618 |         orig_host = ether_addr_equal_64bits(eth->h_dest, > skb->dev->dev_addr);
-      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-net/core/dev.c:4618:21: note: referencing argument 1 of type ‘const u8[8]’ {aka ‘const unsigned char[8]’}
-net/core/dev.c:4618:21: note: referencing argument 2 of type ‘const u8[8]’ {aka ‘const unsigned char[8]’}
-In file included from net/core/dev.c:91: include/linux/etherdevice.h:375:20: note: in a call to function ‘ether_addr_equal_64bits’
-  375 | static inline bool ether_addr_equal_64bits(const u8 addr1[6+2],
-      |                    ^~~~~~~~~~~~~~~~~~~~~~~
-
-Reported-by: Marc Kleine-Budde <mkl@pengutronix.de>
-Tested-by: Marc Kleine-Budde <mkl@pengutronix.de>
-Link: https://lore.kernel.org/netdev/20220212090811.uuzk6d76agw2vv73@pengutronix.de
-Cc: Jakub Kicinski <kuba@kernel.org>
-Cc: "David S. Miller" <davem@davemloft.net>
-Cc: netdev@vger.kernel.org
-Signed-off-by: Kees Cook <keescook@chromium.org>
-Signed-off-by: David S. Miller <davem@davemloft.net>
-Upstream: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2618a0dae09ef37728dab89ff60418cbe25ae6bd
-Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
----
- include/linux/etherdevice.h | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/include/linux/etherdevice.h b/include/linux/etherdevice.h
-index 2ad71cc90b37d..92b10e67d5f87 100644
---- a/include/linux/etherdevice.h
-+++ b/include/linux/etherdevice.h
-@@ -134,7 +134,7 @@ static inline bool is_multicast_ether_addr(const u8 *addr)
- #endif
- }
- 
--static inline bool is_multicast_ether_addr_64bits(const u8 addr[6+2])
-+static inline bool is_multicast_ether_addr_64bits(const u8 *addr)
- {
- #if defined(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS) && BITS_PER_LONG == 64
- #ifdef __BIG_ENDIAN
-@@ -372,8 +372,7 @@ static inline bool ether_addr_equal(const u8 *addr1, const u8 *addr2)
-  * Please note that alignment of addr1 & addr2 are only guaranteed to be 16 bits.
-  */
- 
--static inline bool ether_addr_equal_64bits(const u8 addr1[6+2],
--					   const u8 addr2[6+2])
-+static inline bool ether_addr_equal_64bits(const u8 *addr1, const u8 *addr2)
- {
- #if defined(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS) && BITS_PER_LONG == 64
- 	u64 fold = (*(const u64 *)addr1) ^ (*(const u64 *)addr2);
--- 
-cgit 
-
diff --git a/board/radxa/rock5b/patches/linux/0002-mm-page_alloc-fix-building-error-on-Werror-array-com.patch b/board/radxa/rock5b/patches/linux/0002-mm-page_alloc-fix-building-error-on-Werror-array-com.patch
deleted file mode 100644
index 10de6c72d3..0000000000
--- a/board/radxa/rock5b/patches/linux/0002-mm-page_alloc-fix-building-error-on-Werror-array-com.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From ca831f29f8f25c97182e726429b38c0802200c8f Mon Sep 17 00:00:00 2001
-From: Xiongwei Song <sxwjean@gmail.com>
-Date: Fri, 14 Jan 2022 14:07:24 -0800
-Subject: mm: page_alloc: fix building error on -Werror=array-compare
-
-Arthur Marsh reported we would hit the error below when building kernel
-with gcc-12:
-
-  CC      mm/page_alloc.o
-  mm/page_alloc.c: In function `mem_init_print_info':
-  mm/page_alloc.c:8173:27: error: comparison between two arrays [-Werror=array-compare]
-   8173 |                 if (start <= pos && pos < end && size > adj) \
-        |
-
-In C++20, the comparision between arrays should be warned.
-
-Link: https://lkml.kernel.org/r/20211125130928.32465-1-sxwjean@me.com
-Signed-off-by: Xiongwei Song <sxwjean@gmail.com>
-Reported-by: Arthur Marsh <arthur.marsh@internode.on.net>
-Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
-Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
-Upstream: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ca831f29f8f25c97182e726429b38c0802200c8f
-Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
----
- mm/page_alloc.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mm/page_alloc.c b/mm/page_alloc.c
-index 806f317c2e7e2..c4ef450ac4428 100644
---- a/mm/page_alloc.c
-+++ b/mm/page_alloc.c
-@@ -8228,7 +8228,7 @@ void __init mem_init_print_info(void)
- 	 */
- #define adj_init_size(start, end, size, pos, adj) \
- 	do { \
--		if (start <= pos && pos < end && size > adj) \
-+		if (&start[0] <= &pos[0] && &pos[0] < &end[0] && size > adj) \
- 			size -= adj; \
- 	} while (0)
- 
--- 
-cgit 
-
diff --git a/board/radxa/rock5b/patches/linux/linux.hash b/board/radxa/rock5b/patches/linux/linux.hash
index 7cf26c66d2..ba90c84f54 100644
--- a/board/radxa/rock5b/patches/linux/linux.hash
+++ b/board/radxa/rock5b/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  41c0ee93d8751e4bdb85fae24b3e84fc6904a6755c485244eff2e6f8ca38a0c7  linux-52f51a2b5ba178f331af62260d2da86d7472c14b-git4.tar.gz
+sha256  f68d9f5ffc0a24f850699b86c8aea8b8687de7384158d5ed3bede37de098d60c  linux-6.7.4.tar.xz
diff --git a/board/radxa/rock5b/patches/uboot/uboot.hash b/board/radxa/rock5b/patches/uboot/uboot.hash
index efd629bd2f..bc999536af 100644
--- a/board/radxa/rock5b/patches/uboot/uboot.hash
+++ b/board/radxa/rock5b/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  12e921b466ae731cdbc355e6832b7f22bc90b01aeceef9886f98aaba7b394300  u-boot-2023.07.tar.bz2
+sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
diff --git a/board/radxa/rock5b/post-build.sh b/board/radxa/rock5b/post-build.sh
new file mode 100755
index 0000000000..d84a5da0b0
--- /dev/null
+++ b/board/radxa/rock5b/post-build.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+
+install -m 0644 -D "$BOARD_DIR"/extlinux.conf "$TARGET_DIR"/boot/extlinux/extlinux.conf
diff --git a/board/radxa/rock5b/post-image.sh b/board/radxa/rock5b/post-image.sh
deleted file mode 100755
index c706a5ee78..0000000000
--- a/board/radxa/rock5b/post-image.sh
+++ /dev/null
@@ -1,7 +0,0 @@
-#!/usr/bin/env bash
-set -e
-
-gzip -fk "${BINARIES_DIR}/Image"
-cp board/radxa/rock5b/rock5b.its "${BINARIES_DIR}"
-(cd "${BINARIES_DIR}" && mkimage -f rock5b.its image.itb)
-support/scripts/genimage.sh -c board/radxa/rock5b/genimage.cfg
diff --git a/board/radxa/rock5b/readme.txt b/board/radxa/rock5b/readme.txt
index b3eb06851a..441c28db25 100644
--- a/board/radxa/rock5b/readme.txt
+++ b/board/radxa/rock5b/readme.txt
@@ -13,21 +13,15 @@ Files created in output directory
 output/images
 .
 ├── Image
-├── Image.gz
-├── boot.scr
-├── boot.vfat
-├── image.itb
-├── rk3588-rock-5b.dtb
 ├── rk3588_bl31_v1.40.elf
 ├── rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.12.bin
-├── rock5b.dts
-├── rock5b.its
+├── rk3588-rock-5b.dtb
 ├── rootfs.ext2
 ├── rootfs.ext4
 ├── rootfs.tar
 ├── sdcard.img
-├── u-boot-rockchip.bin
-└── u-boot.bin
+├── u-boot.bin
+└── u-boot-rockchip.bin
 
 Creating bootable SD card:
 ==========================
@@ -61,42 +55,3 @@ Enter 'root' as login user, and the prompt is ready.
 wiki link:
 ----------
 https://forum.radxa.com/c/rock5
-
-Issues:
-=======
-
-WiFi
-----
-The custom Radxa kernel provides custom code to support WiFi. However,
-that code does not compile with GCC 12, which is the current default
-version in buildroot. Hence, the WiFi kernel drivers are disabled, until
-the issues get fixed (if ever). If they are desperately needed, one may
-apply the following workaround, as long as buildroot still supports GCC
-version 11:
-
-1. Set GCC version 11, by adding the following line to
-configs/rock5b_defconfig:
-
-BR2_GCC_VERSION_11_X=y
-
-2. Re-enable custom WiFi drivers by removing the following line from
-board/radxa/rock5b/linux.fragment:
-
-# CONFIG_WL_ROCKCHIP is not set
-
-Rockchip FIQ Debugger
----------------------
-The custom kernel used for this board features an FIQ debugger, which
-can be activated by typing "fiq" on the serial interface. As this can be
-annoying if a user wants to type these charakters and it is not needed
-for most users, this board support disables the FIQ debugger by default.
-To re-enable the FIQ debugger follow the steps:
-
-1. In board/radxa/rock5b/rock5b.dts set the status property of the
-fiq_debugger node to "okay" and set the status property of the uart2
-node to "disabled"
-
-2. Re-enable the fiq debugger module  by removing the following line
-from board/radxa/rock5b/linux.fragment:
-
-# CONFIG_ROCKCHIP_FIQ_DEBUGGER is not set
diff --git a/board/radxa/rock5b/rock5b.dts b/board/radxa/rock5b/rock5b.dts
deleted file mode 100644
index 71a4e42b5e..0000000000
--- a/board/radxa/rock5b/rock5b.dts
+++ /dev/null
@@ -1,12 +0,0 @@
-/dts-v1/;
-
-#include "rockchip/rk3588-rock-5b.dts"
-
-&fiq_debugger {
-	status = "disabled";
-};
-
-&uart2 {
-	pinctrl-0 = <&uart2m0_xfer>;
-	status = "okay";
-};
diff --git a/board/radxa/rock5b/rock5b.its b/board/radxa/rock5b/rock5b.its
deleted file mode 100644
index 9ce235d041..0000000000
--- a/board/radxa/rock5b/rock5b.its
+++ /dev/null
@@ -1,46 +0,0 @@
-/dts-v1/;
-
-/ {
-	description = "Rock 5B FIT Image";
-	#address-cells = <1>;
-
-	images {
-		kernel {
-			description = "Kernel";
-			data = /incbin/("Image.gz");
-			type = "kernel";
-			arch = "arm64";
-			os = "linux";
-			compression = "gzip";
-			load = <0x0a200000>;
-			entry = <0x0a200000>;
-			hash {
-				algo = "sha256";
-			};
-		};
-		fdt {
-			description = "Device Tree";
-			data = /incbin/("rock5b.dtb");
-			type = "flat_dt";
-			arch = "arm64";
-			compression = "none";
-			load = <0x0e000000>;
-			entry = <0x0e000000>;
-			hash {
-				algo = "sha256";
-			};
-		};
-	};
-
-	configurations {
-		default = "standard";
-		standard {
-			description = "Standard Boot";
-			kernel = "kernel";
-			fdt = "fdt";
-			hash {
-				algo = "sha256";
-			};
-		};
-	};
-};
diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index 1ac42c8dc5..2765b5fbd8 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -1,42 +1,50 @@
+# Architecture
 BR2_aarch64=y
 BR2_cortex_a76_a55=y
-BR2_KERNEL_HEADERS_5_10=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/radxa/rock5b/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS=""
-BR2_TARGET_GENERIC_HOSTNAME="rock5b"
-BR2_TARGET_GENERIC_ISSUE="Welcome to the rock5b board"
+
+# Linux headers same as kernel, a 6.7 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_7=y
+
+# Build
 BR2_GLOBAL_PATCH_DIR="board/radxa/rock5b/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-BR2_SYSTEM_DHCP="eth0"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/radxa/kernel.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="52f51a2b5ba178f331af62260d2da86d7472c14b"
-BR2_LINUX_KERNEL_DEFCONFIG="rockchip_linux"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/radxa/rock5b/rock5b.dts"
-BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/linux.fragment"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
+
+# Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock5b-rk3588"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
 BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN=y
+BR2_PACKAGE_ROCKCHIP_RKBIN=y
+BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME="bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.12.bin"
+BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME="bin/rk35/rk3588_bl31_v1.40.elf"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.7.4"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3588-rock-5b"
+BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/linux.fragment"
+
+# Filesystem
+BR2_TARGET_GENERIC_HOSTNAME="rock5b"
+BR2_TARGET_GENERIC_ISSUE="Welcome to the rock5b board"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
 BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/radxa/rock5b/boot.cmd"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_DTC=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_ROCKCHIP_RKBIN=y
-BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME="bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.12.bin"
-BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME="bin/rk35/rk3588_bl31_v1.40.elf"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/radxa/rock5b/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/radxa/rock5b/genimage.cfg"

--===============0235303401252818526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0235303401252818526==--
