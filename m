Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503D0C433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 08:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E175160A92;
	Sun, 23 Jan 2022 08:37:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9xSPpltF_HM9; Sun, 23 Jan 2022 08:37:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40F5A605EE;
	Sun, 23 Jan 2022 08:37:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3708C1BF97A
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 08:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 224FD404A1
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 08:37:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7KV6GrpfiWXZ for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 08:37:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34FAC40327
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 08:37:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9725382A38; Sun, 23 Jan 2022 08:30:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 09:32:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 694189ffa3cddd811620f77e19de9a73a24cd09e
X-Git-Newrev: 653dc2e710534494ea41c68c22a279cf8736b125
X-Patchwork-Hint: ignore
Message-Id: <20220123083029.9725382A38@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lighttpd: replace mod_compress by
 mod_deflate
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

commit: https://git.buildroot.net/buildroot/commit/?id=653dc2e710534494ea41c68c22a279cf8736b125
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mod_compress has been subsumed by mod_deflate since version 1.4.56 and
https://github.com/lighttpd/lighttpd1.4/commit/dab212b5f5ee468b632f40f28699efc810f27210

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lighttpd/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index ed674a9227..99a09e9766 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -38,13 +38,13 @@ config BR2_PACKAGE_LIGHTTPD_ZLIB
 	bool "zlib support"
 	select BR2_PACKAGE_ZLIB
 	help
-	  Enable zlib support for lighttpd mod_compress.
+	  Enable zlib support for lighttpd mod_deflate.
 
 config BR2_PACKAGE_LIGHTTPD_BZIP2
 	bool "bzip2 support"
 	select BR2_PACKAGE_BZIP2
 	help
-	  Enable bzip2 support for lighttpd mod_compress.
+	  Enable bzip2 support for lighttpd mod_deflate.
 
 config BR2_PACKAGE_LIGHTTPD_PCRE
 	bool "pcre support"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
