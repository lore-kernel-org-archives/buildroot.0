Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1359C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 10:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7850141E66;
	Wed, 20 Dec 2023 10:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7850141E66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tpJdDc5tQmjc; Wed, 20 Dec 2023 10:50:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B11D74202A;
	Wed, 20 Dec 2023 10:50:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B11D74202A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6B8921BF2B3
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 10:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4EBF60759
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 10:50:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4EBF60759
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6xzyzcSYQwIf for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 10:50:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1389E60741
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 10:50:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1389E60741
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F210C87C2F; Wed, 20 Dec 2023 10:50:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 11:42:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c047ea463e27ceaafde76d64406862c3322daa0
X-Git-Newrev: 85646943ec6fb8eeee760b89b5d31a09da7ea92b
X-Patchwork-Hint: ignore
Message-Id: <20231220105004.F210C87C2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nmap: fix wording for nc symlink
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

commit: https://git.buildroot.net/buildroot/commit/?id=85646943ec6fb8eeee760b89b5d31a09da7ea92b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nmap/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nmap/Config.in b/package/nmap/Config.in
index fc6312d0fc..6e097a9884 100644
--- a/package/nmap/Config.in
+++ b/package/nmap/Config.in
@@ -24,7 +24,7 @@ config BR2_PACKAGE_NMAP_NCAT
 	  written for the Nmap Project as a much-improved
 	  reimplementation of the venerable Netcat.
 
-	  If symlink to "nc" is installed if neither netcat or
+	  A symlink to "nc" is installed if neither netcat or
 	  netcat-openbsd is selected.
 
 comment "a symlink from ncat to 'nc' will be installed"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
