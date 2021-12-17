Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A9BC433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 20:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D62984D5A;
	Fri, 17 Dec 2021 20:15:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lLUOzlGBSp1k; Fri, 17 Dec 2021 20:15:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3D3884CB0;
	Fri, 17 Dec 2021 20:15:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A2F501BF2F0
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 20:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 923F242171
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 20:15:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4NxfG34tICct for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 20:15:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C820D42143
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 20:15:55 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id a9so6130580wrr.8
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 12:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j96fhh6K2cYmYrzimZF468T7cQFEq8oaD0cshJWPbOU=;
 b=iqTSNoqgu0wRxgy9nBxthjwFjM+zwAjhNLPhdmPMjYkaKCli+fwS+JJ1VnN55UQGsY
 w7Wtafj1RxvkwhUk46KxvOBwVTgKxT88T4ld3CH8Q+WA2+6Y7qtFTLs9agKoGXam/HIw
 WBoD4MdQhDaGWlxl6VIbMYqkZPDyG97BDpV7dDRhiIWrWw64Hqa4n1LOrn8TgVmyAKF7
 dZkbe1R4aNuAHVCaOM3QdQ2tNzbteZQxjkeJxPrP310x77kfvqaJcb6YEQckuhG6alzK
 bFe5jiZod+dyi3sj1FM5XzLQWRES+ctlTHXea2t7qzGkoTbV1Qb32ehsac2MV2eMLeCn
 WVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j96fhh6K2cYmYrzimZF468T7cQFEq8oaD0cshJWPbOU=;
 b=ddzEZfrxy64B3yO0RVkjEAZHc/kkQ59xjcnavuaHhdMmq8/MeME1VtFWoqvXt4toI1
 T/NSBqcsanJwtgiztqn0lq5QsDKDkYlwxKqCfVjFix6XSk7j/C1YHuRcwFFVNBl+Y9Wp
 UsOTPqGU58me6wMiuff9pOSmyVgSMEEOsZQT2zkfYs0XKEw0D6jzxajPv05UAQX383XQ
 jXTWbkhIRegxlsDuR7YmBnO31OrYcIMjdXtXRy5FNe5vmV7TFLQDB/pNuN6qa6lbf72C
 YI7tmyeA93uQXngNf7Gziw3KUrCMZ6VNQWqCQ31LKB40RDZPM9Dmk/I3sw0spLQ9RdcA
 QFaA==
X-Gm-Message-State: AOAM5324x5XlIq9Sr6EMnMceOq6gBwC9EIv1FfVE20bIBVOzmreIY4cf
 SQjwLmaMIyfzYa3c8QTkkbzTpymvuaF3FQ==
X-Google-Smtp-Source: ABdhPJz/l6xSbpD/jLjE77/QqEQ7kJN4U5RmZIw8MuPaIccotdx0nymKdTM0He+iYEu6TD6qeG9wPg==
X-Received: by 2002:adf:facb:: with SMTP id a11mr3656084wrs.18.1639772153738; 
 Fri, 17 Dec 2021 12:15:53 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id b197sm8064445wmb.24.2021.12.17.12.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 12:15:53 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 21:15:28 +0100
Message-Id: <20211217201528.35309-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-bad: fix
 typo
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix typo added by commit 4ae8ecea8fb042931cebf8f8d4cb4bc891073a77

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index acdb2f6b9e..91a3d30e80 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -331,7 +331,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ASSRENDER
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libass -> harfbuzz
 	select BR2_PACKAGE_LIBASS
 
-comment "assrender plugin needs a toolchain w/ C++, gcc => 4.9"
+comment "assrender plugin needs a toolchain w/ C++, gcc >= 4.9"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
