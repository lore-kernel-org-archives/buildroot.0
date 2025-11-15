Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB165CEB2DD
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 14:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94DC880D7D;
	Sat, 15 Nov 2025 14:09:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rfpy9GCBQQQO; Sat, 15 Nov 2025 14:09:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B758C80DFD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B758C80DFD;
	Sat, 15 Nov 2025 14:09:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B384D5
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 14:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4044B6084C
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 14:09:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r5bbQKilbPXl for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 14:09:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC7E260803
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC7E260803
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 14:09:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A496982573; Sat, 15 Nov 2025 14:09:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Nov 2025 14:51:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b7cd4018789678fbd20b1d70fdb8d6c063fb4eb
X-Git-Newrev: 1e8c666cd899c782a3320a56a1dc9e084788d156
X-Patchwork-Hint: ignore
Message-Id: <20251115140929.A496982573@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/postgresql: security bump to
 version 17.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=1e8c666cd899c782a3320a56a1dc9e084788d156
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://www.postgresql.org/about/news/postgresql-181-177-1611-1515-1420-and-1323-released-3171/

Fixes CVE-2025-12817 & CVE-2025-12818.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 3b5e773c65..efa1b5e751 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v17.6/postgresql-17.6.tar.bz2.sha256
-sha256  e0630a3600aea27511715563259ec2111cd5f4353a4b040e0be827f94cd7a8b0  postgresql-17.6.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v17.7/postgresql-17.7.tar.bz2.sha256
+sha256  ef9e343302eccd33112f1b2f0247be493cb5768313adeb558b02de8797a2e9b5  postgresql-17.7.tar.bz2
 # License file, Locally calculated
 sha256  5ed3ce5c9373dff7f98b1fae7a6c7ccd98df7d734d46d24c1bcebf1240be8307  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 31d0068328..86761bf939 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 17.6
+POSTGRESQL_VERSION = 17.7
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
