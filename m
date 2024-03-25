Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0748DC54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 07:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C550E81E07;
	Mon, 25 Mar 2024 07:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qwnWdpcQT7ZL; Mon, 25 Mar 2024 07:34:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39F9B81E53
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39F9B81E53;
	Mon, 25 Mar 2024 07:34:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 614371BF3A3
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 07:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B06C408CA
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 07:34:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LOv-fN10Zjnn for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 07:34:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8834C40A53
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8834C40A53
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 07:34:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3424983CE1; Mon, 25 Mar 2024 07:34:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 08:33:04 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: f53e8f3abf757d1d7b58f22a159fadc6d593f8a4
X-Git-Newrev: d69bdfc1baa29eb8f99d082813459286247a5041
X-Patchwork-Hint: ignore
Message-Id: <20240325073406.3424983CE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/axel: needs gcc
 >= 4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=d69bdfc1baa29eb8f99d082813459286247a5041
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fix the following build failure raised since bump to version 2.17.12 in
commit 50ba0b0a40187b695740a2fce2d2f3ed7cbf58c5 and
https://github.com/axel-download-accelerator/axel/commit/517d3ea036c2837b779a15b410331cd0df4fb066:

src/random.c:1:23: fatal error: stdatomic.h: No such file or directory
 #include <stdatomic.h>
                       ^

Fixes:
 - http://autobuild.buildroot.org/results/ca62edddd42252bf21caa8243f8aaba38992fc68

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c09830644466022de14a350d569e06041b394c53)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/axel/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/axel/Config.in b/package/axel/Config.in
index 4507855ff8..740095a505 100644
--- a/package/axel/Config.in
+++ b/package/axel/Config.in
@@ -1,10 +1,12 @@
 config BR2_PACKAGE_AXEL
 	bool "axel"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	help
 	  HTTP/FTP download accelerator.
 
 	  https://github.com/axel-download-accelerator/axel/
 
-comment "axel needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "axel needs a toolchain w/ threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
