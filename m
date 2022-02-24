Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9CCC433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Feb 2022 11:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9C3F416C0;
	Thu, 24 Feb 2022 11:37:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JztjoPhSdU5X; Thu, 24 Feb 2022 11:37:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A6E2415DF;
	Thu, 24 Feb 2022 11:37:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C81D21BF42D
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 11:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4259415DF
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 11:37:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zO5pbqaMc_4k for <buildroot@lists.busybox.net>;
 Thu, 24 Feb 2022 11:37:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DFEFE415DB
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 11:37:40 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id vz16so3779682ejb.0
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 03:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qsjzoANZwxsEg+0wSIdY/L5L0maBX6H05ZHFxwmbupw=;
 b=IAkSj1DINVlvsFh3dGVjhaL5NGw3Cptk9k9p8zrW9RnNzOWdLLlC99TBch+x+8Q/WO
 ptDM37pom2r5NLKXmEJwrgFTH+Kp/np522Iocp+yxAowC4sKxqpldifYFIq+ZwRe7uAa
 Tm8PRCHFHY/368S8cWFz+0FyrfDhrez2HbgX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qsjzoANZwxsEg+0wSIdY/L5L0maBX6H05ZHFxwmbupw=;
 b=b0irzCo8Ip2dMZ4z9VaGiIBBAXs5BsWCpr8N5nbC26pm9tUUHo5HeW6AXctPiiselg
 07j5lxnVuVV9MjG8NifbaODIf4M3XYsp0k9tBYj7h8G4Aetxok/96iRGpL607dk9N93l
 dbWO4bAZOudamzNZffW+5yHsB9CfAMZdRq3lHSqK7x8A3EXZj+0LqNsLySzdd3OzxRGQ
 hH/C4WXEQumIGhqrKJIvBj8o3TDii+XUwlD+MmP6cHSMwdVW8sp62IlcGgPG5G87N1ty
 sSLVmNQWFO72jUYfbGojYtO8TUlUlY6RlJpRKpybJauHpA7RNTPAYPsdZ3kMwRegYmhy
 N4wg==
X-Gm-Message-State: AOAM532mvieK7+zU5SCYJYlbtPz2PBZBU6I+J5uiR1TN/0Zi+evb4PAR
 lFeDuV5AfazW+GJDaJEPLJzD69GGe36JIVdP
X-Google-Smtp-Source: ABdhPJyU2+FylNQ0UBXU50wcwChPYrELaPbbxcs4Xk1dAESFqYDVdlifDM9mU+RUkFEJr7LwJ5Y4Iw==
X-Received: by 2002:a17:907:1dc4:b0:6a8:4a41:fed9 with SMTP id
 og4-20020a1709071dc400b006a84a41fed9mr1862389ejc.115.1645702658881; 
 Thu, 24 Feb 2022 03:37:38 -0800 (PST)
Received: from angeloc.pdxnet.pdxeng.ch (host185127038042.static.fidoka.tech.
 [185.127.38.42])
 by smtp.gmail.com with ESMTPSA id fy35sm1156527ejc.36.2022.02.24.03.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 03:37:38 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 24 Feb 2022 12:37:34 +0100
Message-Id: <20220224113735.4088631-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] linux: bump CIP kernel to version
 5.10.100-cip2
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
index 13d99bd09d..c454a89fba 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -31,7 +31,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (5.15)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (5.10.83-cip1)"
+	bool "Latest CIP SLTS version (5.10.100-cip2)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -126,7 +126,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.15.13" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "5.10.83-cip1" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "5.10.100-cip2" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.83-cip1-rt1" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index d0813e5db4..8b689f122b 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -9,7 +9,7 @@ sha256  fd4bdbc8be3472d6324fa0f5f57a17f5c3f509d5f5b4fa4f1a9797d982d0bca8  linux-
 sha256  bffaaa4c93ab4ed1de61f804c26c92b82dd80f92793e20194b62497d7b8b4723  linux-4.14.261.tar.xz
 sha256  01ccfc3413c3bb305653ceb0aa528aba0caa61b326e43709bf1f8b624f211031  linux-4.19.224.tar.xz
 # Locally computed
-sha256  5738dcf020ff75fb6e43d6d1a8b572d2f1fe58c08b31f822eb42fb91d6bdc98f  linux-cip-5.10.83-cip1.tar.gz
+sha256  e90e8100bf44cdd6714bca3b9b1f78694c99bfa9bdff761de06b192dfb230831  linux-cip-5.10.100-cip2.tar.gz
 sha256  2395443c5f960e5c6343f70480209d2530da27aa6f0299412e0f4b7128fccb7c  linux-cip-5.10.83-cip1-rt1.tar.gz
 
 # Licenses hashes
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
