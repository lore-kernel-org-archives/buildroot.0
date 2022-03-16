Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9958DC433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 21:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 170AB40905;
	Wed, 16 Mar 2022 21:23:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s1kZMp6SD1Kc; Wed, 16 Mar 2022 21:23:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4ACFF4087C;
	Wed, 16 Mar 2022 21:23:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A1D901BF2C2
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E977606E6
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:23:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FojgwhiJz2D2 for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 21:23:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ECD7960634
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 21:23:41 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id p9so4702128wra.12
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 14:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DjRxYwZdfjUcp/sDzxY70uZ+Ayxl6oS+YkhKoTOZtj4=;
 b=XYHRtP+vw9wg6+9AevOVOSHIa6h1D5Wl8CIHgzJE34cthuXtxnT8K7Uh024CefYYk5
 uQIz4rs62cXCOK/EpbemYJIvcSlYIIoELpY8N/Vxi3hW9LhGJwIPDvB/OTvPfF2Ym+Bb
 ljaJprHsdYcoUaZw/kfmAs9s9ur9Up2RAywIGRDkMSYMuySDYvYXHfqRzyTW5t8ZGUIC
 sNEyx40WbuJrI0DTdIktOFDFnHWYMX0uAICazmc6ZrdGGdSzfpx6LKqLo49HvgRe+QtS
 3DUGKfstxgwpvOP65Frp+ntjE5mJKG3GGMvuDFJoS+Dfr1eE6av6h0oMNqlrlDn0oDce
 XkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DjRxYwZdfjUcp/sDzxY70uZ+Ayxl6oS+YkhKoTOZtj4=;
 b=CvOgth9LmKk3VwXqdFJphR5cyKC+U6HMWmWGJHL0rUs488S9Do9ImuwnsxGXsytR0g
 J9nGLKFKtXDP3wjDGes+nYRLUnCD8oyGVwT9tm2pQh7pcmRkdK4X8rDgoPTR2Q4KkzLE
 5pemC5GgrmQmLyxqw/oThnOY1KtxYOHez0JWMA6CfDTEcj2P9vP7j6a9yQynTbpY8BE7
 XQYR7DqvuX1xvztZCr45UjycjLmKZ6d2aisbHGsqQeKQVjxMzkuykEhKu8L0US76YeRW
 ZwZH7u1ENeTJJMen/ME5jOrL4Qn8gtdhnwf5YocUkzYBNdSDyJSxGpAhHi5x/YmBZtHz
 YSAA==
X-Gm-Message-State: AOAM530jIsKC42/3+E5arr0eQBmFrgoFFwnPsfOWZ/fLoEbfMUm9jq95
 eQxDeU7+heJP1MOzeZlVW9SqUpkshPY=
X-Google-Smtp-Source: ABdhPJwSvK9/OAqsVPTvhlMiXSccAYITFWjcer8pNB1oAmp5UCVygnPz0Ojr9PBXhuLCFo/fp+6I6g==
X-Received: by 2002:a5d:648d:0:b0:203:d7aa:83d2 with SMTP id
 o13-20020a5d648d000000b00203d7aa83d2mr1451706wri.422.1647465820005; 
 Wed, 16 Mar 2022 14:23:40 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a5d4586000000b001f0436cb325sm2440959wrq.52.2022.03.16.14.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 14:23:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 22:22:15 +0100
Message-Id: <20220316212220.3437314-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/6] package/zynaddsubfx: fix PluginEnable option
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replace False by OFF when setting PluginEnable option

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zynaddsubfx/zynaddsubfx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zynaddsubfx/zynaddsubfx.mk b/package/zynaddsubfx/zynaddsubfx.mk
index 158b5b4ede..c8d64f5ce8 100644
--- a/package/zynaddsubfx/zynaddsubfx.mk
+++ b/package/zynaddsubfx/zynaddsubfx.mk
@@ -11,7 +11,7 @@ ZYNADDSUBFX_LICENSE = GPL-2.0+
 ZYNADDSUBFX_LICENSE_FILES = COPYING
 
 # There is no package in buildroot using LV2 plugins: disabling
-ZYNADDSUBFX_CONF_OPTS = -DPluginEnable=False
+ZYNADDSUBFX_CONF_OPTS = -DPluginEnable=OFF
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 ZYNADDSUBFX_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
