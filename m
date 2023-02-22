Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 094AFC61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 16:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B13CC416BD;
	Wed, 22 Feb 2023 16:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B13CC416BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qq-v9EAJcSxi; Wed, 22 Feb 2023 16:12:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C73F6416DF;
	Wed, 22 Feb 2023 16:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C73F6416DF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 05D801BF97C
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB70B416D2
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:10:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB70B416D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TMj3P_hiPpMa for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 16:10:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8879416A2
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 16:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8879416A2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B53478675F; Wed, 22 Feb 2023 16:10:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 17:07:19 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 42743a9503e83365ffa7b57f4423527cf2b672eb
X-Git-Newrev: d981ed04c8359db048730ca1acd7b68e69b19616
X-Patchwork-Hint: ignore
Message-Id: <20230222161022.B53478675F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] Config.in.legacy: fix
 typo on BR2_PACKAGE_MEDIAART_BACKEND_QT
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

commit: https://git.buildroot.net/buildroot/commit/?id=d981ed04c8359db048730ca1acd7b68e69b19616
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

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
(cherry picked from commit 316e149611a761db04171ee6141048d9057183c8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 896e75a9d6..98861137d2 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -2608,7 +2608,7 @@ config BR2_PACKAGE_MEDIAART_BACKEND_GDK_PIXBUF
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
