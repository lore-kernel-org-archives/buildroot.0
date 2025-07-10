Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8B3C83F1D
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 10:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60EB261197;
	Thu, 10 Jul 2025 10:42:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ERG6CCQtNaX4; Thu, 10 Jul 2025 10:42:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88C5F610D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88C5F610D1;
	Thu, 10 Jul 2025 10:42:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 72EC1114
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 10:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5921E408C8
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 10:42:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bI_nhD371sX2 for <buildroot@buildroot.org>;
 Thu, 10 Jul 2025 10:42:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=202.12.124.157;
 helo=fhigh-b6-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7F6DE40263
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F6DE40263
Received: from fhigh-b6-smtp.messagingengine.com
 (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F6DE40263
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 10:42:09 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfhigh.stl.internal (Postfix) with ESMTP id A69307A018C;
 Thu, 10 Jul 2025 06:42:08 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Thu, 10 Jul 2025 06:42:08 -0400
X-ME-Sender: <xms:AJlvaNVSwaUf7xUXcW76BiyvLZsu8hBDl83Ipy3rbfcxX4ELHdERWw>
 <xme:AJlvaHNVrDHbG5camgcuStBIRV8cfGmYz1AUn-e-wQYEsHetHrO057Q8Qy0NGoqgJ
 SBQTfVYirw7jR-j9wU>
X-ME-Received: <xmr:AJlvaJar-ywlWe2KfvnrVT6-4Y7BU_geu4YX-enB6y5zJcLzF0Q4PooZDAaYzB30zI_nr9scHUJk_D4_gwoSONu_FiWFFqjDournpdAn0NA8SFjyRfWeYNgt0aOTYRkw3DlhwfJhSLGXXbo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegtddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertd
 ertdejnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
 fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepgfevgeevkeehhedvgedugf
 eludehvddvveelkedtgfejueeitedtudegiefhudefnecuffhomhgrihhnpegsuhhilhgu
 rhhoohhtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdpnhgspghrtghp
 thhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhhurdhosehfrhgvvg
 drfhhrpdhrtghpthhtohepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdp
 rhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-ME-Proxy: <xmx:AJlvaDrbFrrCOd5QPDM86fwW0MU_1jKHNkBZ65oe0dkc2eX08zm2Vw>
 <xmx:AJlvaFb38xLg8fu0nWudMOl-vaGf6ZwHS6TdQ1dU-2quGcGf6Gx-JQ>
 <xmx:AJlvaDQPwUPs9-vokDN8w3UzTNAXn-M2DSHqvsj5Et4YbVfdGzd5Zg>
 <xmx:AJlvaE6yXXOlYWwKb77idwhaF8XwnZwcnSEXfXDl9T1fAADDuyp6Cw>
 <xmx:AJlvaPr3AHa1tsG4HrGa7UsMuDdz3j0HLyetutfbIHY4R4QA9_8S53y8>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Jul 2025 06:42:07 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Thu, 10 Jul 2025 11:41:58 +0100
MIME-Version: 1.0
Message-Id: <20250710-loongarch-fabi-v2-3-72fcf95c8b65@flygoat.com>
References: <20250710-loongarch-fabi-v2-0-72fcf95c8b65@flygoat.com>
In-Reply-To: <20250710-loongarch-fabi-v2-0-72fcf95c8b65@flygoat.com>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1346;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=tyvK/1VOVmNOj/0gtkmRIxVShuayz+Pbq5nfK6wWIxs=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhoz8Gb/KbkU1VjK/bTllG+Z1uNR5qsjhuw4Pbx5t7jnwu
 fIm51W+jlIWBjEOBlkxRZYQAaW+DY0XF1x/kPUHZg4rE8gQBi5OAZjIHy2Gf5Yri66JKtkJTd7S
 VWCxlvFR1fQ7hfrlk+P8krylFSxmf2BkeKUWs+/+oZLtYp21vHZCRwzyk4odTkV3rzc9MldQNzi
 KHQA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1752144128;
 x=1752230528; bh=/uRso5eD43SKHjurASQdHoX5LlpU3Y4t6FDfhxCUOlA=; b=
 hBvfWLI1GITWNjdGQcV4w8Z+tdVAEzvjS1gkVLIlPDTH1tepUy++SvNOyfm5MStl
 1UZuLK64CtJh6vxt8+10QcJVVJgxad8c5Ymxd/Y5/y3rRTPcg8r7kvdk2G7YUfZH
 ToMu3HSay8e2f1D9waPjbQBSNs4dVehVLI+2LShh56aU3Bv20vwJLWF4b6Eg3Rah
 t6A/EW4CvLCZRpZpXhbn08BAx4VF1ofJ88GaPxoWSkkawnStCIIumFWr9HHOy8Un
 /Fxx/ThheN/dg6D5q2nu+2jT0liIAKmdFiGEQ3lEtQNRtrKPpnHeqot7A+OqIb/7
 KTtnzx9dtTe0w1UKaDR8PA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1752144128; x=
 1752230528; bh=/uRso5eD43SKHjurASQdHoX5LlpU3Y4t6FDfhxCUOlA=; b=I
 TdPDKhRVwKYWvcxMtUrnUM2lzaomCUMF1uYml0cESswdxJE/X29S/qbGYrkJSvWE
 1ZM8DYyPLIL952QnNJbWJBf2/KcMKxGAYKe0CS9SI3yxIRiI3Oj09UTBQDz9KPvw
 5lPW7DChCHm8BRvl4CXfgKuCC2KQXv010Z/9rnLu0NsckeivVGUTP0dKZC8Cc6Jn
 4e41mDHfaJ7cA51bBPXEqRG/6YvdoxjpMVCVpAgFxamM5fHZlZUeWmaZc1bLV+TZ
 92VwmBcUwKdWDjy2hMBleCU3S5izyVUI3gxUKF+avR3oU+usXMNW+GzIW3h06Mpt
 LYqUg6MPRlY1wzgp1UV+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm3 header.b=hBvfWLI1; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=ITdPDKhR
Subject: [Buildroot] [PATCH v2 3/3] arch/loongarch: Fix minimal GCC version
 for taget arch options
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Both la64v1.0 and la64v1.1 requires GCC 14 as minimum.

Fixes: https://autobuild.buildroot.org/results/04a904f08d6e0aacbd308692c99e77a334d72b95/
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/Config.in.loongarch | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/Config.in.loongarch b/arch/Config.in.loongarch
index c11d8dc79f0e76526948d2befbfae722fbc1b0ed..071ee241e932d1c63b86423c1c86ff3b16b25488 100644
--- a/arch/Config.in.loongarch
+++ b/arch/Config.in.loongarch
@@ -13,14 +13,14 @@ config BR2_loongarch64_generic
 config BR2_loongarch64_v1_0
 	bool "LoongArch64 ISA version 1.0"
 	depends on BR2_ARCH_IS_64
-	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	help
 	  LoongArch64 ISA version 1.0 processor.
 
 config BR2_loongarch64_v1_1
 	bool "LoongArch64 ISA version 1.1"
 	depends on BR2_ARCH_IS_64
-	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	help
 	  LoongArch64 ISA version 1.1 processor.
 
@@ -94,7 +94,7 @@ config BR2_LOONGARCH_ABI_LP64F
 config BR2_LOONGARCH_ABI_LP64S
 	bool "lp64s"
 	depends on BR2_ARCH_IS_64
-	# GCC can't find the right library path, pending investigation
+	# GCC can't find libraries, pending investigation
 	depends on BR2_BROKEN
 endchoice
 

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
