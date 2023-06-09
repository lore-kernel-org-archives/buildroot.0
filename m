Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08D4C7EE29
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 17:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 065DB842BB;
	Fri,  9 Jun 2023 17:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 065DB842BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8mO9ZhkAt2gL; Fri,  9 Jun 2023 17:46:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AC86842B3;
	Fri,  9 Jun 2023 17:46:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AC86842B3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 410FA1BF37B
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 17:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 270EA842B3
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 17:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 270EA842B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qyq9HP8ojiGo for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 17:46:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E16681AEF
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E16681AEF
 for <buildroot@buildroot.org>; Fri,  9 Jun 2023 17:46:50 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 69DEC5C0300;
 Fri,  9 Jun 2023 13:46:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 09 Jun 2023 13:46:49 -0400
X-ME-Sender: <xms:iWWDZG3_A8jgowAPIo9Elv-ZVKjEPrrd10CY4W_5XNHvTUYkVwAPPA>
 <xme:iWWDZJHLoQcwpYJ3D6m-shVSX-k_r4bgJuIMuK6GN39NO863gpdS-ufBZTdQQvrZ0
 RDuJ9unybXIAsZgfbM>
X-ME-Received: <xmr:iWWDZO5K1PvmakuXKIk62Pt2HrkN8cCDUp395Pfazo6leuQNRUm7R-HYJAPrzR2iVIjSHSVhZ22GndrvAjG5p2VgVajQMjRk7hjYVWk-aH36SQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgedtkedguddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvihgrnhhr
 uhhiucghvghiuceothhirghnrhhuihesthhirghnrhhuihifvghirdgtohhmqeenucggtf
 frrghtthgvrhhnpefhveffheettdelgfeigffhfffftdejueejleelgedttedtheffgfdv
 ueekffffieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehtihgrnhhruhhisehtihgrnhhruhhifigvihdrtghomh
X-ME-Proxy: <xmx:iWWDZH0nAbEC7CSndNo8UmTuKQHmahazRd4XooEOUsbaTKnib5UMEw>
 <xmx:iWWDZJHid3BEKXLikGO_kQ71CVZ1SLZeGw6NmCE6WR3qnIeF7B1J_A>
 <xmx:iWWDZA9aLLUSR5qxZ9DbUhoOR8RuOmaJO2qtI8Ej-Y2g9RLjZLcIZA>
 <xmx:iWWDZMOXmh-HrtF_Xiy1KvbmFWazyOaeSu-FMG0w8vwXYpJcj4I2nQ>
Feedback-ID: ia0a946e4:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jun 2023 13:46:48 -0400 (EDT)
To: buildroot@buildroot.org
Date: Fri,  9 Jun 2023 17:46:42 +0000
Message-ID: <20230609174647.3097344-1-tianrui@tianruiwei.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tianruiwei.com; 
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1686332809; x=1686419209; bh=IR
 8RBDmSXagFVkWrh/0IRG7ySbS5VvUdre5inaQw4so=; b=j8dFknkQD3lmM55lA8
 mbrPzwKhOJAQ/kMtjWe/T0TEkIMnP0J0TVNZbsrXXgazvgFjE5HJs4+G15A3RPE0
 W3Jrbf28Fk4zIpi5yqzZilLFDHxgLW0QT9sXh/adLHOVr2s89O74hfntRosNe18O
 NrSTm0Zgl9TELhhQAfdoGgBsEErzFz0bdFTb7btNPEuFSbAvbt1HYi1uGuuOWanF
 YCgNcG8m8yZLDRcNQvuex9mb/Z5pfWUCgem9y7fetjoAXJkewMWVgu2oHrBZZ8jU
 KA/hcEb1MywRFu6XHvy3hzzdOGpMQ9K6GF5ZT8a4ilCW+rwRSdG/+dUSXyGmGdLW
 GH0Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1686332809; x=1686419209; bh=IR8RBDmSXagFV
 kWrh/0IRG7ySbS5VvUdre5inaQw4so=; b=doFa9O2t+lgyZdXg2OniVJ81nd9hF
 ctu2rzi1qmqxKTTjLNEfjiv518jT/4CHtcOMpB2WOfWxYG4bsatQDQqdyVH74MjQ
 5by3TWJbici5hlR1g11jjj9Sr6KvGY5oOIL6QGT2m/8TePpEuPL1AQphCoh8RTYT
 UsBksyl8q5fbrOZ42yl5/IlBm3pRQMqxEcpvTIFe94jBaE8YdTF3+eRJjr/5d5JN
 FAanGWvVOgjFCfIQg4/Nsw+IpIjWZXxTCs72f5eR0eq52zoMOvPhj/4nILTn/kUe
 pFueG+N1oD+1yp1dIAoDNR9nnhe/erBCZ7WJK8hSKcCv8Q5AlGgli/zyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=tianruiwei.com
 header.i=@tianruiwei.com header.a=rsa-sha256 header.s=fm2 header.b=j8dFknkQ; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=doFa9O2t
Subject: [Buildroot] [PATCH] arch/config: Enable RISC-V Toolchain with
 Vector Extension
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
From: Tianrui Wei via buildroot <buildroot@buildroot.org>
Reply-To: Tianrui Wei <tianrui@tianruiwei.com>
Cc: Mark Corbin <mark@dibsco.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commits adds support for building a RISC-V toolchain with the
vector extension.

Signed-off-by: Tianrui Wei <tianrui@tianruiwei.com>
---
 arch/Config.in.riscv | 8 ++++++++
 arch/arch.mk.riscv   | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
index b5e84389e0..c5b6c48ed3 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -18,6 +18,9 @@ config BR2_RISCV_ISA_RVD
 config BR2_RISCV_ISA_RVC
 	bool
 
+config BR2_RISCV_ISA_RVV
+	bool
+
 choice
 	prompt "Target Architecture Variant"
 	default BR2_riscv_g
@@ -63,6 +66,11 @@ config BR2_RISCV_ISA_CUSTOM_RVD
 config BR2_RISCV_ISA_CUSTOM_RVC
 	bool "Compressed Instructions (C)"
 	select BR2_RISCV_ISA_RVC
+
+config BR2_RISCV_ISA_CUSTOM_RVV
+	bool "Vector Instructions (V)"
+	select BR2_RISCV_ISA_RVV
+
 endif
 
 choice
diff --git a/arch/arch.mk.riscv b/arch/arch.mk.riscv
index 8d2236147c..ee5c434b97 100644
--- a/arch/arch.mk.riscv
+++ b/arch/arch.mk.riscv
@@ -26,6 +26,9 @@ endif
 ifeq ($(BR2_RISCV_ISA_RVC),y)
 GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)c
 endif
+ifeq ($(BR2_RISCV_ISA_RVV),y)
+GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)v
+endif
 
 # Starting from gcc 12.x, csr and fence instructions have been
 # separated from the base I instruction set, and special -march
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
