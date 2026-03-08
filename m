Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81666EA8539
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 17:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30E3560AAC;
	Sun,  8 Mar 2026 17:16:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rgjp4UltOVEL; Sun,  8 Mar 2026 17:16:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EEB360B09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772990182;
	bh=/N2LfhJpPrHZz7IqxkulsL5onSqyGAzmiycBaWfUhOM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TIvxa9wGA9wUj+zZOcb7MLmYWzH3a5KLUDL9BfvZFPxESoddrmXwAxL+APpNb6kd+
	 vWjlT3JQs4XzdmK+Obp5JErQ7EFsIBSGCczVLc6AlyBe7UjNytoiYUxW2S+IIEN+pV
	 sjpTSqX8voqJU/awIPzvWE+O28avitl34D1rvD/KBQfgFEARPN5hGlbUxY098xO1dl
	 POr8TRvvC/+7WT/H55vQ4e9YHwY5EL8VS42NxvlaRS2ZU/XdFp5OmBTlr8u0nLTpoy
	 HaQz2sAqFc4kv4dmbwiWFif1LXNg2ohRi9usAZTxym8fEj7WMMimBvY4CUIgbKLGxY
	 0dex6/x5/VXbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EEB360B09;
	Sun,  8 Mar 2026 17:16:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7118B223
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 17:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62B7D41800
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 17:16:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yaYFFnnfkQ7R for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 17:16:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5841417F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5841417F7
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 17:16:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0E8585E7D; Sun,  8 Mar 2026 17:16:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 8 Mar 2026 18:12:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f441d359165de9987a371149d71d057ebf0ee9e
X-Git-Newrev: 04dbf7a38f4e83a1c6444b910209a0e3a350b14c
X-Patchwork-Hint: ignore
Message-Id: <20260308171620.B0E8585E7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sqlite: bump version to 3.52.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/04dbf7a38f4e83a1c6444b910209a0e3a350b14c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://sqlite.org/releaselog/3_52_0.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 055e935a4e..9ed3781dca 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fbd89f866b1403bb66a143065440089dd76100f2238314d92274a082d4f2b7bb  sqlite-autoconf-3510200.tar.gz
+sha256  f6b50b0c103392af32a8be15b2b9d25959de9a00a70c3979128aafeaa5338b3f  sqlite-autoconf-3520000.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 795bc32dbf..4b334714ff 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.51.2
-SQLITE_TAR_VERSION = 3510200
+SQLITE_VERSION = 3.52.0
+SQLITE_TAR_VERSION = 3520000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2026
 SQLITE_LICENSE = blessing
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
