Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2845C433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Feb 2022 11:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4638960ED9;
	Thu, 24 Feb 2022 11:37:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ORMGfLy9KXl; Thu, 24 Feb 2022 11:37:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6456C60BA3;
	Thu, 24 Feb 2022 11:37:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9ACAE1BF42D
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 11:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9641240141
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 11:37:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id niLy11Jb281D for <buildroot@lists.busybox.net>;
 Thu, 24 Feb 2022 11:37:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C25F400BA
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 11:37:41 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id h15so2383717edv.7
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 03:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KxihBkqj4WFXEGazD79h9mMvlUzACK2pFiBovvvwdG8=;
 b=dIvQUYV02OXzSib5JcLoRDL5bs6ZzTUHcjzFCxiWkfBpsvDCo2/VWGhgFavRMdPU6e
 ENONOtmMO/7aqgByj9VW6pOPqUwFwd2X0G6CXrhu0YPH/cR+6xrk5aqUWGKkrq0F9Oro
 an28GsmYojt3EDBCNdckSsRKPaZb3D35Y9RqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KxihBkqj4WFXEGazD79h9mMvlUzACK2pFiBovvvwdG8=;
 b=y+0OKRooUTCvsn98bghfQQZ7Of9yjveqfXQUWwxgd9UYTF3X4/JJf7T3qB7HC4mkHr
 JDenlJjRwau98AwUp62u7spupEUdlnUcsmKzGIWculDchx1nDyME13ObuFON6kcfSdJx
 GX1LjAWv4naXiz5Bg+mKveVXIbmjPHfM2whmmivqnJO9m3njwYN05eYCRpIFsV30GJ4p
 5fFi4ocJK1gi+/fmPf7fhAw1F4EPRQsU2Wz+KXPstypxMWhtC01kYYMyXZz2+Kn67yKb
 6pgRZ4aEu8/G6qu7QlhjhbCha4D7/a2ejLYHBbCpB1bEVa/AkagLI8hDjaQdQsL3zvfG
 Gy7w==
X-Gm-Message-State: AOAM530cL5tgYChYgCeEyn5piBtg+bVoYdsmHov6lb7s3lSsRBRYKXck
 UPFCUm2XzsckX/M64jsSI060/bhlc0fWsDan
X-Google-Smtp-Source: ABdhPJznPPAu5yq6Q4eQKGlGNKVndr4wASZZwq/CIrBLLXrf3QaXysqrGmE3JU7FDYVB8hN/ay0PFg==
X-Received: by 2002:a50:cccf:0:b0:410:ba4e:65fd with SMTP id
 b15-20020a50cccf000000b00410ba4e65fdmr1880365edj.31.1645702659584; 
 Thu, 24 Feb 2022 03:37:39 -0800 (PST)
Received: from angeloc.pdxnet.pdxeng.ch (host185127038042.static.fidoka.tech.
 [185.127.38.42])
 by smtp.gmail.com with ESMTPSA id fy35sm1156527ejc.36.2022.02.24.03.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 03:37:39 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 24 Feb 2022 12:37:35 +0100
Message-Id: <20220224113735.4088631-2-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224113735.4088631-1-angelo@amarulasolutions.com>
References: <20220224113735.4088631-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] linux: bump CIP RT kernel to version
 5.10.100-cip2-rt2
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
index c454a89fba..eb602eb505 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -50,7 +50,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  https://www.cip-project.org
 
 config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
-	bool "Latest CIP RT SLTS version (5.10.83-cip1-rt1)"
+	bool "Latest CIP RT SLTS version (5.10.100-cip2-rt2)"
 	help
 	  Same as the CIP version, but this is the PREEMPT_RT realtime
 	  variant.
@@ -127,7 +127,7 @@ config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.15.13" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.100-cip2" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	default "5.10.83-cip1-rt1" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
+	default "5.10.100-cip2-rt2" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/linux.hash b/linux/linux.hash
index 8b689f122b..a47ec9ca6f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -10,7 +10,7 @@ sha256  bffaaa4c93ab4ed1de61f804c26c92b82dd80f92793e20194b62497d7b8b4723  linux-
 sha256  01ccfc3413c3bb305653ceb0aa528aba0caa61b326e43709bf1f8b624f211031  linux-4.19.224.tar.xz
 # Locally computed
 sha256  e90e8100bf44cdd6714bca3b9b1f78694c99bfa9bdff761de06b192dfb230831  linux-cip-5.10.100-cip2.tar.gz
-sha256  2395443c5f960e5c6343f70480209d2530da27aa6f0299412e0f4b7128fccb7c  linux-cip-5.10.83-cip1-rt1.tar.gz
+sha256  945b63f280c5bd9aad66016ef6fbed57612864192bc0f54f6800562f56cfd518  linux-cip-5.10.100-cip2-rt2.tar.gz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
