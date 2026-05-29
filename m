Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B95CCD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7131283DEE;
	Fri, 29 May 2026 08:28:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Shm8o2nhogtl; Fri, 29 May 2026 08:28:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2C5C83DFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043297;
	bh=DuOGnYnDCSZ+gGOlD+Dgs/+XHCOyv9b81L+CBCCWQds=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HqE4NbbTsFw8UYULSPhJWRbeYgmWd9JdKpe+oGTz287zju4kZZjNtxp5zDBucEHKF
	 u35mC0XmsODjpG+LLTfBgMzawpy+SSHqI95zMYYtu6Gb2urG7hmt8tXuQ2CNEPBo+A
	 cpmJ/D+3Bn9Mrvwl3TgP7S0aF2lz4foVKDrTmFA4Yfcei3fhbLd5O0HnM8BHtT5Lve
	 KjUQAq0omgRbQivLzeSrwPn9r3Cfp4qE0s7ohGBgbkQkTfcoXF2+lhUN1ztObX5o2g
	 u1ezch1wtUDC+j/klstdpNMJb7xn9cQNtwu12e9Qv1I+Dcn09Y9CrIB/kY5gY1xCmw
	 c7oBuFDZfkGpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2C5C83DFF;
	Fri, 29 May 2026 08:28:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 125E128E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6331461360
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KkStw2v6qoDO for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:28:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9B736137D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9B736137D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8765E87334; Fri, 29 May 2026 08:27:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:26:21 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 2ebb05124cd6d960b8ab43a9277d4f715369fb31
X-Git-Newrev: 79acbb383d3a1387a3db5fddfb74765dd1679641
X-Patchwork-Hint: ignore
Message-Id: <20260529082748.8765E87334@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/postgresql:
 security bump version to 18.4
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/79acbb383d3a1387a3db5fddfb74765dd1679641
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://www.postgresql.org/about/news/postgresql-184-1710-1614-1518-and-1423-released-3297/

Fixes CVE-2026-6472, CVE-2026-6473, CVE-2026-6474, CVE-2026-6475,
CVE-2026-6476, CVE-2026-6477, CVE-2026-6478, CVE-2026-6479,
CVE-2026-6575, CVE-2026-6637, CVE-2026-6638.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9fb64dfc2411bace5a0e1e55ac17963ba4bca6d1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
