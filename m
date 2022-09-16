Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D186C54EE9
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 11:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF5D483F9F;
	Fri, 16 Sep 2022 11:56:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF5D483F9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pSdUHFrmYhh0; Fri, 16 Sep 2022 11:56:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21B3083F71;
	Fri, 16 Sep 2022 11:56:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21B3083F71
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB3EF1BF2B9
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42F5E842A9
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:47:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42F5E842A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bvUJiMhrr36c for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 11:47:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B90C842BF
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 11:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B90C842BF
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2962883CC2; Fri, 16 Sep 2022 11:47:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 12:19:12 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: e965d938dbbd00de5ca4a1a54631098bc3c32288
X-Git-Newrev: a351bf7ab6b820ec64fd87ab6a103359da79917e
X-Patchwork-Hint: ignore
Message-Id: <20220916114714.2962883CC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/libvncserver: fix
 typo on BR2_nios2
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

commit: https://git.buildroot.net/buildroot/commit/?id=a351bf7ab6b820ec64fd87ab6a103359da79917e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

From time to time we have a reference added to the inexistent BR2_nios:
$ git log --oneline -G'BR2_nios\>'
726dcc6eee package/libvncserver: needs dynamic library
8cd840b7e8 package/ffmpeg: fix typo "nios" -> "nios2"
bd2544d3d3 package/ffmpeg: simplify BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS logic
de7523259b libplayer: fix typo on BR2_nios2
615d65d3c6 mplayer: add missing reverse dependencies for nios2 and sh2a

Fix the last commit, from 2019, like it was done before.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 587d69236c0f93533ed32b15031677cd7b93379c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvncserver/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libvncserver/Config.in b/package/libvncserver/Config.in
index 6189b379d2..f284894555 100644
--- a/package/libvncserver/Config.in
+++ b/package/libvncserver/Config.in
@@ -27,5 +27,5 @@ endif
 
 comment "libvncserver needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_nios
+	depends on !BR2_nios2
 	depends on BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
