Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C50CA0FF0
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 06:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4226D41237;
	Mon,  1 Sep 2025 06:14:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0As0t6gHQhr2; Mon,  1 Sep 2025 06:14:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 850D841203
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 850D841203;
	Mon,  1 Sep 2025 06:14:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A7E9610E
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 06:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EB0160BE5
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 06:14:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YBar0BdfUVye for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 06:14:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E18E56111E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E18E56111E
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 06:14:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC9F981402; Mon,  1 Sep 2025 06:14:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Sep 2025 08:11:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c7af01f47a8aea701d4c8a755d07fb97f1e793af
X-Git-Newrev: 8e91db90e28032548e46aec8490309bd56a4f7db
X-Patchwork-Hint: ignore
Message-Id: <20250901061447.CC9F981402@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Config.in.legacy: fix release where
 LIGHTTPD_LIBEV was removed
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8e91db90e28032548e46aec8490309bd56a4f7db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 0d643a8636420a85512aae69932bba2fbe9e5829 which removed the
BR2_PACKAGE_LIGHTTPD_LIBEV symbol was originally meant for next and
therefore introduced the "Legacy options removed in 2025.11" comment.
However, in the end it was still applied to master for 2025.08, so the
legacy symbol was incorrectly placed.

Fix that.

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Config.in.legacy | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c9db36d66f..a8f3f3401e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,7 +144,7 @@ endif
 
 ###############################################################################
 
-comment "Legacy options removed in 2025.11"
+comment "Legacy options removed in 2025.08"
 
 config BR2_PACKAGE_LIGHTTPD_LIBEV
 	bool "lighttpd removed libev support"
@@ -152,8 +152,6 @@ config BR2_PACKAGE_LIGHTTPD_LIBEV
 	help
 	  Lighttpd 1.4.80 removed optional libev support.
 
-comment "Legacy options removed in 2025.08"
-
 config BR2_PACKAGE_LIBSVGTINY
 	bool "libsvgtiny has been removed"
 	select BR2_LEGACY
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
