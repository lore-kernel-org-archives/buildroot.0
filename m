Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46538CCD1BF
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 22:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B29F81355;
	Sat, 25 Oct 2025 22:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OBrKb8DSgVHt; Sat, 25 Oct 2025 22:07:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F4BB81339
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F4BB81339;
	Sat, 25 Oct 2025 22:07:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CEC2DA1
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 22:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1950E81334
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 22:07:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SJD3DN-TS0Fr for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 22:07:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 545F68117D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 545F68117D
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 22:07:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C0F4878CF; Sat, 25 Oct 2025 22:07:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 26 Oct 2025 00:06:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 05d1690e7cd4cebc4131ca4ca1dbe8dab4ada50b
X-Git-Newrev: 991cb9d36c84ea70d904e03ccd493ea697fda01b
X-Patchwork-Hint: ignore
Message-Id: <20251025220740.4C0F4878CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/unixodbc: bump version to 2.3.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=991cb9d36c84ea70d904e03ccd493ea697fda01b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/lurcher/unixODBC/releases/tag/v2.3.13
https://github.com/lurcher/unixODBC/releases/tag/v2.3.14

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...driver-Fix-incompatible-pointer-to-intege.patch | 49 ----------------------
 package/unixodbc/unixodbc.hash                     |  2 +-
 package/unixodbc/unixodbc.mk                       |  2 +-
 3 files changed, 2 insertions(+), 51 deletions(-)

diff --git a/package/unixodbc/0001-PostgreSQL-driver-Fix-incompatible-pointer-to-intege.patch b/package/unixodbc/0001-PostgreSQL-driver-Fix-incompatible-pointer-to-intege.patch
deleted file mode 100644
index 8efe6dae4e..0000000000
--- a/package/unixodbc/0001-PostgreSQL-driver-Fix-incompatible-pointer-to-intege.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 45f501e1be2db6b017cc242c79bfb9de32b332a1 Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Mon, 29 Jan 2024 08:27:29 +0100
-Subject: [PATCH] PostgreSQL driver: Fix incompatible pointer-to-integer types
-
-These result in out-of-bounds stack writes on 64-bit architectures
-(caller has 4 bytes, callee writes 8 bytes), and seem to have gone
-unnoticed on little-endian architectures (although big-endian
-architectures must be broken).
-
-This change is required to avoid a build failure with GCC 14.
-
-Upstream: https://github.com/lurcher/unixODBC/commit/45f501e1be2db6b017cc242c79bfb9de32b332a1
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- Drivers/Postgre7.1/info.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/Drivers/Postgre7.1/info.c b/Drivers/Postgre7.1/info.c
-index 63ac91f..2216ecd 100644
---- a/Drivers/Postgre7.1/info.c
-+++ b/Drivers/Postgre7.1/info.c
-@@ -1779,14 +1779,14 @@ char *table_name;
- char index_name[MAX_INFO_STRING];
- short fields_vector[8];
- char isunique[10], isclustered[10];
--SDWORD index_name_len, fields_vector_len;
-+SQLLEN index_name_len, fields_vector_len;
- TupleNode *row;
- int i;
- HSTMT hcol_stmt;
- StatementClass *col_stmt, *indx_stmt;
- char column_name[MAX_INFO_STRING], relhasrules[MAX_INFO_STRING];
- char **column_names = 0;
--Int4 column_name_len;
-+SQLLEN column_name_len;
- int total_columns = 0;
- char error = TRUE;
- ConnInfo *ci;
-@@ -2136,7 +2136,7 @@ HSTMT htbl_stmt;
- StatementClass *tbl_stmt;
- char tables_query[STD_STATEMENT_LEN];
- char attname[MAX_INFO_STRING];
--SDWORD attname_len;
-+SQLLEN attname_len;
- char pktab[MAX_TABLE_LEN + 1];
- Int2 result_cols;
- 
diff --git a/package/unixodbc/unixodbc.hash b/package/unixodbc/unixodbc.hash
index 6262dab5ae..e81448adbd 100644
--- a/package/unixodbc/unixodbc.hash
+++ b/package/unixodbc/unixodbc.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  f210501445ce21bf607ba51ef8c125e10e22dffdffec377646462df5f01915ec  unixODBC-2.3.12.tar.gz
+sha256  4e2814de3e01fc30b0b9f75e83bb5aba91ab0384ee951286504bb70205524771  unixODBC-2.3.14.tar.gz
 sha256  a6b9aa1e9bfade121164c06fd975e9b913a8e38bf33d25ff967dfa3ed07d12f8  COPYING
 sha256  1e594f4c7fd6d099eca4bd1340b39d871ce0298331d8ebd4b68935548ee45cf4  exe/COPYING
diff --git a/package/unixodbc/unixodbc.mk b/package/unixodbc/unixodbc.mk
index 302b964a44..47c08a39eb 100644
--- a/package/unixodbc/unixodbc.mk
+++ b/package/unixodbc/unixodbc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNIXODBC_VERSION = 2.3.12
+UNIXODBC_VERSION = 2.3.14
 UNIXODBC_SOURCE = unixODBC-$(UNIXODBC_VERSION).tar.gz
 UNIXODBC_SITE = http://www.unixodbc.org
 UNIXODBC_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
