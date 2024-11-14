Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30F7D68B33
	for <buildroot@archiver.kernel.org>; Thu, 14 Nov 2024 16:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1777140788;
	Thu, 14 Nov 2024 16:25:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CErLoqaR0_up; Thu, 14 Nov 2024 16:25:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B94F640769
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B94F640769;
	Thu, 14 Nov 2024 16:25:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7682C27DF
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 16:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 551BD40B31
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 16:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H_ejB0qFtmCn for <buildroot@buildroot.org>;
 Thu, 14 Nov 2024 16:25:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A149400C5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A149400C5
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 16:25:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 412D1863D7; Thu, 14 Nov 2024 16:25:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Nov 2024 16:55:19 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 1d8cf02e88e212cf4c7bc9b18ccdc582a5edb95b
X-Git-Newrev: 7e2038d9efec14f462246b9e2f06146b382863ec
X-Patchwork-Hint: ignore
Message-Id: <20241114162544.412D1863D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] Revert "package/libpng:
 bump version to 1.6.44"
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7e2038d9efec14f462246b9e2f06146b382863ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

This reverts commit 6f22278527c15e8944c0bdc819a023355cc2c001.

Libpng 1.6.44 triggers a number of autobuilder issues on arm(eb), E.G.:

http://autobuild.buildroot.net/results/72af84420ebdae8cb10c6988312e50268583a427/
http://autobuild.buildroot.net/results/e4c0e3685ffc63a2c6ffa4f60e4ed6ffdd81deea/

The "fixes and improvements" in 1.6.44 are not strictly needed for
2024.02.x, so go back to 1.6.43 instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpng/libpng.hash | 4 ++--
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index 3fd4033f83..356c0e3e5d 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/p/png-mng/mailman/message/58815959/
-sha256  60c4da1d5b7f0aa8d158da48e8f8afa9773c1c8baa5d21974df61f1886b8ce8e  libpng-1.6.44.tar.xz
+# From https://sourceforge.net/p/png-mng/mailman/message/58741099/
+sha256  6a5ca0652392a2d7c9db2ae5b40210843c0bbc081cbd410825ab00cc59f14a6c  libpng-1.6.43.tar.xz
 # Locally computed:
 sha256  7317e078e2d3b5d7ba5a6159e650945153262b44b76f6700f8e9edb261c5143e  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 3e7fc42d82..af38afde47 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.44
+LIBPNG_VERSION = 1.6.43
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
