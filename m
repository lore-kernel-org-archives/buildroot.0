Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6EFC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 14:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0966181985;
	Mon, 27 Dec 2021 14:43:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YBuPQU_r-twd; Mon, 27 Dec 2021 14:43:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28DF481765;
	Mon, 27 Dec 2021 14:43:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CAA141BF9A4
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 14:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2DDE81765
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 14:43:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qEy4L3tS8VLM for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 14:43:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C45A4813EC
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 14:43:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8448082B71; Mon, 27 Dec 2021 14:37:40 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 15:41:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50963f8f2f28dd8abcc800ccbaca1f93c7a82de5
X-Git-Newrev: b59f938302f3db638a61ddf04aac7c986096467e
X-Patchwork-Hint: ignore
Message-Id: <20211227143740.8448082B71@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/*/genimage.cfg: use
 partition-table-type = "gpt" for genimage-15
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b59f938302f3db638a61ddf04aac7c986096467e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Genimage 15 deprecated the gpt option and now prints a warning when it is
used:

INFO: hdimage(sdcard.img): The option 'gpt' is deprecated. Use 'partition-table-type' instead

So change the genimage configuration files to use that instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/aarch64-efi/genimage-efi.cfg                 | 2 +-
 board/beaglev/genimage.cfg                         | 2 +-
 board/friendlyarm/nanopc-t4/genimage.cfg           | 2 +-
 board/friendlyarm/nanopi-m4/genimage.cfg           | 2 +-
 board/kontron/smarc-sal28/genimage.cfg             | 2 +-
 board/minnowboard/genimage.cfg                     | 2 +-
 board/orangepi/orangepi-pc-plus/genimage.cfg       | 2 +-
 board/orangepi/orangepi-r1/genimage.cfg            | 2 +-
 board/orangepi/orangepi-rk3399/genimage.cfg        | 2 +-
 board/orangepi/orangepi-zero-plus2/genimage.cfg    | 2 +-
 board/pc/genimage-efi.cfg                          | 2 +-
 board/pine64/rockpro64/genimage.cfg                | 2 +-
 board/qemu/aarch64-sbsa/genimage.cfg               | 2 +-
 board/radxa/rockpi-4/genimage.cfg                  | 2 +-
 board/radxa/rockpi-n10/genimage.cfg                | 2 +-
 board/radxa/rockpi-n8/genimage.cfg                 | 2 +-
 board/sifive/hifive-unleashed/genimage_sdcard.cfg  | 2 +-
 board/sifive/hifive-unleashed/genimage_spi-nor.cfg | 2 +-
 18 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/board/aarch64-efi/genimage-efi.cfg b/board/aarch64-efi/genimage-efi.cfg
index 13d69e5e42..87e85816bc 100644
--- a/board/aarch64-efi/genimage-efi.cfg
+++ b/board/aarch64-efi/genimage-efi.cfg
@@ -13,7 +13,7 @@ image efi-part.vfat {
 
 image disk.img {
 	hdimage {
-		gpt = true
+		partition-table-type = "gpt"
 	}
 
 	partition boot {
diff --git a/board/beaglev/genimage.cfg b/board/beaglev/genimage.cfg
index 3b28e8dbb6..deefdbc110 100644
--- a/board/beaglev/genimage.cfg
+++ b/board/beaglev/genimage.cfg
@@ -1,6 +1,6 @@
 image sdcard.img {
 	hdimage {
-		gpt = true
+		partition-table-type = "gpt"
 	}
 
 	partition rootfs {
diff --git a/board/friendlyarm/nanopc-t4/genimage.cfg b/board/friendlyarm/nanopc-t4/genimage.cfg
index e616be6349..d63c293ab4 100644
--- a/board/friendlyarm/nanopc-t4/genimage.cfg
+++ b/board/friendlyarm/nanopc-t4/genimage.cfg
@@ -12,7 +12,7 @@ image boot.vfat {
 
 image sdcard.img {
 	hdimage {
-		gpt = true
+		partition-table-type = "gpt"
 	}
 
 	partition loader1 {
diff --git a/board/friendlyarm/nanopi-m4/genimage.cfg b/board/friendlyarm/nanopi-m4/genimage.cfg
index 03f39adfab..35d056ae6e 100644
--- a/board/friendlyarm/nanopi-m4/genimage.cfg
+++ b/board/friendlyarm/nanopi-m4/genimage.cfg
@@ -12,7 +12,7 @@ image boot.vfat {
 
 image sdcard.img {
 	hdimage {
-		gpt = true
+		partition-table-type = "gpt"
 	}
 
 	partition loader1 {
diff --git a/board/kontron/smarc-sal28/genimage.cfg b/board/kontron/smarc-sal28/genimage.cfg
index 8c8a7baaae..0ad020b347 100644
--- a/board/kontron/smarc-sal28/genimage.cfg
+++ b/board/kontron/smarc-sal28/genimage.cfg
@@ -1,6 +1,6 @@
 image sdcard-emmc.img {
 	hdimage {
-		gpt = true
+		partition-table-type = "gpt"
 	}
 
 	partition rcw {
diff --git a/board/minnowboard/genimage.cfg b/board/minnowboard/genimage.cfg
index 2eccce2de4..b169d1d067 100644
--- a/board/minnowboard/genimage.cfg
+++ b/board/minnowboard/genimage.cfg
@@ -17,7 +17,7 @@ image efi-part.vfat {
 #  * the efi-partition created above
 image sdcard.img {
 	hdimage {
-		gpt = true
+		partition-table-type = "gpt"
 	}
 
 	partition boot {
diff --git a/board/orangepi/orangepi-pc-plus/genimage.cfg b/board/orangepi/orangepi-pc-plus/genimage.cfg
index 7c3b4cd746..e730b38096 100644
--- a/board/orangepi/orangepi-pc-plus/genimage.cfg
+++ b/board/orangepi/orangepi-pc-plus/genimage.cfg
@@ -15,7 +15,7 @@ image boot.vfat {
 image sdcard.img {
 	hdimage {
 		# for root=PARTLABEL support
-		gpt = true
+		partition-table-type = "gpt"
 		# default GPT location conflicts with bootloaders, move it after
 		gpt-location = 1M
 	}
diff --git a/board/orangepi/orangepi-r1/genimage.cfg b/board/orangepi/orangepi-r1/genimage.cfg
index e42c37d5fd..e93e802bd9 100644
--- a/board/orangepi/orangepi-r1/genimage.cfg
+++ b/board/orangepi/orangepi-r1/genimage.cfg
@@ -15,7 +15,7 @@ image boot.vfat {
 image sdcard.img {
 	hdimage {
 		# for root=PARTLABEL support
-		gpt = true
+		partition-table-type = "gpt"
 		# default GPT location conflicts with spl, move it after
 		gpt-location = 1M
 	}
diff --git a/board/orangepi/orangepi-rk3399/genimage.cfg b/board/orangepi/orangepi-rk3399/genimage.cfg
index ceab37963d..c94e0bc7cc 100644
--- a/board/orangepi/orangepi-rk3399/genimage.cfg
+++ b/board/orangepi/orangepi-rk3399/genimage.cfg
@@ -12,7 +12,7 @@ image boot.vfat {
 
 image sdcard.img {
 	hdimage {
-		gpt = true
+		partition-table-type = "gpt"
 	}
 
 	partition loader1 {
diff --git a/board/orangepi/orangepi-zero-plus2/genimage.cfg b/board/orangepi/orangepi-zero-plus2/genimage.cfg
index f51ce3f854..aee9719ae4 100644
--- a/board/orangepi/orangepi-zero-plus2/genimage.cfg
+++ b/board/orangepi/orangepi-zero-plus2/genimage.cfg
@@ -13,7 +13,7 @@ image boot.vfat {
 image sdcard.img {
 	hdimage {
 		# for root=PARTLABEL support
-		gpt = true
+		partition-table-type = "gpt"
 		# default GPT location conflicts with bootloaders, move it after
 		gpt-location = 1M
 	}
diff --git a/board/pc/genimage-efi.cfg b/board/pc/genimage-efi.cfg
index 9cf701b798..035a077a78 100644
--- a/board/pc/genimage-efi.cfg
+++ b/board/pc/genimage-efi.cfg
@@ -14,7 +14,7 @@ image efi-part.vfat {
 
 image disk.img {
 	hdimage {
-		gpt = true
+		partition-table-type = "gpt"
 	}
 
 	partition boot {
diff --git a/board/pine64/rockpro64/genimage.cfg b/board/pine64/rockpro64/genimage.cfg
index aa2095b916..14dd0e1d18 100644
--- a/board/pine64/rockpro64/genimage.cfg
+++ b/board/pine64/rockpro64/genimage.cfg
@@ -12,7 +12,7 @@ image boot.vfat {
 
 image sdcard.img {
 	hdimage {
-		gpt = true
+		partition-table-type = "gpt"
 	}
 
 	partition loader1 {
diff --git a/board/qemu/aarch64-sbsa/genimage.cfg b/board/qemu/aarch64-sbsa/genimage.cfg
index 957f1a0530..121ae9f37b 100644
--- a/board/qemu/aarch64-sbsa/genimage.cfg
+++ b/board/qemu/aarch64-sbsa/genimage.cfg
@@ -14,7 +14,7 @@ image efi-part.vfat {
 
 image disk.img {
 	hdimage {
-		gpt = true
+		partition-table-type = "gpt"
 	}
 
 	partition boot {
diff --git a/board/radxa/rockpi-4/genimage.cfg b/board/radxa/rockpi-4/genimage.cfg
index 197968320e..a5100af420 100644
--- a/board/radxa/rockpi-4/genimage.cfg
+++ b/board/radxa/rockpi-4/genimage.cfg
@@ -12,7 +12,7 @@ image boot.vfat {
 
 image sdcard.img {
 	hdimage {
-		gpt = true
+		partition-table-type = "gpt"
 	}
 
 	partition loader1 {
diff --git a/board/radxa/rockpi-n10/genimage.cfg b/board/radxa/rockpi-n10/genimage.cfg
index b3ade327d6..652e75db11 100644
--- a/board/radxa/rockpi-n10/genimage.cfg
+++ b/board/radxa/rockpi-n10/genimage.cfg
@@ -12,7 +12,7 @@ image boot.vfat {
 
 image sdcard.img {
 	hdimage {
-		gpt = true
+		partition-table-type = "gpt"
 	}
 
 	partition loader1 {
diff --git a/board/radxa/rockpi-n8/genimage.cfg b/board/radxa/rockpi-n8/genimage.cfg
index 3329576b76..2e064d48c0 100644
--- a/board/radxa/rockpi-n8/genimage.cfg
+++ b/board/radxa/rockpi-n8/genimage.cfg
@@ -12,7 +12,7 @@ image boot.vfat {
 
 image sdcard.img {
 	hdimage {
-		gpt = true
+		partition-table-type = "gpt"
 	}
 
 	partition loader1 {
diff --git a/board/sifive/hifive-unleashed/genimage_sdcard.cfg b/board/sifive/hifive-unleashed/genimage_sdcard.cfg
index e7f98a47ce..e66f221d73 100644
--- a/board/sifive/hifive-unleashed/genimage_sdcard.cfg
+++ b/board/sifive/hifive-unleashed/genimage_sdcard.cfg
@@ -1,6 +1,6 @@
 image sdcard.img {
 	hdimage {
-		gpt = true
+		partition-table-type = "gpt"
 	}
 
 	partition u-boot-spl {
diff --git a/board/sifive/hifive-unleashed/genimage_spi-nor.cfg b/board/sifive/hifive-unleashed/genimage_spi-nor.cfg
index 2e5d89bfe8..903e675a90 100644
--- a/board/sifive/hifive-unleashed/genimage_spi-nor.cfg
+++ b/board/sifive/hifive-unleashed/genimage_spi-nor.cfg
@@ -2,7 +2,7 @@ image spi-nor.img {
 	size = 32M
 
 	hdimage {
-		gpt = true
+		partition-table-type = "gpt"
 	}
 
 	partition u-boot-spl {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
