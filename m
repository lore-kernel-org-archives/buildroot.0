Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28A9C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F8DB60F54;
	Mon, 15 Aug 2022 09:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F8DB60F54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kgaCCGZ6Hvxz; Mon, 15 Aug 2022 09:18:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C76B460EDB;
	Mon, 15 Aug 2022 09:18:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C76B460EDB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F54F1BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2842416B4
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2842416B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qbjrJPzMmcGq for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:17:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 209AF41619
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 209AF41619
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 28AF4875A8; Mon, 15 Aug 2022 09:02:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 11:03:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e07fcf80bc5347075629b222402ad29008de64b7
X-Git-Newrev: 587d69236c0f93533ed32b15031677cd7b93379c
X-Patchwork-Hint: ignore
Message-Id: <20220815090238.28AF4875A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvncserver: fix typo on BR2_nios2
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

commit: https://git.buildroot.net/buildroot/commit/?id=587d69236c0f93533ed32b15031677cd7b93379c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
