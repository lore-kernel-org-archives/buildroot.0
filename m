Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BBBCD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 14:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B601606EE;
	Sun, 31 May 2026 14:38:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9GsrtGZlhmIt; Sun, 31 May 2026 14:38:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D5DD60711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780238291;
	bh=cf5ittAkaOPdbnWaS8wusYTWVu5Xs9IMjvlg8pJANgE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fb3RgF3g5UJC8Ikp90E7YfWWa5Y9F5frqo9RqhtMaGC16YrkGCvw8riXCEseiFuL+
	 piOVhI6Wa2/A6p1ECNfj63DQOhmkxeRDuU1PWIlgIlBra4m5aBXcPZ3nAYXCZFThhK
	 63bX+H6CECHr1t3aeVXlmZ8zZ8Ri/FB03yDH/h4YCqCdSZG1ua5I6R3mstwX1r8FLD
	 QCfCMJb43bfuUVvKiNTnyrIr99GQnDN3tR7sdIkd+Trr2BnWMHY8v1oazrb/IrM7XT
	 wLq3l5sWqFHWfacrGSBMymYKlIlVlNWmkkQHJXbU8KClpjulNhdutGGMatAUmeXcEb
	 LfPHAiZ3FK3hg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D5DD60711;
	Sun, 31 May 2026 14:38:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C1BA8257
 for <buildroot@buildroot.org>; Sun, 31 May 2026 14:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B33B54299D
 for <buildroot@buildroot.org>; Sun, 31 May 2026 14:38:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gPW3emSHT0XR for <buildroot@buildroot.org>;
 Sun, 31 May 2026 14:38:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD65D42994
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD65D42994
 for <buildroot@buildroot.org>; Sun, 31 May 2026 14:38:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2754F876D4; Sun, 31 May 2026 14:37:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 16:36:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50d772b66bb0ab281aef2bade584de39b4cd6da5
X-Git-Newrev: df127aec63fc6ad456f7ca5e2878eb3f2e7405dd
X-Patchwork-Hint: ignore
Message-Id: <20260531143756.2754F876D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wireless-regdb: bump version to
 2026.05.30
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/df127aec63fc6ad456f7ca5e2878eb3f2e7405dd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.infradead.org/pipermail/wireless-regdb/2026-May/001917.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/wireless-regdb/wireless-regdb.hash | 2 +-
 package/wireless-regdb/wireless-regdb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
index bdca077781..4c6b3bec78 100644
--- a/package/wireless-regdb/wireless-regdb.hash
+++ b/package/wireless-regdb/wireless-regdb.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
-sha256  5fc0000475d8c5368ccc5222827c16aef98b1eb6a69c9b5a3e7b7e98528945ac  wireless-regdb-2026.03.18.tar.xz
+sha256  8a27bfc081bafed8c24dd70fab0d96f098e5a0bfcd08d3da672595f225ab8993  wireless-regdb-2026.05.30.tar.xz
 # Locally computed
 sha256  678b0df753c86198fc496d1f1033429bbd57f101472132ee7eaaf9f5e0a7fae1  LICENSE
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 7e0c585401..9761afc243 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRELESS_REGDB_VERSION = 2026.03.18
+WIRELESS_REGDB_VERSION = 2026.05.30
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = $(BR2_KERNEL_MIRROR)/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
