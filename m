Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7616C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Feb 2022 13:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E93E84C37;
	Fri, 18 Feb 2022 13:31:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ED2cuXAir0P5; Fri, 18 Feb 2022 13:31:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C19684C35;
	Fri, 18 Feb 2022 13:31:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9C4921BF29F
 for <buildroot@lists.busybox.net>; Fri, 18 Feb 2022 13:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88F856113B
 for <buildroot@lists.busybox.net>; Fri, 18 Feb 2022 13:31:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IFk7GU4II88v for <buildroot@lists.busybox.net>;
 Fri, 18 Feb 2022 13:31:04 +0000 (UTC)
X-Greylist: delayed 19:08:56 by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6FA4D60BC1
 for <buildroot@buildroot.org>; Fri, 18 Feb 2022 13:31:03 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E5E9D60009;
 Fri, 18 Feb 2022 13:30:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nL3Le-0000e3-Nw; Fri, 18 Feb 2022 14:30:58 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 18 Feb 2022 14:30:55 +0100
Message-Id: <20220218133057.2426-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/zsh: security bump to version 5.8.1
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
Cc: Phil Eichinger <phil.eichinger@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
