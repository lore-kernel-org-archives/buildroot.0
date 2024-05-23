Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C8AC25B7C
	for <buildroot@archiver.kernel.org>; Thu, 23 May 2024 17:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E8C1824BD;
	Thu, 23 May 2024 17:05:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ZlFA8qCzDHO; Thu, 23 May 2024 17:05:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A72B1824A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A72B1824A4;
	Thu, 23 May 2024 17:05:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6DF071CE677
 for <buildroot@lists.busybox.net>; Thu, 23 May 2024 17:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5829B824BD
 for <buildroot@lists.busybox.net>; Thu, 23 May 2024 17:05:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FNNS2sNQy0G0 for <buildroot@lists.busybox.net>;
 Thu, 23 May 2024 17:05:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2F506824A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F506824A4
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F506824A4
 for <buildroot@buildroot.org>; Thu, 23 May 2024 17:05:33 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41fd5dc0439so23149465e9.0
 for <buildroot@buildroot.org>; Thu, 23 May 2024 10:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716483932; x=1717088732;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UJk0beeI6qYs45DgeTTUohw7BWvubbI4gvEkVlBgTSQ=;
 b=nqjKeyAbz0Na+Zt+wYklhw1tTW2b1y6ez5rYiZx9ELzWVpgRb4RrEcwSI+cJgNjjCE
 YV7QgXkR/IMC45oz0jPCdGdfU4zl65eOJmqGUsDD4GKJB3v0KOjfrHttZzYpb3OWntAg
 0KOE4i/2c+e7z4DKvrbk7TMEijThcdOhWK+t8NL478poZ32dQ4H3Lwr4uXZje7rkIrOe
 8/bNNNVo/HLq/fLXNnZEbn1KpYncCCqvYCwkdh0dz6ryx+kizJSqPV+1LluAQEwk/gCi
 IdkzrBpCR0PrvvnE4dRWjKrhkMisNCZA1l6FEVIQIW3+kkg4319dn478OMSx+MYseU7/
 HXJQ==
X-Gm-Message-State: AOJu0YypN7qAQMbYHqDymA8+R4ZSVLxUis0u6c/LDYJIsGS1lDHJ91Qr
 nSWLtl96j3A371ABLlxCJ/0ZadusvrEWThmBclK1tm1IusgBkY/P4dMsTQ==
X-Google-Smtp-Source: AGHT+IGKvSKcJQw7N6os7RtP4CPbNoyWAurgtXQunzL/jtZcNaI7KAygHqSY1w6r/5z2IPuUrmN7GQ==
X-Received: by 2002:a05:600c:3b8a:b0:418:c1a3:8521 with SMTP id
 5b1f17b1804b1-420fd354b47mr49726155e9.26.1716483931415; 
 Thu, 23 May 2024 10:05:31 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42100fa95a3sm30021205e9.36.2024.05.23.10.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 10:05:30 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 23 May 2024 19:05:23 +0200
Message-ID: <20240523170523.1492521-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716483932; x=1717088732; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UJk0beeI6qYs45DgeTTUohw7BWvubbI4gvEkVlBgTSQ=;
 b=Gl5pKZ0rbZO3wuQdmEYRvGSoXf3H+cyzZIMwovz+RykS6FxL6agRahykjjVdftxWby
 A5M9dXt3Sw3PaP/8TFnYrpWpaEvsF7nHfFiqiOd/QyDa5HkM8shBy7SsqqIctXBGojMH
 bRDu/Nmq+pROrlHA3xRoA96etRHH5c7k77RW1lY8RevA7fvdbATj3mmea6Y1ueEyOyXL
 z/Ct8CXozxiG8uAk5DRajL7w7n6HIQZ+yN22TjJ44DbzRdb0slOJ34ZXk+IzQvdpneT6
 /RFF/634M8O4AgBHB/yb76fc+hR5TH3f7JaQXyDyrhRdCpTyop0h1wpB7BHPPBQhg2Z9
 59vw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Gl5pKZ0r
Subject: [Buildroot] [PATCH 1/1] package/util-linux: fix build with
 uclibc-ng < 1.0.39
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

Fix the following build failure with uclibc-ng < 1.0.39 (i.e., without
https://github.com/wbx-github/uclibc-ng/commit/85ac4f04d94e98389a8315e720630d0f95bfdfd6)
raised since bump to version 2.39 in commit
ad276d94a392fb13244e042851a44269e6254d61 and
https://github.com/util-linux/util-linux/commit/03a254f010b08da1175f50a8ae7882e59228f1b4:

sys-utils/setarch.c:106:7: error: 'PER_LINUX32_3GB' undeclared here (not in a function); did you mean 'PER_LINUX32'?
  106 |     X(PER_LINUX32_3GB) \
      |       ^~~~~~~~~~~~~~~

Fixes: ad276d94a392fb13244e042851a44269e6254d61
 - http://autobuild.buildroot.org/results/fb1feb47f2660882fa53f66bacc63e191fd52175

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ch.c-fix-build-with-uclibc-ng-1.0.39.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/util-linux/0001-sys-utils-setarch.c-fix-build-with-uclibc-ng-1.0.39.patch

diff --git a/package/util-linux/0001-sys-utils-setarch.c-fix-build-with-uclibc-ng-1.0.39.patch b/package/util-linux/0001-sys-utils-setarch.c-fix-build-with-uclibc-ng-1.0.39.patch
new file mode 100644
index 0000000000..12dd119ef3
--- /dev/null
+++ b/package/util-linux/0001-sys-utils-setarch.c-fix-build-with-uclibc-ng-1.0.39.patch
@@ -0,0 +1,39 @@
+From beef18da4de87ca5aaadf2beb14187f35cc4f50f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 15 May 2024 18:22:11 +0200
+Subject: [PATCH] sys-utils/setarch.c: fix build with uclibc-ng < 1.0.39
+
+Fix the following build failure with uclibc-ng < 1.0.39 (i.e., without
+https://github.com/wbx-github/uclibc-ng/commit/85ac4f04d94e98389a8315e720630d0f95bfdfd6)
+raised since version 2.39 and
+https://github.com/util-linux/util-linux/commit/03a254f010b08da1175f50a8ae7882e59228f1b4:
+
+sys-utils/setarch.c:106:7: error: 'PER_LINUX32_3GB' undeclared here (not in a function); did you mean 'PER_LINUX32'?
+  106 |     X(PER_LINUX32_3GB) \
+      |       ^~~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/fb1feb47f2660882fa53f66bacc63e191fd52175
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/util-linux/util-linux/commit/4647fc6afbf7e99c49531600425df60f1243fcd2
+---
+ sys-utils/setarch.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/sys-utils/setarch.c b/sys-utils/setarch.c
+index 227bc6b5de..4bcb5e69e6 100644
+--- a/sys-utils/setarch.c
++++ b/sys-utils/setarch.c
+@@ -89,6 +89,11 @@
+ # define PER_LINUX_FDPIC	(PER_LINUX | FDPIC_FUNCPTRS)
+ #endif
+ 
++/* fallback for old uclibc-headers < 1.0.39 */
++#ifndef PER_LINUX32_3GB
++# define PER_LINUX32_3GB	(PER_LINUX32 | ADDR_LIMIT_3GB)
++#endif
++
+ #define ALL_PERSONALITIES \
+     X(PER_LINUX) \
+     X(PER_LINUX_32BIT) \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
