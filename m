Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF80C3DA4A
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 20:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E1C78114A;
	Mon,  5 Aug 2024 20:41:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nCQ9nTTrH1BS; Mon,  5 Aug 2024 20:40:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D65108115C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D65108115C;
	Mon,  5 Aug 2024 20:40:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A5D81BF335
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 20:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48946402C3
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 20:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dXppmIDQoBNJ for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 20:40:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12C5A40096
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12C5A40096
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 20:40:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0078284529; Mon,  5 Aug 2024 20:40:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Aug 2024 22:32:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 761259c93400bc806611a242c7dc3df7ff67c231
X-Git-Newrev: baf5a1f0da5cd0deaca214d8ced77b5a1937626c
X-Patchwork-Hint: ignore
Message-Id: <20240805204051.0078284529@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ffmpeg: bump version to 6.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=baf5a1f0da5cd0deaca214d8ced77b5a1937626c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebased patch 0003.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ffmpeg/0003-libavutil-Fix-mips-build.patch | 5 +++--
 package/ffmpeg/ffmpeg.hash                         | 2 +-
 package/ffmpeg/ffmpeg.mk                           | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/ffmpeg/0003-libavutil-Fix-mips-build.patch b/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
index a52d7fc347..aeb272c459 100644
--- a/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
+++ b/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
@@ -10,7 +10,8 @@ Fixes https://trac.ffmpeg.org/ticket/9138
 Patch sent upstream:
 http://ffmpeg.org/pipermail/ffmpeg-devel/2021-June/281272.html
 
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Bernd: rebased for version 6.1.2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 [Dario: make the patch to be applied with fuzz factor 0]
 Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
@@ -23,9 +24,9 @@ index a89cfa6d959d..6ec00df75312 100755
 --- a/configure
 +++ b/configure
 @@ -2227,6 +2227,7 @@ HEADERS_LIST="
-     opencv2_core_core_c_h
      OpenGL_gl3_h
      poll_h
+     pthread_np_h
 +    sys_auxv_h
      sys_param_h
      sys_resource_h
diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index f70ff5da83..630bd70c56 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968  ffmpeg-6.1.1.tar.xz
+sha256  3b624649725ecdc565c903ca6643d41f33bd49239922e45c9b1442c63dca4e38  ffmpeg-6.1.2.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256  b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
 sha256  cb48bf09a11f5fb576cddb0431c8f5ed0a60157a9ec942adffc13907cbe083f2  LICENSE.md
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 5b2d33883d..19c270a14b 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 6.1.1
+FFMPEG_VERSION = 6.1.2
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = https://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
