Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97ADC4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 23:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79C5560C29;
	Wed, 28 Dec 2022 23:03:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79C5560C29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iiKU4g3x4ddr; Wed, 28 Dec 2022 23:03:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B984460C27;
	Wed, 28 Dec 2022 23:03:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B984460C27
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4DA291BF5F5
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 23:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 220AC40329
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 23:03:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 220AC40329
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aA9TF1r4kIKw for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 23:03:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72EEC402F4
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 72EEC402F4
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 23:03:39 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id o8so8984545ilo.1
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 15:03:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gz7lv7k881Q6gl0CF6kby6rxV4462ax/F2ewzjxBKs4=;
 b=kDi4EbYDs5f/90o4R9HIWN9vJQq8f9UKlzFXNA36d7IP3vyCaYvRH2qR8fl4YDwKj2
 MB9PDYIo59M1tHLoxGD6+B6gfCcn9bk9mYAR95rzBtMcQMH4+puvLa34lSG8WwYCkxZ1
 DQAZZElRDS8UlmvUTIm0FL1oBo6l3cuZzcMArtYPO1IM/NauWdHjuBuXr1DuLHUagLod
 pJZG8b9A7DWZU5JDoTbOTmusrfnGDmt/KR/QlSYEUkyZc7FIIGfNarvTvxMX3qvchWBi
 lSqbeomp43kChanMzraYB8TjBpuLuXrbKAmqnIqGP+9Z/X6DI5Jp8sfjfLeIjFE0Cuot
 /saQ==
X-Gm-Message-State: AFqh2kqVeJgQOlsMfol5CPuL8bXxG4tvsNS//TJDeqIeat1dBQIk1mB1
 jbi/NB9NvE5iwMo4Ifcix5uXRaQGeF8=
X-Google-Smtp-Source: AMrXdXtOuj7+PG+jlmEKKwaTvQS/Zv1w0c9CG5gail676bbytatllz7X4UogvljAXGHlTEP86UskdQ==
X-Received: by 2002:a92:7409:0:b0:305:dee9:bcbe with SMTP id
 p9-20020a927409000000b00305dee9bcbemr18458830ilc.22.1672268618069; 
 Wed, 28 Dec 2022 15:03:38 -0800 (PST)
Received: from joel-desktop-ubuntu.. ([2601:282:2100:d122:80bd:e50:6d9f:4b1e])
 by smtp.googlemail.com with ESMTPSA id
 j9-20020a926e09000000b002e85e8b8d1dsm5317230ilc.5.2022.12.28.15.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Dec 2022 15:03:37 -0800 (PST)
From: Joel Carlson <joelsoncarl@gmail.com>
X-Google-Original-From: Joel Carlson <JoelsonCarl@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 28 Dec 2022 16:03:26 -0700
Message-Id: <20221228230326.3799157-1-JoelsonCarl@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Gz7lv7k881Q6gl0CF6kby6rxV4462ax/F2ewzjxBKs4=;
 b=GPXap6WpkV4xqIza1glmTZpTQ/LfeBbEUXpr6o27t2D8sNOKrZ3T/9fxiE9L9r7Wdp
 X2gigiHXHSOorrL56oaC+KVPgoHlpkS9Nz8kNpgk7rZXBdYtwZkwHObHD+GKGOjcy+Vw
 kmoPDAiv9h9flF3bRJz39lZ4kABwrybQ3Ma6TDmVEIJltgeM/ymBZoMdcMc5xzRPU3kZ
 zd5+VlGlELH1ITV1TgB9vjrMe1VKw1NMI7PyImT01YGH3M8FYTtIwUKArqg225WuihQC
 R8+py3xQt6znAwsu4EDuZ6Hj+3Uvc60U3hAsg8Nk3Mmt3TgDR62PUIunI4EwZMg0WTF0
 fMFA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GPXap6Wp
Subject: [Buildroot] [PATCH 1/1] package/capnproto: bump version to 0.10.3
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
Cc: Koen Martens <gmc@sonologic.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The 0.10 line offers minor improvements and bug fixes.

The previous security bump from 0.9.1 to 0.9.2 fixed CVE-2022-46149,
which was also present in 0.10.2, but is fixed within 0.10.3.

Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
---
 package/capnproto/capnproto.hash | 2 +-
 package/capnproto/capnproto.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/capnproto/capnproto.hash b/package/capnproto/capnproto.hash
index c3233e7c8b..0faf69d069 100644
--- a/package/capnproto/capnproto.hash
+++ b/package/capnproto/capnproto.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4fe1ca8ab90859f33f08d2c4fcd7099e2983b0b946beecebd2fe051e3a64c67e  capnproto-0.9.2.tar.gz
+sha256  e07446f56043c983e009038e69d18ff86a2924909f0b518ccf47eccf5ac03919  capnproto-0.10.3.tar.gz
 sha256  9564998c8d7f270a61a8b89869a8d17a9d5e3783b64027788b5e339ec8479e10  LICENSE
diff --git a/package/capnproto/capnproto.mk b/package/capnproto/capnproto.mk
index 23f128455a..84acf5fc65 100644
--- a/package/capnproto/capnproto.mk
+++ b/package/capnproto/capnproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAPNPROTO_VERSION = 0.9.2
+CAPNPROTO_VERSION = 0.10.3
 CAPNPROTO_SITE = $(call github,capnproto,capnproto,v$(CAPNPROTO_VERSION))
 CAPNPROTO_LICENSE = MIT
 CAPNPROTO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
