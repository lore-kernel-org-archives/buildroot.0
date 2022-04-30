Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9927AC433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 08:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2470D41BDB;
	Sat, 30 Apr 2022 08:48:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zr5Q4DrL-fXa; Sat, 30 Apr 2022 08:48:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7A1F4197A;
	Sat, 30 Apr 2022 08:48:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 30B311BF40A
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 08:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E9A360AD8
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 08:48:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0jS5SjXU896h for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 08:48:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30B7D60A84
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 08:48:02 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id l18so19349111ejc.7
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 01:48:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JE7mOVh0u1ozFYuBcHf4++0DSHJoyLrJ9YQsOe4yhhs=;
 b=tHWcm0ouSKNq037+7iRk45q2jjQ/OUDvxbjLe4pdBF2o+7wOlY8x8vVjpRTByddJoQ
 bKs42eUdFRgh6aLJXXfOk4MIULdHIHSxoYTOHnJQT+3ZMoQtZLKWJ+BXrTpSyOoO4nKo
 3D8zX1R3VarOFpksDNJtt09uL7AsCE3ZBY5Pmw1n2w6Z4oBY4vCpMlGMkAZ4zTxbHk+S
 FhKR2a+T3UN3HvUq9R25Fk4b36oM1bV09v+tFnJojZPhCfo4si+pxjWaPB4cFcXJX74+
 5l9HCzDJbH5BPCu3M5IWx+TyqJ6bBhp6y7RcFnYvkeWlMGOHDZ/eN69X/p4DiWuuaC1+
 Ab5A==
X-Gm-Message-State: AOAM531zUYe7k1Zme3oUrWBUxNVM4ZpseKoEuiorJXYnYMmMdIOWUgA4
 GB9mvjHeJAnLV5+0KeI5zV336o6gG88=
X-Google-Smtp-Source: ABdhPJxgFU3K0a8rE7/UwnqAE1fZxDLKMKe0HMtfUixOZGWV49xzh59hXYqyQ1wfsmoyieD7TC1f0w==
X-Received: by 2002:a17:907:969f:b0:6f3:dede:f2d2 with SMTP id
 hd31-20020a170907969f00b006f3dedef2d2mr3022138ejc.511.1651308480188; 
 Sat, 30 Apr 2022 01:48:00 -0700 (PDT)
Received: from localhost.localdomain (tmo-082-126.customers.d1-online.com.
 [80.187.82.126]) by smtp.gmail.com with ESMTPSA id
 de3-20020a1709069bc300b006f39ffe23fdsm1347559ejc.0.2022.04.30.01.47.56
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 01:47:59 -0700 (PDT)
From: Thomas Huth <huth@tuxfamily.org>
To: buildroot@buildroot.org
Date: Sat, 30 Apr 2022 10:47:42 +0200
Message-Id: <20220430084742.522833-1-huth@tuxfamily.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/frotz: Update to version 2.54
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A simple update by bumping the version number and sha256 sum
to the current version.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 package/frotz/frotz.hash | 2 +-
 package/frotz/frotz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/frotz/frotz.hash b/package/frotz/frotz.hash
index e5024aa2cd..145aa3800f 100644
--- a/package/frotz/frotz.hash
+++ b/package/frotz/frotz.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8da558828dd74d6d6ee30483bb32276ef918b8b72b7f6e89b4f7cb27e7abf58b  frotz-2.53.tar.bz2
+sha256  bdf9131e6de49108c9f032200cea3cb4011e5ca0c9fbdbf5b0c05f7c56c81395  frotz-2.54.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/frotz/frotz.mk b/package/frotz/frotz.mk
index c1362b2ac6..5af235137c 100644
--- a/package/frotz/frotz.mk
+++ b/package/frotz/frotz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FROTZ_VERSION = 2.53
+FROTZ_VERSION = 2.54
 FROTZ_SOURCE = frotz-$(FROTZ_VERSION).tar.bz2
 FROTZ_SITE = $(call gitlab,DavidGriffith,frotz,$(FROTZ_VERSION))
 FROTZ_DEPENDENCIES = host-pkgconf ncurses
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
