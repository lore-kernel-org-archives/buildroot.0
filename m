Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AD4C433EF
	for <buildroot@archiver.kernel.org>; Sat, 29 Jan 2022 22:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D862760B2B;
	Sat, 29 Jan 2022 22:47:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o1oBnjFiWWB1; Sat, 29 Jan 2022 22:47:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BDC060AE7;
	Sat, 29 Jan 2022 22:47:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B0751BF357
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 22:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44FBB40128
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 22:47:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Iw84NJTb4F9u for <buildroot@lists.busybox.net>;
 Sat, 29 Jan 2022 22:47:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3487F400CD
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 22:47:02 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id e8so18027689wrc.0
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 14:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4rmdlumvXxutocS4e8RtF/Ik73xgQl/dRvPMkAEFyQg=;
 b=QHcfih/Svkvl37IZva93/C79dItC3MmHkgV1Y9h8wROGzz84p1qnHwvINt7FHxfTeX
 aOQCWkNK+EqKvpnkA5zvQXMxazZ/fBJTPGSgMZ4WxsMLQEpRnL2xuQtIrqC3aRlQJ7X7
 sTDv0StC+fVvS2sguSytlXvOAGrJh2QcC1rlrJiTySufxGixL140M/MNp2vJWdmGKkx8
 C2z/IoO2utckTeUuEj6nnLuJj72prwlUseTztheiZkf77lCeyc7E/ecDB42xeHm8m/JC
 Au1dxZCWPAxU54zWbjkU5FikHrHdV5Rlj6vue0Xtlc27+rKGAlAVMzXLZEjfip/HQQL6
 j6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4rmdlumvXxutocS4e8RtF/Ik73xgQl/dRvPMkAEFyQg=;
 b=5o+ssLqHaIG1vSpuxrgIYL3XbP+gfNi5E5uphOfMxzEptY6oTv0wAY/b/PNiTFUQqI
 QTGJHjjTpMLclG0WWtnM32dCtehhZlbg6u+8JIRms4zLuaUD+go9ajDoFr4AVsqE0c2Z
 scRrB7PaWaK3u7i5MwQ/twaoZ6wsj2wpUi4HpZGGfxVsOzhw4t21XwEV78htKEdl3M8b
 0k2ypklcDM+eklhqSAk+LT4VZi5FF/7snQFpCrMmKtajwIHLSFX3ymrmMn5Bug1kj8Md
 b0rNe7SLZd1d5EDOTSSGm83mvm9hAFQcS+lwczNIajArFuAK+fy6dJXlQEDpeshE+zOS
 NXPw==
X-Gm-Message-State: AOAM531fkaso/ritu4Ts/xAxM0U5bRdS8XeyANiPvJpunr9j9+Sz8oge
 17MTN99OaPT85A2sQPyuJOWdMCLSOOs=
X-Google-Smtp-Source: ABdhPJyuvum3rEzQlQTQPyACkfUy97w3wq1K2a9ZiGDMZtGRYAEd4LpXq/09uIxAEag1+UiUUsbZ/A==
X-Received: by 2002:a5d:6402:: with SMTP id z2mr12030648wru.481.1643496420324; 
 Sat, 29 Jan 2022 14:47:00 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id l24sm5101278wme.17.2022.01.29.14.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 14:46:59 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Jan 2022 23:46:51 +0100
Message-Id: <20220129224651.1282263-5-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220129224651.1282263-1-romain.naour@gmail.com>
References: <20220129224651.1282263-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/5] docs/manual/adding-packages-directory.txt:
 reorder select/depends
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From [1]:
"Even though the ordering has absolutely no consequences in Kconfig, it
 is not logical (when reading). It is more logical and far easier to
 understand when depends come first, followed by the selects."

 Also, the Config.in example in the manual suggests to use this coding
 style [2]."

Use the correct coding style in the chapter "Choosing depends on or select"
in the manual.

[1] http://lists.busybox.net/pipermail/buildroot/2015-October/142955.html
[2] https://nightly.buildroot.org/manual.html#_coding_style

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 docs/manual/adding-packages-directory.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 6c68d7aa67..e5c7462a6c 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -196,13 +196,13 @@ config BR2_PACKAGE_E
 --------------------------
 config BR2_PACKAGE_D
 	bool "Package D"
-	select BR2_PACKAGE_B
 	depends on BR2_PACKAGE_A
+	select BR2_PACKAGE_B
 
 config BR2_PACKAGE_E
 	bool "Package E"
-	select BR2_PACKAGE_D
 	depends on BR2_PACKAGE_A
+	select BR2_PACKAGE_D
 --------------------------
 
 Overall, for package library dependencies, +select+ should be
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
