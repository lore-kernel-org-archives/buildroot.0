Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8071EC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 19:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5712084740;
	Sat,  8 Jun 2024 19:15:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LY1YRU0XeZe9; Sat,  8 Jun 2024 19:15:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D49CE848E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D49CE848E5;
	Sat,  8 Jun 2024 19:15:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B3A11BF869
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5D62846BD
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gw3nTIJ3B5Bc for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 19:15:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28DD2846BB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28DD2846BB
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 19:15:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 12D4E8710D; Sat,  8 Jun 2024 19:15:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 19:10:50 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 5d9c54de0c48be3a616db5e3c2f6c7112ff635bf
X-Git-Newrev: 5a708e510a0d43a4cb1e62b382403f679cf49ba2
X-Patchwork-Hint: ignore
Message-Id: <20240608191500.12D4E8710D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/gcc-bare-metal:
 bump version to match gcc
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

commit: https://git.buildroot.net/buildroot/commit/?id=5a708e510a0d43a4cb1e62b382403f679cf49ba2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The gcc 13.x. version was bumped to 13.3.0 by commit 5d9c54de0c48b
(package/gcc: update to 13.3.0), so update gcc-bare-metal to match.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc-bare-metal/13.2.0            | 1 -
 package/gcc-bare-metal/13.3.0            | 1 +
 package/gcc-bare-metal/gcc-bare-metal.mk | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gcc-bare-metal/13.2.0 b/package/gcc-bare-metal/13.2.0
deleted file mode 120000
index b7a75dc7dd..0000000000
--- a/package/gcc-bare-metal/13.2.0
+++ /dev/null
@@ -1 +0,0 @@
-../gcc/13.2.0/
\ No newline at end of file
diff --git a/package/gcc-bare-metal/13.3.0 b/package/gcc-bare-metal/13.3.0
new file mode 120000
index 0000000000..b7238b60c1
--- /dev/null
+++ b/package/gcc-bare-metal/13.3.0
@@ -0,0 +1 @@
+../gcc/13.3.0/
\ No newline at end of file
diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
index 0dfc8d7a5c..3554eb88ed 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.mk
+++ b/package/gcc-bare-metal/gcc-bare-metal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOST_GCC_BARE_METAL_VERSION = 13.2.0
+HOST_GCC_BARE_METAL_VERSION = 13.3.0
 HOST_GCC_BARE_METAL_SITE = \
 	https://ftp.gnu.org/gnu/gcc/gcc-$(HOST_GCC_BARE_METAL_VERSION)
 HOST_GCC_BARE_METAL_SOURCE = gcc-$(HOST_GCC_BARE_METAL_VERSION).tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
