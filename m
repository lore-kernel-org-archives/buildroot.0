Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB5BC433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 04:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5351F60C0E;
	Wed, 23 Feb 2022 04:33:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cr8Fvftw8uNq; Wed, 23 Feb 2022 04:33:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74FB960ACB;
	Wed, 23 Feb 2022 04:33:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AB0121BF2A5
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 04:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A367260ACB
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 04:33:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8RfJV0PFOpSf for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 04:33:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C564560AB3
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 04:33:29 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id e22so5836330qvf.9
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 20:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3e7ss/glG+Lv3KTYoM66rF3sz3Z5mQHxTWRFKPu3g9M=;
 b=U6kR/nxKlZSmBMeHoKGN1Ng8utY9hJv4jL7FrtSU7C8/3qng19NJPtytrc/9fiwLI3
 obULHSE0vZikzFv0bOYo8i+1qz3WqO1Y3EZr1FeZNVH6AD9nXTxYiJMhXWXzoqVk9T8D
 eEvnfp4EOcoRP2Yggi7/8NbusUAsQQuRf4n0AtOQK4d37GJZ7I0do6HPbi05GYhwchPt
 1C5g2W041Lutq3YWoPnDXuizWTxUSVgfpthOT/n9NSlj9eN1LwVfHXL2/tP3kOKYd4xG
 E9iGcyrdT/GYAVkOMa5oOD5Qia1hZVm8jrAbFtLFYjCvFlWzTB9Dn6NUrtDDMzqtVomk
 kubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3e7ss/glG+Lv3KTYoM66rF3sz3Z5mQHxTWRFKPu3g9M=;
 b=LykebyFPKulsUNRXx5CtcRuirbtcEMAFGQG89XrkuVOtmQxC5Q6XBi9+txa9DyJVSL
 uQHxDPNhlFId3YApR3zb+El1YU6LH+s2ij6Bhsg5TM6YC+rAqCbZbfQUwoQCIUhqLpwT
 e7+m88oxRKY86so9EBL6dj8G7+8nxf0FPqQSBaGodTVXyWZJML1zlRQzaA2nf1/oXtwS
 91BTf4gZ0XpjW4lzNVVfdjFLElL39ytsK3qZTp3Id3kRWDq7cbCDVQRlHk7QE1w9U87q
 vhXjq7angtWkAoV7uC1519Wfz9Ne2UmenM+k/PrYHxvZSdyENG4tR31jCr3vtXpLOMmN
 54JA==
X-Gm-Message-State: AOAM5337wdGV0c2/YnwdFbGXm5rAJeSnuZuxWbmAXR9e7xr0jeT81StB
 yOjdyPdM9xQsQ4B5VMSUXfDJBCte2gY=
X-Google-Smtp-Source: ABdhPJzB/5YVGiXquL3v3IT5EfQhF9F7yIGOqqaEuaxKF2s5fwsrb8/wb7Sm8rzoYTzWRKMINRWGYQ==
X-Received: by 2002:a05:622a:3d2:b0:2dd:2ce0:b0b6 with SMTP id
 k18-20020a05622a03d200b002dd2ce0b0b6mr25114933qtx.431.1645590807928; 
 Tue, 22 Feb 2022 20:33:27 -0800 (PST)
Received: from abyss.attlocal.net
 (108-193-1-150.lightspeed.sntcca.sbcglobal.net. [108.193.1.150])
 by smtp.gmail.com with ESMTPSA id 18sm1367186qtx.88.2022.02.22.20.33.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 22 Feb 2022 20:33:27 -0800 (PST)
From: Charles Hardin <ckhardin@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 20:33:20 -0800
Message-Id: <20220223043320.25753-1-ckhardin@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/alsa-plugins: bump to version 1.2.6
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
Cc: Charles Hardin <ckhardin@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/alsa-project/alsa-plugins/releases/tag/v1.2.6

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
 package/alsa-plugins/alsa-plugins.hash | 2 +-
 package/alsa-plugins/alsa-plugins.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-plugins/alsa-plugins.hash b/package/alsa-plugins/alsa-plugins.hash
index 8ecbd19965..2582a0d639 100644
--- a/package/alsa-plugins/alsa-plugins.hash
+++ b/package/alsa-plugins/alsa-plugins.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  42eef98433d2c8d11f1deeeb459643619215a75aa5a5bbdd06a794e4c413df20  alsa-plugins-1.2.5.tar.bz2
+sha256  068818a4b55d8c029daa00015d853d45113f56b224b7c64e1e117988c825b2a0  alsa-plugins-1.2.6.tar.bz2
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING.GPL
diff --git a/package/alsa-plugins/alsa-plugins.mk b/package/alsa-plugins/alsa-plugins.mk
index 396f47adaf..b8819151ef 100644
--- a/package/alsa-plugins/alsa-plugins.mk
+++ b/package/alsa-plugins/alsa-plugins.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_PLUGINS_VERSION = 1.2.5
+ALSA_PLUGINS_VERSION = 1.2.6
 ALSA_PLUGINS_SOURCE = alsa-plugins-$(ALSA_PLUGINS_VERSION).tar.bz2
 ALSA_PLUGINS_SITE = https://www.alsa-project.org/files/pub/plugins
 ALSA_PLUGINS_LICENSE = LGPL-2.1+
-- 
2.24.3 (Apple Git-128)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
