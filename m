Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33E6EC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:25:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6C0B60187
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:25:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C6C0B60187
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9732983C5C;
	Tue,  3 Aug 2021 23:25:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mOJbLU0LM2Vz; Tue,  3 Aug 2021 23:25:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D30D083CB4;
	Tue,  3 Aug 2021 23:25:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B2F201BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7510F4063E
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ejo9zfq4eGox for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56949406BB
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id AC50B87F55; Tue,  3 Aug 2021 21:10:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 13 Jul 2021 21:16:14 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b928074e2d83f5b873bf1ba381b212dfad9bf207
X-Git-Newrev: 9a1bd7cc1ce512672a5d76baa86c449e36137052
X-Patchwork-Hint: ignore
Message-Id: <20210803211000.AC50B87F55@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] beaglev: update to new
 starfive linux and u-boot
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=9a1bd7cc1ce512672a5d76baa86c449e36137052
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update the commit id for u-boot to include fixes from the starfive-tech
u-boot repository:

494e5ef7b807 jh7100: Enable full 2M L2 cache
4571f5a4e1e4 vic7100: enable cache ways (L2 cache)
abb06422a5cd Remove fdt_high and initrd_high for Starfive
93099a61c7b0 starfive: beaglev: Disable SIFIVE_CLINT and enable RISCV_TIMER
bfb5abac3d1f Revert "riscv: Enable the SiFive CLINT block driver in S-Mode(VIC7100 ONLY)"
7b70e1d44ba9 defconfig: enable cache_wayenable for better performance
7c585978616b configs: earlycon=sbi is deprecated

The commit abb06422a5cd ("Remove fdt_high and initrd_high for Starfive")
has removed the need for buildroot to patch the fdt_addr_r address.

Update linux from commit in the old 5.10 branch that Fedora image was
using to head of esmil_starlight branch [1] which is currently based
on 5.13-rc5 and represents the best kernel for this board [2]. This
commit was tagged as buildroot-20210609 because the branch gets rebased
regularly.

In addition, the updated kernel now has jh7100-beaglev-starlight.dtb so
buildroot no longer needs to copy the dtb from u-boot.

[1] https://github.com/starfive-tech/linux/tree/esmil_starlight
[2] https://github.com/starfive-tech/linux/issues/26

Signed-off-by: Drew Fustini <drew@beagleboard.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
[Arnout: add comment to refer to the tag in linux repo]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/beaglev/extlinux.conf                        |  2 +-
 ...onfigs-starfive-vic7100-adjust-fdt_addr_r.patch | 39 ----------------------
 board/beaglev/post-build.sh                        |  6 ----
 configs/beaglev_defconfig                          | 15 +++++----
 4 files changed, 9 insertions(+), 53 deletions(-)

diff --git a/board/beaglev/extlinux.conf b/board/beaglev/extlinux.conf
index c5444d094c..9daf6a7581 100644
--- a/board/beaglev/extlinux.conf
+++ b/board/beaglev/extlinux.conf
@@ -1,4 +1,4 @@
 label linux
   kernel /boot/Image
-  devicetree /boot/starfive_vic7100_beagle_v.dtb
+  devicetree /boot/jh7100-beaglev-starlight.dtb
   append console=ttyS0,115200 earlyprintk root=PARTUUID=0fef845a-c6e1-45bc-82f7-002fa720f958 rootwait
