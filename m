Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6350C433EF
	for <buildroot@archiver.kernel.org>; Fri, 25 Mar 2022 21:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26B4560BB0;
	Fri, 25 Mar 2022 21:07:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2pndxdM3sdHp; Fri, 25 Mar 2022 21:07:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3402A60B64;
	Fri, 25 Mar 2022 21:07:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9DF501BF380
 for <buildroot@lists.busybox.net>; Fri, 25 Mar 2022 21:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CD1E60B64
 for <buildroot@lists.busybox.net>; Fri, 25 Mar 2022 21:07:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CWR7lt82z6jj for <buildroot@lists.busybox.net>;
 Fri, 25 Mar 2022 21:07:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9079060B2C
 for <buildroot@buildroot.org>; Fri, 25 Mar 2022 21:07:16 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d7so12389967wrb.7
 for <buildroot@buildroot.org>; Fri, 25 Mar 2022 14:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rTpLUbeU/sqQKe8CRJrVwvBFxYT3MY8v8b8sEJU/br4=;
 b=OOEKl6CniQejuwMRzpgpoIUgXdzjqwuC7eCju9sS3/Mp3hZvL0awh1dW5Pm1wiyopl
 Kqm4Qw4RCwOWWgyR3t0GPl5wlr0zhI3V01aP4D6riA+wN5mNHVCcIEDCIncQJHVm3yz9
 B0NDpHsDlPsN6DFe/pvGFKCNqiPHpxs5iPNWYBCGm3IIwkbE99vequE2aCS9ZddFr5dq
 t+7FJSUSbNObQz1ceyesCTtpTl2BL6MSVAmpzUDv53wtF0CbNB9SBvp37m7NXi55vkCk
 h9owpS/FZpIilPIGTLoZeNK++LfrTRFkp6k1jV7Lg7s3R8iZPNY3DVqIkpdAOwcP1eAu
 eFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rTpLUbeU/sqQKe8CRJrVwvBFxYT3MY8v8b8sEJU/br4=;
 b=4a6y5HzpgecR58sHdKItGxfKKG89Ijyor4AzgdKqMpX4nMQ4NAvOcDlumrMfWMRi5K
 RsVwEcwAawK8uad13YX3IHR2yUhfT8Ad3vnJnaWzUG2KqeXgykTi871yi2N8GO3Fl3Km
 PwZzr5LosRwQ12/oT0pdiBDbOOZY2WrSLiaPa6fmBMeVgUSWMqcjsCN2VywDB3SjLQ3y
 mMAFFMPSZHmA3mjFijSmsoQIsAYqqmo0oQGXV0kVQm3dbBuFmJZCb0FJLe/XXrLxDpL3
 0k2RwxIcNo/eGuplWxejUk/zhOHnMNqMN0Xxzch8x7yyU0UllGizAvQRtZfLjVKuyBFn
 sISw==
X-Gm-Message-State: AOAM532zotgYtYOKaHHmIw4wSQQBfEfOFhAQzA2cHULMFs+fxlOx8ImP
 duhLz3709xgbU0rvoVWADm4LGNmiyxM=
X-Google-Smtp-Source: ABdhPJyyu6ofCvCaLHDICG0rZ1RNWkYhrrAY4DeAVJRsUgK8A5aFePuYdOz5Qb/nz7URBPPME9mmig==
X-Received: by 2002:a5d:62c8:0:b0:203:e3bf:9259 with SMTP id
 o8-20020a5d62c8000000b00203e3bf9259mr10455901wrv.509.1648242434494; 
 Fri, 25 Mar 2022 14:07:14 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05600002c600b002057f1738fcsm6482130wry.110.2022.03.25.14.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 14:07:14 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Mar 2022 22:05:54 +0100
Message-Id: <20220325210554.526198-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/iwd: fix uclibc build
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following uclibc build failure raised since bump to version 1.25
in commit 0fc5bc235990073233df6352d1208624034a6b6e and
https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=01cd8587606bf2da1af245163150589834126c1:

/home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: src/storage.o: in function `storage_init':
storage.c:(.text+0x13a4): undefined reference to `explicit_bzero'

Fixes:
 - http://autobuild.buildroot.org/results/2aff8d3d7c33c95e2c57f7c8a71e69939f0580a1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-src-storage.c-fix-build-with-uclibc.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/iwd/0001-src-storage.c-fix-build-with-uclibc.patch

diff --git a/package/iwd/0001-src-storage.c-fix-build-with-uclibc.patch b/package/iwd/0001-src-storage.c-fix-build-with-uclibc.patch
new file mode 100644
index 0000000000..55fdaa86fd
--- /dev/null
+++ b/package/iwd/0001-src-storage.c-fix-build-with-uclibc.patch
@@ -0,0 +1,37 @@
+From 99e74ade2ea892e6d0b070bec1df6a135ce2c8b3 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 25 Mar 2022 16:35:49 +0100
+Subject: [PATCH] src/storage.c: fix build with uclibc
+
+explicit_bzero is used in src/storage.c since commit
+01cd8587606bf2da1af245163150589834126c1c but src/missing.h is not
+included, as a result build with uclibc fails on:
+
+/home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: src/storage.o: in function `storage_init':
+storage.c:(.text+0x13a4): undefined reference to `explicit_bzero'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/2aff8d3d7c33c95e2c57f7c8a71e69939f0580a1
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://lists.01.org/hyperkitty/list/iwd@lists.01.org/thread/WB2XXRBUDHC5IVFDEOJBK23JHPURL427]
+---
+ src/storage.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/storage.c b/src/storage.c
+index 82a72443..aa8066b1 100644
+--- a/src/storage.c
++++ b/src/storage.c
+@@ -44,6 +44,7 @@
+ #include <ell/ell.h>
+ #include "ell/useful.h"
+ 
++#include "src/missing.h"
+ #include "src/common.h"
+ #include "src/storage.h"
+ #include "src/crypto.h"
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
