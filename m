Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0216C71157
	for <buildroot@archiver.kernel.org>; Tue, 24 Jun 2025 05:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BE1960FDF;
	Tue, 24 Jun 2025 05:17:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EZb1dfM0csKF; Tue, 24 Jun 2025 05:17:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 898DA60ADB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 898DA60ADB;
	Tue, 24 Jun 2025 05:17:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 472B3767
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 05:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D21760D76
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 05:17:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IgRBTpA_3ofo for <buildroot@buildroot.org>;
 Tue, 24 Jun 2025 05:17:42 +0000 (UTC)
X-Greylist: delayed 62794 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 24 Jun 2025 05:17:42 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5F9AD60035
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F9AD60035
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::236;
 helo=relay16.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com;
 receiver=<UNKNOWN> 
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F9AD60035
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 05:17:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13BD244A22;
 Tue, 24 Jun 2025 05:17:38 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 thomas.petazzoni@bootlin.com, Joachim Wiberg <troglobit@gmail.com>
Date: Tue, 24 Jun 2025 07:17:34 +0200
Message-ID: <20250624051736.2859733-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduledtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephedtheeufeeutdekudelfedvfefgieduveetveeuhffgffekkeehueffueehhfeunecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtp
 hhtthhopehtrhhoghhlohgsihhtsehgmhgrihhlrdgtohhm
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1750742259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=UHa4FLRKh27GkqP3ZNUnJUQSVT/ZC103QgnyCfLY6PE=;
 b=L1laNo+oSgECxhPJ4Xk1ZyOLuJXIjXcqLphguZ0BKtTGcnT1L0GAXEUF6ND/+aigMLqkGR
 QgsP8EeMLred1hm/pA/MPhB6LKBjpSD07MtGJcNnWjy1IP84x4kBLP13KucDJNoH9qsgDR
 lxxYvGrdHWK7vswlXE4zvpgvsqDgKEaQDSzcEi8MkIoX1dmIt9O4263QnbFXSOAHi5iSBN
 Fid0G4bWaKaO2MuR3s9piHMI6mOosbsxCc4waY+ZB/84bEIESIhNzccFdvcG62PAaPNpwG
 hHeN5Lv6Z4+JEL2O3BLdatQ30MRF0jLx2Otf2ZEGrqp+zGk49ll9gb/445IRZw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=L1laNo+o
Subject: [Buildroot] [PATCH] board/espressobin: Bump linux to v6.12.34
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
From: Maxime Chevallier via buildroot <buildroot@buildroot.org>
Reply-To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump from v5.15.1 to the latest LTS, v6.12.34.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 configs/globalscale_espressobin_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/globalscale_espressobin_defconfig b/configs/globalscale_espressobin_defconfig
index 562e646b70..5b4f6dcf55 100644
--- a/configs/globalscale_espressobin_defconfig
+++ b/configs/globalscale_espressobin_defconfig
@@ -1,12 +1,12 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Marvell ESPRESSObin"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/globalscale/espressobin/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.34"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/globalscale/espressobin/linux-extras.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
