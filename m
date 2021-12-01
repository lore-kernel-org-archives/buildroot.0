Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A862C433FE
	for <buildroot@archiver.kernel.org>; Wed,  1 Dec 2021 07:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 925E1606A6;
	Wed,  1 Dec 2021 07:17:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ExKSWdQgd8E; Wed,  1 Dec 2021 07:17:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01A366069B;
	Wed,  1 Dec 2021 07:17:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 326411BF32A
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 07:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AB8181919
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 07:17:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w2Mrh-2uhvf5 for <buildroot@lists.busybox.net>;
 Wed,  1 Dec 2021 07:17:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D725D81916
 for <buildroot@buildroot.org>; Wed,  1 Dec 2021 07:17:20 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso265519wmh.0
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 23:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZAZgpstoDwO3vs0Blf/sKGDVuVX9IM3mLcOA0/CWBiA=;
 b=Yh90ziGB+cAOdvXpOdO/rFG8owFrhMLgW+hwvjHYK3DYebSYjL3rC5S5vdtLei2W5s
 VCyKh1cuIynGV5tv78XW4ie4yQ6Gijv2CGuaIjJf63wE0bfKl5KFr/eh/Qaxd/TKaHPI
 Tadsdg4sncUyC5+ZJ4EMNAGYGh90WXt4iQTXy1Kc4/Qof8Yo8dQ8ku8O0YwCQzijG66d
 dqUtig0FT2rCH/1PUJnplWr64BfC2MHU+N7w8TahBIt8R7/i8Kjbq41mzxyIynwnEhYU
 IUjy8R1PzgicM/2nSR2e+7Qlu7nJYqu8Di5EwbBhWHQ7lLwAHUhg6s/X2tMMTXAxe/CY
 AqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZAZgpstoDwO3vs0Blf/sKGDVuVX9IM3mLcOA0/CWBiA=;
 b=8Ody22OZidhh0bD5X/otTUgtlNhHgPCbSxTKvg7ltSbOWlMSyPDKGKzUujZv3vZ8je
 KR42GAyl6ff2eALTGxu0zdXoIDJb10/NKSRtcKMalL8OW++aL0jQSDQNBaAAdiWyvxzi
 C5sxAeobra0M3mkRun6rRheGTD0//madaqPawXbJVzaykdWgLtVK2zhE+zyTBRE0xZkP
 JgY9rHc9Nl/MVhVzn5WT17IqAcvkQVlQ/hfMZwVPRnDPFALn4I4fQoAmNoBXR3yTndmv
 11vGge3FJNT+p+GV1Si7ZxMgUgsglZEHt3+FXWArNoC5lfaXvHnXKRRSi7fsh9KF1Tq0
 yMyA==
X-Gm-Message-State: AOAM531NEOM3i31pZSlhpG3bPLNg484MYTwXO8PpcMxaaK2okIJusy6p
 ARzzqwV2fRQhXorfYT16uS6q3+R1zfZJ2w==
X-Google-Smtp-Source: ABdhPJyAZ7GoZG8VLWvxfSIMUMhYjRs6cOqsltsIJ+wFSW96UT8ncgI8UfpxhiZ0S52sd+Alk6dcuQ==
X-Received: by 2002:a1c:7405:: with SMTP id p5mr4644600wmc.152.1638343038849; 
 Tue, 30 Nov 2021 23:17:18 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id r8sm23312636wrz.43.2021.11.30.23.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 23:17:18 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 Dec 2021 08:17:29 +0100
Message-Id: <20211201071729.563846-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: drop spurious spaces
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop spurious spaces added by commit
14989d0be59762a354e7c5c15a2eeb4826d8040b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tvheadend/tvheadend.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 6000e82a6f..3c1764c478 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -194,8 +194,10 @@ TVHEADEND_POST_INSTALL_TARGET_HOOKS += TVHEADEND_CLEAN_SHARE
 #    to the other users (because there will be crendentials in there)
 
 define TVHEADEND_INSTALL_INIT_SYSV
-	$(INSTALL) -D package/tvheadend/etc.default.tvheadend $(TARGET_DIR)/etc/default/tvheadend
-	$(INSTALL) -D package/tvheadend/S99tvheadend          $(TARGET_DIR)/etc/init.d/S99tvheadend
+	$(INSTALL) -D package/tvheadend/etc.default.tvheadend \
+		$(TARGET_DIR)/etc/default/tvheadend
+	$(INSTALL) -D package/tvheadend/S99tvheadend \
+		$(TARGET_DIR)/etc/init.d/S99tvheadend
 endef
 
 define TVHEADEND_USERS
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
