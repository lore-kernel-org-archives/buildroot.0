Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D59C021AA
	for <buildroot@archiver.kernel.org>; Fri, 21 Feb 2025 09:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4F2780DA4;
	Fri, 21 Feb 2025 09:30:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w2AkT26F8Ud9; Fri, 21 Feb 2025 09:30:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80E118104F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80E118104F;
	Fri, 21 Feb 2025 09:30:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 89A84D92
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 09:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8321960BC1
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 09:30:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eTeKsQg0o5DJ for <buildroot@buildroot.org>;
 Fri, 21 Feb 2025 09:30:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5E83E60BBE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E83E60BBE
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E83E60BBE
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 09:30:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1098F44164;
 Fri, 21 Feb 2025 09:30:26 +0000 (UTC)
Date: Fri, 21 Feb 2025 10:30:26 +0100
MIME-Version: 1.0
Message-Id: <20250221-fixes_octavo-v2-3-0bb2012512eb@bootlin.com>
References: <20250221-fixes_octavo-v2-0-0bb2012512eb@bootlin.com>
In-Reply-To: <20250221-fixes_octavo-v2-0-0bb2012512eb@bootlin.com>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>, thomas.petazzoni@bootlin.com, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeileeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfetkedtgfehvdfhieejfeehheefledthfevteeikedvgeekvedvgeegueffveeunecuffhomhgrihhnpegvlhhinhhugidrohhrghenucfkphepvdgrtddumegtsgduleemleehrggvmeelfhdttdemugegfhgrmedvkegsugemsgekvgelmedvvggvfhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeelhegrvgemlehftddtmegugehfrgemvdeksggumegskegvleemvdgvvghfpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehsmhhilhgvrdhfrhdprhgtphhtthhopehkohhrhidrm
 hgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1740130226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JYaRVoi8OVzS83xT88hiy+lrA1h6c5jvUVVneDnTRr8=;
 b=anj79qbFOhQLgme5tN77cQ4kC7SX//6TsfDocr/ecLHBJiodM2I3SMMT/lT0vWYeTqosNK
 rVXh2IS6Wn1ylspgaeaiGzLtsMBK908G5W1izSYuZuyzCCN0bJOKLrz7FWyQxJt8OApkN8
 UMmjRyGkGa5S10lKNLkJ2sRj7Jl0pwe02NfbAoM6kFuw1QzZGb9juEdXxtZIjV4lAVOP/G
 gdqGKcB5iwhlJ1R6Ie9ABTFSK0zFyZfMT8EppPGWoRAF8sKuowgaM5y0ljRcvKb3Mhm2lr
 HF6p5ULEJF+xNA1mFkv53mi9SPSEN3Ln1moR7pha2zqK7HdeOWw5xNukmYIVgQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=anj79qbF
Subject: [Buildroot] [PATCH v2 3/3] configs/octavo: Switch to Bootlin stable
 toolchain
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update the Octavo configurations to use the Bootlin glibc stable prebuilt
external toolchain, as recommended in the Buildroot meeting report from
ELCE 2024: https://elinux.org/Buildroot:DeveloperDaysELCE2024

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 configs/octavo_osd32mp1_brk_defconfig | 4 +++-
 configs/octavo_osd32mp1_red_defconfig | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/configs/octavo_osd32mp1_brk_defconfig b/configs/octavo_osd32mp1_brk_defconfig
index 92848f62b5..e8857f3649 100644
--- a/configs/octavo_osd32mp1_brk_defconfig
+++ b/configs/octavo_osd32mp1_brk_defconfig
@@ -1,6 +1,8 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/octavo/osd32mp1-brk/patches"
 BR2_ROOTFS_OVERLAY="board/octavo/osd32mp1-brk/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
diff --git a/configs/octavo_osd32mp1_red_defconfig b/configs/octavo_osd32mp1_red_defconfig
index 4372b4f8ae..d179e0a27e 100644
--- a/configs/octavo_osd32mp1_red_defconfig
+++ b/configs/octavo_osd32mp1_red_defconfig
@@ -1,6 +1,8 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/octavo/osd32mp1-red/patches"
 BR2_ROOTFS_OVERLAY="board/octavo/osd32mp1-red/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
