Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99C9106ACE9
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 20:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADAAB80D1C;
	Thu, 12 Mar 2026 20:26:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FIsAlaY3KNdD; Thu, 12 Mar 2026 20:26:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1A6580D1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773347176;
	bh=bQhJTJkOcP6wVFfQomGyfCnZBg+p1CsBmJ/AgOs7d6k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mkCYsiOpOwHghlUiOJw9suh60nDnsgpKO2PKdwutsqEbYPfrEYgVuyGinCaGvNFpr
	 WmaAdOqnSe55KZ6VtSMRbm/Ngjzt64LOS6r+wlRycdukPHFPGTQbWZxJd99A2Ywyyp
	 dyhvNDnGUZlfFQfYjHxcjrwyLbWHdV14IPRc/Z4SqxHZ65c1NMlHaov8c9rW30Md5D
	 CkRgh5xyiUXBUTtX7Y0jbLVrl7TgHKEkiLwL07FcVvEZmmNVw1teoh1K2n6pY2JjDS
	 6c0WkI8Er+SIvYj13moXwPbBGvcp5gxXUK0BE491MklUrOOlDmk5x7rV5nA01/fblb
	 jle8FshgcoyGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1A6580D1F;
	Thu, 12 Mar 2026 20:26:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C881F282
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 20:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA90580D1F
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 20:26:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W9cXGloWGLMV for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 20:26:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F10DA80D1C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F10DA80D1C
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 20:26:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 20B4887620; Thu, 12 Mar 2026 20:26:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Mar 2026 21:19:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6fa96c2dd840012009a469229b06190ec47dffcf
X-Git-Newrev: 2da1ccab3444a723dc6e3820890e193f9550dc95
X-Patchwork-Hint: ignore
Message-Id: <20260312202615.20B4887620@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 26.0.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2da1ccab3444a723dc6e3820890e193f9550dc95
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.freedesktop.org/archives/mesa-announce/2026-March/000841.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index b9acabe325..34555c05ea 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.0.1
+MESA3D_HEADERS_VERSION = 26.0.2
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 898d1c6897..7cdaee7e79 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-February/000840.html
-sha256  bb5104f9f9a46c9b5175c24e601e0ef1ab44ce2d0fdbe81548b59adc8b385dcc  mesa-26.0.1.tar.xz
-sha512  d47072257035acfa8a5594c0cda831b4e5178169dea8a06c6657268a441e32271f8798486e837cea23f35ce3f0b4b9520a4ea4ed26b0e1267b02da4c649bc9f9  mesa-26.0.1.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-March/000841.html
+sha256  973f535221be211c6363842b4cce9ef8e9b3e1d5ea86c5450ca86060163c7346  mesa-26.0.2.tar.xz
+sha512  0a7b9fc9b09e40345cc22d246dc1656900d74754c093882f6a39623af17fddc5f4a0c7938207c784ccf7306c5ed497be6a02c36f95c6548e01a2faa085e04c35  mesa-26.0.2.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 54e8ea4081..e9f5419e4f 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.0.1
+MESA3D_VERSION = 26.0.2
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
