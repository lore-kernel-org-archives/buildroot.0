Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB9BC77B7C
	for <buildroot@archiver.kernel.org>; Sun, 21 May 2023 08:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 266D560B12;
	Sun, 21 May 2023 08:23:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 266D560B12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vpO0xPWsBw5X; Sun, 21 May 2023 08:23:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59B3960B4E;
	Sun, 21 May 2023 08:23:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59B3960B4E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 18F671BF3D8
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 08:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E245A82DDE
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 08:23:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E245A82DDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IIrR31or2y7X for <buildroot@lists.busybox.net>;
 Sun, 21 May 2023 08:23:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D097C82C7C
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D097C82C7C
 for <buildroot@busybox.net>; Sun, 21 May 2023 08:23:20 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f41d087b24so32194155e9.1
 for <buildroot@busybox.net>; Sun, 21 May 2023 01:23:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684657399; x=1687249399;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wuq8wgOOnqEQ4rRl30P5M4fqrUYAP8FqTBUrlC3aDeE=;
 b=WYefxUI3GLg8ivrcgWsEIXubERedv3Q39KBQpl8CtcY4YZVEnH/ykjLAPC8C56/Q+y
 OoWMcfiRSciPWEfzO1YBqerp68yOVJfqLiaxmk3mDrwOnlePRrN+WBxAcCMFpgqyolFD
 7VaZu7E89Ffa6yeuvDs5E3cL67YlvVou0SHNuuMZiiTjM1ikzgBYtVCoXDtOs028Poom
 rsgP/4K4Nw4Cmg82Ah5lf/Y4ZrXQUlRmmvfdRf7GrR5XCsVk8vzG1NrFjmbrsiffZwtt
 iuZ+5i6cCot85ZmY+1GRcAUjNHuCpucvNFhPjelFV/dLRtPME8aEIP8BEi1VoyOD5vHA
 Xh3g==
X-Gm-Message-State: AC+VfDzbB8U+8KBr9Cq0wNBqy+ZbzPJST8YR9Wod5k5sB7GPS4nX8Gi2
 jHYipUW7Hc6LMUXwh2/7g18HPV7661A=
X-Google-Smtp-Source: ACHHUZ77kdFcDiiJpHCkAEUmdERxIK25vrxbpzkVRBgapHndlvW2I9ehJI97v74xIcK0SQ0L56D6Eg==
X-Received: by 2002:a1c:7512:0:b0:3f1:70a2:ceb5 with SMTP id
 o18-20020a1c7512000000b003f170a2ceb5mr4922605wmc.13.1684657398464; 
 Sun, 21 May 2023 01:23:18 -0700 (PDT)
Received: from pc-140.home ([2a01:cb1c:e03:bd00:5ffe:deec:ec3f:c958])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a7bcd0b000000b003f4ebeaa970sm4498035wmj.25.2023.05.21.01.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 01:23:18 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Sun, 21 May 2023 10:23:12 +0200
Message-Id: <20230521082312.24185-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684657399; x=1687249399;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Wuq8wgOOnqEQ4rRl30P5M4fqrUYAP8FqTBUrlC3aDeE=;
 b=iynoBILEVyQB2IiXN1kanU/U6DFTVClTrkiJwVlZIGm6+B9Pg22ol/WgSyNIRLMpxB
 CZdwdv3U6KIJb8VvAR+5AQ8gGi/bKAJRQ5XWopStA8GqrQIFopMnyyIbwb4sL+nbZMyn
 WhezLCoQ+n4GGNs8Ei7bPPfmdng0sGCrINM/IB6CvrpBR55EtLlRswIKREJV/rJbm5J0
 8/hsI7ScEOIE5wPEnBrjk/8d6UaYYaHCRbmlVabAAYaPeQPeRjXj808ua0ydSCRcnovY
 ypM1h3u6K1dAFUD8qmZ1gfA4OvlAeWNbh1kcO/QCxWXSNnep7gbiUiT/s0UVZ5MORhsZ
 hWVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=iynoBILE
Subject: [Buildroot] [PATCH 1/1] package/python-gast: bump to version 0.5.4
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
Cc: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/python-gast/python-gast.hash | 4 ++--
 package/python-gast/python-gast.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-gast/python-gast.hash b/package/python-gast/python-gast.hash
index f16d001a6a..9ce5296938 100644
--- a/package/python-gast/python-gast.hash
+++ b/package/python-gast/python-gast.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gast/json
-md5  fdff900805e03e9dd76d377eb4cbaed7  gast-0.5.3.tar.gz
-sha256  cfbea25820e653af9c7d1807f659ce0a0a9c64f2439421a7bba4f0983f532dea  gast-0.5.3.tar.gz
+md5  907c689e3fdbc7a48cc010e665195baa  gast-0.5.4.tar.gz
+sha256  9c270fe5f4b130969b54174de7db4e764b09b4f7f67ccfc32480e29f78348d97  gast-0.5.4.tar.gz
 # Locally computed sha256 checksums
 sha256  6a04bbabd9b48bea6bf7c0bd3f3a062e1476b3c403a746448fd69b0d902e148f  LICENSE
diff --git a/package/python-gast/python-gast.mk b/package/python-gast/python-gast.mk
index e02e87fb23..0db1dbe93e 100644
--- a/package/python-gast/python-gast.mk
+++ b/package/python-gast/python-gast.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GAST_VERSION = 0.5.3
+PYTHON_GAST_VERSION = 0.5.4
 PYTHON_GAST_SOURCE = gast-$(PYTHON_GAST_VERSION).tar.gz
-PYTHON_GAST_SITE = https://files.pythonhosted.org/packages/48/a3/0bd844c54ae8141642088b7ae09dd38fec2ec7faa9b7d25bb6a23c1f266f
+PYTHON_GAST_SITE = https://files.pythonhosted.org/packages/e4/41/f26f62ebef1a80148e20951a6e9ef4d0ebbe2090124bc143da26e12a934c
 PYTHON_GAST_SETUP_TYPE = setuptools
 PYTHON_GAST_LICENSE = BSD-3-Clause
 PYTHON_GAST_LICENSE_FILES = LICENSE
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