diff --git a/board/beaglev/patches/uboot/0001-include-configs-starfive-vic7100-adjust-fdt_addr_r.patch b/board/beaglev/patches/uboot/0001-include-configs-starfive-vic7100-adjust-fdt_addr_r.patch
deleted file mode 100644
index 74d70f2721..0000000000
--- a/board/beaglev/patches/uboot/0001-include-configs-starfive-vic7100-adjust-fdt_addr_r.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 2c4c813940c577590f3352cef0c49a8def17905d Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Wed, 28 Apr 2021 22:58:45 +0200
-Subject: [PATCH] include/configs/starfive-vic7100: adjust fdt_addr_r
-
-The default fdt_addr_r of 0x88000000 doesn't work, the kernel never
-boots. Using 0x90000000 works fine.
-
-Since it would overlap with the kernel_comp_addr_r area, this one is
-moved 16 MB further, at 0x91000000.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- include/configs/starfive-vic7100.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/include/configs/starfive-vic7100.h b/include/configs/starfive-vic7100.h
-index 8c5915a73c..7150a23873 100644
---- a/include/configs/starfive-vic7100.h
-+++ b/include/configs/starfive-vic7100.h
-@@ -111,13 +111,13 @@
- 	"fdt_high=0xffffffffffffffff\0" \
- 	"initrd_high=0xffffffffffffffff\0" \
- 	"kernel_addr_r=0x84000000\0" \
--	"fdt_addr_r=0x88000000\0" \
-+	"fdt_addr_r=0x90000000\0" \
- 	"scriptaddr=0x88100000\0" \
- 	"script_offset_f=0x1fff000\0" \
- 	"script_size_f=0x1000\0" \
- 	"pxefile_addr_r=0x88200000\0" \
- 	"ramdisk_addr_r=0x88300000\0" \
--	"kernel_comp_addr_r=0x90000000\0" \
-+	"kernel_comp_addr_r=0x91000000\0" \
- 	"kernel_comp_size=0x10000000\0" \
- 	"type_guid_gpt_loader1=" TYPE_GUID_LOADER1 "\0" \
- 	"type_guid_gpt_loader2=" TYPE_GUID_LOADER2 "\0" \
--- 
-2.30.2
-
diff --git a/board/beaglev/post-build.sh b/board/beaglev/post-build.sh
index b19b9bf6d0..fe61fd33cc 100755
--- a/board/beaglev/post-build.sh
+++ b/board/beaglev/post-build.sh
@@ -1,12 +1,6 @@
 #!/bin/sh
 BOARD_DIR=$(dirname $0)
 
-# The DTB to use is provided within the U-Boot source tree, so we grab
-# it from there, and install it to TARGET_DIR/boot/.
-eval $(make -C ${CONFIG_DIR} --no-print-directory QUOTED_VARS=YES VARS=UBOOT_DIR printvars)
-install -D -m0644 ${UBOOT_DIR}/arch/riscv/dts/starfive_vic7100_beagle_v.dtb \
-	${TARGET_DIR}/boot/starfive_vic7100_beagle_v.dtb
-
 # Bring the extlinux.conf file in.
 install -D -m 0644 ${BOARD_DIR}/extlinux.conf \
 	${TARGET_DIR}/boot/extlinux/extlinux.conf
diff --git a/configs/beaglev_defconfig b/configs/beaglev_defconfig
index bbb69ca268..9b3aba136b 100644
--- a/configs/beaglev_defconfig
+++ b/configs/beaglev_defconfig
@@ -4,16 +4,17 @@ BR2_RISCV_ISA_CUSTOM_RVM=y
 BR2_RISCV_ISA_CUSTOM_RVF=y
 BR2_RISCV_ISA_CUSTOM_RVD=y
 BR2_RISCV_ISA_CUSTOM_RVC=y
-BR2_GLOBAL_PATCH_DIR="board/beaglev/patches/"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/beaglev/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beaglev/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# HEAD of the Fedora branch
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,linux,710cf052d6abda73584481d920b4b6befc7240ea)/linux-710cf052d6abda73584481d920b4b6befc7240ea.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="starfive_vic7100_evb_sd_net"
+# tag buildroot-20210609 of the 5.13 branch (esmil_starlight)
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,linux,83dba1f25dfc118cacec991c31a7a4cfa7405c89)/linux-83dba1f25dfc118cacec991c31a7a4cfa7405c89.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="starlight"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="starfive/jh7100-beaglev-starlight"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
@@ -31,8 +32,8 @@ BR2_TARGET_OPENSBI_UBOOT_PAYLOAD=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-# HEAD of the Fedora branch
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,u-boot,3f3ac01a29ad1cd5fa519d86f81daead2447f1d4)/uboot-3f3ac01a29ad1cd5fa519d86f81daead2447f1d4.tar.gz"
+# HEAD of the starfive-tech:Fedora_VIC_7100_2021.04 branch
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,u-boot,494e5ef7b8071d0b2fba50616d97771e44cbcb7c)/uboot-494e5ef7b8071d0b2fba50616d97771e44cbcb7c.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="starfive_vic7100_beagle_v_smode"
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_JH71XX_TOOLS=y
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
