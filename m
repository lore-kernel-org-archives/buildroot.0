Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3346AC433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 11:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B9A9408F2;
	Sun,  3 Apr 2022 11:07:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xdm_pGId_rbu; Sun,  3 Apr 2022 11:07:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80C4C408DA;
	Sun,  3 Apr 2022 11:07:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE5951BF4E3
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 11:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D5DF607C9
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 11:06:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UGgB4s6sc_1d for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 11:06:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B82A3607A4
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 11:06:46 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id m30so10432032wrb.1
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 04:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1XSY5cIm2OCGVs58/uxl4BmiiaiU+sthe3SDI3LZxaU=;
 b=Qj+tHF0DsYqGoalU1rThKNIMCBrr0DWhvmLcxn8LWmKDSkIDQNgLwPz+1CDWJc70fj
 RCM/bK8xPv2c18TTzAF+y56H5NuKf8BrFSFtBddy36fLxQgqlgw/xfMLCiWpdAUYPdIe
 nDCzH8qNiE4ohGKltNBkDYODagX+0jH6uD6plU6BQWzvUnL3n7vL957hTRtywMonTJb6
 EcVBRRWmAq8SVuHep9m8ahYAumsN/Cpcnd2D1TQ7vcfzZMbXgNb2BqyOLCj/nlPrKESc
 mObV5faWorFoJsFlRpdqP7hmSaov/pw0/0WDdq0PivavXxWMRVKFqVV2YHtp9syN1Uaa
 cK2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1XSY5cIm2OCGVs58/uxl4BmiiaiU+sthe3SDI3LZxaU=;
 b=4Bl+KjD6TOvvVTA4d3Kv73ZciQEcEGczz3Ymebkw8N4CmF78PRQvv9BrZ94xSU+yQr
 v6wXGxhZ/PL1pq3yg4hwmBeWmt99YdYUV8dKA+Z09AYw3wyqsLCQqik4hbvB3P9T929r
 bytsbRxhqBZQ1T3LQIuEkGmZQBJpes+ExB00t2YP+0096Y09gT2XKml1AweOYZIuhVKr
 8qcLyBxzBJTu5uv14l67QEERb3CoGtUKLkijDi10abzlVoioFFV1TelSd5Cfm5/4FNLa
 YoC5eFsfB0OJuQ4PIFYh1hB8l0CnLNRhjaJuoAgH7sWo8vLGnANnC7LSY4CrWI5Va5Fh
 wi4w==
X-Gm-Message-State: AOAM532toyEV66iHDrV7tBz/Ou9TxbGS3gfxyuvvfKzqJ2fkVZK4oQ25
 KBsX8rGTZ2dSQNr85TmW1lGhZLaHpmc=
X-Google-Smtp-Source: ABdhPJx3MgRmO3kZPwQP5mbK8IVUAovJldEtku11solo29ex+eVEh8yqcX0poKByoZMksOuYO2Vv2g==
X-Received: by 2002:a5d:55cf:0:b0:203:ee46:1c5 with SMTP id
 i15-20020a5d55cf000000b00203ee4601c5mr13352237wrw.370.1648984004582; 
 Sun, 03 Apr 2022 04:06:44 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a5d6612000000b00203fbd39059sm6548259wru.42.2022.04.03.04.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 04:06:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Apr 2022 13:04:54 +0200
Message-Id: <20220403110455.2875846-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220403110455.2875846-1-fontaine.fabrice@gmail.com>
References: <20220403110455.2875846-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/htop: use official tarball
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/htop/htop.hash | 4 +++-
 package/htop/htop.mk   | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/htop/htop.hash b/package/htop/htop.hash
index dffe5ca1ad..d7c39be4d0 100644
--- a/package/htop/htop.hash
+++ b/package/htop/htop.hash
@@ -1,3 +1,5 @@
+# From https://github.com/htop-dev/htop/releases/download/3.1.2/htop-3.1.2.tar.xz.sha256
+sha256  884bce5b58cb113127860b9e368609019e92416a81550fdf0752052f3a64b388  htop-3.1.2.tar.xz
+
 # Locally calculated
-sha256  fe9559637c8f21f5fd531a4c072048a404173806acbdad1359c6b82fd87aa001  htop-3.1.2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 210518da2f..1e7b171a17 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 HTOP_VERSION = 3.1.2
-HTOP_SITE = $(call github,htop-dev,htop,$(HTOP_VERSION))
+HTOP_SOURCE = htop-$(HTOP_VERSION).tar.xz
+HTOP_SITE = https://github.com/htop-dev/htop/releases/download/$(HTOP_VERSION)
 HTOP_DEPENDENCIES = ncurses
 HTOP_AUTORECONF = YES
 # Prevent htop build system from searching the host paths
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
