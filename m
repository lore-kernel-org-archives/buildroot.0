Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E31CC433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 22:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9DE541CB6;
	Thu, 24 Mar 2022 22:34:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4hLU3oT6g0cZ; Thu, 24 Mar 2022 22:34:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC2B441CB0;
	Thu, 24 Mar 2022 22:34:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 69F5F1BF36A
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 22:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 596968186B
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 22:34:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zCblRc29LMc0 for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 22:34:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07A708175E
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 22:34:20 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id t11so8537567wrm.5
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 15:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xkC1ohWUFBosGxHQ9oaLhr4ICWCG4kctFuodKFNHckw=;
 b=q7/22tEBM2bnF2VPznF6xhGuNMWWJenZSrdahgvLlFmZu67GFuI2+us7Zmapd+QD5X
 Ckjfgq1WTbSsERcuVO8EdjonP6vCNz6E8mM6y6WAaJDd4GbfUEfz3OERsiWXjEJmJr6u
 nG0geyRZ1qlSVO8E9Gqt7mkRV0j+Vh/XQ7WvuTMkoB7DAbCs6803P22MjG7X8Iop1z+q
 tRxmRhYGLtnxXR3la06rA86e+Ecki4YQ19hCFu5FMzVAQGho1AV9B+RMXj4MSuvGBOqV
 SQEOerDy133pjje2OcRfgpow2QXeT9HZqndrM9bIpwFRXeEP3tASf/18GBogrZLj0pdD
 OCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xkC1ohWUFBosGxHQ9oaLhr4ICWCG4kctFuodKFNHckw=;
 b=UhMR/lW71axEEKiP6E+YxmDUQJrTYKNU1JUP/R+a/qT73Zjyqlz6GqnisNDhAdsN/E
 5Z93ZOSNhY8FspiyhQJsSA2pirGaYRCQOSjKSVVnFX3rSTxi0ZxhdXbsSyCvFqBTmZy3
 rSC139ZC3Rwa8YqhBajaa9TNZ0U1I27+1k51WoblkGM8uchZEktRtjfQmyxqUJALWs8V
 so+XYlROjjxNAry/ZeZya/6BW1PmAhIdtwnsVgiJWu76WugVdta+g4mG+bdfzBaoBMCe
 zbxd2Hr78eQHmbSwKDN2HQQRJNthJnvIVvA1gtiUX3YYJtGA1vJXCqz4lhJeeOyCJCNM
 wL0w==
X-Gm-Message-State: AOAM531vsH2Fh5r0K11wL8TD5xRWHfTAdkiLq5UmOgIoj6oxPYcOzT3s
 hI8cEAH3omcL9LpIl9X6TlJWIeDcckI=
X-Google-Smtp-Source: ABdhPJzsR/1Z1alC8C60oOafzIa7t+CuEB0myqdNGNc8VbYxY9a4A7E++JzD3dic8UdkY/cueObqCA==
X-Received: by 2002:adf:e241:0:b0:203:f56e:51e3 with SMTP id
 bl1-20020adfe241000000b00203f56e51e3mr6308230wrb.473.1648161258849; 
 Thu, 24 Mar 2022 15:34:18 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a5d6d4b000000b0020599079f68sm2471001wri.106.2022.03.24.15.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 15:34:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 24 Mar 2022 23:32:18 +0100
Message-Id: <20220324223218.27767-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/protozero: fix build with clang-tidy
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure if clang-tidy is found on host (and
protobuf is built before protozero) which is raised since tests are
disabled in commit be4869f393561aa5c297b631efc62dfd5e1c3f3f:

CMake Error at CMakeLists.txt:77 (add_dependencies):
  The dependency target "writer_tests" of target "clang-tidy" does not exist.

Fixes:
 - http://autobuild.buildroot.org/results/c3ae3b5caf79eb30c8a1786f58abea4f2b41a26e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...xt-protobuf-is-only-needed-for-tests.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/protozero/0001-CMakeLists.txt-protobuf-is-only-needed-for-tests.patch

diff --git a/package/protozero/0001-CMakeLists.txt-protobuf-is-only-needed-for-tests.patch b/package/protozero/0001-CMakeLists.txt-protobuf-is-only-needed-for-tests.patch
new file mode 100644
index 0000000000..3033e24aa2
--- /dev/null
+++ b/package/protozero/0001-CMakeLists.txt-protobuf-is-only-needed-for-tests.patch
@@ -0,0 +1,35 @@
+From 1c16d3ffccd9e415c6ea3681f23231cd5184043c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 16 Feb 2022 00:11:38 +0100
+Subject: [PATCH] CMakeLists.txt: protobuf is only needed for tests
+
+Don't check for protobuf if tests are disabled. As a side effect, this
+will avoid a build failure if clang-tidy and protobuf are found but
+tests are disabled
+
+Fix #109
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/mapbox/protozero/pull/110]
+---
+ CMakeLists.txt | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index b975d49..df2ca15 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -52,7 +52,9 @@ endif()
+ #
+ #-----------------------------------------------------------------------------
+ 
+-find_package(Protobuf)
++if(BUILD_TESTING)
++    find_package(Protobuf)
++endif()
+ 
+ 
+ #-----------------------------------------------------------------------------
+-- 
+2.34.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
