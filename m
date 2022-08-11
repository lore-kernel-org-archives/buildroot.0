Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16910C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 11:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 862CC61001;
	Thu, 11 Aug 2022 11:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 862CC61001
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pvhjof-YiHLC; Thu, 11 Aug 2022 11:41:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2AB660F5D;
	Thu, 11 Aug 2022 11:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2AB660F5D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C77C51BF38C
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B01B24032A
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:41:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B01B24032A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FcrJRMzuG1bg for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 11:41:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0AB04023B
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 11:41:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0AB04023B
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C36AC87118; Thu, 11 Aug 2022 11:26:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 13:39:28 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: bdd83a3e544e05fa1e509cf478eabf0aac56fec9
X-Git-Newrev: 0053bbbeaf7e1c36d6a947f3aadfaeb480911461
X-Patchwork-Hint: ignore
Message-Id: <20220811112646.C36AC87118@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libcurl: fix
 dependency symbol typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=0053bbbeaf7e1c36d6a947f3aadfaeb480911461
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Commit 6d07e2618c0 ("package/uacme: requires TLS support in libcurl")
mistyped the BR2_PACKAGE_LIBCURL_FORCE_TLS dependency making the fix
ineffective.

Fixes:
http://autobuild.buildroot.net/results/56ea6cb146df63d1575da9dae3035b3220de875f/
http://autobuild.buildroot.net/results/280b0ed7f9cdb424917373f98c3e4e6b593c6d21/

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit bf1c9174aca83becc9f44828a8832f04c138fd23)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index bc2f8f47f2..218309ed56 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -83,7 +83,7 @@ comment "WolfSSL needs a toolchain w/ dynamic library"
 
 config BR2_PACKAGE_LIBCURL_TLS_NONE
 	bool "None"
-	depends on !BR2_PACKAGE_LIBCURL_FORCE_SSL_TLS
+	depends on !BR2_PACKAGE_LIBCURL_FORCE_TLS
 
 endchoice
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
