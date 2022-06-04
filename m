Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70B9C43334
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 11:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 485B8844B6;
	Sat,  4 Jun 2022 11:55:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eaz7I2jxZfPK; Sat,  4 Jun 2022 11:55:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58C4F844B3;
	Sat,  4 Jun 2022 11:55:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 301171BF5AA
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 11:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D51241B3F
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 11:55:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YrbjpeVZctKe for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 11:55:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91A5941A1E
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 11:55:14 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id s12so13283599ejx.3
 for <buildroot@buildroot.org>; Sat, 04 Jun 2022 04:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aNuXXCdE44b6f+0zzJKrkD/bH/DTUoiCOnABdcZf+TI=;
 b=V01vBRlUxVKipb+33nlQAK9yWyV6XsWglRP02b0K+mg+voJZvwyNvSSf2EedPT/+mM
 t2Egs4rcP+TlCt45g0xLdYRLo+jZyHI+OwIvAIynxyDqmX/3f6D8DzB5vLOI/3OeyGoe
 5lB3HO1ev5a4D4TMmxthjz0PqEcLfMmlrcvBjcBsxUnwgoNMfyBuqrVcxBBWp8kb0Mri
 gWKfwqsxnr0Oe3egesdNG52QFZL9OT2b4eIVZc/XO2jXi97WOAl9MOlz+IC5bZDqKiFF
 yP/ib2LJPs4KYE3yFe9++pecfDScdhWqk5ux1gmEMNy6C+9DsvSigLH5PDB/ViRl5K87
 GH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aNuXXCdE44b6f+0zzJKrkD/bH/DTUoiCOnABdcZf+TI=;
 b=Ww540xSQaHNELfwn2/8NngMKBkdxx1t6PEzOWQccUY6GBxPJSqPU808caAKgOWj0G4
 AODgH4vPJQIiIiuXGeRKZE53gF1WCz3SNgX7OWpy3Hdzg0li1hrVvIqmAMAFpxIciAPa
 QUuxgt0IREYiLDoZWREkRlUFl1uyfsJaKW3PF90MAwpG5m4ESpGKgLnZrwXgXZpbob7G
 cJTrSNPivQotwkVBToXD97m9135dqEcqcjw0XtxUuRQDJHywTPHWCfJT7DyShwqGc5tl
 uK/QOxkIVkiqw1yS4alTBaGbLxOhiCLSxFGzZC7iXxnYal2pEWYoL9zyH4PYpQX9QqT6
 lmgg==
X-Gm-Message-State: AOAM53166aSXHjcYLxbq1iMlhQTSPMsd1n7pG/BxUSY6B6f0MmSD5ZXn
 0mOxc1sSJLTw8botUl79KdUx4HgfMvU=
X-Google-Smtp-Source: ABdhPJyHxCanI8Re0V+Jm9XDoZKRCqsTN9AcyQ+Uqg3nb84EnlieVN4c4StkmOapscmQzPOe60slfQ==
X-Received: by 2002:a17:907:60d3:b0:6f5:c4c3:2f96 with SMTP id
 hv19-20020a17090760d300b006f5c4c32f96mr12567524ejc.724.1654343712294; 
 Sat, 04 Jun 2022 04:55:12 -0700 (PDT)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 d10-20020a1709063cea00b006f3ef214e5bsm3891829ejh.193.2022.06.04.04.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jun 2022 04:55:11 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Jun 2022 13:54:58 +0200
Message-Id: <20220604115458.7914-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/rauc: bump to version 1.7
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch that is already in upstream.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 ...src-verify_hash.c-include-inttypes.h.patch | 38 -------------------
 package/rauc/rauc.hash                        |  2 +-
 package/rauc/rauc.mk                          |  2 +-
 3 files changed, 2 insertions(+), 40 deletions(-)
 delete mode 100644 package/rauc/0001-src-verify_hash.c-include-inttypes.h.patch

diff --git a/package/rauc/0001-src-verify_hash.c-include-inttypes.h.patch b/package/rauc/0001-src-verify_hash.c-include-inttypes.h.patch
deleted file mode 100644
index 916c8cca0b..0000000000
--- a/package/rauc/0001-src-verify_hash.c-include-inttypes.h.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From b19a9c26d88a913417e77aaf60c72cdbf393d1f6 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 31 May 2022 21:22:36 +0200
-Subject: [PATCH] src/verify_hash.c: include inttypes.h
-
-Include inttypes.h to avoid the following build failure:
-
-In file included from /nvmedata/autobuild/instance-22/output-1/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/include/glib-2.0/glib.h:62,
-                 from src/verity_hash.c:26:
-src/verity_hash.c: In function 'verify_zero':
-src/verity_hash.c:69:55: error: expected ')' before 'PRIu64'
-   69 |    g_message("Spare area is not zeroed at position %" PRIu64 ".",
-      |                                                       ^~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/1a093c0e194a061836884419d2f50506105db01e
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/rauc/rauc/pull/914]
----
- src/verity_hash.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/verity_hash.c b/src/verity_hash.c
-index db82a78..3b2c2a0 100644
---- a/src/verity_hash.c
-+++ b/src/verity_hash.c
-@@ -19,6 +19,7 @@
-  */
- 
- #include <errno.h>
-+#include <inttypes.h>
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
--- 
-2.35.1
-
diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index f6c1446de4..677d358158 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,4 +1,4 @@
 # Locally calculated, after verifying against
 # https://github.com/rauc/rauc/releases/download/v1.6/rauc-1.6.tar.xz.asc
-sha256  86013788dd02321b7c3f913ad3a1f8802afbc784ec076fa278524a9e1ef9e7b0  rauc-1.6.tar.xz
+sha256  8b7d37cc1eb57df4f03de3c943dd7be290b78d47be28881e8b1f070e1d5e55df  rauc-1.7.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 0520b30521..90b2317d4b 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 1.6
+RAUC_VERSION = 1.7
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
