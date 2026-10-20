Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAF9606A323
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 10:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=m/d+sq4B;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=FJ3AMgpZ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E14E6086B;
	Tue, 20 Oct 2026 10:29:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ZEVfQXPtksH; Tue, 20 Oct 2026 10:29:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6600460846
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792492164;
	b=YxCG91U1q8/nm+YZbRMHVvJYJKV+sCSe4xcpSCrgljZHevlZz5Ux0M0ek6YXf3pH/Crx
	 AXvkcZDOAbHfQpZDEpK5cOr7RdRyYOWWo3Hv3AA9VuYq0wvbIztrDUKHqmUZ39s79GkF4
	 bO4fM0q0j5DX4UdS1puhzAFIYsGwnllT/fgUYAzpb8DaSk8Fz/H6DZzG3KZJCPCNBoKvH
	 6WZ5Coi8x2GUQFfvjMn0/xtUGGxFd/T802nOUJVsL/3WA+5/6e9kigIVqv1DcULDrKJ32
	 +FY1e/+YOy0kKsomwArkTagF3UBUtM1v17Jn8D+fCE/AoKZddvpForXGHAp8oBtuX2A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792492164;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-MIME-Autoconverted:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=C0XzNPqW+LrCRdmnnsnqZn7RK25FkJ9dB8b2Ft4aj/c=;
	b=LG834QT294HnTyxNIQWXzyKAB+lQc4RvcL7MKIPToJOquM1oB8WIUAq4M1tgO5ZQXLc9
	 /s/tHZJytJv4/50tHFFMEa67yaEddi49hCXxvmOi9LhOhse1DIJ/iP5UoOwjr3dQZrjM4
	 QEHoR3nvj8oWrrU4j63AXIhV9uakb8A/TSnmvuMtLp660QuwquSIE3BnNY5ALsU+2Me6g
	 mJnRBSdvvfS9N8z0YyqMMAoEKwy6QGG/fTXI7osjEzChXf5NVNQVqO3/D/gv5291DTuKe
	 ZfYngnqcDWgOomkw1H7CvHtH28XqRgFDC92Ez0p8/9feSwOSPTMamkKwNYLLmrOhkcg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792492164;
	bh=C0XzNPqW+LrCRdmnnsnqZn7RK25FkJ9dB8b2Ft4aj/c=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m/d+sq4Bttyw/odrfFAKs/ayS6ORBlwtIsotl2W8/xQ/LGBH1/QNCkgfM4TuvSdwR
	 l5IPR5s5OO6zyGmoqPPBiNcH+kyIu9gNlhL49hYVA16an1kt6HpIqzWN5GogS8UXpL
	 w2wE2KLLOe0KPR/36Vl8thWqjygZjsfln6sPTwuXf6hc69g1Lcq3WFJYuUSIhof8uh
	 /HIjmGnD4JWhfnk8u0/KCXnWSV7b01/KXKPA7iQrlZh2Jx74C20BaQaIcyik8eI2nC
	 ke7S3o5OVyN4gDvmVgRbko4lqS/TyMNblPCvPWmPEB6+Ers6kotMADFANvMuB8rrSs
	 qggPgIWNfSpZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6600460846;
	Tue, 20 Oct 2026 10:29:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E08B1E9
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 504F940583
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:29:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gGISsyhdFD8C for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 10:29:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2B51640567
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792492155;
 b=GjPG5hypC2p+Q9k5x0mxePAbFhHT3OymdPvMgo8VZMq2ZEi/1wzE4vdR64H98xa9Guso
 hbvayzmx9azrVIekZndGY/rZYh2VBYwgH9kRAtrlJQmtQRWnqjHoQKd3WlCubbzhNuGVC
 DdQNEOITVCsTltAuWCoI2ovv9fb7yUST8lKWHTF+9zJnCKSD1YStnZ0TTzSOQ+F4EMVwY
 eml0rY9/S3i6nGuvTe8bKbaCNPNOeLinxzFifmNVleDH7+jJhPdFGCKzJvjMFoAja2YK4
 I02J7o6cu3CjxAWtmiLVXYWWx5WkR0IAn3mFSkHLh0XWToxR+8YLsn6A6pV9yzakoiQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792492155;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:
 X-MIME-Autoconverted:Content-Type;
 bh=aEYhOxOTNT8h1OCrQH+MCULfH1bGBKfhroKUhHhkeMk=;
 b=CXCssqzBv9PCCyhfSnAuqTKA4k8Cb6NBJ49s/xOOp7tGFFmiqHyq62GCj2qxMll4wDdt
 VAiNqdqu9g4kE9cYhm1++hGAeWLRHSRZ9qEXTkCKrsqs07Pj4gQuE+s8TzTxPYZa2CaZR
 CvSjON3+n9li5BxS8j2+yx6UbAzCy4TaqxO4LSA3OikQKkjCW1bOV6ka9mAPmCFuFn/nf
 fO9sokv+1gkBgkKY4nBp+VzYQd2fW1YjM4z5XY7eTtx8EjaAAf/jGA4pmO6lRbn3ZcqNk
 PuEVLqhzRFhxEK6sQW1VZ+ynlx7bTTqyA1mEABIl8gPVP27WF//rnp6B2XMlMI4Ml/Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=FJ3AMgpZ; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=FJ3AMgpZ
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B51640567
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:29:14 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=FJ3AMgpZOHT3Ioj93ceHhS2kWllkrtaNdPOu/iaUUAgQ6+yesUw8ihGm9rKGHtisSxcu2wiFVn+W3eb1RxNb3Nj4PwazEd976y2gvzZsZXBlxfx7OnR7lq/gToCEDFWft2IR0dl7zfmyic5pRVGjWlcfceNxz+LLQRQ083dg2eaxu573zPTgm1RwZA1hoDG4/PaR8ETdbvXDqgYfcyd/XYgqUaVvQcABqh5dVib6lgKUYxMPC0tTzkwRQ/iNtXU18oz0yz8BIygN5wz93ta54YuY2tNo1Tz7kFKN/X5VrIXuPOE1e1JhGC+7mWoPHSG5/VPGWAA4fLv2dkITXAvhvA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=TR0X5xNGnZJxwVljtXyqXM4D2t8c/EY0xZU+67IA32U=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 414447017; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Oct 2026 10:29:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1xJ75h-0000000833C-3u9A;
 Tue, 20 Oct 2026 12:29:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 12:28:57 +0200
Message-ID: <20261020102906.1918308-3-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020102906.1918308-1-peter@korsgaard.com>
References: <20261020102906.1918308-1-peter@korsgaard.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH 3/7] board/freescale: use flash.bin for imx9
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The boot file is generally referred to flash.bin, which is also the name
mainline U-Boot uses:

https://docs.u-boot-project.org/en/v2026.10/board/nxp/imx93_frdm.html#build-u-boot
https://trustedfirmware-a.readthedocs.io/en/stable/plat/imx9.html#deploy-tf-a-images
https://spsdk.readthedocs.io/en/v3.4.1/examples/ahab/imx93/imx93_ahab_uboot.html#ahab-image-container-set

So use that here as well for clarity and compatibility with mainline U-Boot.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
