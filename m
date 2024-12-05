Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37183E7716E
	for <buildroot@archiver.kernel.org>; Thu,  5 Dec 2024 21:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0217F6079B;
	Thu,  5 Dec 2024 21:39:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ww6VzC9KpLHu; Thu,  5 Dec 2024 21:39:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10540607E0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10540607E0;
	Thu,  5 Dec 2024 21:39:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D35781DD1
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 21:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C001341C36
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 21:39:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nmPgrsz-lpt2 for <buildroot@buildroot.org>;
 Thu,  5 Dec 2024 21:39:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2BF840616
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2BF840616
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 21:39:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FF3E868EA; Thu,  5 Dec 2024 21:39:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Dec 2024 21:43:13 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: c61c66269389a839498af119e331d76498fac2a4
X-Git-Newrev: fa3c41f3c937d36842664d6fb8d10116ba135283
X-Patchwork-Hint: ignore
Message-Id: <20241205213921.9FF3E868EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/postgresql:
 security bump version to 16.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=fa3c41f3c937d36842664d6fb8d10116ba135283
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Release notes:
https://www.postgresql.org/about/news/postgresql-171-165-159-1414-1317-and-1221-released-2955/

Fixes CVE-2024-10976, CVE-2024-10977, CVE-2024-10978 & CVE-2024-10979.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 257c1de7e9ec54da2d2d0a040b5a0fda06cd05f2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 1d9a9081b7..6a15f78628 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v16.4/postgresql-16.4.tar.bz2.sha256
-sha256  971766d645aa73e93b9ef4e3be44201b4f45b5477095b049125403f9f3386d6f  postgresql-16.4.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v16.5/postgresql-16.5.tar.bz2.sha256
+sha256  a6cbbb7037f98cb8afa7d3970b7c48040cf02b115e39253a0c037a8bb8e778f0  postgresql-16.5.tar.bz2
 # License file, Locally calculated
 sha256  9bf20ee493926a7e17a74bc7f05089fbc014269667b1540bc35a6b194a40c9de  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 4021a54300..12693e625c 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 16.4
+POSTGRESQL_VERSION = 16.5
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
