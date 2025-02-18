Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D274DC02198
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 09:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 841DE40726;
	Tue, 18 Feb 2025 09:04:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tHFHF0mfZT4v; Tue, 18 Feb 2025 09:04:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50ABD4054A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50ABD4054A;
	Tue, 18 Feb 2025 09:04:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 14340C8
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 09:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED5A1811CA
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 09:04:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VFIdnMSiriXs for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 09:04:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20C5E810C6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20C5E810C6
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 09:04:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16D5087788; Tue, 18 Feb 2025 09:04:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 18 Feb 2025 08:34:22 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 2219410297d8fc8ec39c243a0a59038a4f5f3779
X-Git-Newrev: 2def1470e8a8d1315664d1735eb0428558931e66
X-Patchwork-Hint: ignore
Message-Id: <20250218090407.16D5087788@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/postgresql:
 security bump version to 16.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=2def1470e8a8d1315664d1735eb0428558931e66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Release notes:
https://www.postgresql.org/docs/release/16.7/
https://www.postgresql.org/about/news/postgresql-173-167-1511-1416-and-1319-released-3015/

Fixes CVE-2025-1094:
https://www.postgresql.org/support/security/CVE-2025-1094/

Updated license hash due to copyright year bump:
https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=759620716adb347c1d8c8b2e6f7d88b947a54c98

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 88730dc353..11c0e77b05 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v16.6/postgresql-16.6.tar.bz2.sha256
-sha256  23369cdaccd45270ac5dcc30fa9da205d5be33fa505e1f17a0418d2caeca477b  postgresql-16.6.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v16.7/postgresql-16.7.tar.bz2.sha256
+sha256  62e02f77ebfc4a37f1700c20cc3ccd85ff797b5613766ebf949a7899bb2113fe  postgresql-16.7.tar.bz2
 # License file, Locally calculated
 sha256  9bf20ee493926a7e17a74bc7f05089fbc014269667b1540bc35a6b194a40c9de  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 4656eba3d8..f4b384ed82 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 16.6
+POSTGRESQL_VERSION = 16.7
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
