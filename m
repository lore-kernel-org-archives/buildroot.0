Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F30FA3728
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 17:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AD7480BF5;
	Fri,  2 Jan 2026 17:06:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k1riqJABPHv1; Fri,  2 Jan 2026 17:06:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 725C780C1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767373595;
	bh=ytQKkjdClK7Nv3dXjD2W/u5BtWTbZlvwxbStge0GD10=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mLckdrCNhyxrQ6QXrdksquYCnG8F1JE3NlfFJoXnVZlsyoGy25o7cBzyxCNCbuL3N
	 1xDIWvsnQKp3gvra7cMRX3k2mMcYB1xNovTpi495pkfQHki14z6L6pmggXUGAEx6Gi
	 Y0RqTTSHAsGAimhSDktJni9MLv/xFDI0VQvky98vLzcDDQTzxTEt1GXJVjgekwZb0c
	 4y3u1Z55f0yM9bxEbvRpXZE7s/q/sYoHrIOT/DTDWRFUN+6dosbipiKz6IUT+kpejV
	 C7J128mkYcktL3OgQKUe6mS7NEuoStxszZfpm+fS3DiIAHv0W7Bi+de7/nHdL8JrV4
	 rENl4Ac0XNM5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 725C780C1F;
	Fri,  2 Jan 2026 17:06:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D9C7519D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEE49403F3
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:06:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id obwMawU70-Qn for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 17:06:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0378040227
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0378040227
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:06:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E76A387FC3; Fri,  2 Jan 2026 17:06:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 18:06:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f0c865ee1e8b8a5a79dd1be86bfc5a8859b943ee
X-Git-Newrev: 98a4635d87efaf054cbd10cabcdbdee4153a5b4f
X-Patchwork-Hint: ignore
Message-Id: <20260102170630.E76A387FC3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board: microchip: mpfs_icicle: update to
 support production silicon
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=98a4635d87efaf054cbd10cabcdbdee4153a5b4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the introduction of the production silicon Icicle Kit comes the
need to support multiple board device trees. The HSS puts a minimal dtb
in it's payload's ancillary-data immediately after U-Boot in memory.
CONFIG_OF_BOARD will use this dtb that the HSS carries with the bare
minimum of nodes enabled. It allows for firmware to provide the address
of the devicetree in memory using the `a1` register.
Use the device tree compatible from the hart software services to
essentially "detect" which board is in use and therefore select the
appropiate device tree for the board.
Add a fdt production node to the .its referencing the production Icicle
Kit DTB with appropriate attributes. Introduce matching configuration
entries to enable selection of the production Icicle kit FDT blob for
the MPFS Icicle Production Silicon board.
Update the configuration names to match the device tree compatibles for
each board configuration. With these updates, change image node and
configuration node names with more appropriate names.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/microchip/mpfs_icicle/mpfs_icicle.its        | 36 +++++++++++++++++-----
 board/microchip/mpfs_icicle/uboot-env.txt          | 21 +++++++------
 .../mpfs_icicle/uboot-fragment-rootfs.config       |  1 +
 3 files changed, 42 insertions(+), 16 deletions(-)

diff --git a/board/microchip/mpfs_icicle/mpfs_icicle.its b/board/microchip/mpfs_icicle/mpfs_icicle.its
index a62b079fa1..2f89a6ee2f 100644
--- a/board/microchip/mpfs_icicle/mpfs_icicle.its
+++ b/board/microchip/mpfs_icicle/mpfs_icicle.its
@@ -24,7 +24,7 @@
 					algo = "sha256";
 				};
 			};
-			base_fdt {
+			fdt-mpfs-icicle-kit.dtb {
 				description = "Flattened Device Tree blob";
 				data = /incbin/("./mpfs-icicle-kit.dtb");
 				type = "flat_dt";
@@ -35,19 +35,41 @@
 					algo = "sha256";
 				};
 			};
+			fdt-mpfs-icicle-kit-prod.dtb {
+				description = "Flattened Device Tree blob";
+				data = /incbin/("./mpfs-icicle-kit-prod.dtb");
+				type = "flat_dt";
+				arch = "riscv";
+				compression = "none";
+				load = <0x8a000000>;
+				hash-1 {
+					algo = "sha256";
+				};
+			};
 		};
 
 		configurations {
-			default = "kernel_dtb";
-			kernel_dtb {
+			default = "conf-microchip,mpfs-icicle-kit-prod";
+			conf-microchip,mpfs-icicle-kit {
 				description = "1 Linux kernel, FDT blob";
 				kernel = "kernel";
-				fdt = "base_fdt";
+				fdt = "fdt-mpfs-icicle-kit.dtb";
 			};
 
-			base_dtb {
+			conf-microchip,mpfs-icicle-kit-prod {
+				description = "1 Linux kernel, FDT blob";
+				kernel = "kernel";
+				fdt = "fdt-mpfs-icicle-kit-prod.dtb";
+			};
+
+			conf-microchip,fdt-mpfs-icicle-kit.dtb {
 				description = "Base FDT blob for MPFS Icicle board";
-				fdt = "base_fdt";
+				fdt = "fdt-mpfs-icicle-kit.dtb";
+			};
+
+			conf-microchip,fdt-mpfs-icicle-kit-prod.dtb {
+				description = "Base FDT blob for MPFS Icicle Production board";
+				fdt = "fdt-mpfs-icicle-kit-prod.dtb";
 			};
 		};
-};
+};
\ No newline at end of file
diff --git a/board/microchip/mpfs_icicle/uboot-env.txt b/board/microchip/mpfs_icicle/uboot-env.txt
index 8a655085ed..befbfa2006 100644
--- a/board/microchip/mpfs_icicle/uboot-env.txt
+++ b/board/microchip/mpfs_icicle/uboot-env.txt
@@ -5,12 +5,15 @@
 setenv fdt_high 0xffffffffffffffff
 setenv initrd_high 0xffffffffffffffff
 
-load mmc 0:${distro_bootpart} ${scriptaddr} mpfs_icicle.itb;
-bootm start ${scriptaddr}#kernel_dtb;
-bootm loados ${scriptaddr};
-# Try to load a ramdisk if available inside fitImage
-bootm ramdisk;
-bootm prep;
-fdt set /soc/ethernet@20112000 mac-address ${icicle_mac_addr0};
-fdt set /soc/ethernet@20110000 mac-address ${icicle_mac_addr1};
-bootm go;
+fdt addr ${fdtcontroladdr}
+fdt get value board_compatible / compatible 1
+
+setenv fitconf conf-${board_compatible}
+
+load mmc 0:${distro_bootpart} ${scriptaddr} mpfs_icicle.itb
+bootm start ${scriptaddr}#${fitconf}
+bootm loados ${scriptaddr}
+bootm ramdisk
+bootm prep
+run design_overlays
+bootm go
diff --git a/board/microchip/mpfs_icicle/uboot-fragment-rootfs.config b/board/microchip/mpfs_icicle/uboot-fragment-rootfs.config
index e2a5eb9438..47f4c35ea4 100644
--- a/board/microchip/mpfs_icicle/uboot-fragment-rootfs.config
+++ b/board/microchip/mpfs_icicle/uboot-fragment-rootfs.config
@@ -1,3 +1,4 @@
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="root=/dev/mmcblk0p3 rootwait uio_pdrv_genirq.of_id=generic-uio"
 CONFIG_MPFS_PRIORITISE_QSPI_BOOT=n
+CONFIG_OF_BOARD=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
