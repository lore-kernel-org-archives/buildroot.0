Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BE3C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FF0983EC7;
	Mon, 15 Aug 2022 09:19:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FF0983EC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MxKgqySBRw0h; Mon, 15 Aug 2022 09:19:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F10383EC4;
	Mon, 15 Aug 2022 09:19:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F10383EC4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1CE5F1BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D424A415FF
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D424A415FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gKxUNfKMm-bL for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:17:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB2AE416B1
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB2AE416B1
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E34D9875AC; Mon, 15 Aug 2022 09:02:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 11:04:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b24ba50ab1e9b080900b0f24a329e222904ce370
X-Git-Newrev: 6ddff6d76043e47ea6104debb601438b8a7e7078
X-Patchwork-Hint: ignore
Message-Id: <20220815090238.E34D9875AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server: drop
 bogus BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ddff6d76043e47ea6104debb601438b8a7e7078
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit '09729b5e63 xserver_xorg-server: bump version, improve option
support' from 2010 removed the symbol but forgot to drop references to
it.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xserver_xorg-server/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index daf4d81702..865917c4ec 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -12,9 +12,9 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_LIBSHA1 if (!BR2_PACKAGE_OPENSSL && !BR2_PACKAGE_LIBGCRYPT)
 	select BR2_PACKAGE_MCOOKIE
 	select BR2_PACKAGE_PIXMAN
-	select BR2_PACKAGE_XFONT_FONT_ALIAS if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
-	select BR2_PACKAGE_XFONT_FONT_MISC_MISC if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
-	select BR2_PACKAGE_XFONT_FONT_CURSOR_MISC if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
+	select BR2_PACKAGE_XFONT_FONT_ALIAS
+	select BR2_PACKAGE_XFONT_FONT_MISC_MISC
+	select BR2_PACKAGE_XFONT_FONT_CURSOR_MISC
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXAU
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
