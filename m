Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 335C9C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 00:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9ECB1403E7;
	Mon, 27 Dec 2021 00:37:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NtHhFy1dUnyW; Mon, 27 Dec 2021 00:37:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C204403AA;
	Mon, 27 Dec 2021 00:37:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3BB791BF97C
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 00:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23B6B60D4D
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 00:36:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MlZdiLl5aJk2 for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 00:36:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C26A60C20
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 00:36:57 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so13080244pjp.0
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 16:36:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z191/Aixp+60DuEaLrxQXIEQhEq2WaEydrwKsGPLpLc=;
 b=OvP/xW05SqU6QpMs8ls8beHfik3ZjM0idLELajT2bV1Xc/NvQgHKfMAJyagoAbflTZ
 lk4XRTLJ0cdsaTw79+ikH1VrQkClyxNN+GRkK6i9piWjE/EAc89GpUHORmmrBCUQap+o
 NcXWpBn05AJ5+UjvyxBPDmIYPb/ViUrAEkvi9RBdWuOCXEhWtVZlZ1V4wq5kBQDoGe2e
 CpQ1wud8/b/k3TwioPEPD/dMzEIHMWRYGWY4H2GnipknOsDd0PTNJ105uF5bMuyzraMk
 0lyb0dXhQVKdEdArj79UsIfC0KF4v0vwNN0YIdNSaY3nee84o5T4M4AAu8xOBFxOL1lK
 XeBg==
X-Gm-Message-State: AOAM530IhD/VF/tC1hpsyo+FoGuvDXJKYhZv0vmdV+JsJI9gTQIIGTxo
 3CSKDPMC0r0d9gp8gZnkT+IOkhpyVD03hA==
X-Google-Smtp-Source: ABdhPJzR2Iy6HK76hHPxCV2roz2f3JS7AlaAbKv8kMs958hyS1i5Oz4Zt8XV+Al+9jSUTgl3S1SxMQ==
X-Received: by 2002:a17:90b:3903:: with SMTP id
 ob3mr18637718pjb.178.1640565417411; 
 Sun, 26 Dec 2021 16:36:57 -0800 (PST)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 d13sm13771099pjz.7.2021.12.26.16.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 16:36:57 -0800 (PST)
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 16:36:55 -0800
Message-Id: <20211227003655.78166-1-christian@paral.in>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/docker-cli: bump to version 20.10.11
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
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 6eb9413a11..fbcda5753e 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d91010813824070dd2380013c8f343e61e6dda170f7853f024bda39b432b64ba  docker-cli-20.10.9.tar.gz
+sha256  55d55fdead906cbea8608ef39d5a62d54d1118e604a5ae7e2d58b4fb54a599a7  docker-cli-20.10.11.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 3a344bca36..0e35a60d43 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 20.10.9
+DOCKER_CLI_VERSION = 20.10.11
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
