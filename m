Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF91AC35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 19:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86D6641A60;
	Mon, 18 Dec 2023 19:41:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86D6641A60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0eRVae-6KWBf; Mon, 18 Dec 2023 19:41:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE9AE41880;
	Mon, 18 Dec 2023 19:41:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE9AE41880
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 67BDA1BF3DC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4149660BEB
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:40:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4149660BEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A1hBX1d_SIYu for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 19:40:17 +0000 (UTC)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 07A1860B50
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 19:40:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07A1860B50
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1d3b8184a84so6959225ad.1
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 11:40:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702928416; x=1703533216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WrqHviaX37J+nkPJSjh2ijJfN/9C5B4R9kCmmlwk+wk=;
 b=LYGHyvSv2MV/f2IycczTP2+3Ri6wK+AGe6347uNMjD6rGj6iWScTbtH/s9tjsazlOk
 LiE9It0bJC5R7VN80Iz9HfmEbthpVCm7ixCgsw8jmvmznS+SLYW2yfiqruTAFR8/N59D
 3ymfvQesd9HrFi439C+0UI/8vAlRy1hDp0VupbVri/ULp65NAvy/dL8xy0JQlRdtstXI
 LnKveY+pXmkgFGlT8yeE9BdvdW0KQcDUjexBPtObnCVPslvIQHZfznUNdZdKIJORf0LB
 Gfs8bfws7Nq8/mBxM9xO5mVOEw2nGavzDPZlwnG3zwY1852/Threz6aKB//1ZHT4WXP4
 I6eQ==
X-Gm-Message-State: AOJu0YxAs2min5W+J5/ZlIn3htnNuZTduIwXiKi2+hH/cFnZ/ypUzmnD
 dx39RMu/srzUGK+wBEV9w8AaKS68IEhzh2PWk9s=
X-Google-Smtp-Source: AGHT+IHGkCfww5WCG1zIULgajYI0ssZG7VAFZRF4KRbd129fLb2YBjek5PwyGQqHc1YHD0DtE2s84g==
X-Received: by 2002:a17:902:b216:b0:1d0:a2b2:6b0d with SMTP id
 t22-20020a170902b21600b001d0a2b26b0dmr8266145plr.4.1702928415866; 
 Mon, 18 Dec 2023 11:40:15 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 jj20-20020a170903049400b001cfbd3f38dcsm2983808plb.225.2023.12.18.11.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 11:40:14 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 12:39:54 -0700
Message-ID: <20231218194001.544887-9-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218194001.544887-1-adam.duskett@amarulasolutions.com>
References: <20231218194001.544887-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702928416; x=1703533216;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WrqHviaX37J+nkPJSjh2ijJfN/9C5B4R9kCmmlwk+wk=;
 b=iDkv5EbyXYHDXd/JZKfOVGakrrRYGJBYDyiJZsjOyZNlnPE6yE9ArhnkMBfdFrzYY7
 Qb7KqRW7wVo0zVbJJVgORzGDotsl2Bi7jCbrj7ajc6o9JIAMAzti4U79ZMinRTyeNW2H
 gFFW4T7FsVSp6RkGwgqqs45sdJeXeqejScN1c=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=iDkv5Eby
Subject: [Buildroot] [PATCH v2 09/14] package/sway: enable bash-completion
 support
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/sway/sway.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/sway/sway.mk b/package/sway/sway.mk
index 19f90b8b00..677b101f1d 100644
--- a/package/sway/sway.mk
+++ b/package/sway/sway.mk
@@ -13,7 +13,6 @@ SWAY_CONF_OPTS = \
 	-Dwerror=false \
 	-Ddefault-wallpaper=false \
 	-Dzsh-completions=false \
-	-Dbash-completions=false \
 	-Dfish-completions=false \
 	-Dswaybar=false \
 	-Dswaynag=false \
@@ -34,4 +33,10 @@ else
 SWAY_CONF_OPTS += -Dgdk-pixbuf=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
+SWAY_CONF_OPTS += -Dbash-completions=true
+else
+SWAY_CONF_OPTS += -Dbash-completions=false
+endif
+
 $(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
