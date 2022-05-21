Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95783C433F5
	for <buildroot@archiver.kernel.org>; Sat, 21 May 2022 12:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27FAE40B20;
	Sat, 21 May 2022 12:31:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x4ImO_g7TBBQ; Sat, 21 May 2022 12:31:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F8B740B07;
	Sat, 21 May 2022 12:31:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 69ACC1BF2C0
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 12:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66A1560BD7
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 12:31:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pWv0HQM1VTSs for <buildroot@lists.busybox.net>;
 Sat, 21 May 2022 12:31:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D761B60BAE
 for <buildroot@buildroot.org>; Sat, 21 May 2022 12:31:47 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 n124-20020a1c2782000000b003972dfca96cso3861196wmn.4
 for <buildroot@buildroot.org>; Sat, 21 May 2022 05:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QLOa1xjIN0aJVpGQO8gtr7c1+fb5r77jgEsMZg6gCFI=;
 b=Jr5/jJFfbSUsURmVMfjTzqsEaGXCc4KRf5xnhrRv3/uLWE57l/rAB8z/dOQblQ5nnu
 evtvwdEJVR6D7iy4AsTIFE6T1q71sZQqn31cGNpWx5CZCNHq+YnnfAZF6sOO8POvHPMr
 KHWWOhLes1tc5icmQokhdhMLa+RAhBngm8/HEGXFmk2+N5VhpLScL1EioMmtLaiclXkS
 RmLH1sLfW5/74l5I6CBkDkVQk081elXF4kxRBQoG5cPScSunJBBzqmytB7F7uEuzDrW3
 +1NwyElSB9GbgpGtr/UdO6d4T01qQVFaxwRf8qHOWl1C9zpyUKZBqgXyZ1Wk60MorsHH
 2tIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QLOa1xjIN0aJVpGQO8gtr7c1+fb5r77jgEsMZg6gCFI=;
 b=ZALGOlhECmdTVcOXAEkhAYAhR9YNEweqYhP8a9bbY+xRxEkGw1xOilD8+YfHJxjhB2
 rEg2G05Ms2TvU4zBMvpEKJ0XS5FXVDQyMYTDZq1UtrH357Rz3mpWbDfRrRFQi0uQMqD2
 MwfqlO7m0Xc/YEqHpJtv7JK1o69OFT2sKQJOaZGBRSPaAIoj0AvFx5+0EOak7HY+sPLE
 KxcM8Q9aFWDocl/k+U3XR1ORNKxbc/uW/T67fjCe9CENzjy2AG0nWQfpxfnoOP7YWfvK
 OUTWPr4NVJwSrtfGQ+IuDOlLsxxGTcYgHcALGkJJOJ+ANFFBY3m+hTR2R2jRG1+75U3o
 ZVGQ==
X-Gm-Message-State: AOAM530q8YgGxOCNOmvG2T4LDECsm12AbrLYpr6rLzoZxY7s4cWlox0q
 uaOi5n4xonkA6Y/tkZIawIjcKB1Z8Kc=
X-Google-Smtp-Source: ABdhPJyiGK5n8+a/8mjc9+qyqyiuRjXSrBwU1g392GYBk/KbLq4DDL7KgchuNS5Nu8AvGKmFlDQYEw==
X-Received: by 2002:a7b:c755:0:b0:397:36a4:64f5 with SMTP id
 w21-20020a7bc755000000b0039736a464f5mr8115822wmk.47.1653136305681; 
 Sat, 21 May 2022 05:31:45 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 d21-20020adf9b95000000b0020d06e7c16fsm4890840wrc.84.2022.05.21.05.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 May 2022 05:31:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 May 2022 14:29:22 +0200
Message-Id: <20220521122922.207122-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/boost: fix boost-log build
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

Fix the following build failure with boost-log raised since bump to
version 1.79.0 in commit 7fa88b8eb637f5ec4927ac1bd05309dea7d60bc9 and
https://github.com/boostorg/log/commit/3cbc2585c3b7ff5d884a6c337a99525b57fa184b:

error: at libs/log/build/Jamfile.v2:59
error: Unable to find file or target named
error:     '/boost/architecture//mips'
error: referred to from project at
error:     'libs/log/build'

Fixes:
 - http://autobuild.buildroot.org/results/edcc7c7f3586993a77b6cc06ed02363a42c09a83

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ips1-to-mips-and-alias-mips1-to-mips.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/boost/0002-Rename-mips1-to-mips-and-alias-mips1-to-mips.patch

diff --git a/package/boost/0002-Rename-mips1-to-mips-and-alias-mips1-to-mips.patch b/package/boost/0002-Rename-mips1-to-mips-and-alias-mips1-to-mips.patch
new file mode 100644
index 0000000000..cc4ab8a2f8
--- /dev/null
+++ b/package/boost/0002-Rename-mips1-to-mips-and-alias-mips1-to-mips.patch
@@ -0,0 +1,48 @@
+From 1a55d1d9c6d1cf7739645080bdd92fe903b4211e Mon Sep 17 00:00:00 2001
+From: Nikita Kniazev <nok.raven@gmail.com>
+Date: Wed, 28 Jul 2021 21:06:54 +0300
+Subject: [PATCH] Rename mips1 to mips and alias mips1 to mips
+
+[Retrieved from:
+https://github.com/boostorg/config/commit/1a55d1d9c6d1cf7739645080bdd92fe903b4211e]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ checks/architecture/Jamfile.jam             | 3 ++-
+ checks/architecture/{mips1.cpp => mips.cpp} | 4 ++--
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+ rename checks/architecture/{mips1.cpp => mips.cpp} (89%)
+
+diff --git a/libs/config/checks/architecture/Jamfile.jam b/libs/config/checks/architecture/Jamfile.jam
+index 2ba54f9ad..c3779d917 100644
+--- a/libs/config/checks/architecture/Jamfile.jam
++++ b/libs/config/checks/architecture/Jamfile.jam
+@@ -18,7 +18,8 @@ obj 64 : 64.cpp ;
+ 
+ obj arm      : arm.cpp ;
+ obj combined : combined.cpp ;
+-obj mips1    : mips1.cpp ;
++obj mips     : mips.cpp ;
++alias mips1  : mips ; # Backwards compatibility
+ obj power    : power.cpp ;
+ obj riscv    : riscv.cpp ;
+ obj sparc    : sparc.cpp ;
+diff --git a/libs/config/checks/architecture/mips1.cpp b/libs/config/checks/architecture/mips.cpp
+similarity index 89%
+rename from checks/architecture/mips1.cpp
+rename to checks/architecture/mips.cpp
+index b4a670b89..85f85583d 100644
+--- a/libs/config/checks/architecture/mips1.cpp
++++ b/libs/config/checks/architecture/mips.cpp
+@@ -1,4 +1,4 @@
+-// mips1.cpp
++// mips.cpp
+ //
+ // Copyright (c) 2012 Steven Watanabe
+ //
+@@ -7,5 +7,5 @@
+ // http://www.boost.org/LICENSE_1_0.txt)
+ 
+ #if !(defined(__mips) || defined(_MIPS_ISA_MIPS1) || defined(_R3000))
+-#error "Not MIPS1"
++#error "Not MIPS"
+ #endif
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
