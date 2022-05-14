Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35098C433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 15:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97D0A410B8;
	Sat, 14 May 2022 15:55:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a92I-i-6567E; Sat, 14 May 2022 15:55:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74A06410A9;
	Sat, 14 May 2022 15:55:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E4681BF2F8
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 15:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D68783FA4
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 15:55:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3TCBVdW5PW6I for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 15:55:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A84583F2F
 for <buildroot@buildroot.org>; Sat, 14 May 2022 15:55:21 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id v12so14962988wrv.10
 for <buildroot@buildroot.org>; Sat, 14 May 2022 08:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6PMOpMMrTDuWGJVFu0LJX5FFmWDOrIwVfDucpuAl578=;
 b=Ya5Aamqjz9px44fUrLWTGON5DFwW+l3nVPb35F6IRZc46cDzDDO4ifS3fqtkeTr130
 7njSW2qg7zhvyOCMSpDEiNWN/U4BUGKGCyDhcefOAymjPBAofqiZObLrBNT86OrxLEgq
 aqqih3aaiypDD9AB4HBN5XEoNxU7I1YIM1KVwoUqgMBu0tNORASAXQwaPKL99PXfTaKp
 1CjaA/ORfFOxF+v1CS6QciNmoOrmn9ibmVBuoMdMh56GXuZe1PcxktOwYgeGPUVm4Y8A
 yTemXXtt2CUj7pyGBHxq8L2Ct9j6dRF2UpgFiB1K45rtF/4RL0LFdxatL4rtJ7Imnk6/
 Lz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6PMOpMMrTDuWGJVFu0LJX5FFmWDOrIwVfDucpuAl578=;
 b=rDgHcKh7yb0kl8yZYPsjMu3OCDlGfCs9CMKwVSL4iMFgGgputdIls0P6BvD/h/Kc1Q
 af2oqz2CCmrALmNcGSS7J4ZYzaNkN7ViiwJVy74uqAdvIVRZbE/WP2jxkvCLuP0N9YCN
 xxrdcRviqpiDtZi9Je6uLLCBSH5T42dPRY1uD9hTG+2YIUwV4SQBpds65XqkikHJAAyO
 RTCk+R/gDaRsD3LPNCnXpYYVZEbZLjjAiOOoUc/FSfaqaglDfjDSGL3gqGj/0J84XOs5
 fqa/qsPNX5pfkwLEX/lg+/AeZPYCUeuk73XsKYb5CpclJfmOl9brxmKimFPu+L1NiJtW
 sCfg==
X-Gm-Message-State: AOAM5330m7GYQuZjlc5+zItlZl2oXK1gnFQIPBu6qiT8WrCCETWRNT7J
 v/TV6WhBcH0cz1TzPClM8/Wi8ozswZ4=
X-Google-Smtp-Source: ABdhPJyMR53tCvURi/bb2nN/OfDeNKEw4WBdyOEBLtCRMf8emWVdPO0EeBT2FSPFx8D0aQ7M/qtI5g==
X-Received: by 2002:adf:e891:0:b0:20a:d653:7cd2 with SMTP id
 d17-20020adfe891000000b0020ad6537cd2mr7721409wrm.195.1652543719037; 
 Sat, 14 May 2022 08:55:19 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 x15-20020adfcc0f000000b0020c5253d923sm5180870wrh.111.2022.05.14.08.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 May 2022 08:55:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 17:53:01 +0200
Message-Id: <20220514155301.4901-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220514155301.4901-1-fontaine.fabrice@gmail.com>
References: <20220514155301.4901-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] toolchain/toolchain-buildroot: glibc can't
 be built without optimization
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure:

In file included from <command-line>:
./../include/libc-symbols.h:75:3: error: #error "glibc cannot be compiled without optimization"
   75 | # error "glibc cannot be compiled without optimization"
      |   ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/1ba20982d5ec0edc751a11a2d5639f5f6477b9bc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 toolchain/toolchain-buildroot/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 8838cc48ff..1ed1bbe76f 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -60,6 +60,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 || !BR2_arc
 	depends on !BR2_powerpc_SPE
 	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
+	depends on !BR2_OPTIMIZE_0
 	depends on !BR2_OPTIMIZE_FAST
 	select BR2_TOOLCHAIN_USES_GLIBC
 	help
@@ -82,6 +83,9 @@ comment "glibc on MIPS w/ NAN2008 needs a toolchain w/ headers >= 4.5"
 	depends on BR2_MIPS_NAN_2008
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
 
+comment "glibc can't be built without optimization"
+	depends on BR2_OPTIMIZE_0
+
 comment "glibc can't be built with Optimize for fast"
 	depends on BR2_OPTIMIZE_FAST
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
