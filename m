Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D564C54E5D
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 13:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA6BC40608;
	Mon, 18 Mar 2024 13:31:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id atKSeDj6tUiw; Mon, 18 Mar 2024 13:31:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E776E408A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E776E408A5;
	Mon, 18 Mar 2024 13:31:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA0861BF363
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 13:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF6AA408A5
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 13:31:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dCDGlyIZn4K0 for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 13:31:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2041840608
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2041840608
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 13:31:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0BE3582929; Mon, 18 Mar 2024 13:31:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 18 Mar 2024 14:27:35 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 315a591532b5bd111f1085bfc5c3cf9358410084
X-Git-Newrev: 83c305da5b7b866dcbebcd8c2e0f0b797f99c713
X-Patchwork-Hint: ignore
Message-Id: <20240318133140.0BE3582929@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/squid: needs C++17
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

commit: https://git.buildroot.net/buildroot/commit/?id=83c305da5b7b866dcbebcd8c2e0f0b797f99c713
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

C++17 is mandatory since bump to version 6.2 in commit
2a7c6816f02f45946e896577d78e3470331b2d63 and
https://github.com/squid-cache/squid/commit/09835feb258c3058d028918e36d959dccb3f7496
resulting in the following build failure:

configure: error: *** A compiler with support for C++17 language features is required.

Fixes: 2a7c6816f02f45946e896577d78e3470331b2d63
 - http://autobuild.buildroot.org/results/06755c324f0bf37e52976fce48a5ad62915193da

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1e576592607705d397220b9a5907265f052dcb95)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/squid/Config.in b/package/squid/Config.in
index 6272140768..89b5a377c7 100644
--- a/package/squid/Config.in
+++ b/package/squid/Config.in
@@ -1,10 +1,10 @@
-comment "squid needs a toolchain w/ C++, threads, gcc >= 4.8 not affected by bug 64735"
+comment "squid needs a toolchain w/ C++, threads, gcc >= 7 not affected by bug 64735"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735 || \
 		!BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
 config BR2_PACKAGE_SQUID
 	bool "squid"
@@ -12,7 +12,7 @@ config BR2_PACKAGE_SQUID
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::current_exception
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	# needs fork()
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_LIBCAP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
