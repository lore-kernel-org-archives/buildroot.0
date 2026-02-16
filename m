Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF88E83821
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 19:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A343F8249B;
	Mon, 16 Feb 2026 19:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M0nRIYOT7P5G; Mon, 16 Feb 2026 19:07:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38E738232C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771268855;
	bh=3wfO7CtMDKkhF6jdjWfXquDuWnsZlRJMgfSUSn/oDuA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K7yEKSVL3wqBJdUepv+x955KuOj344ETlMo5poVkW/ElX0y0DKNwQzW+exVLvLMay
	 gbNcC96NoG3a9g8/N9XGVoNUb89K3jm1b5Wx82mW418jHhHh63FtcGKWnNfXs28uDk
	 gemLiiYGI0eeeK2UdqReg9j9YpL6AdeVIhGWOdk2CzPM5eO9g4B82+tagfRkM1qSFE
	 maK3ec73EH/LJJVWsbxOEkgkq78ZYZY+oXaKprJ4m7Qj9+3LGQrXz2Q1MWC6x08ft5
	 yat437/wVTq+OPcx2gcbnGmFFpqy8qmmZwSm3ak+cJDMN8Dup2hioUEfkvYMpzPYt+
	 TIJ6uYRuAYRtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38E738232C;
	Mon, 16 Feb 2026 19:07:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 94F5A270
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 19:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2792A40C47
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 19:07:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eR04N7qx2lW3 for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 19:07:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FABF40CA2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FABF40CA2
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 19:07:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F3C486EE3; Mon, 16 Feb 2026 19:07:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 16 Feb 2026 20:06:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53445ca6418779bd5fe27d3ca84e11116259e548
X-Git-Newrev: a5a1171ca3b5688eed233488744c5eb77ed69ec5
X-Patchwork-Hint: ignore
Message-Id: <20260216190728.3F3C486EE3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/postgresql: security bump version
 to 18.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a5a1171ca3b5688eed233488744c5eb77ed69ec5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.postgresql.org/about/news/postgresql-182-178-1612-1516-and-1421-released-3235/

Fixes CVE-2026-2003, CVE-2026-2004, CVE-2026-2005, CVE-2026-2006 &
CVE-2026-2007.

Updated license hash due to copyright year bump:
https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=aa4b5ebc7640f60905cd4c71db45674e5941b611

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.hash | 6 +++---
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 524066c61e..8d47db5b7f 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v18.1/postgresql-18.1.tar.bz2.sha256
-sha256  ff86675c336c46e98ac991ebb306d1b67621ece1d06787beaade312c2c915d54  postgresql-18.1.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v18.2/postgresql-18.2.tar.bz2.sha256
+sha256  5245bd1b79700d55b8e0575be0325ef61e7bbef627e6a616e4cf36ad4687be36  postgresql-18.2.tar.bz2
 # License file, Locally calculated
-sha256  5ed3ce5c9373dff7f98b1fae7a6c7ccd98df7d734d46d24c1bcebf1240be8307  COPYRIGHT
+sha256  3d6af92ff8a4c2cdf69afb1cf44edea727922f5cd0cf8b5f72b11cdecac8fdfd  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 38403b0f45..542fe05264 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 18.1
+POSTGRESQL_VERSION = 18.2
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
