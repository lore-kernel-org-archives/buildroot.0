Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAEA606A31D
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 20:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RaEq1s4H
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D25F40C72;
	Wed, 21 Oct 2026 20:04:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5_BRELZP-ErU; Wed, 21 Oct 2026 20:04:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EC50640EC5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792613087;
	b=kSJajrhtMDqLp6iB+PnABvIZ9YiC2prhWIdO+0/uRPpnte1rk9UdCa63+Oe+zfY74SLq
	 3oMd2e4Z8CqFfg0/Ds/Xp+xCPLnlG1AhdP1kJc6aG2/PaqSbmbwvMPn8wfh9PUXEIiYMU
	 +QLTAy95XWgu88qaEFZddFj0pGUXH/Eh+Sf/BfK127e4bxXq85EJeybFIlR3LHL8Xtodt
	 okoqRGVRx0fBKlcyQWfM4jFLvOduYQoXrKK/i9LEfgKPKjONHDY+giQjKUhg0vtzPeEbj
	 mTt9GQ95fOLUcZiWgBQ4jQvIKINZv2Ij7qivPtL5xHDUZj+qxeWljqQYm3jDCzL/ktg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792613087;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9GOWVxt/1R8MBrVVYdv/MIw/nRtyvemmYHQoh6eilYI=;
	b=GY+MF/fnwt1WMOogBcaA0ZlkZ5sCi8zSa00umKf4Wv2hUUNVc1lkV0fwceGD0Z2Es0BQ
	 zZoNJWZaegQ+w0SOXIdpL9ihKNm3t4ibn2CmyXduybmx7M5Qqw3fxA/aQHJjK+pc8m5n7
	 9ZrKR9S/hVp4HcskqyqsesT7+nVcQWsxxSkxyUYWwIfBslJ855iAJoU3WDAjR56ZUZM3x
	 qk/3fYObu5BIpRGUm/E4vX+xe2Y2H/XQbQg85Gh2AdRUZOIZPTwyfOQ/LNSD+QwwCNvgk
	 +dDiSPzOiWX1vhdX80ygKiruLOq8ejLKGDx8fnZjlLcEbd8jwbryfIQVZ/nqEjm1UGQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792613087;
	bh=9GOWVxt/1R8MBrVVYdv/MIw/nRtyvemmYHQoh6eilYI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RaEq1s4H90CXrPYlsz6+N4xzMZbSaEUEhEkWUg3Nq+ONUuNMvotH7JbnfOecwNAd/
	 NtEECaOSiiCiSFWPU5bYweaahhxjYC30CgH6DTqFtYre5nMc7NU99gGvd+7B+yt/w6
	 +VF4n0MVcqQNbWe4o/jCUCMJhNPSLr7aTT3CwZXCHfbsIQOMtt7RQpKXD5PrSmzYjY
	 LnnfpWaZEbMR+UuGkm3tRzeLzSA9yI/Lbax6aPR7RBiSmxwI0ehurOJ8n7vHUhq3Vy
	 nTiZK3iVLa4Wcr2CQ3M0E1/vypdPp8AJKFoB1xZT1fWjxoO+ibJhjEBqo8vlUP8pON
	 OQ2i5eYf9ZOEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC50640EC5;
	Wed, 21 Oct 2026 20:04:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 98163356
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D04280C8E
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:04:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4C3hG5b33TBc for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 20:04:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A0ECD80A83
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792613077;
 b=ZULoledJ9quFZRT/2cNjDtydhWIETqfIAh8+JIHJDdr3BGsGkqIL6xMLLnhOMpxQndYt
 j7JOBSrHDLP/aJ9MR9jgKMOkhdy9iZ+garWfsfy/O7fxmeZXMlom7WHyiwkfZMwqCbNOZ
 MtPBhfJlkyV64sLbqH/zVxNgmFnFEbKLGE4cmO4TZaKmz1O1/cbpQJDQaRpZdHch9ccOF
 3QORzY28+Zh/KTwVbHQzdH0pxCB3Syyc6+78reeYJI896nuPgwTgIo+HE+0+YLIbE7XQc
 Vn1+lZPJ1Hm4xgWPCkrW5wwXfivLG3veQPFfIsI4088sz/siOSRHiJlWz6Un7RmlH4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792613077;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4wmkToXgc0LCpdA8ApUeruWkyLdqDUsPka8bFxHN7TQ=;
 b=JmYvSdBxkFWwzmM+rUARksc1he/CZNDcTYXgvykYKdCMLmI9KgKdNOOUps0RBOAYt+Uy
 4NDdDhyF9cPOIgL+x8h3nuxivoziSzvugDszU9/VewiVmJfplBTKZd+CSiO0oDAqaH/r8
 r+5+fbVe8jEzP5gpuVV+3UUWBrIz47OqX0pXCXlVVYgmin2WIL78xeLPQeOqpO/Vp1Lfm
 KkgjYwLQIyHaS6xcQRkXJ0U7MVo3IK1oUF+AEfG0jXtR2e3PJIOi8qoUjvqKCg24BbBZP
 iOd7v+IBO5wBpOBPZd/TmG2ABjDf+z+xQnnGI6mcBiSRbJ+Vr/BkDpERF9fVmrvZLpQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0ECD80A83
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:04:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EADC899B22; Wed, 21 Oct 2026 20:03:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 22:03:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b79b19bb0137f0c02b936db08737b5ca3861e62
X-Git-Newrev: aa1ed6e7415b48807b4a0df289c230d690bff45e
X-Patchwork-Hint: ignore
Message-Id: <20261021200313.EADC899B22@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/freescale: use flash.bin for imx9
 boot file
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aa1ed6e7415b48807b4a0df289c230d690bff45e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The boot file is generally referred to flash.bin, which is also the name
mainline U-Boot uses:

