Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D853C3600C
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 07:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A21160D65;
	Thu,  3 Apr 2025 07:33:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9BldMeUuBKqj; Thu,  3 Apr 2025 07:33:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 361C160675
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 361C160675;
	Thu,  3 Apr 2025 07:33:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 69B621F4
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 07:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5031581FDA
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 07:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YV-1DEJCmyXg for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 07:33:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3CEA381F64
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CEA381F64
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3CEA381F64
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 07:33:55 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 3324D58912D
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 07:13:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id A35544435B;
 Thu,  3 Apr 2025 07:12:59 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Thu,  3 Apr 2025 09:12:57 +0200
Message-ID: <20250403071258.1995429-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeejleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteeltefhvdeuteegvddvjeejteffgefgvdeigeeuvedvueevtdeluedvgfeuuedtnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopeifihhnughsuhhrfhdrrddpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1743664379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=llyZFUHkY5B77LXoOaeUqFl7cdSMkAOjaZb/OFkJJLc=;
 b=KMT/dGQamJDGbdVaVzNAywFfXqdMvpGbPVvoGDcDoPKVQv2bOuo8LpaORDmR6+zmjRa1XY
 R16hdjvXIYcHdAt9w+VbImbuVFlmjpyTA9tjVCyrQRqtygblUM61E0PX94yp9xFW5R2sJA
 hp5FMW7/21FdsAtDr1TbYSLIyf/QwViA4OSgsJLq1hWWbipbnoGzjoreah4VDujf6Z2PhK
 ecgZic/YG1ybCBokJ6wk8GUmRfsAvRx9Dnlp+XbA1ok0HpygHWGhHrQMzaJK1X43MA3AWu
 hNolHH5L3lCqgt8DcdboLd0OY5Yx2ea2k0oO4cwnvLacBkmXOoqNPqCQ9pIyFg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KMT/dGQa
Subject: [Buildroot] [PATCH] package/glibc: disable on RISC-V ilp32f and
 lp64f, not supported
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

glibc fails to build on RISC-V 32-bit with the ilp32f ABI and on
RISC-V 64-bit with the lp64f: both use single-point precision floating
point, which glibc doesn't support, failing during the configure step
with:

  configure: error: glibc does not yet support the single floating-point ABI

Fix that by disabling glibc support on those configurations.

Fixes:

  https://autobuild.buildroot.org/results/fe8d569cab507992978ef0da649278dd3a9e0b23/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibc/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index d464b3def8..52752e975e 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -22,7 +22,9 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	default y if BR2_microblaze
 	default y if BR2_arc && BR2_ARC_ATOMIC_EXT && !BR2_arc750d && !BR2_arc770d
 	depends on !BR2_POWERPC_CPU_HAS_SPE
-	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
+	# glibc needs atomic instructions, and does not support
+	# single-precision floating point ABIs (ilp32f and lp64f)
+	depends on (BR2_RISCV_ISA_RVA && !BR2_RISCV_ABI_ILP32F && !BR2_RISCV_ABI_LP64F) || !BR2_riscv
 	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_GLIBC_SUPPORTS
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
