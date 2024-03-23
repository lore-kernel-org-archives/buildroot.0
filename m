Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75960CD11BF
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 12:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 415A74010F;
	Sat, 23 Mar 2024 12:38:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5N127kidsFqD; Sat, 23 Mar 2024 12:38:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4273E404D7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4273E404D7;
	Sat, 23 Mar 2024 12:38:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 89F4C1BF3E1
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 12:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77331404D7
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 12:38:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mGJnYkV6MtYV for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 12:38:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A34194010F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A34194010F
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 12:38:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B7E9838A3; Sat, 23 Mar 2024 12:38:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 23 Mar 2024 13:33:39 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 8878a7f47968bc5b2ec5b374e4406203257b7194
X-Git-Newrev: f47b3d591893674873bd8f0b7c4a23ce628c8d8d
X-Patchwork-Hint: ignore
Message-Id: <20240323123833.8B7E9838A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/postgresql:
 security bump version to 15.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=f47b3d591893674873bd8f0b7c4a23ce628c8d8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Release notes: https://www.postgresql.org/docs/release/15.6/

Fixes CVE-2024-0985: PostgreSQL non-owner REFRESH MATERIALIZED VIEW
CONCURRENTLY executes arbitrary SQL

Update COPYRIGHT hash for a change in copyright year (2023->2024).

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
[Peter: Fix COPYRIGHT hash, extend commit message]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.hash | 6 +++---
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 4fc3bfcff0..03409d6135 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v15.4/postgresql-15.5.tar.bz2.sha256
-sha256  8f53aa95d78eb8e82536ea46b68187793b42bba3b4f65aa342f540b23c9b10a6  postgresql-15.5.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v15.6/postgresql-15.6.tar.bz2.sha256
+sha256  8455146ed9c69c93a57de954aead0302cafad035c2b242175d6aa1e17ebcb2fb  postgresql-15.6.tar.bz2
 # License file, Locally calculated
-sha256  1a7d13c3ab31961b91ba256f77d6e82e0b54bf992253060fe93bdb5466df416a  COPYRIGHT
+sha256  9bf20ee493926a7e17a74bc7f05089fbc014269667b1540bc35a6b194a40c9de  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 89ba80557d..da37affe7b 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 15.5
+POSTGRESQL_VERSION = 15.6
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
