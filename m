Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08635C4708E
	for <buildroot@archiver.kernel.org>; Tue,  3 Jan 2023 20:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93CA560F93;
	Tue,  3 Jan 2023 20:20:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93CA560F93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id moHwCc_uLMmS; Tue,  3 Jan 2023 20:20:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E139960F94;
	Tue,  3 Jan 2023 20:20:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E139960F94
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E55C71BF94D
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 20:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFB5D40891
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 20:19:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFB5D40891
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OqUJLYRrirV2 for <buildroot@lists.busybox.net>;
 Tue,  3 Jan 2023 20:19:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A20140882
 for <buildroot@buildroot.org>; Tue,  3 Jan 2023 20:19:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A20140882
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8395B8732E; Tue,  3 Jan 2023 20:19:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 3 Jan 2023 20:50:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e59365629f882eb3e4ea012ab2cd396bc3d8a4fe
X-Git-Newrev: 791b530368bee8894fb5c48351846609f97ee9e5
X-Patchwork-Hint: ignore
Message-Id: <20230103201951.8395B8732E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ncurses: Fix homepage in Config.in
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

commit: https://git.buildroot.net/buildroot/commit/?id=791b530368bee8894fb5c48351846609f97ee9e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The homepage listed in package/ncurses/Config.in is now incorrect, and
redirects to https://invisible-island.net/ncurses/, so just use that
instead.

Signed-off-by: Dennis Van Hoorick <dennis.vanhoorick@barco.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ncurses/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ncurses/Config.in b/package/ncurses/Config.in
index 9f7753b06a..c0086cbbe3 100644
--- a/package/ncurses/Config.in
+++ b/package/ncurses/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_NCURSES
 
 	  This package installs only a few vital termcap entries
 
-	  http://www.gnu.org/software/ncurses/
+	  https://invisible-island.net/ncurses/
 
 if BR2_PACKAGE_NCURSES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
