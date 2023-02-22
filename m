Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7320EC636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 16:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1DFAC416DD;
	Wed, 22 Feb 2023 16:12:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DFAC416DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qlQ8Wvb45y_U; Wed, 22 Feb 2023 16:12:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B671416F9;
	Wed, 22 Feb 2023 16:12:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B671416F9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 80D991BF97A
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B380419AC
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:11:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B380419AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9DkU6aT-LV7i for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 16:11:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6863D4196C
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 16:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6863D4196C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 56F878678A; Wed, 22 Feb 2023 16:11:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 17:07:24 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 3d75ea9fdba8d6797d505e45e43af55b70663c6d
X-Git-Newrev: bd8decd5811c44d742188e31e61b34f116f32335
X-Patchwork-Hint: ignore
Message-Id: <20230222161136.56F878678A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] Config.in.legacy: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=bd8decd5811c44d742188e31e61b34f116f32335
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
index 3a2e6883e9..5000c7a7be 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -2433,7 +2433,7 @@ config BR2_PACKAGE_MEDIAART_BACKEND_GDK_PIXBUF
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
