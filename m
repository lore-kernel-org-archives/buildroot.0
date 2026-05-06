Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AD9CD342C
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DE8960F61;
	Wed,  6 May 2026 22:17:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oshBHXFaYkRV; Wed,  6 May 2026 22:17:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7FA4607CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778105837;
	bh=JBUZsa3uPpFdSn5NTwVii9mwebK+5mh87j6c63arUSc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ab7IyRnL+Gs1C9TQLtMe46XkpVUP0UWpMXLDxvLaDFEulHb55BYKhqf96GmFs7i8a
	 SFWHeY1/+CXhZRkreYf4lU9LS3gpU1G58l6hUj2FsiK9LcSfY3Hd+uqB5t1E5IVO60
	 bq/uFRtHMUs2eBl+U1teNW2HCUVvzS9hMp6lWqWlXJTCO9vhZNsh1lZDpbd5gPqHnA
	 3E9K5WRCpDbRutg2kEFSPjaOP3bYqs/1NlCTz9tE4uYDXf9lKx5on3dXUfREmTa8Bl
	 00poRZiHe2WQwH7/c8sAYJ7myx2kqWITdsyw8zC38aHie/XH819xIbbFNPR/EnP+sS
	 PqZWXgy0igBPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7FA4607CD;
	Wed,  6 May 2026 22:17:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EB2A280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F6DD83323
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:17:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oeboer3uBD0l for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:17:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF68B83294
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF68B83294
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:17:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C33B84BC5; Wed,  6 May 2026 22:17:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 May 2026 23:14:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 951e07f0c40c52fc069c53c6cf9232dcc0e8b296
X-Git-Newrev: c073c976179021c84e0c84f6f23e938b43783e75
X-Patchwork-Hint: ignore
Message-Id: <20260506221714.4C33B84BC5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 26.1.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c073c976179021c84e0c84f6f23e938b43783e75
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.freedesktop.org/archives/mesa-announce/2026-May/000849.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 1098aee9c1..ea6c328134 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.0.6
+MESA3D_HEADERS_VERSION = 26.1.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index eed4265147..ae95f9cd3a 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-April/000848.html
-sha256  1d3c3b8a8363b8cc354175bb4a684ad8b035211cc1d6fa17aeb9b9623c513f89  mesa-26.0.6.tar.xz
-sha512  7f298234cb7b353ac40dc4d116866115160d1a52de6da8d4f1343af7ed47ca11e1a07b70aad8d24221906e0b520a4c140c12ffa7e7e706e3f25f301842a37e68  mesa-26.0.6.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-May/000849.html
+sha256  a5095e6dc2986c78f0cef4c5555dc803e93b6bfe5670e991f9e8bd49395bae19  mesa-26.1.0.tar.xz
+sha512  02972b1a2e6a2d10fa9c970ab579ddd6f0d3acfb782d82616b91cca7a28dd494b15fb14748fff333b1078898cf990a25666e9122d7fd41cb212a151caf933786  mesa-26.1.0.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index b4179908c3..1eaa4c577e 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.0.6
+MESA3D_VERSION = 26.1.0
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
