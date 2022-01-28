Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726F9C433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 20:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2630B405CF;
	Fri, 28 Jan 2022 20:46:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8qxXHhCJwbT1; Fri, 28 Jan 2022 20:46:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35D2B40253;
	Fri, 28 Jan 2022 20:46:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 598AA1C1162
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 20:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55F89405D0
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 20:46:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BrhHhIwomIZz for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 20:46:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B37740253
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 20:46:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C582882B50; Fri, 28 Jan 2022 20:39:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 21:37:58 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: e75d81356be71c79cbe59bd7b9a267ef7f06fb51
X-Git-Newrev: fb8b3112878c1d57e642ba69c196184eb2000f73
X-Patchwork-Hint: ignore
Message-Id: <20220128203942.C582882B50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/lighttpd: replace
 mod_compress by mod_deflate
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb8b3112878c1d57e642ba69c196184eb2000f73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

mod_compress has been subsumed by mod_deflate since version 1.4.56 and
https://github.com/lighttpd/lighttpd1.4/commit/dab212b5f5ee468b632f40f28699efc810f27210

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 653dc2e710534494ea41c68c22a279cf8736b125)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lighttpd/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index e9a5aa34f0..3e468ce9c8 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -37,13 +37,13 @@ config BR2_PACKAGE_LIGHTTPD_ZLIB
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
