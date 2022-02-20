Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8E2C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 19:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95F5580AD4;
	Sun, 20 Feb 2022 19:23:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wrJisjhD475C; Sun, 20 Feb 2022 19:23:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9548815AD;
	Sun, 20 Feb 2022 19:23:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 153F11BF476
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 19:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 021D340215
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 19:23:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RcZLhPs89VZp for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 19:23:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5402401DE
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 19:23:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 402D07FF78; Sun, 20 Feb 2022 19:15:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Feb 2022 20:23:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25fc617963b4ae28b20e9bc07863500f62c0862d
X-Git-Newrev: ca6c2ee3da7be5e4af478e779b49248b89e6514d
X-Patchwork-Hint: ignore
Message-Id: <20220220191524.402D07FF78@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zsh: security bump to version 5.8.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=ca6c2ee3da7be5e4af478e779b49248b89e6514d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issue:

- CVE-2021-45444: In zsh before 5.8.1, an attacker can achieve code
  execution if they control a command output inside the prompt, as
  demonstrated by a %F argument.  This occurs because of recursive
  PROMPT_SUBST expansion.

The 5.8.1 release is not listed in MD5SUM, so drop the md5 hash.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zsh/zsh.hash | 6 +-----
 package/zsh/zsh.mk   | 2 +-
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/zsh/zsh.hash b/package/zsh/zsh.hash
index 2df409c946..5c661ded25 100644
--- a/package/zsh/zsh.hash
+++ b/package/zsh/zsh.hash
@@ -1,7 +1,3 @@
-# From http://www.zsh.org/pub/MD5SUM
-md5  e02a5428620b3dd268800c7843b3dd4d  zsh-5.8.tar.xz
-# Calculated based on the hash above and after checking signature
-# http://www.zsh.org/pub/zsh-5.8.tar.xz.asc
-sha256  dcc4b54cc5565670a65581760261c163d720991f0d06486da61f8d839b52de27  zsh-5.8.tar.xz
 # Locally calculated
+sha256  b6973520bace600b4779200269b1e5d79e5f505ac4952058c11ad5bbf0dd9919  zsh-5.8.1.tar.xz
 sha256  d06fdf3ef9b1ec69d6b9e170b0a9516fbad3523261ff1668bde3bfea6e0ef5f5  LICENCE
diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index 1a04833211..c5ab7c2fae 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZSH_VERSION = 5.8
+ZSH_VERSION = 5.8.1
 ZSH_SITE = http://www.zsh.org/pub
 ZSH_SOURCE = zsh-$(ZSH_VERSION).tar.xz
 ZSH_DEPENDENCIES = ncurses
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
