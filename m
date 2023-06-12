Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F93C7EE2E
	for <buildroot@archiver.kernel.org>; Mon, 12 Jun 2023 20:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C871404F8;
	Mon, 12 Jun 2023 20:22:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C871404F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id okIu1NZvV0gT; Mon, 12 Jun 2023 20:22:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9122F405A9;
	Mon, 12 Jun 2023 20:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9122F405A9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 453D51BF2BF
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 20:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F36B404F8
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 20:22:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F36B404F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id coD7X9hzSeeN for <buildroot@lists.busybox.net>;
 Mon, 12 Jun 2023 20:22:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB5E640160
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 20:22:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB5E640160
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8E2982840; Mon, 12 Jun 2023 20:22:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 12 Jun 2023 22:18:05 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 06d210fe5594fea3cecd23f975ce6568814bb2cb
X-Git-Newrev: a2c82a768eb26459991d7c2b7867554dffdc9208
X-Patchwork-Hint: ignore
Message-Id: <20230612202222.D8E2982840@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/postgresql:
 security bump version to 15.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=a2c82a768eb26459991d7c2b7867554dffdc9208
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Release notes:
https://www.postgresql.org/about/news/postgresql-153-148-1311-1215-and-1120-released-2637/

Fixes CVE-2023-2454 & CVE-2023-2455.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2c6206b2179eee98795a7a3a01d9432dd06f4e85)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 3e89d3ec35..da6ec7f311 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v15.2/postgresql-15.2.tar.bz2.sha256
-sha256  99a2171fc3d6b5b5f56b757a7a3cb85d509a38e4273805def23941ed2b8468c7  postgresql-15.2.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v15.3/postgresql-15.3.tar.bz2.sha256
+sha256  ffc7d4891f00ffbf5c3f4eab7fbbced8460b8c0ee63c5a5167133b9e6599d932  postgresql-15.3.tar.bz2
 # License file, Locally calculated
 sha256  1a7d13c3ab31961b91ba256f77d6e82e0b54bf992253060fe93bdb5466df416a  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index e46622c0e7..ca11a8191f 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 15.2
+POSTGRESQL_VERSION = 15.3
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
