Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C42C47074
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 16:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D784640191;
	Sun,  7 Jan 2024 16:25:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D784640191
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xL8rLEbk8-fP; Sun,  7 Jan 2024 16:25:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D30A34037C;
	Sun,  7 Jan 2024 16:25:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D30A34037C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 260491BF869
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2872415E5
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:23:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2872415E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mucJCFpgQYEt for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 16:23:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F683415E7
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 16:23:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F683415E7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F0E2847B5; Sun,  7 Jan 2024 16:23:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Jan 2024 12:19:13 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: efdcc3f4d33f9840c6b3b7b176000cbce62dd219
X-Git-Newrev: 0e5b9818a285c5597e94714c02c5fcafdfc82053
X-Patchwork-Hint: ignore
Message-Id: <20240107162342.1F0E2847B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/nmap: fix wording
 for nc symlink
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e5b9818a285c5597e94714c02c5fcafdfc82053
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 85646943ec6fb8eeee760b89b5d31a09da7ea92b)
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
