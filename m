Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A3DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 09:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AFA8405FC;
	Tue, 15 Mar 2022 09:02:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nOAeUHSapBrz; Tue, 15 Mar 2022 09:02:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA02140201;
	Tue, 15 Mar 2022 09:02:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 066B31BF2A0
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 09:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6A3E408E1
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 09:02:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4vAQNR84abGD for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 09:02:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C1CC408C0
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 09:02:14 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id a8so39655766ejc.8
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 02:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=98o4wkNZZ7Eyk67YwXeUVnw8VNketveMIfv9ubri45U=;
 b=D9QSThBoq0nq7yk+paFvPHm8suByYpHpLIQ5KM+/0fzRwbYGPjeCTfnJ1cW6GQ9t1D
 Uz7BFKG7sp9XyILqQizIF49eDBBREFhSFw/js+mQXVc6dX3N+9/yEDm5XtjTDUyN4xPP
 0H+wozD+A/+IVhdq00UcCCViDyu+0+9zuS2s8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=98o4wkNZZ7Eyk67YwXeUVnw8VNketveMIfv9ubri45U=;
 b=f3R8f1Gvp0jzHdS5i5H1ov1xNyhGB0ifveDofJgHj27ZBr6J05lDa31AsfTNkCh928
 vBTwvO8XpqUmUUhTUENt0VYB0e4cKecXqmD3V6UxzwvYPjksCzHSqjQhNlOVeka4yWUP
 yoFPyKkmdyNf/Be/Ol/K3/veGejW/QChvELDZUJ0+4TpXh/LS33DbLCVjLS8e4HpjiJL
 TC2i1D4Vi72wWetRZ/VtRSsYT8YoJShNIz2dWyjYu5KxOzLlAy8PNTNzc8wyeWH4KrMs
 fxZKifiXVY9OKVeitePo8yE/7Y7pGtedATCZ1URqC5/pc5B3xjJbnx/SGKhjNK9zyUn8
 kdWw==
X-Gm-Message-State: AOAM530LOi88cm/EwmATe+RoRwTvKs+Ru4YAAdBX4e1ExM64gcSlSWHS
 jh5MLgoFQ/w4IwcPyFL5hG0UWpDI8bmgLg==
X-Google-Smtp-Source: ABdhPJyFwVTr+Q0lJPZoERkgRPk4vuyCrnkmyLRiADoSNRzknqHD55YhmIKsWlC/HdzwHKqYnbV/pA==
X-Received: by 2002:a17:907:761c:b0:6d6:e553:7bd1 with SMTP id
 jx28-20020a170907761c00b006d6e5537bd1mr21487764ejc.5.1647334932997; 
 Tue, 15 Mar 2022 02:02:12 -0700 (PDT)
Received: from angeloc.pdxnet.pdxeng.ch ([31.24.139.5])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a056402520b00b00416c0baee96sm7877961edd.6.2022.03.15.02.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 02:02:12 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 15 Mar 2022 10:02:09 +0100
Message-Id: <20220315090209.206025-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] linux: bump CIP kernel to version 5.10.104-cip3
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 linux/Config.in  | 4 ++--
 linux/linux.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 36744c5337..3678ee061f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -31,7 +31,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (5.15)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (5.10.100-cip2)"
+	bool "Latest CIP SLTS version (5.10.104-cip3)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -126,7 +126,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.15.26" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "5.10.100-cip2" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "5.10.104-cip3" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.100-cip2-rt2" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 758fdbf856..18480a87bf 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -9,7 +9,7 @@ sha256  295e4bb3ba3244a9f4c48139ad13f78145f3e6402e11aa25b20aadb9ae9f2b25  linux-
 sha256  03a65f405c3acae4dd8cd952444b7cd931f972c01a42e20a471319a2f6c018d2  linux-4.14.269.tar.xz
 sha256  4fcfe814780d63dc56e907bf41596ff162e9601978bdc1a60eab64cc3903a22c  linux-4.19.232.tar.xz
 # Locally computed
-sha256  e90e8100bf44cdd6714bca3b9b1f78694c99bfa9bdff761de06b192dfb230831  linux-cip-5.10.100-cip2.tar.gz
+sha256  63e6df81c4a747c60eed535ffc2f6f1ddb0c17ec349e860316d9a700c69ab38e  linux-cip-5.10.104-cip3.tar.gz
 sha256  945b63f280c5bd9aad66016ef6fbed57612864192bc0f54f6800562f56cfd518  linux-cip-5.10.100-cip2-rt2.tar.gz
 
 # Licenses hashes
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
