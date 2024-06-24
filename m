Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18CBC2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 20:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A10E60B56;
	Mon, 24 Jun 2024 20:03:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H7PlvRRZ2qTc; Mon, 24 Jun 2024 20:03:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A42836100A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A42836100A;
	Mon, 24 Jun 2024 20:03:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 174521BF95D
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79838408E0
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dhD96Y-ebQgk for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CB13408E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CB13408E6
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3395482B64; Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Jun 2024 21:32:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f5226cd6b72a7b47edbc3220b3e1279526c75b31
X-Git-Newrev: 06b5ce9f04123a985e7543d5aadae60e14399401
X-Patchwork-Hint: ignore
Message-Id: <20240624200226.3395482B64@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ffmpeg: update the patches to be
 applied with fuzz 0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=06b5ce9f04123a985e7543d5aadae60e14399401
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit allows the package patches to be applied with fuzz factor 0.
The fuzz factor specifies how many lines of the patch can be inexactly
matched, so the value 0 requires all lines to be exactly matched.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/ffmpeg/0003-libavutil-Fix-mips-build.patch | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/ffmpeg/0003-libavutil-Fix-mips-build.patch b/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
index ee2d1db8bd..a52d7fc347 100644
--- a/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
+++ b/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
@@ -1,4 +1,4 @@
-From 6e8daf0d502a2a822f1f08f42368d7d676dc1a9e Mon Sep 17 00:00:00 2001
+From e9d97f9d29ce57d7a5a62607c2a08e091a06de6e Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd.kuhls@t-online.de>
 Date: Sun, 6 Jun 2021 08:54:53 +0200
 Subject: [PATCH] libavutil: Fix mips build
@@ -11,16 +11,18 @@ Patch sent upstream:
 http://ffmpeg.org/pipermail/ffmpeg-devel/2021-June/281272.html
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  configure            | 2 ++
  libavutil/mips/cpu.c | 6 +++---
  2 files changed, 5 insertions(+), 3 deletions(-)
 
 diff --git a/configure b/configure
-index 6bfd98b384..773a7d516c 100755
+index a89cfa6d959d..6ec00df75312 100755
 --- a/configure
 +++ b/configure
-@@ -2191,6 +2191,7 @@ HEADERS_LIST="
+@@ -2227,6 +2227,7 @@ HEADERS_LIST="
      opencv2_core_core_c_h
      OpenGL_gl3_h
      poll_h
@@ -28,8 +30,8 @@ index 6bfd98b384..773a7d516c 100755
      sys_param_h
      sys_resource_h
      sys_select_h
-@@ -6361,6 +6361,7 @@ check_func_headers VideoToolbox/VTCompressionSession.h VTCompressionSessionPrepa
- check_func_headers VideoToolbox/VTCompressionSession.h VTCompressionSessionPrepareToEncodeFrames -framework VideoToolbox
+@@ -6472,6 +6473,7 @@ check_func_headers VideoToolbox/VTCompressionSession.h VTCompressionSessionPrepa
+ check_func_headers VideoToolbox/VideoToolbox.h VTPixelRotationSessionCreate -framework VideoToolbox
  check_headers windows.h
  check_headers asm/types.h
 +check_headers sys/auxv.h
@@ -37,7 +39,7 @@ index 6bfd98b384..773a7d516c 100755
  # it seems there are versions of clang in some distros that try to use the
  # gcc headers, which explodes for stdatomic
 diff --git a/libavutil/mips/cpu.c b/libavutil/mips/cpu.c
-index 59619d54de..19196de50b 100644
+index 59619d54dee3..19196de50b59 100644
 --- a/libavutil/mips/cpu.c
 +++ b/libavutil/mips/cpu.c
 @@ -19,7 +19,7 @@
@@ -68,5 +70,5 @@ index 59619d54de..19196de50b 100644
          return cpu_flags_cpucfg();
      else
 -- 
-2.29.2
+2.34.1
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
