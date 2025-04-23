Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B529C369CB
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 19:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F937612B2;
	Wed, 23 Apr 2025 19:24:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oKL62RA7eBzE; Wed, 23 Apr 2025 19:24:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8120612AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8120612AD;
	Wed, 23 Apr 2025 19:24:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C2C901BC
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D77D41275
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:24:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BRGXjkrlT2fS for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 19:24:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68F0241276
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68F0241276
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:24:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 529D686230; Wed, 23 Apr 2025 19:24:03 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 23 Apr 2025 21:21:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e7a00fd93a09bbb1adb91e03e1e9ca3a8acec600
X-Git-Newrev: 055547ff126fb359d94c5c0d8e838320deff84f2
X-Patchwork-Hint: ignore
Message-Id: <20250423192403.529D686230@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/graphicsmagick: security bump to
 version 1.3.45
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=055547ff126fb359d94c5c0d8e838320deff84f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

1.3.44 added the following security fixes:

* TIFF: Fixed multiple heap and stack buffer overflows (directed by
  the source EXIF profile) while writing EXIF into the native TIFF
  IFD.

* FITS: Fix problem that the FITS reader could return invalid image
  frames with rows or columns set to zero. Other code in the library
  crashes, or even asserts, if invalid image frames with rows or
  columns set to zero are returned.

* Coverity fixes: Various fixes for Coverity issues raised after the
  update to version 2023.12.2.

* Clang Analyzer (scan-build) fixes: Various fixes for new issues
  discovered by Clang Analyzer.

https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/7046c344273c263a9b6e4901b910508aea3804b5

In addition 1.3.45 fixes a off-by-one issue introduced in 1.3.44:
https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/96f765a2e3cebf0b70094da34d03b73c50c3aa63

Update the Copyright.txt hash for a change in copyright years:
https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/f0bba104ee3859286ea8adfc2ff603fd64be5624
https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/26fce892769e4a26247dd2db5b8dc0719ce20953

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/graphicsmagick/graphicsmagick.hash | 4 ++--
 package/graphicsmagick/graphicsmagick.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/graphicsmagick/graphicsmagick.hash b/package/graphicsmagick/graphicsmagick.hash
index a894aedf11..044214c8fc 100644
--- a/package/graphicsmagick/graphicsmagick.hash
+++ b/package/graphicsmagick/graphicsmagick.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  97dc1a9d4e89c77b25a3b24505e7ff1653b88f9bfe31f189ce10804b8efa7746  GraphicsMagick-1.3.40.tar.xz
-sha256  0a20e661de942ebe115a354d0ec6d1d42b93856ea765f813f350a5ce5024cdb7  Copyright.txt
+sha256  dcea5167414f7c805557de2d7a47a9b3147bcbf617b91f5f0f4afe5e6543026b  GraphicsMagick-1.3.45.tar.xz
+sha256  27d121f97ad71ff506ac5a6a9539e969154f3a66f3da24fd5b6f268acd106295  Copyright.txt
diff --git a/package/graphicsmagick/graphicsmagick.mk b/package/graphicsmagick/graphicsmagick.mk
index 76b826ceef..baaa9bcb02 100644
--- a/package/graphicsmagick/graphicsmagick.mk
+++ b/package/graphicsmagick/graphicsmagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRAPHICSMAGICK_VERSION = 1.3.40
+GRAPHICSMAGICK_VERSION = 1.3.45
 GRAPHICSMAGICK_SOURCE = GraphicsMagick-$(GRAPHICSMAGICK_VERSION).tar.xz
 GRAPHICSMAGICK_SITE = https://downloads.sourceforge.net/project/graphicsmagick/graphicsmagick/$(GRAPHICSMAGICK_VERSION)
 GRAPHICSMAGICK_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