https://docs.u-boot-project.org/en/v2026.10/board/nxp/imx93_frdm.html#build-u-boot
https://trustedfirmware-a.readthedocs.io/en/stable/plat/imx9.html#deploy-tf-a-images
https://spsdk.readthedocs.io/en/v3.4.1/examples/ahab/imx93/imx93_ahab_uboot.html#ahab-image-container-set

So use that here as well for clarity and compatibility with mainline U-Boot.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/freescale/common/imx/genimage.cfg.template_imx9 | 4 ++--
 board/freescale/common/imx/imx9-bootloader-prepare.sh | 6 +++---
 board/freescale/imx91evk/readme.txt                   | 2 +-
 board/freescale/imx93evk/readme.txt                   | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/board/freescale/common/imx/genimage.cfg.template_imx9 b/board/freescale/common/imx/genimage.cfg.template_imx9
index df7ddc25b7..227cc14431 100644
--- a/board/freescale/common/imx/genimage.cfg.template_imx9
+++ b/board/freescale/common/imx/genimage.cfg.template_imx9
@@ -2,7 +2,7 @@
 #
 # We mimic the .sdcard NXP's image format:
 # * the SD card must have 32 kB free space at the beginning,
-# * U-Boot is integrated into imx9-boot-sd.bin and is dumped as is,
+# * U-Boot is integrated into flash.bin and is dumped as is,
 # * a FAT partition at offset 8MB is containing Image and DTB files
 # * a single root filesystem partition is required (ext2, ext3 or ext4)
 #
@@ -24,7 +24,7 @@ image sdcard.img {
 
 	partition imx-boot {
 		in-partition-table = "no"
-		image = "imx9-boot-sd.bin"
+		image = "flash.bin"
 		offset = %IMXOFFSET%
 	}
 
diff --git a/board/freescale/common/imx/imx9-bootloader-prepare.sh b/board/freescale/common/imx/imx9-bootloader-prepare.sh
index a267114d43..ff5910bbf7 100755
--- a/board/freescale/common/imx/imx9-bootloader-prepare.sh
+++ b/board/freescale/common/imx/imx9-bootloader-prepare.sh
@@ -31,11 +31,11 @@ main ()
 
 	"${HOST_DIR}/bin/mkimage_imx8" -soc IMX9 -append "${BINARIES_DIR}/ahab-container.img" -c \
 		-ap "${BINARIES_DIR}/u-boot-spl-ddr.bin" a55 ${SPL_LOAD_ADDR} \
-		-out "${BINARIES_DIR}/imx9-boot-sd.bin"
+		-out "${BINARIES_DIR}/flash.bin"
 
-	flashbin_size="$(wc -c "${BINARIES_DIR}/imx9-boot-sd.bin" | awk '{print $1}')"
+	flashbin_size="$(wc -c "${BINARIES_DIR}/flash.bin" | awk '{print $1}')"
 	pad_cnt=$(($((flashbin_size + 0x400 - 1)) / 0x400))
-	dd if="${BINARIES_DIR}/u-boot-atf-container.img" of="${BINARIES_DIR}/imx9-boot-sd.bin" bs=1K seek=${pad_cnt}
+	dd if="${BINARIES_DIR}/u-boot-atf-container.img" of="${BINARIES_DIR}/flash.bin" bs=1K seek=${pad_cnt}
 
 	exit $?
 }
diff --git a/board/freescale/imx91evk/readme.txt b/board/freescale/imx91evk/readme.txt
index 42c9f41fa2..9a0bbb7be3 100644
--- a/board/freescale/imx91evk/readme.txt
+++ b/board/freescale/imx91evk/readme.txt
@@ -22,9 +22,9 @@ You will find in output/images/ the following files:
   - bl31.bin
   - boot.vfat
   - ddr_fw.bin
+  - flash.bin
   - Image
   - imx91-11x11-evk.dtb
-  - imx9-boot-sd.bin
   - lpddr4_pmu_train_fw.bin
   - rootfs.ext2
   - rootfs.ext4
diff --git a/board/freescale/imx93evk/readme.txt b/board/freescale/imx93evk/readme.txt
index 1173de39db..9978bee684 100644
--- a/board/freescale/imx93evk/readme.txt
+++ b/board/freescale/imx93evk/readme.txt
@@ -20,9 +20,9 @@ You will find in output/images/ the following files:
   - bl31.bin
   - boot.vfat
   - ddr_fw.bin
+  - flash.bin
   - Image
   - imx93-11x11-evk.dtb
-  - imx9-boot-sd.bin
   - lpddr4_pmu_train_fw.bin
   - rootfs.ext2
   - rootfs.ext4
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
