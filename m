Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A246C433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 18:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29669408AE;
	Sat, 22 Jan 2022 18:51:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wcuREg6kHKN2; Sat, 22 Jan 2022 18:51:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7377B40332;
	Sat, 22 Jan 2022 18:51:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA0B51BF2C2
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 18:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D814340332
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 18:50:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jiaqYlMtQSW6 for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 18:50:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 01F7D4032E
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 18:50:58 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 az27-20020a05600c601b00b0034d2956eb04so24839957wmb.5
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 10:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+OoqlVhc2bsQLbXF4YUZgA3oxz8ICsTsGtwPMz/rNDA=;
 b=DYAw6i2J981SBaW3gqh2zXgHFVXxhandt0zJocZMFA95LqD/jCG/6pEJ9tgm5r7d2k
 +sKhKS55JhPODs8twXlLAqyphsVxo0tQMyDwSyS67joK4Tyyy18YgvtE6X4by26nGWRr
 UwMMNAT2ELpPMGpMKozVgfjiDSSz7bRnufFbnlIffge2EmsWfNMW4X9Wfrgmq0xg5VzC
 k3IpHIx4PwwAbdjZk9eNlgYBuyZXgv/MJt4ec8FK9/sktZi8mXSt3/FSj+AEpd5kzwUK
 5C8gSharLPoMkGhMrauiGEule6JU3sGU5LJBFk1ykl2ihqsemPUpm4Ewsi8T01D2Mk+u
 ylHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+OoqlVhc2bsQLbXF4YUZgA3oxz8ICsTsGtwPMz/rNDA=;
 b=In5SyD9XwSz2dZLoGp2GAqEMiLIaT2pvUmDrXiccnL95q6TtwCIrr9as0wxSRkWucD
 TWc//bOc/3wxL7w9EXHmFVtYaixAg1CQIC5Is/jxcAgB+hmCSStZOgiQCFA2xq/l+mUO
 mRxQRo047U903YEpwWLLGtfFs6dhpvFbFqS5LYEAPObu5txeQKkVY0sVrlPBkVxakbc+
 vXTUiV1m1pMZNxMmGdCmh5w732QorU9CqtMzHCNoCnBAjt5cCKsya9TSrjZmURFc95ZT
 yt1ESjjoOK4hajo+mj2vPrtoE8w3UJA8lh7YSA5QdcE028tEGI/JFWl4t0Q4e8mtc5N0
 sD0Q==
X-Gm-Message-State: AOAM533AmfRf8h44qJxulmuuK6aEnP628qYfpaFhX8CyjfzwwRqf6yQP
 E6IseliM0KOxY1GCsv0fJM1IRmevrRpyJw==
X-Google-Smtp-Source: ABdhPJxZ3H8Nn2Pqu1gp8aJ36y3mMIg7B962C7EWI6QpD3qnaY6cLClYcfcSkf6hqmCtaK1cuRtvGQ==
X-Received: by 2002:a05:600c:3490:: with SMTP id
 a16mr5506075wmq.179.1642877457245; 
 Sat, 22 Jan 2022 10:50:57 -0800 (PST)
Received: from dell5510.arch.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id g17sm20124006wmq.9.2022.01.22.10.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 10:50:56 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 19:50:49 +0100
Message-Id: <20220122185049.1194-2-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220122185049.1194-1-petr.vorel@gmail.com>
References: <20220122185049.1194-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/2] package/nfs-utils: Update supported
 versions
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Suggested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
New in v2

 package/nfs-utils/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index df9c12ca44..f00debc420 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -12,6 +12,8 @@ config BR2_PACKAGE_NFS_UTILS
 	help
 	  The NFS Linux kernel server.
 
+	  Supports NFSv3 and optionally NFSv4 (and later).
+
 	  http://linux-nfs.org/
 
 if BR2_PACKAGE_NFS_UTILS
@@ -24,7 +26,7 @@ config BR2_PACKAGE_NFS_UTILS_NFSV4
 	select BR2_PACKAGE_LVM2
 	select BR2_PACKAGE_SQLITE
 	help
-	  Enable NFSv4/NFSv4.1 support
+	  Enable NFSv4/NFSv4.1/NFSv4.2 support
 
 comment "NFSv4/NFSv4.1 support needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
