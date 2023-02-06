Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BD7C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E8C54EF52;
	Tue, 21 Feb 2023 00:10:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E8C54EF52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rf58oxV9uKTj; Tue, 21 Feb 2023 00:10:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18C7E4F061;
	Tue, 21 Feb 2023 00:10:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18C7E4F061
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 539141BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 089C3417AF
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 089C3417AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EyYen0xf9P2U for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43A344159F
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43A344159F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40F898648F; Mon, 20 Feb 2023 20:52:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 11:24:31 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6a9feaabbce4f21dd2a688d35a5027cb0e2a7a22
X-Git-Newrev: 316e149611a761db04171ee6141048d9057183c8
X-Patchwork-Hint: ignore
Message-Id: <20230220205248.40F898648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Config.in.legacy: fix typo on
 BR2_PACKAGE_MEDIAART_BACKEND_QT
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

commit: https://git.buildroot.net/buildroot/commit/?id=316e149611a761db04171ee6141048d9057183c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Currently using this minimal .config:
 BR2_PACKAGE_MEDIAART_BACKEND_GDK_PIXBUF=y
triggers:
     *** Legacy options removed in 2018.05 ***
 [ ] libmediaart none backend option renamed (NEW)
 [*] libmediaart gdk-pixbuf backend option renamed
 [*] libmediaart qt backend option renamed

Commit "8553b39887 libmediaart: rename options to have proper prefix",
part of the 2018.05 release had a copy&paste error.

As stated in the beginning of the file:
 The oldest symbols will be removed again after about two years.
But while we carry these legacy symbols, let's fix the typo.

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4d82a54208..e5cfcea8fa 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -2700,7 +2700,7 @@ config BR2_PACKAGE_MEDIAART_BACKEND_GDK_PIXBUF
 	  BR2_PACKAGE_MEDIAART_BACKEND_GDK_PIXBUF has been renamed to
 	  BR2_PACKAGE_LIBMEDIAART_BACKEND_GDK_PIXBUF
 
-config BR2_PACKAGE_MEDIAART_BACKEND_GDK_PIXBUF
+config BR2_PACKAGE_MEDIAART_BACKEND_QT
 	bool "libmediaart qt backend option renamed"
 	select BR2_LEGACY
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
