Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A38CCD6E51
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 06:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32A2760F74;
	Sun, 31 May 2026 06:06:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1l547LvUwYcp; Sun, 31 May 2026 06:06:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FF5D60F7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780207600;
	bh=BgrcJcNEYCzuSP2fw5WGatGVkx2x3dIsvdguOmxe95w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=R+uhbkF8R4uzKztj5HUn+mFjt9LiqVfBSbzGQIcACqSboxSyruaBefWX4Yx84/DgB
	 hgogosO0Ask8l3KUmVb7RCeJzbBraIUng6fs80QatNWAeC1NVx2I9I+JttEa1HGsDM
	 oidF3Kbjs9NJzpOozPvu254rwiLX/U343fslQT18D8DqpecwRsFbA4MmhzANsjos28
	 vQZz16vv5oouOi8CagIRjiJysR60tCwnTziH0UHRBIa0+/niuTGKa5lmM/8u851STP
	 vxEvjmmFVR+2+pvx32Nb4DMblZs+NHS0xb8Fqq7jkCObVnflSOEcpd5BFSUU/1YvNU
	 ExuFGmsxbNn+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FF5D60F7D;
	Sun, 31 May 2026 06:06:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CEEA7257
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B477E402BC
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wN0-P73474Lr for <buildroot@buildroot.org>;
 Sun, 31 May 2026 06:06:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E938B400C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E938B400C4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:06:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A42C80798; Sun, 31 May 2026 06:06:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 08:06:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd1430b39f7f796e663881599439ea192c8fc432
X-Git-Newrev: 77697100875b525d247d93c5b344f127664c1f6b
X-Patchwork-Hint: ignore
Message-Id: <20260531060624.8A42C80798@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl2_image: security bump to
 version 2.8.12
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/77697100875b525d247d93c5b344f127664c1f6b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes the following security issue (in 2.8.10):

CVE-2026-35444: Heap buffer overflow READ via unchecked colormap index in
XCF loader

https://github.com/libsdl-org/SDL_image/security/advisories/GHSA-gq8w-x74c-h6p7

In addition, 2.8.12 includes a number of memory related bugfixes:

Fixed memory overflow with corrupt LBM image
Fixed crash when decoding an invalid XCF image
Fixed out of bound read in GIF decoder

Update hash of license file for change of copyright year with:
https://github.com/libsdl-org/SDL_image/commit/281b4ebcb02b106995a0c7fc21f689c160d3fefd

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdl2_image/sdl2_image.hash | 4 ++--
 package/sdl2_image/sdl2_image.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl2_image/sdl2_image.hash b/package/sdl2_image/sdl2_image.hash
index 9d5ae395cd..16b78fea11 100644
--- a/package/sdl2_image/sdl2_image.hash
+++ b/package/sdl2_image/sdl2_image.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f7c06a8783952cfe960adccdd3d8472b63ab31475b4390d10cfdcc1aea61238f  SDL2_image-2.8.4.tar.gz
-sha256  a0e8ce06504966e45088ee1cc7583cc8af9aac615d4cf56d47d847da9cb15139  LICENSE.txt
+sha256  393f5efb50536ec13ca4f4affb69cc9966d3c3f969e6c5e701faddf9f9785381  SDL2_image-2.8.12.tar.gz
+sha256  7826eca0a0f7e591f38dd844e207a200aac81a59b20d8a30c3af8c6282af13e6  LICENSE.txt
diff --git a/package/sdl2_image/sdl2_image.mk b/package/sdl2_image/sdl2_image.mk
index e058cd9f74..b31afa0f08 100644
--- a/package/sdl2_image/sdl2_image.mk
+++ b/package/sdl2_image/sdl2_image.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_IMAGE_VERSION = 2.8.4
+SDL2_IMAGE_VERSION = 2.8.12
 SDL2_IMAGE_SOURCE = SDL2_image-$(SDL2_IMAGE_VERSION).tar.gz
 SDL2_IMAGE_SITE = http://www.libsdl.org/projects/SDL_image/release
 SDL2_IMAGE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
