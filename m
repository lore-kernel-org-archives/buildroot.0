Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CCFCD3424
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 17:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43B8261062;
	Sun,  3 May 2026 17:46:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x9HCrX7Dygh0; Sun,  3 May 2026 17:46:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F26CD61082
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777830386;
	bh=HJqpOCb4eYCvGqMfJNFcrLZA8dRsxNHluhTuT07CBvE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Rnm2DclcRl3tRvQH6/Pbs5AuAtK8uN8At3nGfQsmfBOp8ho/r8VYob+rhhgoU4yc+
	 w4j+/qIIaBiYziPv3GUXt0iTW9/CuL7nArZfneJJ89Q1hed/nabj+Kn+7Tn0KrPeZl
	 Rx6V+ohJNWd5IEr6zPpsWbUtfUSBz7upkhs4mrRqN88y46IbghYCOWtSJNBw0c5PDv
	 /c84KbS2ILi4wCN+6rwo5sxgKjuktzrqk9FKx6JUxEg6RaFvw7wHAyCiTeqykKiKAS
	 KyRwaOvCbtuOwdbYqc+h/0tXcNzbl3v8LoikYxlExaddcjQgbliXKBxlQJxnM/8rw2
	 WAaP7PAanHLvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F26CD61082;
	Sun,  3 May 2026 17:46:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 09DCF190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 17:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2B5741031
 for <buildroot@buildroot.org>; Sun,  3 May 2026 17:46:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PSoEUkfbXZ3d for <buildroot@buildroot.org>;
 Sun,  3 May 2026 17:46:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A647413DA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A647413DA
 for <buildroot@buildroot.org>; Sun,  3 May 2026 17:46:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B7D377FDF8; Sun,  3 May 2026 17:46:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 18:59:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd26af479a10ac316f491887b499e7de87e160be
X-Git-Newrev: 2239b9dc466f0594acec4bcfa381cb7ccc943771
X-Patchwork-Hint: ignore
Message-Id: <20260503174621.B7D377FDF8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 26.0.6
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2239b9dc466f0594acec4bcfa381cb7ccc943771
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.freedesktop.org/archives/mesa-announce/2026-April/000848.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 01883a8ce1..1098aee9c1 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.0.5
+MESA3D_HEADERS_VERSION = 26.0.6
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index f486734cd5..eed4265147 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-April/000845.html
-sha256  d229c9937d9a25ca0a8958c59f425174563d300ec42acbea2dbe84a055023368  mesa-26.0.5.tar.xz
-sha512  8aa03a46269b2443be15cbd516d523af78fdd35e5273f5346b9142d2d21e245f6d5fd47e7e90176b0444ea967540eaa7c62d217f599ca5a216ef83244ee97d5c  mesa-26.0.5.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-April/000848.html
+sha256  1d3c3b8a8363b8cc354175bb4a684ad8b035211cc1d6fa17aeb9b9623c513f89  mesa-26.0.6.tar.xz
+sha512  7f298234cb7b353ac40dc4d116866115160d1a52de6da8d4f1343af7ed47ca11e1a07b70aad8d24221906e0b520a4c140c12ffa7e7e706e3f25f301842a37e68  mesa-26.0.6.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index fb5499de81..b4179908c3 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.0.5
+MESA3D_VERSION = 26.0.6
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
