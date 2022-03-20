Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D1AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 21:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41A7B402DC;
	Sun, 20 Mar 2022 21:19:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vwi4-HltguUO; Sun, 20 Mar 2022 21:19:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A2FB4023F;
	Sun, 20 Mar 2022 21:19:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B9C61BF3C9
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 21:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EED40814BA
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 21:19:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4VrsCOWIGzQv for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 21:19:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33696814B8
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 21:19:35 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id h23so17778449wrb.8
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 14:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LAqnlgi9TOAU0Esymz1M3XKZEHJp/6S8cyHCo9b5LcA=;
 b=EB83vVNvOyXfDHKr1Jc9UOME/MPx4A8HRhNoEuy9pAgzYfH5qE5BXSoCxojiTNW+eQ
 CyjweZw4Z9see2iNXNU8pmMpBuyMbAP4SPtoSUXJS2MIuMwo9GuSJ+Fn6vgiIvu04ZgG
 J3ERz68jLTG7yqwuSIsmUPtBjGcSKZkYVFmEOWBpVHCITeL1yVbFmi3oVasErbhASNsD
 2xifzTxBwXq+BmG6S71KbtcT/0huv7huujyF1IGTIOL1mHnzQptsw1f0K1ZYEcIg3JFq
 BRt7fdKvv2M6LQXQ81Dd0bK1O9X522S8SGJxGdz16a7aoNL2NGGCIRipdJdboEbyzJ35
 0xWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LAqnlgi9TOAU0Esymz1M3XKZEHJp/6S8cyHCo9b5LcA=;
 b=y33EuzoemSBSUlTqnYqBMsM2iDbcggjg4QDcBFgj6u+y04avl+Et9+WccKr4e/fo4V
 viJ9DYBu13xMcZVrno735UX7d+Kvc6XtqmWGvOfJ7VTBICKUMgRBXOaDwxVwAVkioPva
 uYI9F43qimAqE7CNdOoI9sCG1Mm8YYBHWzPzK9NWUBlsiHCW6O27IAGOnclbWxbMKZCr
 9lgk6D3m2JhDdK2XCvuzBbK+UBqYeGdklpe0xzlx+zXCVC/kgk5CiIjgMhKBn2S241i8
 l1hDfxvxzeecCMDspKU4XVG5Wwnq/Z3KQInddZ24izmhoa6tTV0LZGW9GD7OIHXchLil
 wVMA==
X-Gm-Message-State: AOAM531NO12S5T/1yKUy56EkunH2J0G7yq5MpjZoI57UwkDTHFi1myBx
 zYUhCJr4gDkd1dpRXCcUmFzowCnC59I=
X-Google-Smtp-Source: ABdhPJwRCV2BhrrWnCBdzxAx7s7X8HGh8bpFsjUM1t1fd2/FaB/oiZ7vjLuh5JPaq1dKJ25HYu8/Sg==
X-Received: by 2002:adf:ef48:0:b0:1f0:47ba:d4e6 with SMTP id
 c8-20020adfef48000000b001f047bad4e6mr16382400wrp.438.1647811173036; 
 Sun, 20 Mar 2022 14:19:33 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a05600c4f0100b00387369f380bsm17104362wmq.41.2022.03.20.14.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 14:19:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 22:18:15 +0100
Message-Id: <20220320211815.1798812-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220320211815.1798812-1-fontaine.fabrice@gmail.com>
References: <20220320211815.1798812-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/jack1: libsndfile is optional,
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

libsndfile is only needed to build jackrec example client

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jack1/Config.in | 1 -
 package/jack1/jack1.mk  | 6 +++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/jack1/Config.in b/package/jack1/Config.in
index 625afdf8c1..5b3116e2f1 100644
--- a/package/jack1/Config.in
+++ b/package/jack1/Config.in
@@ -10,7 +10,6 @@ config BR2_PACKAGE_JACK1
 	select BR2_PACKAGE_ALSA_LIB_RAWMIDI
 	select BR2_PACKAGE_ALSA_LIB_SEQ
 	select BR2_PACKAGE_BERKELEYDB
-	select BR2_PACKAGE_LIBSNDFILE
 	help
 	  JACK Audio Connection Kit (JACK 1 implementation).
 
diff --git a/package/jack1/jack1.mk b/package/jack1/jack1.mk
index 39183826a4..6dca56001f 100644
--- a/package/jack1/jack1.mk
+++ b/package/jack1/jack1.mk
@@ -11,12 +11,16 @@ JACK1_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
 JACK1_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
 JACK1_INSTALL_STAGING = YES
 
-JACK1_DEPENDENCIES = host-pkgconf alsa-lib berkeleydb libsndfile
+JACK1_DEPENDENCIES = host-pkgconf alsa-lib berkeleydb
 
 ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
 JACK1_DEPENDENCIES += libsamplerate
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
+JACK1_DEPENDENCIES += libsndfile
+endif
+
 ifeq ($(BR2_PACKAGE_READLINE),y)
 JACK1_DEPENDENCIES += readline
 endif
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
