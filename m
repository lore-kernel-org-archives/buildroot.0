Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D468C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 16:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD58F60A91;
	Sat,  8 Jan 2022 16:51:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V-EAVMSG0god; Sat,  8 Jan 2022 16:51:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 378F1606E7;
	Sat,  8 Jan 2022 16:51:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1AFD91BF599
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A61340871
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:51:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 418BjrzMp4jD for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 16:51:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2CDFF40357
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 16:51:17 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id e9so16086873wra.2
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 08:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HGEvUZTrXaxkMe9Hh0szFHVk+5znPPY2VYNU31GZRoM=;
 b=RlXC61M1Bth/9I/N8NV8cGPoGoIKuuikEi7Jt8SzPFiL7ts14I/Ld9sM1iPYjyCB3G
 ezewDW9VCeejMCkK9GBT/nbElUhLBlKakp+MhVBY4YoXv2h92xJt5tTsj+ucMAx1/lmy
 UkMKti2XmBuqEcw0nErBQTLOr7nwKiPHrUwCcX/GJvzrvVBMQ1qyJFmj2569EcngZJ9k
 uxSQdvW11ustS62jiLLL28RZAjPqCmK8rtZjYwnlvN8ZTfozUw0HqJfBJREdE/S7nDS+
 RqNkeoePybheqV+mcg1Cbaq0mJYTMQTON4JA6/5tjOR3lwtsowzpyX/mCMZJFJYUr9g1
 oSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HGEvUZTrXaxkMe9Hh0szFHVk+5znPPY2VYNU31GZRoM=;
 b=LxkHzACtuT5d9y2yvVibVwCXTT4Dc3uDyPYbMg0rCHrQO379hbG+QJ6Gwn0AJNvQrL
 H9a7Smv4bV9HMk8FYTI4jaRuFPqZtpNS3H/0Lfbk4GaA9oyc5dKeXqZlOYw8d+NC6Yrw
 d2ZipCx9/GB1XUf+LozNUm3Yi1ek/zPkVOuQGNOypTZZ4GLZ+v1AtHADfViAnxXQNf34
 8SUaGko03T5H7LF2JCenIkreWNiYo+eqZnDRuqS3SQnixdlVElflXLs8KHmG0kgHuN1b
 nTSuiXodZvBADqCdwbXlsx2jYwqVvPaWJJSDBAe8R02TAedQUhGMO12GG/+IORc4kn6z
 RqJA==
X-Gm-Message-State: AOAM533rkFYFst/cz+58hnxMfAiQ9M4rSvPz8cF3CmPrCiAct9E+23e9
 vYXk77mI7yLWpYagpBY2R0gyZeQuSN4=
X-Google-Smtp-Source: ABdhPJxdfsIGtC/GHWBadzlP3CTEGIrLoR5Ox5YXCzkQCyUD0p6d/bQAjbuETO20043+P9vpqk0w/Q==
X-Received: by 2002:a05:6000:188c:: with SMTP id
 a12mr61978529wri.45.1641660675356; 
 Sat, 08 Jan 2022 08:51:15 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id ba18sm2039523wrb.40.2022.01.08.08.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 08:51:15 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 17:50:04 +0100
Message-Id: <20220108165005.2737902-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220108165005.2737902-1-fontaine.fabrice@gmail.com>
References: <20220108165005.2737902-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/libss7: add Linux in comment
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add "Linux" before kernel in comment to be consistent with other
packages and manual

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libss7/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libss7/Config.in b/package/libss7/Config.in
index bdf5fbe3a8..d8bcf11ce7 100644
--- a/package/libss7/Config.in
+++ b/package/libss7/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_LIBSS7
 
 	  http://www.asterisk.org/downloads/libss7
 
-comment "libss7 needs a kernel to be built"
+comment "libss7 needs a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL
 
 comment "libss7 needs a toolchain w/ threads"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
