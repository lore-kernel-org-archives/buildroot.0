Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEEAC3DA7D
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 00:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C16B417C3;
	Wed,  4 Jan 2023 00:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C16B417C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dINiS_1iCsBb; Wed,  4 Jan 2023 00:21:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3092417C5;
	Wed,  4 Jan 2023 00:21:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3092417C5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 699EA1BF95E
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 00:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4550C81F00
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 00:21:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4550C81F00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y3R3d2svzIYK for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 00:21:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DFE681EF7
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3DFE681EF7
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 00:21:19 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.6])
 by Aruba Outgoing Smtp  with ESMTPSA
 id CrWtpAYj2eo8HCrWup7N9F; Wed, 04 Jan 2023 01:21:16 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  4 Jan 2023 01:21:10 +0100
Message-Id: <20230104002113.1038775-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230104002113.1038775-1-giulio.benetti@benettiengineering.com>
References: <20230104002113.1038775-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfAatUBph3vkZy8UUv1X1mx1FWTdn1pfYKe39KoN1Mv/62lhUe6guenYbpRDTo/6smltP1FEy4DgUsEwa2gLBWpZsGDRUEmbTQS0szol69J6enJJ3yS5G
 YkKTq3lFUo+DViaLND79G4su99eqlErRzYVz7YoNCnr66MmnvcZ29ecX5G23cxhfwkDSwcmwb3eOQtaDkxRN6rOoNsycA622+QKzYFf6nsHqUdX8+l9rfdEi
 bWmcxs4HUwHrdsgYLqoIr3DIiuZdxhnEnZL3f3fWXUHuPUGbpvttgBSl4GKqL4VEgvHMlbRg90YtRBmL06Vu7A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1672791676; bh=7p4dKRrWTkHEVHLC65n3aQ2lrVzT8u9cy2ANoGIEtdk=;
 h=From:To:Subject:Date:MIME-Version;
 b=Tpol28AofgP88KvqLmHU7s1KYQvis28lAInEOx9uV7O/qiToMlCyVewHfVhIN6OSo
 T5AWg8U6BUFiGDgsv2enGCfmhPhQ5QZPr1znoeTjhpOjDx2i1bWSX2jQOPDKGC5SbX
 SgP8aRKHke8+53xnqPz8Waf9UDMoRiV9yXKbxVhVYUOHtJvLBWPB/VH/7aJ4HBWl2m
 wJCYh4DyCqXkyVDFjDZb64FVlijtj/04loAXQOcQEhq98RXpx5c/gRymwicFWPPprQ
 atzi55FS3wIVMMQ3ve3P/EplK3TLvz2I7SCM1twJ7IBM526FxmFycA1Q/AI9Bnazzi
 mCIdlklSa5/2Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Tpol28Ao
Subject: [Buildroot] [PATCH 1/4] configs/asus_tinker_rk3288_defconfig: fix
 boot by prepending tpl to spl+u-boot
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

During last U-boot version bump it's not been noted that tpl was not
prepended to spl anymore preventing the board to boot, so let's copy tpl
to image folder and prepend it to u-boot-spl-dtb.bin placing it to 32K
offset, where rk3288 bootrom expects to find it. Let's also place
u-boot-dtb separated from spl at 8M offset, where spl expects it to find
it.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/asus/tinker/genimage.cfg       | 11 +++++++++--
 board/asus/tinker/post-build.sh      |  4 ++--
 configs/asus_tinker_rk3288_defconfig |  3 +--
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/board/asus/tinker/genimage.cfg b/board/asus/tinker/genimage.cfg
index a4b1e8d608..fa7fd734f2 100644
--- a/board/asus/tinker/genimage.cfg
+++ b/board/asus/tinker/genimage.cfg
@@ -2,12 +2,19 @@ image sdcard.img {
 	hdimage {
 	}
 
-	partition u-boot-spl-dtb {
+	partition u-boot-tpl-spl-dtb {
 		in-partition-table = "no"
-		image = "u-boot-spl-dtb.img"
+		image = "u-boot-tpl-spl-dtb.img"
 		offset = 32K
 	}
 
+	partition u-boot-dtb {
+		in-partition-table = "no"
+		image = "u-boot-dtb.img"
+		offset = 8M
+		size = 30M
+	}
+
 	partition rootfs {
 		partition-type = 0x83
 		image = "rootfs.ext4"
diff --git a/board/asus/tinker/post-build.sh b/board/asus/tinker/post-build.sh
index 8108ed83ff..ffbbcdeb58 100755
--- a/board/asus/tinker/post-build.sh
+++ b/board/asus/tinker/post-build.sh
@@ -3,7 +3,7 @@
 MKIMAGE=$HOST_DIR/bin/mkimage
 BOARD_DIR="$(dirname $0)"
 
-$MKIMAGE -n rk3288 -T rksd -d $BINARIES_DIR/u-boot-spl-dtb.bin $BINARIES_DIR/u-boot-spl-dtb.img
-cat $BINARIES_DIR/u-boot-dtb.bin >> $BINARIES_DIR/u-boot-spl-dtb.img
+$MKIMAGE -n rk3288 -T rksd -d $BINARIES_DIR/u-boot-tpl.bin $BINARIES_DIR/u-boot-tpl.img
+cat $BINARIES_DIR/u-boot-tpl.img $BINARIES_DIR/u-boot-spl-dtb.bin > $BINARIES_DIR/u-boot-tpl-spl-dtb.img
 
 install -m 0644 -D $BOARD_DIR/extlinux.conf $TARGET_DIR/boot/extlinux/extlinux.conf
diff --git a/configs/asus_tinker_rk3288_defconfig b/configs/asus_tinker_rk3288_defconfig
index 6963fa939f..02b340a7f1 100644
--- a/configs/asus_tinker_rk3288_defconfig
+++ b/configs/asus_tinker_rk3288_defconfig
@@ -17,9 +17,8 @@ BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
-BR2_TARGET_UBOOT_FORMAT_DTB_BIN=y
 BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin"
+BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin tpl/u-boot-tpl.bin"
 
 # Kernel
 BR2_LINUX_KERNEL=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
