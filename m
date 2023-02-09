Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F1DC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3DB47034C;
	Tue, 21 Feb 2023 02:18:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3DB47034C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nwxwS7XiQdOF; Tue, 21 Feb 2023 02:18:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF2D170206;
	Tue, 21 Feb 2023 02:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF2D170206
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 457C31BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0745417CD
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0745417CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id thHPitFJOboX for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1230F417FF
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1230F417FF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F05286495; Mon, 20 Feb 2023 20:52:57 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 9 Feb 2023 21:51:47 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8cee8fb37c6ad0164d3f7bad8cfd0f812592ad6c
X-Git-Newrev: e2fd606b91784ced64c7312e02fcbf95f3e736d6
X-Patchwork-Hint: ignore
Message-Id: <20230220205257.0F05286495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ply: add dependency on
 Linux headers >= 5.5
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e2fd606b91784ced64c7312e02fcbf95f3e736d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Version 2.3.0 of ply now requires Linux headers >= 5.5

This was missing in commit b9612601b037e6deb79af300e64e0557dda1be5c
("package/ply: bump to version 2.3.0")

Fixes:

  http://autobuild.buildroot.net/results/ce37039991cb0fb02b97d341d78327e54d0e1d26
  http://autobuild.buildroot.net/results/c00714847ae92dd609bc8990df318bee58be38b8
  http://autobuild.buildroot.net/results/8210bd2b9c67d6d7616ada525019b2658195416a

Signed-off-by: Andreas Klinger <ak@it-klinger.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/ply/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ply/Config.in b/package/ply/Config.in
index 0500e7883f..f7507095c1 100644
--- a/package/ply/Config.in
+++ b/package/ply/Config.in
@@ -5,16 +5,16 @@ config BR2_PACKAGE_PLY_ARCH_SUPPORTS
 	default y if BR2_powerpc
 	default y if BR2_x86_64
 
-comment "ply needs a toolchain w/ dynamic library, headers >= 4.14"
+comment "ply needs a toolchain w/ dynamic library, headers >= 5.5"
 	depends on BR2_PACKAGE_PLY_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5 || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_PLY
 	bool "ply"
 	depends on BR2_PACKAGE_PLY_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 # BPF_JLT
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5 # BPF_JLT
 	depends on !BR2_STATIC_LIBS
 	help
 	  ply is a light-weight dynamic tracer for Linux. By means of
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
