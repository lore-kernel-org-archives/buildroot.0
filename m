Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF696ECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 08:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A350960B51;
	Sat, 17 Sep 2022 08:14:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A350960B51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qYxB7V59Jip7; Sat, 17 Sep 2022 08:14:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E960360D4E;
	Sat, 17 Sep 2022 08:14:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E960360D4E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 82DBB1BF82F
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 08:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D9C460D4E
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 08:13:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D9C460D4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SGsxbalorySh for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 08:13:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF2DD60BE4
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 08:13:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF2DD60BE4
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BD92983FBA; Sat, 17 Sep 2022 08:13:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 08:46:25 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 131db884ce6f0baeea612d5e9c1a0ba2a64c68c7
X-Git-Newrev: 410bc6afcdc7975163481ce82dc235a506ebd5a6
X-Patchwork-Hint: ignore
Message-Id: <20220917081344.BD92983FBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/postgresql:
 security bump version to 14.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=410bc6afcdc7975163481ce82dc235a506ebd5a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Release notes:
https://www.postgresql.org/about/news/postgresql-145-138-1212-1117-1022-and-15-beta-3-released-2496/

Fixes CVE-2022-2625:
https://www.postgresql.org/support/security/CVE-2022-2625/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 167cbd76eea17d5995f6e4f88e34d8b3f795cc33)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.hash | 5 ++---
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index b2e94195e1..8fdaadde99 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,5 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v14.4/postgresql-14.4.tar.bz2.sha256
-sha256  c23b6237c5231c791511bdc79098617d6852e9e3bdf360efd8b5d15a1a3d8f6a  postgresql-14.4.tar.bz2
-
+# From https://ftp.postgresql.org/pub/source/v14.5/postgresql-14.5.tar.bz2.sha256
+sha256  d4f72cb5fb857c9a9f75ec8cf091a1771272802f2178f0b2e65b7b6ff64f4a30  postgresql-14.5.tar.bz2
 # License file, Locally calculated
 sha256  f6d6616acdb598742e2a7c64fa0551c1c72c309d279fd2d90370e5fdd41c8945  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index c893f8026c..32a44bef0f 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 14.4
+POSTGRESQL_VERSION = 14.5
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
