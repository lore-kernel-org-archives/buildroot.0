Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794E4C02181
	for <buildroot@archiver.kernel.org>; Wed, 22 Jan 2025 21:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27FDD607A5;
	Wed, 22 Jan 2025 21:10:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rf4UxYW-8Jr2; Wed, 22 Jan 2025 21:10:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24FD060833
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24FD060833;
	Wed, 22 Jan 2025 21:10:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B2ADCB88
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 21:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A032340614
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 21:10:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WR3_uMBLxDgz for <buildroot@buildroot.org>;
 Wed, 22 Jan 2025 21:10:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 40B55403DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40B55403DA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 40B55403DA
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 21:10:22 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id EA635B0055A;
 Wed, 22 Jan 2025 22:10:17 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Julien Olivain <ju.o@free.fr>
Date: Wed, 22 Jan 2025 22:10:09 +0100
Message-ID: <20250122211009.1124558-1-ju.o@free.fr>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737580220;
 bh=AiaHLS/wZ5IVT912jeLA2Y60/Yg3Krz26WCK4FWy01k=;
 h=From:To:Cc:Subject:Date:From;
 b=gZLhGNnehLAF+Sk9mXkZ7kBuoXSeg1OMspCHLTrXeR3lmMKLu0soPMfn1DoWlFjD0
 QjmTYfk865Nojoz0vdXAdfJPalT5mXg+yrqazXZQt5Nk/IS0rAfIhGIBLmAa7H9+Vs
 dW2LoFFySGepHUgG8Eb97mEH1zo100KIOHV9R8Ax1OcZzLxz+nl+rsdaTLMrplXWk0
 KF7YUnb4WTOuXBK/t/V1qqq6ublzZXx4Yc6nnIHovK7XvX5R3077R/h7B6ba0gm/Ni
 jgJpxOHiC0ntxpw1fphu6v74xOpTBUt6jWpQxxv8T8KJwOm7AfU02oA5l3zhfB+cH7
 59xUb/PYfbWFw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gZLhGNne
Subject: [Buildroot] [PATCH 1/1] package/wine: bump to version 10.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

For a summary of changes since 9.19, see:
https://www.winehq.org/news/

This commit also adds a comment near _VERSION describing the intent to
stick the package on stable versions. See [1].

[1] https://lore.kernel.org/buildroot/ff5c88fb-c745-483c-9f8e-8aa49164e76b@dawncrow.de/

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8924998985
---
 package/wine/wine.hash |  6 +++---
 package/wine/wine.mk   | 10 ++++++++--
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/wine/wine.hash b/package/wine/wine.hash
index 61de6db80f..eb0d45ca0a 100644
--- a/package/wine/wine.hash
+++ b/package/wine/wine.hash
@@ -1,8 +1,8 @@
 # From:
-# https://dl.winehq.org/wine/source/9.x/sha512sums.asc
-sha512  530219c6a337f2996eac92d644ab603528b82cc6136cc37c1e6aa736d418f33c6f4b0d54f3537b04bceaf4487d84abcf926a2f5e9536ed4e966c4fe63c5b6ddd  wine-9.19.tar.xz
+# https://dl.winehq.org/wine/source/10.0/sha512sums.asc
+sha512  effb41c5641993e2e52eaa825cc19b7d9846e084992c5a5b066ead2339b24384d320898a9cee347a9a87106bcb3b0f54c8cd2c8d4de3a887a658052ddd5168d6  wine-10.0.tar.xz
 # Locally calculated after checking pgp signature
-sha256  2c13a0c3f31f25a54d415d86785a1ad46ef8a07ae973b6b699345a45206ac015  wine-9.19.tar.xz
+sha256  c5e0b3f5f7efafb30e9cd4d9c624b85c583171d33549d933cd3402f341ac3601  wine-10.0.tar.xz
 # Locally calculated
 sha256  e237fa56668030e928551ddd60f05df5fe957f75eab874bbd017e085ed722e7c  COPYING.LIB
 sha256  51433d87540ee2f30e3cff986e00e1477880002bf993106a13775ed60d4e0af4  LICENSE
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 6b1ba19b0b..efee63a294 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -4,9 +4,15 @@
 #
 ################################################################################
 
-WINE_VERSION = 9.19
+# In Buildroot, Wine should be updated only on "stable" versions. This
+# usually corresponds to version "X.0" (for initial stable releases)
+# or "X.0.y" (for maintenance releases). Please avoid updating to a
+# development version, unless it is absolutely needed (for example:
+# incompatibility with another library and no maintenance stable
+# version is available).
+WINE_VERSION = 10.0
 WINE_SOURCE = wine-$(WINE_VERSION).tar.xz
-WINE_SITE = https://dl.winehq.org/wine/source/9.x
+WINE_SITE = https://dl.winehq.org/wine/source/10.0
 WINE_LICENSE = LGPL-2.1+
 WINE_LICENSE_FILES = COPYING.LIB LICENSE
 WINE_CPE_ID_VENDOR = winehq
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
