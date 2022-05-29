Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD194C433F5
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 08:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81FDB41764;
	Sun, 29 May 2022 08:37:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QfGOtsyqMBjy; Sun, 29 May 2022 08:37:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8798F41760;
	Sun, 29 May 2022 08:37:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 02CFB1BF404
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 08:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D90D7426AD
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 08:35:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j6Ro1qj2H5Zd for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 08:35:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3A04426BD
 for <buildroot@buildroot.org>; Sun, 29 May 2022 08:35:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6028986536; Sun, 29 May 2022 08:24:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 10:25:28 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 74ceee961195c233e911a8f26da3721334195607
X-Git-Newrev: e57fd610eaf7b9552c61cb74dfaf687c57b59c2f
X-Patchwork-Hint: ignore
Message-Id: <20220529082411.6028986536@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/postgresql:
 security bump version to 14.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=e57fd610eaf7b9552c61cb74dfaf687c57b59c2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Release notes:
https://www.postgresql.org/about/news/postgresql-143-137-1211-1116-and-1021-released-2449/

Fixes CVE-2022-1552:
https://www.postgresql.org/support/security/CVE-2022-1552/

Removed patch which was committed upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f822e078499fae5b6a9311a53a54d4022b4f7ba5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0001-libpq-Fix-pkg-config-without-OpenSSL.patch | 34 ----------------------
 package/postgresql/postgresql.hash                 |  4 +--
 package/postgresql/postgresql.mk                   |  2 +-
 3 files changed, 3 insertions(+), 37 deletions(-)

diff --git a/package/postgresql/0001-libpq-Fix-pkg-config-without-OpenSSL.patch b/package/postgresql/0001-libpq-Fix-pkg-config-without-OpenSSL.patch
deleted file mode 100644
index 90b0577a20..0000000000
--- a/package/postgresql/0001-libpq-Fix-pkg-config-without-OpenSSL.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 465ab24296c27502c81c8c197725cba728b9b057 Mon Sep 17 00:00:00 2001
-From: Peter Eisentraut <peter@eisentraut.org>
-Date: Fri, 1 Apr 2022 17:12:56 +0200
-Subject: [PATCH] libpq: Fix pkg-config without OpenSSL
-
-Do not add OpenSSL dependencies to libpq pkg-config file if OpenSSL is
-not enabled.  Oversight in beff361bc1edc24ee5f8b2073a1e5e4c92ea66eb.
-
-Author: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Discussion: https://www.postgresql.org/message-id/flat/20220331163759.32665-1-fontaine.fabrice%40gmail.com
-[Retrieved from:
-https://git.postgresql.org/gitweb/?p=postgresql.git;a=commit;h=465ab24296c27502c81c8c197725cba728b9b057]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/interfaces/libpq/Makefile | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/interfaces/libpq/Makefile b/src/interfaces/libpq/Makefile
-index 89bf5e0126..b5fd72a4ac 100644
---- a/src/interfaces/libpq/Makefile
-+++ b/src/interfaces/libpq/Makefile
-@@ -95,7 +95,9 @@ SHLIB_PREREQS = submake-libpgport
- 
- SHLIB_EXPORTS = exports.txt
- 
-+ifeq ($(with_ssl),openssl)
- PKG_CONFIG_REQUIRES_PRIVATE = libssl libcrypto
-+endif
- 
- all: all-lib libpq-refs-stamp
- 
--- 
-2.30.2
-
diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 2ba3b07563..8ebe7b58fa 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,5 +1,5 @@
-# From https://ftp.postgresql.org/pub/source/v14.2/postgresql-14.2.tar.bz2.sha256
-sha256  2cf78b2e468912f8101d695db5340cf313c2e9f68a612fb71427524e8c9a977a  postgresql-14.2.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v14.3/postgresql-14.3.tar.bz2.sha256
+sha256  279057368bf59a919c05ada8f95c5e04abb43e74b9a2a69c3d46a20e07a9af38  postgresql-14.3.tar.bz2
 
 # License file, Locally calculated
 sha256  f6d6616acdb598742e2a7c64fa0551c1c72c309d279fd2d90370e5fdd41c8945  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 1dfb20b58d..45049f669d 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 14.2
+POSTGRESQL_VERSION = 14.3
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
