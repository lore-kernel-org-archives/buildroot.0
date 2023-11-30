Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18043C4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 08:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8CA460608;
	Thu, 30 Nov 2023 08:39:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8CA460608
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N9ZJb1KQKwxd; Thu, 30 Nov 2023 08:39:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D20126F57B;
	Thu, 30 Nov 2023 08:39:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D20126F57B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE8011BF23B
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C438684449
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:38:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C438684449
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jJc84p_PGPLI for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 08:38:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 706F184487
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 08:38:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 706F184487
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6066587601; Thu, 30 Nov 2023 08:38:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 09:25:45 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 8212d48c118456c1ca6a293c5e21adaeed2228d7
X-Git-Newrev: ec2238b8bcdd114a1d0b0f0db9027f887e990c39
X-Patchwork-Hint: ignore
Message-Id: <20231130083815.6066587601@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/postgresql:
 security bump version to 15.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=ec2238b8bcdd114a1d0b0f0db9027f887e990c39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Release notes:
https://www.postgresql.org/about/news/postgresql-161-155-1410-1313-1217-and-1122-released-2749/

Fixes CVE-2023-5868, CVE-2023-5869, CVE-2023-5870.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4d549c071dcc7ede701ee91cb39bc4a9a2be7baf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 0640f883a7..4fc3bfcff0 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v15.4/postgresql-15.4.tar.bz2.sha256
-sha256  baec5a4bdc4437336653b6cb5d9ed89be5bd5c0c58b94e0becee0a999e63c8f9  postgresql-15.4.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v15.4/postgresql-15.5.tar.bz2.sha256
+sha256  8f53aa95d78eb8e82536ea46b68187793b42bba3b4f65aa342f540b23c9b10a6  postgresql-15.5.tar.bz2
 # License file, Locally calculated
 sha256  1a7d13c3ab31961b91ba256f77d6e82e0b54bf992253060fe93bdb5466df416a  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index b951b14aa0..3108fe65e1 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 15.4
+POSTGRESQL_VERSION = 15.5
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
