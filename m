Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F5AC433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 00:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 252DA403A7;
	Mon, 27 Dec 2021 00:30:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XQ43iqnLacw7; Mon, 27 Dec 2021 00:30:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FDC94032E;
	Mon, 27 Dec 2021 00:30:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7953A1BF97C
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 00:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7578E60D4D
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 00:30:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id USQGVrmHulJk for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 00:30:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA49C60C20
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 00:30:38 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 y16-20020a17090a6c9000b001b13ffaa625so16914597pjj.2
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 16:30:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XUlqba/vRYDeZeWYCPZbl8WDGjcH3/efIDi8ViKN0cs=;
 b=4crg+Ai1OhLNl8WRQ1AJAI6Xv5O7AcKHRow0s5BbARvFfIBzTTiWb9YYBFp4zRFlQf
 TQjpduxLRjDZy2kGexxCa4jy+M+C3Nss8f1v/wxHmQYpCeaUUxOp+y3oxs2qh0M546BB
 ui/ts/ofvEmUd+Q7gQw2UH3rE6qOMwBg5j3dkbs9cbnAJp3YXphuGMDIHeFhqbw5pbU9
 mDlARxrXJYJPN2neuqixYqxgXyeDlUhSDaACnfqqD+kiDh+d/nt+UTEo9waKrFeb0Xbg
 AlDokzd2V4/glvF8v+bJomtHIU5YqkYqTDhNqs8ur+bgq3vVn+xDk8GxjWPyGGR1bmhc
 x+6Q==
X-Gm-Message-State: AOAM5328t2+aroNUwiJHSp7NGUUhymI7geF6udq5po2ZKyjsSIBn0Ni4
 adSJS8+xKD3GaOY4rRV9/0axGlLxWm89qQ==
X-Google-Smtp-Source: ABdhPJxEBppTfPqYzIWqC88kxNOjSI4nAbU1Yl7idPrBmokzrQ4CEnKieUQ9Jyu8UJkdEDSpvRd+Dg==
X-Received: by 2002:a17:90b:783:: with SMTP id
 l3mr18408415pjz.104.1640565038042; 
 Sun, 26 Dec 2021 16:30:38 -0800 (PST)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 t4sm14953262pfj.168.2021.12.26.16.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 16:30:37 -0800 (PST)
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 16:30:34 -0800
Message-Id: <20211227003034.8877-1-christian@paral.in>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/docker-engine: bump to version
 20.10.11
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 5e15842859..d1323f507d 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  359e8854d0d51bc884d434f182f64ca62f25fbbe7b9c6a336eb09f212fe8cc9a  docker-engine-20.10.9.tar.gz
+sha256  6fa7835bf7c17c293621967bd5096642fa1e3e1b597fbc7d7bd35f455d886495  docker-engine-20.10.11.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 84366d9334..45fa7fa53e 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 20.10.9
+DOCKER_ENGINE_VERSION = 20.10.11
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
