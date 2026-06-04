Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B98CCD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E303C60B70;
	Fri,  5 Jun 2026 12:39:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xDamzbaGUd2t; Fri,  5 Jun 2026 12:39:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A87F60BB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663142;
	bh=8A38DwT9sCO+oolMU6jPItCU7O207KVHHUst3QRCd6w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aeWMbm9OHRb6GWao9fu6mud3vSG81gaAEJ3gYlhPISOqtZz5bLPdw1gob9tXDt/ZL
	 RIcs+w8cQh63f8ow1C15IXULZgLmtcFA5odkoHiDbwpRadd2EsR4NfshQS3NcSoOwz
	 t0h7N94G5L7Q0htvRdmYDVM+10NuzGRWYeJ6LvhKoURJ7tgQpFYLWvJFyucU1sXCaD
	 Vi5jVcnjGkFNn3crYkqQ3AqIIqPmXWPa91UXEjXcZRh2/9kDumeUyGzHmX6ejZuNja
	 u50s7Y8YP4DTFEmPjhKPRYRmsNcUyLdw/9c67Kq9wnFqLRD71BKViCwOaNz2TNV92P
	 L46mcjNlvOZQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A87F60BB5;
	Fri,  5 Jun 2026 12:39:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EBBFF4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0DE381ECD
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6WwjU6Zxt87v for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0747981E4C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0747981E4C
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 31CA187B3B; Fri,  5 Jun 2026 12:37:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:34:48 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0ccaae26621e963e92ed1ad0d599caa357308d90
X-Git-Newrev: adec6e4f9c39a439a21bd94c7c7f8296a6405e2a
X-Patchwork-Hint: ignore
Message-Id: <20260605123714.31CA187B3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/sdl2_image:
 security bump to version 2.8.12
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/adec6e4f9c39a439a21bd94c7c7f8296a6405e2a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
(cherry picked from commit 77697100875b525d247d93c5b344f127664c1f6b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
