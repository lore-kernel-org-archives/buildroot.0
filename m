Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DB2C433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Dec 2021 15:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 000948269C;
	Wed,  8 Dec 2021 15:47:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MTwMG9pyqaUt; Wed,  8 Dec 2021 15:47:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E941825E8;
	Wed,  8 Dec 2021 15:47:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 14C071BF32B
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 15:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0327A60804
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 15:46:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aCjI6Pa9JLPr for <buildroot@lists.busybox.net>;
 Wed,  8 Dec 2021 15:46:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8BB9160802
 for <buildroot@buildroot.org>; Wed,  8 Dec 2021 15:46:48 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id e3so9866391edu.4
 for <buildroot@buildroot.org>; Wed, 08 Dec 2021 07:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SYhQ8v2lUcU6HE87A3DWs10mBPLkKKAIPvWraNMhP0k=;
 b=RgZa/7rON1DKVZ9BSSWqUpECPQiNZB3YTszgO1MUwEqqOshvK4rDKOoyq4Qg9kgKSl
 /7D+XZiJrSGucjTfzMiNCRQkpPaiG4tFj2J7+UvrHG3lKQQaYAf4XFaSn/qejQrjmTIP
 gO2xfBi0SeHQI3vOw9uU0NIgZnIs3AmuyVMiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SYhQ8v2lUcU6HE87A3DWs10mBPLkKKAIPvWraNMhP0k=;
 b=xZnc6Ubg3ciuY5yY7F9UF9EbTCLs/+MDepGQMYENv9eVH+QKEyLVKW4x2KUlIdyYQI
 v14VHkH6HwvckAUZNLnIq+jlvsyBts6pwTuIezrQ2SPBA6Wz7FxAY/kUr+y7y+Su9iqB
 HfbipcGi4wQcoWjnzfYAPfl/11KKWUSgLegHoQQ6GarInKNq3UcLmHNEQAN5PTZpsAQC
 /YG3SIPC4FqB/pUuQ1Rnvcshknu0TYfv2Qbh1gSob00oHRIJQz35corTRaXkcwH2A2pG
 LCGh5M5N2PDDYgAvE+QApDi2DNHDJhVJ/w8Aejy/fWHQi2iKfvCMAIM+zxQW1uj39S7J
 aKSg==
X-Gm-Message-State: AOAM533/H3cwcntmOPVCN/STIHBznxETD9Ff4IzfCHBZpTZX8s3wWhzs
 cdtYs4HTUmkrVylrwXc1SitdHenkfCg9Yw==
X-Google-Smtp-Source: ABdhPJys1ygCtNbjqYXEAg2KoULUuuvMkLa+KbFEsPAlwiKFEM/2zXl9XNRBDavZDUw8+Ikl8osIXw==
X-Received: by 2002:a05:6402:518e:: with SMTP id
 q14mr20277533edd.399.1638978406311; 
 Wed, 08 Dec 2021 07:46:46 -0800 (PST)
Received: from localhost.localdomain (host185036130019.static.fidoka.tech.
 [185.36.130.19])
 by smtp.gmail.com with ESMTPSA id gs17sm1673977ejc.28.2021.12.08.07.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 07:46:45 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  8 Dec 2021 16:46:41 +0100
Message-Id: <20211208154641.58478-2-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211208154641.58478-1-angelo@amarulasolutions.com>
References: <20211208154641.58478-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] linux: bump CIP RT kernel to version
 5.10.83-cip1-rt1
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

This patch bumps Linux CIP RT kernel to version 5.10.83-cip1-rt1.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 linux/Config.in  | 6 +++---
 linux/linux.hash | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index e21d1681f7..6c30100921 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -50,12 +50,12 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  https://www.cip-project.org
 
 config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
-	bool "Latest CIP RT SLTS version (4.19.198-cip54-rt21)"
+	bool "Latest CIP RT SLTS version (5.10.83-cip1-rt1)"
 	help
 	  Same as the CIP version, but this is the PREEMPT_RT realtime
 	  variant.
 
-	  The CIP community plans to maintain 4.19 for security and
+	  The CIP community plans to maintain 5.10 for security and
 	  bug fixes for more than 10 years.
 
 	  https://www.cip-project.org
@@ -127,7 +127,7 @@ config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.15.6" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.83-cip1" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	default "4.19.198-cip54-rt21" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
+	default "5.10.83-cip1-rt1" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/linux.hash b/linux/linux.hash
index 6d3b31c5a4..2f144427f4 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -10,7 +10,7 @@ sha256  9784204f95cfc7de1c933088e6f9364e99a29988ae4e6b9353677637eb171aa0  linux-
 sha256  8f4ecd71fbcdd733c2849e2e5afe59d351c463c9a699bdbf428d88fa911009db  linux-4.19.219.tar.xz
 # Locally computed
 sha256  5738dcf020ff75fb6e43d6d1a8b572d2f1fe58c08b31f822eb42fb91d6bdc98f  linux-cip-5.10.83-cip1.tar.gz
-sha256  449668d678e458ddaf30f944b7ca7f5ce6ea6664f57d43ea4eb90b176e03b9cb  linux-cip-4.19.198-cip54-rt21.tar.gz
+sha256  2395443c5f960e5c6343f70480209d2530da27aa6f0299412e0f4b7128fccb7c  linux-cip-5.10.83-cip1-rt1.tar.gz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
