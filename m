Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331D9C25B74
	for <buildroot@archiver.kernel.org>; Thu, 30 May 2024 19:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6E064056F;
	Thu, 30 May 2024 19:29:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wl-nfl8ppLHj; Thu, 30 May 2024 19:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6C054144D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6C054144D;
	Thu, 30 May 2024 19:29:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0C46B1D4A3A
 for <buildroot@lists.busybox.net>; Thu, 30 May 2024 19:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE09360668
 for <buildroot@lists.busybox.net>; Thu, 30 May 2024 19:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dOpl-hbuMUr6 for <buildroot@lists.busybox.net>;
 Thu, 30 May 2024 19:29:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B9D560644
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B9D560644
 for <buildroot@buildroot.org>; Thu, 30 May 2024 19:29:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2678587783; Thu, 30 May 2024 19:29:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 30 May 2024 21:18:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84a9ab91d3deaf341b47e69a2ce50c8d5965ec86
X-Git-Newrev: 091ad8455da98fb7abc5af22e7a4c36f64c0783e
X-Patchwork-Hint: ignore
Message-Id: <20240530192951.2678587783@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cog: bump to version 0.18.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=091ad8455da98fb7abc5af22e7a4c36f64c0783e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a small bugfix release, with a rendering fix for popup menus
and that can use weston-protocols version 14 for building. Release
notes:

  https://wpewebkit.org/release/cog-0.18.4.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cog/cog.hash | 8 ++++----
 package/cog/cog.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index c0e99e14aa..b59b5f4795 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/cog-0.18.3.tar.xz.sums
-md5  e457de5b5ac8994ae9971c0a5a22b8a2  cog-0.18.3.tar.xz
-sha1  21df2a84c651b45e78d08e45e71631250a0078c3  cog-0.18.3.tar.xz
-sha256  cd4ec937175a290ccd7c8ec398e4569aec04084cd94b11b2d83518778ba9d055  cog-0.18.3.tar.xz
+# From https://wpewebkit.org/releases/cog-0.18.4.tar.xz.sums
+md5  0566ab6676b499ebcff372fbe39e24fc  cog-0.18.4.tar.xz
+sha1  2d6f88cfb07eaac1be2bf9954832f19f8a856631  cog-0.18.4.tar.xz
+sha256  31d7079db2eeed790899d2f1f824dd6a54bf30d072d196d737be572f105d99b1  cog-0.18.4.tar.xz
 
 # Hashes for license files:
 sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index 11c0e3b502..7f680bb700 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COG_VERSION = 0.18.3
+COG_VERSION = 0.18.4
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
