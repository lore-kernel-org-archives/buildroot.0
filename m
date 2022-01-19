Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1C1C433EF
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 09:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61BE140992;
	Wed, 19 Jan 2022 09:03:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bpVoYMFMG9aa; Wed, 19 Jan 2022 09:03:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4093741497;
	Wed, 19 Jan 2022 09:03:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4C1FF1BF45A
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 09:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D76F60D6E
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 09:03:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vuBlZwt96Uab for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 09:03:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A369960B9B
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 09:03:06 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id e8so1582430ilm.13
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 01:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o3SC0Bdu3o/oh/fv/gxl0dug5FNUR6actNsHF+o3ol8=;
 b=ONs4RL3/V92NQR7+qhPsMuUxSxroQKQBquDyuc4za3SCL0m+Ab8aGrnBCEEQg4velZ
 2yloLhDhI9hmFDpXvJc/YMNnpg78f9p2LtwqhbP7olT8GNtBLqVkAYRLhiXinmUIwRtj
 hrsuKVUqxj12UcBMeW4KGbPIdcrQIgjw/5ULw578G1hv1+d8Bw2R75hAvnkHcIPqSGH3
 HuGpK8ROwOHNvFCrOVJfjYuBiFtBZ+mAi142U62sSPcok1a2pTX86C3R3+olN7fGkiXs
 BGEtsbwQs6FxCTMWderxmkv5IM+MyCsz5yw5fvld6JT+axQkMEBBbroxYW+jcY6R1KcG
 iiRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o3SC0Bdu3o/oh/fv/gxl0dug5FNUR6actNsHF+o3ol8=;
 b=FI1G3lluDlATm0LiWAApvrK5iDXAp+Ch5X2inLk8aXBHath7Lv7mJ1NgOtWyzccNmt
 6/U949mrm2DQhsTXGbAxm87lmkbCeXj3GBceRa4KtowVBryx6pmjo9uea75YEk9gfVb7
 X1DMG87cp13U9/g8Pq3ipYTLAoMqJRLhxYSaV4ZQZpIsFmcbnuGcCI7tlLFm7UoW/wbr
 HuxRJaEfTwETTGqU9W5Umg7+MvDsKEvlZ8klZciJDsKrnrRZzqLiuPqggJKFXO83iZQM
 xEc4AEw9UULYwBhxVwQ3SHS7APYX+fSqkYc/kPgHuy3YBAjxiax+Gjfe22RhJk4dZ4pD
 JSYg==
X-Gm-Message-State: AOAM5312mZF8KcBgZn3MrsoNNCAHvHzDhgPw/Njs1S6GN1+IW7RcEkbp
 +DUP/4ZbmzUFzCsadcNA05g2sMmTmqc=
X-Google-Smtp-Source: ABdhPJxmKOp763Eea6M/5vC09J29SHwpw937BUf7kvIWIyc8DmGysbatGLjyMITBkbPlLHOR3yWNHA==
X-Received: by 2002:a92:1e04:: with SMTP id e4mr15778586ile.220.1642582985504; 
 Wed, 19 Jan 2022 01:03:05 -0800 (PST)
Received: from james-x399.localdomain (97-118-239-242.hlrn.qwest.net.
 [97.118.239.242])
 by smtp.gmail.com with ESMTPSA id c19sm12196097ili.19.2022.01.19.01.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 01:03:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 19 Jan 2022 02:03:01 -0700
Message-Id: <20220119090301.3649833-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libxml2: add optional icu support
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/libxml2/libxml2.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 5d688acae5..023a461472 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -24,6 +24,13 @@ LIBXML2_DEPENDENCIES = host-pkgconf
 
 HOST_LIBXML2_CONF_OPTS = --without-zlib --without-lzma --without-python
 
+ifeq ($(BR2_PACKAGE_ICU),y)
+LIBXML2_DEPENDENCIES += icu
+LIBXML2_CONF_OPTS += --with-icu
+else
+LIBXML2_CONF_OPTS += --without-icu
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 LIBXML2_DEPENDENCIES += zlib
 LIBXML2_CONF_OPTS += --with-zlib=$(STAGING_DIR)/usr
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
