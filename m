Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905FBC433F5
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 13:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5006F6108B;
	Mon, 16 May 2022 13:16:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pEpYMpQ2Zf7O; Mon, 16 May 2022 13:16:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 649776106B;
	Mon, 16 May 2022 13:16:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 806091BF37E
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6739F82CAC
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:14:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CZLwHB-9ZEda for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 13:14:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A2DC782C9C
 for <buildroot@buildroot.org>; Mon, 16 May 2022 13:14:05 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id m1so20470574wrb.8
 for <buildroot@buildroot.org>; Mon, 16 May 2022 06:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rAr808R7QXQrW7xpt3UmnrV/WovQkF9siFLgmqYcYvQ=;
 b=bv1N4Jq1xl7hX0uAot5OMaDp6rdcgIBx9/Qh4d5NaHo4s2K9X1nXjGLplHBG7CwrAy
 8axw+iUyv+8M9ZrYkCgy0Km80yImqljy2DxjTaMTA7qp4azmShZAsW83A/EFYjVCEHPu
 GXUu5dpbK5Tkgr3z67z0bqLrqexqHpOxUFherKTTb1lkMQ39SQmBZvHMFPDJE3tL7daY
 wS8qFQxm10Hh6j7hPVTw3m04Uh9B3rWn+lUWYd0DrmXyuYh5NPIzohmecRn4GguvEjYq
 om50PaqXyLIE0UL36HUcy/sPw8DR8fS+PX3+TUBn69AUXV5BVoJHUJp0EbeLWIQt3gQT
 r3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rAr808R7QXQrW7xpt3UmnrV/WovQkF9siFLgmqYcYvQ=;
 b=Yql9PKmdahmXfVPmsrmucRrfTYDibIMOZpNNJM5tsyUCKKPFdUhKYKA4Kf/aI05Sfc
 1WMckU5DQPNTiy9lJPiUB3C3oixedJEPL5V+a2y6n+9LMINRiAaCDX52aCPBHACmqAVg
 hRs+buLECy/ngMlzSp0PGzymm8xgO0Ny6b8IRtPmWRHm0zJ6wc1Es+9iftUJ69Jlipke
 e8jrJf7pLRu2TmIaCbFnRr2jwUCwXVEo9PazI8AuO5KLY8EaLeYgjv2Mvo0jILr2R4Ih
 71wwJxabBc93efIz1CN/9PJYWXp5gh+7zZUc+wB6nTMhkhDH9OamCzNSTGn6ciLcSd++
 CHVg==
X-Gm-Message-State: AOAM530Yi7WRjPPLysMHCE8/PLeKDQULjPyI9wr3j0JLAk/iZ4VDdHsA
 Ag/X4ru0skWI3BELIU/FnRs7j88W0ic=
X-Google-Smtp-Source: ABdhPJzm6218e3EbX2fLsBEonaednch0ZrIbf/fcVVz4yJ0K00ub7vPR2ZE7S0ajHOAZDlextLFGWw==
X-Received: by 2002:a5d:6b8c:0:b0:20d:1234:b24e with SMTP id
 n12-20020a5d6b8c000000b0020d1234b24emr641258wrx.677.1652706844979; 
 Mon, 16 May 2022 06:14:04 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003942a244f51sm13023789wmb.42.2022.05.16.06.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 06:14:04 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 May 2022 15:13:26 +0200
Message-Id: <20220516131334.1910858-13-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220516131334.1910858-1-johan.oudinet@gmail.com>
References: <20220516131334.1910858-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 12/20] package/erlang-p1-pkix: bump version to
 1.0.8
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-pkix/erlang-p1-pkix.hash | 2 +-
 package/erlang-p1-pkix/erlang-p1-pkix.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-pkix/erlang-p1-pkix.hash b/package/erlang-p1-pkix/erlang-p1-pkix.hash
index b0ee7d58ba..c58dc5c2c5 100644
--- a/package/erlang-p1-pkix/erlang-p1-pkix.hash
+++ b/package/erlang-p1-pkix/erlang-p1-pkix.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3a39c4ca74f93efa0e4de4c37f9e4d073b1aeb142ad669f12588ad2b3c39724e  erlang-p1-pkix-1.0.6.tar.gz
+sha256  257171bec3fe495cd390c3a987131893a0a1a0b22e5973ac3cba9c354cb72324  erlang-p1-pkix-1.0.8.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/erlang-p1-pkix/erlang-p1-pkix.mk b/package/erlang-p1-pkix/erlang-p1-pkix.mk
index 12ae042138..a7ecb08ad9 100644
--- a/package/erlang-p1-pkix/erlang-p1-pkix.mk
+++ b/package/erlang-p1-pkix/erlang-p1-pkix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_PKIX_VERSION = 1.0.6
+ERLANG_P1_PKIX_VERSION = 1.0.8
 ERLANG_P1_PKIX_SITE = $(call github,processone,pkix,$(ERLANG_P1_PKIX_VERSION))
 ERLANG_P1_PKIX_LICENSE = Apache-2.0
 ERLANG_P1_PKIX_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
