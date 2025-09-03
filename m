Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C97CA0FF2
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 16:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 569F8422AE;
	Wed,  3 Sep 2025 16:23:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZMoviWzXmaR2; Wed,  3 Sep 2025 16:23:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D50D40D51
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D50D40D51;
	Wed,  3 Sep 2025 16:23:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DC76510E
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D96EA41608
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:23:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aYQ-nAGQuJ_1 for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 16:23:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A2BE41605
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A2BE41605
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:23:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 156D387EA4; Wed,  3 Sep 2025 16:23:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Sep 2025 18:15:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4c282f8ec2bec752ca41f4cfebe3c34f45ffade
X-Git-Newrev: 0eefa1095de0f9b18987ac76979b90a55411dc68
X-Patchwork-Hint: ignore
Message-Id: <20250903162314.156D387EA4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/imagemagick: security bump to
 v7.1.2-3
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

commit: https://git.buildroot.net/buildroot/commit/?id=0eefa1095de0f9b18987ac76979b90a55411dc68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes the following vulnerabilities:
- CVE-2023-5341:
    A heap use-after-free flaw was found in coders/bmp.c in ImageMagick.
    https://www.cve.org/CVERecord?id=CVE-2023-5341

- CVE-2025-55004:
    ImageMagick is free and open-source software used for editing and
    manipulating digital images. Prior to version 7.1.2-1, ImageMagick is
    vulnerable to heap-buffer overflow read around the handling of images
    with separate alpha channels when performing image magnification in
    ReadOneMNGIMage. This can likely be used to leak subsequent memory
    contents into the output image. This issue has been patched in version
    7.1.2-1.
    https://www.cve.org/CVERecord?id=CVE-2025-55004

- CVE-2025-55005:
    ImageMagick is free and open-source software used for editing and
    manipulating digital images. Prior to version 7.1.2-1, when preparing
    to transform from Log to sRGB colorspaces, the logmap construction
    fails to handle cases where the reference-black or reference-white
    value is larger than 1024. This leads to corrupting memory beyond the
    end of the allocated logmap buffer. This issue has been patched in
    version 7.1.2-1.
    https://www.cve.org/CVERecord?id=CVE-2025-55005

- CVE-2025-55160:
    ImageMagick is free and open-source software used for editing and
    manipulating digital images. Prior to versions 6.9.13-27 and 7.1.2-1,
    there is undefined behavior (function-type-mismatch) in splay tree
    cloning callback. This results in a deterministic abort under UBSan
    (DoS in sanitizer builds), with no crash in a non-sanitized build.
    This issue has been patched in versions 6.9.13-27 and 7.1.2-1.
    https://www.cve.org/CVERecord?id=CVE-2025-55160

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 2983b511cc..f260a0e0fb 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ceb972266b23dc7c1cfce0da5a7f0c9acfb4dc81f40eb542a49476fedbc2618f  imagemagick-7.1.1-43.tar.gz
+sha256  b16415e8694a2e15e5282d64fc7b358f309ff3a514a90eb5da268676c772de3d  imagemagick-7.1.2-3.tar.gz
 sha256  a556c5292c87c9a6ac795c80669b0c3660f9f729de8c476bf2b10f83ab1b34ec  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 6bbda40396..30cacc7f1a 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.1.1-43
+IMAGEMAGICK_VERSION = 7.1.2-3
 IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
