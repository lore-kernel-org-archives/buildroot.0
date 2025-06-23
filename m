Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85DEC77B7C
	for <buildroot@archiver.kernel.org>; Mon, 23 Jun 2025 22:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92FDF60BA8;
	Mon, 23 Jun 2025 22:00:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bTr4RYdFx26o; Mon, 23 Jun 2025 22:00:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F35C60FFC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F35C60FFC;
	Mon, 23 Jun 2025 22:00:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 61A92154
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 22:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A7D960ECB
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 22:00:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Miq7PCkmr0Nn for <buildroot@buildroot.org>;
 Mon, 23 Jun 2025 22:00:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0D07C60B97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D07C60B97
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D07C60B97
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 22:00:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 8F29F42E77;
 Mon, 23 Jun 2025 22:00:04 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Jun 2025 23:55:46 +0200
Message-ID: <20250623215546.1850256-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddukeduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdfftddtledvgeefveegfedtjedvveeltdevkeffgfejgeeiveeijeeuvdevgeeunecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepvdgrtddumegtsgduleemledvtdgsmeegjedttdemrgdvfheimegukegukeemhegtvggtmegshegvgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeelvddtsgemgeejtddtmegrvdhfieemugekugekmeehtggvtgemsgehvgegpdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1750716005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=b8sJFkQucB3pSrDaYxEtYyFSVPlC2k0S1rk9n2kDgA0=;
 b=RpJA48drz2mv1QBjehyrc0rg8r31nv2XM3D8F1OUUDV0Ueuty2wbrz6LLfLJHAOFcvevrV
 z5PkZ8c62ps1dt6EudZLwEjv4ZkFkZwZOGgm9h4KyvyUKbq950cM8q+HpiI/0fbEjDIW3+
 JhEb3YX6UV33XaTJnAjwR5YCR+vUMvcz5WF4JiB2/c11Av51WF2CtgrV5flBKR8Q44n9Ug
 WDcWTlIQj2/bW8UMQ/d4hkRRVibR5dMbn3RPSrnmoXxpEdTSWtXvU0ypQaeV7MRoI1FXH3
 A5rsvBYdp0R6s7cfrdsbHVTbKeQCb5Y7MZLRvFqxr2Tq+ArC4Admkwl5fGTaag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RpJA48dr
Subject: [Buildroot] [PATCH] package/squashfs: bump to version 4.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See https://github.com/plougher/squashfs-tools/releases/tag/4.7 for
details:

1. Mksquashfs now reads files in parallel from the input directories
2. Rewritten and improved help system (Mksquashfs/Unsquashfs)
3. New options for building reproducible filesystems (Mksquash/Sqfstar)
4. Elimination of "fragment block stall" and -(not-)reproducible options
5. Other improvements for Mksquashfs/Sqfstar
6. Other improvements for Unsquashfs/Sqfscat
7. New environment variable SQFS_CMDLINE (Mksquashfs/Unsquashfs)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/squashfs/squashfs.hash | 4 ++--
 package/squashfs/squashfs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/squashfs/squashfs.hash b/package/squashfs/squashfs.hash
index c921d638bb..5593502836 100644
--- a/package/squashfs/squashfs.hash
+++ b/package/squashfs/squashfs.hash
@@ -1,5 +1,5 @@
-# Locally computed
-sha256  94201754b36121a9f022a190c75f718441df15402df32c2b520ca331a107511c  squashfs-tools-4.6.1.tar.gz
+# From https://github.com/plougher/squashfs-tools/releases/tag/4.7
+sha256  f1605ef720aa0b23939a49ef4491f6e734333ccc4bda4324d330da647e105328  squashfs-tools-4.7.tar.gz
 
 # License files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index f2cb0ab25e..f3c72e068b 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUASHFS_VERSION = 4.6.1
+SQUASHFS_VERSION = 4.7
 SQUASHFS_SOURCE = squashfs-tools-$(SQUASHFS_VERSION).tar.gz
 SQUASHFS_SITE = https://github.com/plougher/squashfs-tools/releases/download/$(SQUASHFS_VERSION)
 SQUASHFS_LICENSE = GPL-2.0+
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
