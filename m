Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258EFC433F5
	for <buildroot@archiver.kernel.org>; Sat, 19 Feb 2022 10:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D9A1813F1;
	Sat, 19 Feb 2022 10:35:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XCz_u1yZZ3a0; Sat, 19 Feb 2022 10:35:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB72381370;
	Sat, 19 Feb 2022 10:35:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 119FC1BF344
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 10:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8E7081370
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 10:35:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l7snDzfnpwRk for <buildroot@lists.busybox.net>;
 Sat, 19 Feb 2022 10:35:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B91A280CEA
 for <buildroot@busybox.net>; Sat, 19 Feb 2022 10:35:23 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id e3so18642713wra.0
 for <buildroot@busybox.net>; Sat, 19 Feb 2022 02:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GSzsUDSBeIuyVXqV0vqFTrP/0RdbzJjLQZTAHFHG/tw=;
 b=PwmAd7m38iL4QbmNEiAlEWnpO9KZK7uVt4gf0CeiH+T50M+BNPXY/GugOgj3lm5bf4
 hdzRi7F/Z2klz/rcuk9+9Qu5B27SuYel1AQMrcWOSVsrvBgh6EZf76psSJy+Hswoct0F
 VcHPVB3pJnW2p7WRJlng+LKgxAQDWL7cKXLVgr0f15nB7ZO0V/FKvP0e1BTEk4GMVa0b
 I6M8q+K5PpBDAGYZnjjljasVLv//alkTck0NTUmMKkZQfojFJMsHuIuEjfsn2gLFZFg7
 UuGjtlYrkWzuyLjk7Ny56yDliLMrr9ts2dxJEaN72CoK1jOsipyvrzV2AZKYcZpezFMv
 zbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GSzsUDSBeIuyVXqV0vqFTrP/0RdbzJjLQZTAHFHG/tw=;
 b=zWTnkeQgSsBbo+wG/8ePPoGdlPnCdXI/FriDvg/ew3siCmfTtNMiucxYVW9Jd87WYN
 3igAUB//+HfdeYiNhsathh0UdZl34kaGTyamVnZRpMiXejq6mJV2XyWyj5vT/63R2PIS
 1d2Ts9L45v3KCiuHogK3+1flZZGnVrz2Xf120Hg1UhRtUo2vD0wsHTP5sXC4FdZic/x3
 DU5RL0xduITd/wkDkyYaqMUrX3nwiBsG1RtrOrFbY1eon+krqCoRWr/Dvep7DV80UA0m
 epvZq6cIUgBS32qbBN5LwRM6daIy9pSpHMtBSv1Y626m83vCxKbeyYTmN2Zmo5SbD9tW
 EP3g==
X-Gm-Message-State: AOAM533NGsE1eKNL4rHztXo4wWZPOs/cNDM8x0/3TyCtKU+VkhDDuPF1
 Hqh6IyCdpYYJnpmDLjyAkijmg+Sb5y4=
X-Google-Smtp-Source: ABdhPJyWltSyo5bpwzT2AqfKan+r7Dq3f//9B3F6S55qRb4kaSgGPzYnffa/DASYVwVnxzF2lQWf8A==
X-Received: by 2002:a05:6000:1684:b0:1e9:b4fc:ef69 with SMTP id
 y4-20020a056000168400b001e9b4fcef69mr1196704wrd.206.1645266921731; 
 Sat, 19 Feb 2022 02:35:21 -0800 (PST)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id e3sm37558460wrr.94.2022.02.19.02.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Feb 2022 02:35:21 -0800 (PST)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Sat, 19 Feb 2022 11:35:07 +0100
Message-Id: <20220219103507.29176-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libnids: bump version to 1.26
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
Cc: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change repo source to official github.com repository which
is actively maintained. Previous sourceforge.net sources
remained untouched since 2010.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/libnids/libnids.hash | 4 ++--
 package/libnids/libnids.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libnids/libnids.hash b/package/libnids/libnids.hash
index 4a2949c39d..e51dbf151c 100644
--- a/package/libnids/libnids.hash
+++ b/package/libnids/libnids.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 314b4793e0902fbf1fdb7fb659af37a3c1306ed1aad5d1c84de6c931b351d359  libnids-1.24.tar.gz
-sha256 91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
+sha256  3f3e9f99a83cd37bc74af83d415c5e3a7505f5b190dfaf456b0849e0054f6733  libnids-1.26.tar.gz
+sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/libnids/libnids.mk b/package/libnids/libnids.mk
index 3e36838c40..57e68654dc 100644
--- a/package/libnids/libnids.mk
+++ b/package/libnids/libnids.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBNIDS_VERSION = 1.24
-LIBNIDS_SITE = https://sourceforge.net/projects/libnids/files/libnids/$(LIBNIDS_VERSION)
+LIBNIDS_VERSION = 1.26
+LIBNIDS_SITE = $(call github,MITRECND,libnids,$(LIBNIDS_VERSION),$(LIBNIDS_VERSION).tar.gz)
 LIBNIDS_LICENSE = GPL-2.0
 LIBNIDS_LICENSE_FILES = COPYING
 LIBNIDS_CPE_ID_VENDOR = libnids_project
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
