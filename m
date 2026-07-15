Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FDFC44501
	for <buildroot@archiver.kernel.org>; Wed, 15 Jul 2026 18:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B12546070C;
	Wed, 15 Jul 2026 18:52:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XeivxPROIdl5; Wed, 15 Jul 2026 18:52:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C57C6606FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784141533;
	bh=K7s0tyZDt5ADChQ0epTP0sQQiL0pBscPdLaCTVIgpak=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IP7U1wTDYbOE5IV6bIUWB5h63Yo2VNFbHsxqjqQK3Cevqsi8T0lboiQBRP0i3Kb9F
	 zYDc0ldoEBO/g6Fd6mnGHqvf1kvQit6iS1cuho0IwLuroYm2nqYfTzp+YGOA5ox6fW
	 Zc+SJXnsMa46Hc2UnVqXW/n+e39M6f8aogHxqllVZC2HOzD2Zu42D7LCtdvUFXBzvj
	 v5zPGjXhocqOvltzHKphC+3IRNp3fQUre/WBmJArDSclU6AwVO2/Ic7ApNoDppxkin
	 RU8OPDwhhvI6Y5xQ1hmtVvby7mGqzRta6awODm5VVr9+WUXLNYnFAQQ34Pqkgq9Vb2
	 QXGFy3/4OJX9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C57C6606FA;
	Wed, 15 Jul 2026 18:52:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E3FBA203
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 18:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA0AC606FA
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 18:52:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XNjubtnUdNMD for <buildroot@buildroot.org>;
 Wed, 15 Jul 2026 18:52:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBB0B60625
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBB0B60625
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 18:52:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80AC98893D; Wed, 15 Jul 2026 18:51:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Jul 2026 20:48:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 643f480f4379afe5677ec399c802b8d33734b601
X-Git-Newrev: f2d4e6f159b4cd3dc6750cf4e5bd595864de45a3
X-Patchwork-Hint: ignore
Message-Id: <20260715185135.80AC98893D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/armadillo: bump to version 15.4.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f2d4e6f159b4cd3dc6750cf4e5bd595864de45a3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://arma.sourceforge.net/docs.html#changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index 70456a4fb2..c4425ed262 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  f781e9d935db7e8b9a64c58b6a817354d38a1769e179b477364f5e6414953f6c  armadillo-15.4.0.tar.xz
+sha256  12781baf33c71b622c2f040fd27143479d120ec89d40f889621f0b1bb6232e27  armadillo-15.4.1.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index b806b0f1d1..15dd721680 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 15.4.0
+ARMADILLO_VERSION = 15.4.1
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
