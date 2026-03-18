Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03114107761F
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 21:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B4BC60DDA;
	Wed, 18 Mar 2026 21:48:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aVbxCuhp7tZX; Wed, 18 Mar 2026 21:48:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 684A460DBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773870537;
	bh=yGMmiLvjlglsSXY/GnW1g13rpIFCS20PLJxEI3+R7TM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Oypp1BIw4pqkJ+qUfRyGKSjCdxgl1kkNBfCyrt7DyLDt9G0scxCqTwLSPAUzErwr+
	 s556h5+V+KFhjdaVFiiAvi1X+ZC6+uAhaR+B0D1vH/d8SK9VWWYRD0pNSLtK+e6GkR
	 sx/z+xKflBOnrh3ms5ycVkgIV++RCcQXQrpP/MZ5NG9XmSNb5EUE18N/XvZ64pgrCc
	 xUjZCAVwdYbH1TsoNw4RN87FNptIHVe95gVqlLpV0cWphKvpJD+NQ0P3DUbQe2KQi0
	 XO5FZnO2C8ak9MYK8heGVXjmu5+gOl768Ym8FXI75tQ4Lm/hyi3BkhQEUObgWxsTax
	 gUXNia425dnsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 684A460DBD;
	Wed, 18 Mar 2026 21:48:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 15CF01B6
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 21:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07CBD8130A
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 21:48:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qf02iR6I7Nn4 for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 21:48:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55360810DE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55360810DE
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 21:48:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5CFD1841E3; Wed, 18 Mar 2026 21:48:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Mar 2026 22:43:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 763b9c289e36eedc0ac43791e9a367e01b16b038
X-Git-Newrev: 67e982e782d069cdfc3fc25c412c68f78054c760
X-Patchwork-Hint: ignore
Message-Id: <20260318214854.5CFD1841E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 26.0.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/67e982e782d069cdfc3fc25c412c68f78054c760
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.freedesktop.org/archives/mesa-announce/2026-March/000842.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 34555c05ea..cabdd479a1 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.0.2
+MESA3D_HEADERS_VERSION = 26.0.3
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 7cdaee7e79..c938372b49 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-March/000841.html
-sha256  973f535221be211c6363842b4cce9ef8e9b3e1d5ea86c5450ca86060163c7346  mesa-26.0.2.tar.xz
-sha512  0a7b9fc9b09e40345cc22d246dc1656900d74754c093882f6a39623af17fddc5f4a0c7938207c784ccf7306c5ed497be6a02c36f95c6548e01a2faa085e04c35  mesa-26.0.2.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-March/000842.html
+sha256  ddb7443d328e89aa45b4b6b80f077bf937f099daeca8ba48cabe32aab769e134  mesa-26.0.3.tar.xz
+sha512  82a33d0fa0c2855a63f599e38753126a2195025a13e45f38e14fda7aa008cb05925bb74088e4a1e199c9237d9388f4d4408a2c95c1d7fe79d8e6e6f27c84187b  mesa-26.0.3.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 3e5ce1266e..b9243dfaec 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.0.2
+MESA3D_VERSION = 26.0.3
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
