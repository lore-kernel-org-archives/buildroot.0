Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F22EE4996
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 13:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B645B410A7;
	Mon, 21 Aug 2023 13:54:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B645B410A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ewwuQMbl8Gzq; Mon, 21 Aug 2023 13:54:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDC5340A02;
	Mon, 21 Aug 2023 13:54:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDC5340A02
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A84B21BF2F2
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 13:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E48C40A02
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 13:54:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E48C40A02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mnAGd6gO_k8q for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 13:54:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B444409FB
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 13:54:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B444409FB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72D5C85FCF; Mon, 21 Aug 2023 13:54:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Aug 2023 15:51:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db46428e0ad00b6916fff2a41a33a45db8fb778f
X-Git-Newrev: 31ddf22ff6466f54817c944eaeca67cfc028a50b
X-Patchwork-Hint: ignore
Message-Id: <20230821135411.72D5C85FCF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/postgresql: security bump version
 to 15.4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=31ddf22ff6466f54817c944eaeca67cfc028a50b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://www.postgresql.org/about/news/postgresql-154-149-1312-1216-1121-and-postgresql-16-beta-3-released-2689/

Fixes CVE-2023-39417 & CVE-2023-39418.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index da6ec7f311..0640f883a7 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v15.3/postgresql-15.3.tar.bz2.sha256
-sha256  ffc7d4891f00ffbf5c3f4eab7fbbced8460b8c0ee63c5a5167133b9e6599d932  postgresql-15.3.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v15.4/postgresql-15.4.tar.bz2.sha256
+sha256  baec5a4bdc4437336653b6cb5d9ed89be5bd5c0c58b94e0becee0a999e63c8f9  postgresql-15.4.tar.bz2
 # License file, Locally calculated
 sha256  1a7d13c3ab31961b91ba256f77d6e82e0b54bf992253060fe93bdb5466df416a  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index ca11a8191f..b951b14aa0 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 15.3
+POSTGRESQL_VERSION = 15.4
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
