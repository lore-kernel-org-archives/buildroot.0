Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B2DC25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38A0841E40;
	Thu,  9 May 2024 16:32:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1zKdfjyELJBv; Thu,  9 May 2024 16:32:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7C3441E57
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7C3441E57;
	Thu,  9 May 2024 16:32:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D4B021BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE75E83EC1
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:32:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id srFSDwpCjpQ0 for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:32:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A1D483EBC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A1D483EBC
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:32:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 026F086CAE; Thu,  9 May 2024 16:32:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 18:31:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5649202ddccdbc4d6e2a6aca8330c0846d9cd999
X-Git-Newrev: 0c9ea82ea805fe00ca69836b0ca785af2728ec08
X-Patchwork-Hint: ignore
Message-Id: <20240509163227.026F086CAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/imagemagick: bump to version
 7.1.1-31
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c9ea82ea805fe00ca69836b0ca785af2728ec08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see [1].

License hash file changed, due to the addition of an URL. See [2].

Fixes: [3]

Some 32 bit architectures were failing at runtime with the message:

    FATAL: time limit exceeded 'file.png' @ fatal/cache.c/GetImagePixelCache/1702

The fix is included in 7.1.1-23.

[1] https://github.com/ImageMagick/Website/blob/main/ChangeLog.md
[2] https://github.com/ImageMagick/ImageMagick/commit/2c87d7da1b1db4573a37bd7933dfbf772ac3eecf
[3] https://github.com/ImageMagick/ImageMagick/issues/6891

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/imagemagick/imagemagick.hash | 4 ++--
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index fd80316ec5..30a12220dd 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  09402e5f17c6575ef9f010bb2e21ae1710f1f3426f115ad4317ee9129c32608e  imagemagick-7.1.1-21.tar.gz
-sha256  8cceeb67d4e783cb63075c7311fdb990fa0369ee80fbd0f481064cd02386ca2d  LICENSE
+sha256  c82210ea3fdbd044b656ba3d5b42df1da9a18e78fc0e500169bad70d3b0d9ba3  imagemagick-7.1.1-31.tar.gz
+sha256  a556c5292c87c9a6ac795c80669b0c3660f9f729de8c476bf2b10f83ab1b34ec  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 53cf02abf4..b2d3e755a6 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.1.1-21
+IMAGEMAGICK_VERSION = 7.1.1-31
 IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
