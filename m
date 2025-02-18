Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7281BC02198
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 09:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCD1240BB0;
	Tue, 18 Feb 2025 09:05:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jSdcWCZUMCAa; Tue, 18 Feb 2025 09:05:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA991408EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA991408EC;
	Tue, 18 Feb 2025 09:05:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DF54E05
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 09:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 080484027D
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 09:05:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CduMT3QS9Bof for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 09:05:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13C51400FD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13C51400FD
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 09:05:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F39F3877B7; Tue, 18 Feb 2025 09:05:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 18 Feb 2025 10:01:28 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 877ddbd1d287bf2234d97fb6b9006a669ffb7c67
X-Git-Newrev: d572e03e262f27e0c0d0dcb5308314967746e105
X-Patchwork-Hint: ignore
Message-Id: <20250218090527.F39F3877B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/imagemagick: bump
 to version 7.1.1-43
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

commit: https://git.buildroot.net/buildroot/commit/?id=d572e03e262f27e0c0d0dcb5308314967746e105
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

For various bugfixes.  Notice that 7.1.1-36 fixed a security vulnerability
(CVE-2024-41817), but that issue is specific to the AppImage version:

https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-8rxc-922v-phg8

Release notes:
https://github.com/ImageMagick/ImageMagick/releases/tag/7.1.1-43

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b5ff38782cf8f1dbc1fd9585f49affdfb14833e8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 30a12220dd..2983b511cc 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c82210ea3fdbd044b656ba3d5b42df1da9a18e78fc0e500169bad70d3b0d9ba3  imagemagick-7.1.1-31.tar.gz
+sha256  ceb972266b23dc7c1cfce0da5a7f0c9acfb4dc81f40eb542a49476fedbc2618f  imagemagick-7.1.1-43.tar.gz
 sha256  a556c5292c87c9a6ac795c80669b0c3660f9f729de8c476bf2b10f83ab1b34ec  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index b2d3e755a6..6bbda40396 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.1.1-31
+IMAGEMAGICK_VERSION = 7.1.1-43
 IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
