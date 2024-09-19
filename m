Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B81CE8D5F
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7521841278;
	Thu, 19 Sep 2024 09:18:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lfGVLmUAbIQa; Thu, 19 Sep 2024 09:18:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F5AD412AD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F5AD412AD;
	Thu, 19 Sep 2024 09:18:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E1131BF4DA
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E7FE849CB
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id revIO5W7e5T8 for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:16:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9873C849F5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9873C849F5
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:16:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95C5783C6E; Thu, 19 Sep 2024 09:16:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:04:56 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 500d75762b064a2aae37023ada053c6eb16a905b
X-Git-Newrev: 56e5bc2ca40b7e2037a6ac4595ddc0402b531e2e
X-Patchwork-Hint: ignore
Message-Id: <20240919091607.95C5783C6E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/gdb: fix program
 typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=56e5bc2ca40b7e2037a6ac4595ddc0402b531e2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 27277a2bc90326f9bfda3aacc2ef494bf207a8ec)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 574ad5462f..66c2f672ff 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -52,7 +52,7 @@ config BR2_PACKAGE_GDB_SERVER
 	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
 	help
 	  Build the gdbserver stub to run on the target.
-	  A full gdb is needed to debug the progam.
+	  A full gdb is needed to debug the program.
 
 config BR2_PACKAGE_GDB_DEBUGGER
 	bool "full debugger"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
