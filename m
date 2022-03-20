Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCE0C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 21:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52077408DE;
	Sun, 20 Mar 2022 21:19:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1CfAQ2vHVK2B; Sun, 20 Mar 2022 21:19:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C460403A7;
	Sun, 20 Mar 2022 21:19:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6F7C61BF3C9
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 21:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69C4A4023F
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 21:19:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dp_KL9JPwvOU for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 21:19:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 112FC401F8
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 21:19:30 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id d7so18389313wrb.7
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 14:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WtPsxAfLmiJwNOsGh40ENOrmk3PJbCF+qHTT70jWdmE=;
 b=V0eNAWjx5FTEAGb1WsHz1EflZRZ0ZqKw57RAJ724UqQi3j6CnDb17UaRyyzs8+EHFs
 CXhkN6HWWH/HEKFof7SjdwEAZKo0EpXlFmUPOkBzDkq7CyaXSU6qsuwMyAFD/lNaelSG
 OYBQ3/28Ye5Ewdm+3T144T10rDHcnOJc8jBCBkV2hh7RZbdS47z4RVVMm91s4hOutk8E
 TkG4GH2Q3nuVYiz2Mksv1GH7RloduClyLgc+hBeMQ0SVTjm2vm9aynllF0gsq4+ok/f2
 /1CiJ6sCyt0EiPUEeUNXR2jFqd/2+oMZqGx8yuJsKjFa7vdruCYG9xziZWSiFo2UVJCV
 eHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WtPsxAfLmiJwNOsGh40ENOrmk3PJbCF+qHTT70jWdmE=;
 b=2W3Z6XJNlaUBmk2B7JaXwyw6hZnHk0ZP3rvr3Fa6XfZpwC1wOqI3e9iGOLgn1njNLs
 iDWnAY151kP/kc+2dliRQWBqLJTvoNGhO/xCh8jtH0NGJ+RkNVDoj0hv6K/3rzJMDnwI
 isMfUddCDDFjhMV+Z49eE/cpm58l1kzXHIAetANsBkLiOwDntEFoM5xbN8ZsxT8UR/xn
 CAl7vtZQi2Rf97WZc3DRgAzmCQpqGqkynts4sQCZ5M/KWQR6mpIb3Vbrc06dHI3AIKuv
 PMRFWjs9KBdTKBGmN/nVdvC2jOz3JR9yrwMjX3dEGHkNQeKfoe6jiogYsW6AkWq7IskK
 pe2w==
X-Gm-Message-State: AOAM530btRW+WUhh0u04Z4ZUNvuHl36rj7nxZMcL+7sKsuGJQI2T9zLS
 Y6FvO94Io61bVpyDFyc3mbE6sXeF8hM=
X-Google-Smtp-Source: ABdhPJzKZfcPK13egffKSp+9+cBk/JTcLkC0W9+pk2AslbY9Aj92VJ65TwCyX7E7gBPWIUz2KwhUiQ==
X-Received: by 2002:adf:eed0:0:b0:203:f2e2:197b with SMTP id
 a16-20020adfeed0000000b00203f2e2197bmr12215949wrp.604.1647811168818; 
 Sun, 20 Mar 2022 14:19:28 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a05600c4f0100b00387369f380bsm17104362wmq.41.2022.03.20.14.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 14:19:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 22:18:14 +0100
Message-Id: <20220320211815.1798812-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/jack1: libsamplerate is optional,
 not mandatory
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
Cc: Adam Heinrich <adam@adamh.cz>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libsamplerate is only needed to build the NetJack backend and internal
client

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jack1/Config.in | 1 -
 package/jack1/jack1.mk  | 6 +++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/jack1/Config.in b/package/jack1/Config.in
index 1c67f10332..625afdf8c1 100644
--- a/package/jack1/Config.in
+++ b/package/jack1/Config.in
@@ -10,7 +10,6 @@ config BR2_PACKAGE_JACK1
 	select BR2_PACKAGE_ALSA_LIB_RAWMIDI
 	select BR2_PACKAGE_ALSA_LIB_SEQ
 	select BR2_PACKAGE_BERKELEYDB
-	select BR2_PACKAGE_LIBSAMPLERATE
 	select BR2_PACKAGE_LIBSNDFILE
 	help
 	  JACK Audio Connection Kit (JACK 1 implementation).
diff --git a/package/jack1/jack1.mk b/package/jack1/jack1.mk
index 311f7c9ba0..39183826a4 100644
--- a/package/jack1/jack1.mk
+++ b/package/jack1/jack1.mk
@@ -11,7 +11,11 @@ JACK1_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
 JACK1_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
 JACK1_INSTALL_STAGING = YES
 
-JACK1_DEPENDENCIES = host-pkgconf alsa-lib berkeleydb libsamplerate libsndfile
+JACK1_DEPENDENCIES = host-pkgconf alsa-lib berkeleydb libsndfile
+
+ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
+JACK1_DEPENDENCIES += libsamplerate
+endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 JACK1_DEPENDENCIES += readline
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
