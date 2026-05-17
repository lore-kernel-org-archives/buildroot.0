Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF6DCD4F3C
	for <buildroot@archiver.kernel.org>; Sun, 17 May 2026 20:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2210442901;
	Sun, 17 May 2026 20:21:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XyyQzDvU5v96; Sun, 17 May 2026 20:21:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5626542903
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779049314;
	bh=WgqKVuCGaPsVfUrL7Xnx+ZupiP8u4BW4KQo/TIw5ceU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=b8AXIkgdtn4tLqIFtosTICR2kdA9zGjjSdoLW1fC5upTJv7l35Dht5dmoBpNi04iL
	 JOroWD92Nv8ioC0d4j9mbVP3ZcxbIXgpeQDRjzuGrqlTeKg2CheTA2B6r/qgZmfkMZ
	 5b4pYjP0/7Q9KGdvu69WxPOYN9zWLvNzG9ITJRTB6twCWF/P1DQGSNHpN8N25I6jEi
	 8HO7VcSFNsF8+tiF22NX92lVfIDPMvC7E5zUwMJ/tmUQ3wPJp3IWUhdB+kF48+ElGq
	 0Tk0bnCnfpmcmenAnrn3oh8ytWaCJwXabwqNU7iH64pHAlZzE7gXmCZcAb+YgQEEYJ
	 DNf6l5UA8uBTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5626542903;
	Sun, 17 May 2026 20:21:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 04828265
 for <buildroot@buildroot.org>; Sun, 17 May 2026 20:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA2AE42903
 for <buildroot@buildroot.org>; Sun, 17 May 2026 20:21:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aSfp8AVDpePc for <buildroot@buildroot.org>;
 Sun, 17 May 2026 20:21:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6D5B42901
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6D5B42901
 for <buildroot@buildroot.org>; Sun, 17 May 2026 20:21:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE26A86535; Sun, 17 May 2026 20:21:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 17 May 2026 22:13:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f049a07fb054a39b832b06c3c2f2aa74410cd167
X-Git-Newrev: 9fb64dfc2411bace5a0e1e55ac17963ba4bca6d1
X-Patchwork-Hint: ignore
Message-Id: <20260517202144.EE26A86535@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/postgresql: security bump version
 to 18.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9fb64dfc2411bace5a0e1e55ac17963ba4bca6d1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.postgresql.org/about/news/postgresql-184-1710-1614-1518-and-1423-released-3297/

Fixes CVE-2026-6472, CVE-2026-6473, CVE-2026-6474, CVE-2026-6475,
CVE-2026-6476, CVE-2026-6477, CVE-2026-6478, CVE-2026-6479,
CVE-2026-6575, CVE-2026-6637, CVE-2026-6638.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 58eab8e548..be57f216f1 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v18.3/postgresql-18.3.tar.bz2.sha256
-sha256  d95663fbbf3a80f81a9d98d895266bdcb74ba274bcc04ef6d76630a72dee016f  postgresql-18.3.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v18.4/postgresql-18.4.tar.bz2.sha256
+sha256  81a81ec695fb0c7901407defaa1d2f7973617154cf27ba74e3a7ab8e64436094  postgresql-18.4.tar.bz2
 # License file, Locally calculated
 sha256  3d6af92ff8a4c2cdf69afb1cf44edea727922f5cd0cf8b5f72b11cdecac8fdfd  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index fed3887ef5..16ed591df4 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 18.3
+POSTGRESQL_VERSION = 18.4
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
