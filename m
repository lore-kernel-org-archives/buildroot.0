Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC15D43370
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E78B8405A;
	Fri, 12 Dec 2025 07:58:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DNUZU8Vhb5ph; Fri, 12 Dec 2025 07:58:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B45E83EBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526259;
	bh=4scMqWrFlIljvebktomVNSP+emmaEno6D7zcy3AZVXo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=s2+kZCt7IeB1IiC1y9VTt/ZhahiBpPlU1XNR8ByV/NuaO9xqmh850TidZ7ZC1YIuG
	 yhq6/JXhVG+rggj4M8Des6/Etlt8e+tf0m49Jv1qPDv9rlQmBe67/0e1xRIS93edwM
	 HeoQ6w9L8kJcRBOyb6Ec63fDjE2BW6zHw7d066B5b9Zgth1iolWdQO8gi38YaS6d8E
	 rA/207Ba3yV1laPSLTlC3SdXSksMuZPdl26WzN+oDJ6nhGPUntNCU6etIk/ZbfL1Uj
	 8I603He4tjTXVJQFpkV0GgFsEgAoC0Irw7Kn2hxGOz4C8gfXnZiPxDa+evI51ndWK4
	 wnPjAxFHjaGRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B45E83EBA;
	Fri, 12 Dec 2025 07:57:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 545D8E7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E28A41109
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VZAbbr5FhnWn for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1231841146
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1231841146
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1153285C4C; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Dec 2025 22:45:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 251063eca0a74a9bb57217748e13f7bab7badecb
X-Git-Newrev: a805d5b9056597fa4c1f69c01d4e7d76c76cd414
X-Patchwork-Hint: ignore
Message-Id: <20251212075537.1153285C4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 25.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=a805d5b9056597fa4c1f69c01d4e7d76c76cd414
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2025-December/000829.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 662683f944..39564b6af3 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 25.3.0
+MESA3D_HEADERS_VERSION = 25.3.1
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index e642273d67..4bfc1d4584 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://gitlab.freedesktop.org/mesa/mesa/-/blob/25.3/docs/relnotes/25.3.0.rst?ref_type=heads
-sha256  0fd54fea7dbbddb154df05ac752b18621f26d97e27863db3be951417c6abe8ae  mesa-25.3.0.tar.xz
-sha512  46df9e5e27f9a36cf893a68ad4a465fcc6efe1bcb46ad8d4b015699ad1a11e582b8d41f4157326556af603fe454b2ff34ecc17a0c742b5fd9ce5f0097106fec5  mesa-25.3.0.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2025-December/000829.html
+sha256  059d0d985622f49588f01aa29152804f4da8ffe6add046e00a52923379c2d8da  mesa-25.3.1.tar.xz
+sha512  7e2f7295f1f4df129935b60d75c890f6ae585ecc511f69f55a61826df5f2434ffdb4109c632af9842a986bf9beed430a0404d377e8335b71fa36682bd10533ba  mesa-25.3.1.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 3d2f85240b..6fcbf96c80 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 25.3.0
+MESA3D_VERSION = 25.3.1
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
