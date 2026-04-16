Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FF6F8D777
	for <buildroot@archiver.kernel.org>; Thu, 16 Apr 2026 20:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 858C5405F1;
	Thu, 16 Apr 2026 20:35:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QmBMZD9MWYTh; Thu, 16 Apr 2026 20:35:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2203405F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776371701;
	bh=M4GUBs1+yiLoX6c3iauVsFxcq2udrpbEVBdBMxCd8fU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OIZsG2gjCCH5/NsfUSvb+oUQCw+iZns9dR8fy91MfWltzoKyoIqtWMIgP8Fi1UgIc
	 AP17W3YWVyAa32fUV/7nWKB8J7yQLkliFOkOYU4Cs04VZ4qgH2QAdkJVFRi+69nmY3
	 WyXzHVMyNkQEBo0ToXR6jDX53zkZPSe2wU9os697cA4VUbJhgaHqKl4B4drDcmrPSG
	 2Yfri0aIEbmnvOGC5UwVR/I54CETZlDjHy7GvrrLh1GTueuiJjGhDQvQdqi6+k85Vq
	 Ve44s6uY1/FqbzHtqSCxuG7abbq/lCQanau2O2JxKempFvXub1tcg7LBKmHaUOw2XP
	 rIWmUKfSCkCpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2203405F3;
	Thu, 16 Apr 2026 20:35:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CB3982F4
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 20:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADAF880820
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 20:34:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qTsjgnzxnrA8 for <buildroot@buildroot.org>;
 Thu, 16 Apr 2026 20:34:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8938580816
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8938580816
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 20:34:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25D9C817FF; Thu, 16 Apr 2026 20:34:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 16 Apr 2026 22:26:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 746d57946803a2f952cc08505159e19f135bd628
X-Git-Newrev: 8e00cf503494d42d02260fbbaa6f174e8deb3a6f
X-Patchwork-Hint: ignore
Message-Id: <20260416203457.25D9C817FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 26.0.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8e00cf503494d42d02260fbbaa6f174e8deb3a6f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.freedesktop.org/archives/mesa-announce/2026-April/000845.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 3fe82e9ba5..01883a8ce1 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.0.4
+MESA3D_HEADERS_VERSION = 26.0.5
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 9a56e54406..f486734cd5 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-April/000843.html
-sha256  6d91541e086f29bb003602d2c81070f2be4c0693a90b181ca91e46fa3953fe78  mesa-26.0.4.tar.xz
-sha512  ddb59df633116a7ccd9d2d3a2e2009945909e3f774956efcbc032a2f963641cce50d0f319bebdc041df17700aa827aa2ccbc61c9e40b4020de9ff027eab27e23  mesa-26.0.4.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-April/000845.html
+sha256  d229c9937d9a25ca0a8958c59f425174563d300ec42acbea2dbe84a055023368  mesa-26.0.5.tar.xz
+sha512  8aa03a46269b2443be15cbd516d523af78fdd35e5273f5346b9142d2d21e245f6d5fd47e7e90176b0444ea967540eaa7c62d217f599ca5a216ef83244ee97d5c  mesa-26.0.5.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 79f063d7e3..fb5499de81 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.0.4
+MESA3D_VERSION = 26.0.5
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
