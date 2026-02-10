Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50479EB26F5
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 18:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA5DC60B26;
	Tue, 10 Feb 2026 18:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RzC3JZWcky73; Tue, 10 Feb 2026 18:08:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE45F6081C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770746909;
	bh=jaDO/jo5WNyQavK2eMQcgIdGm6qs3h0N6+HmGDLBT0Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VpTjbSTcgXfwqB6as0ouXd93sZgGliKYyFYoExpzx8eFY98YiBCe0JiUoPVU6Lk7v
	 FIm7ZKf8jB8bdLMEWzneb5BCjQDL2Z7YG4QmOggiyknPvQpBOpFSKWs5IPwXOaEB7j
	 oDAnVagnRg41TVuZ44XbWA5/eTsYftDE3RdxtRiHFvebBzz1RguX7XOBoqPbMuKnpJ
	 YE+UaBIg1YcYsT3CZ2b6V5ZbXCS25+YIkzU6e7z7I79zZeF6ckrxWSkDMlVKyirfYp
	 X/bZTPHsB2qFVdje4bPK/ywYJpU9LDb5Xxk0+BpAy7ELGLpqCqx79IT1F5IVG92fAT
	 7+VwCG84dfs5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE45F6081C;
	Tue, 10 Feb 2026 18:08:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6967823D
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 18:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A85040A47
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 18:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OUER0GbRr4Db for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 18:08:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEF2640A46
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEF2640A46
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 18:08:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCEE586BB0; Tue, 10 Feb 2026 18:08:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 10 Feb 2026 19:07:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 875d6aedbc639484e9203c5bcda1a55ecb7ad4c9
X-Git-Newrev: 5bd15ee7d488a8192ed0a12440ea49feee9c695b
X-Patchwork-Hint: ignore
Message-Id: <20260210180825.BCEE586BB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wireless-regdb: bump version to
 2026.02.04
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5bd15ee7d488a8192ed0a12440ea49feee9c695b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.infradead.org/pipermail/wireless-regdb/2026-February/001830.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/wireless-regdb/wireless-regdb.hash | 2 +-
 package/wireless-regdb/wireless-regdb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
index 4b2c67965f..39fc1a78d5 100644
--- a/package/wireless-regdb/wireless-regdb.hash
+++ b/package/wireless-regdb/wireless-regdb.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
-sha256  d4c872a44154604c869f5851f7d21d818d492835d370af7f58de8847973801c3  wireless-regdb-2025.10.07.tar.xz
+sha256  0ff48a5cd9e9cfe8e815a24e023734919e9a3b7ad2f039243ad121cf5aabf6c6  wireless-regdb-2026.02.04.tar.xz
 # Locally computed
 sha256  678b0df753c86198fc496d1f1033429bbd57f101472132ee7eaaf9f5e0a7fae1  LICENSE
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 055238be5e..31bc9e9a22 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRELESS_REGDB_VERSION = 2025.10.07
+WIRELESS_REGDB_VERSION = 2026.02.04
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = $(BR2_KERNEL_MIRROR)/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
