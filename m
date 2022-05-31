Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35449C433EF
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 12:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E328440CE0;
	Tue, 31 May 2022 12:52:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a9eK6fGP9yOO; Tue, 31 May 2022 12:52:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 000E440CE7;
	Tue, 31 May 2022 12:52:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D049F1BF57B
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 12:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF1D740B1B
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 12:51:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q9XZxbXTPA6F for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 12:51:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1949C40AFB
 for <buildroot@buildroot.org>; Tue, 31 May 2022 12:51:58 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id jx22so26336348ejb.12
 for <buildroot@buildroot.org>; Tue, 31 May 2022 05:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=forkoder-eu.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9+uc35Flz0TTYU9daHo+1Sjv+ftzsdeAxeNHD+EFLmo=;
 b=iW2Of2atHTdpTffl3dXA+NjGZKzgA9umIlKcrLYDT4zEF2/8UgntGMMwFoih7dj9Wd
 56GMdCktWEvGQmaum7a7pg/VbDmZ8q9fNZ7WRUc83a/U5L7ZiCIn//SBUnj9FcL4swDb
 5D61vokLM5AYfbBCDv5EkYFedNH/EAGKLHTPbZSL5S+suPwUnG4lvhlimTycb5oO9lnQ
 k953WYIMH3VeNM/o8IC83BAjdIs8x5IokwX5UH+DDP/6f8Vh/dqA+/UhhFZGhibmwBmX
 H5/3euQ47DNgC102LgVm4JlBV4GI1B9P3vhM88IFW7XyQcKkwPbcxwcw2Y5e65fTehaN
 HlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9+uc35Flz0TTYU9daHo+1Sjv+ftzsdeAxeNHD+EFLmo=;
 b=IfEde2vuXgizTuTYS1jSpW4vW+yjNliwdsnOVZimORnJv7jTjOVyauOf/KhJLUqrna
 TciSKfx2F89mbnxRC8t3njMlehfKcgutb0cTz2XFdXoX0RzIcT1koEc3LJag6U5H8ggs
 19VlYSagUoB0gp2J/LuA7CQ9g2dVSgKNVxXFnTFvQWCUArD9gemrEUZSA/AxlaHbEK9S
 m3727krr/pK1ND9O8eZD3N4Uf64TRYWO3fnOuYESMW1zEMR96x/aLkupFbZ4tzhAAo0/
 MvQTBWaH7EMpcIwXie/RLdItN6deNCaWgvfoVRUaDJqLfvsxZxaUd1NE/mO19VELJIVZ
 s8GQ==
X-Gm-Message-State: AOAM532PDO3bCu/6Nr6iJRlb2kqV0dkfGgU2AsOIdErH4CA8If6Z3CPi
 UY9nNFubiOY+qwH0mfm5KAjnQFgsrevahymi
X-Google-Smtp-Source: ABdhPJwJAnnL0KOyzN58EABZcwcMrQ4vu4HJrVOc9vzbF4KzbS2QZruRxhQVvn+MG/F9H3DwJrdcMA==
X-Received: by 2002:a17:907:62a0:b0:6fe:69f3:88de with SMTP id
 nd32-20020a17090762a000b006fe69f388demr50983148ejc.214.1654001517008; 
 Tue, 31 May 2022 05:51:57 -0700 (PDT)
Received: from Vlad-ExternalManjaro.home
 ([2a02:a03f:61bc:9e00:725c:af7c:8d:b8e5])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a50a405000000b0042d6d8ec1d5sm6450355edb.60.2022.05.31.05.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 05:51:56 -0700 (PDT)
From: vsvoboda@forkoder.eu
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 14:51:51 +0200
Message-Id: <20220531125152.135227-2-vsvoboda@forkoder.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531125152.135227-1-vsvoboda@forkoder.eu>
References: <20220531125152.135227-1-vsvoboda@forkoder.eu>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] fs/tar: add option for zstd compression
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
Cc: Vladimir Svoboda <vsvoboda@forkoder.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Vladimir Svoboda <vsvoboda@forkoder.eu>

---
 fs/tar/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/tar/Config.in b/fs/tar/Config.in
index a4e375c68b..e88a5bb91e 100644
--- a/fs/tar/Config.in
+++ b/fs/tar/Config.in
@@ -46,6 +46,11 @@ config BR2_TARGET_ROOTFS_TAR_XZ
 	help
 	  Do compress the tarball with xz.
 
+config BR2_TARGET_ROOTFS_TAR_ZSTD
+	bool "zstd"
+	help
+	  Do compress the tarball with zstd.
+
 endchoice
 
 config BR2_TARGET_ROOTFS_TAR_OPTIONS
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
