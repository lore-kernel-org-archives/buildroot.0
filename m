Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61C3C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 17:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AFF160A77;
	Fri, 22 Jul 2022 17:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AFF160A77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lZxTr9F8yAWs; Fri, 22 Jul 2022 17:46:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 519B260F4B;
	Fri, 22 Jul 2022 17:46:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 519B260F4B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4182F1BF316
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 17:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BD3441598
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 17:46:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BD3441598
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kbk2I_4dlTjY for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 17:46:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B60340A60
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 17:46:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B60340A60
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5C45984171; Fri, 22 Jul 2022 17:32:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 19:45:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b6714bf2aa828ded86e1ca63a42f86793d6b8c2
X-Git-Newrev: bf1c9174aca83becc9f44828a8832f04c138fd23
X-Patchwork-Hint: ignore
Message-Id: <20220722173254.5C45984171@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcurl: fix dependency symbol typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf1c9174aca83becc9f44828a8832f04c138fd23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
