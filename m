Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95887C25B79
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 21:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FF02822EE;
	Tue, 14 May 2024 21:55:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tf9qPe7vrsJx; Tue, 14 May 2024 21:55:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2393181971
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2393181971;
	Tue, 14 May 2024 21:55:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8CB291BF42D
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 21:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A1B7817D3
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 21:55:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MDpR8-kbpA9X for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 21:55:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7D3B3822CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D3B3822CB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D3B3822CB
 for <buildroot@buildroot.org>; Tue, 14 May 2024 21:55:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a09e6.dip0.t-ipconnect.de [91.58.9.230])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E1243A4C48EC;
 Tue, 14 May 2024 23:54:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59422)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1s7065-000000000Dp-3On0;
 Tue, 14 May 2024 21:54:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 14 May 2024 23:54:06 +0200
Message-Id: <20240514215406.2866563-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240514215406.2866563-1-bernd@kuhls.net>
References: <20240514215406.2866563-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1715723649;
 bh=dw40Cqg+GbGL9A3l2N1SHGJx+vmaMqvl2wCHH0XYMnY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iUYm40WRC/SMYDFM3xouuLRVF03oFgejSUfAE5a5lSqhIk8MoMTm1xF1+XHonQC3H
 S4L/pdnNIVaQSo9niaA2NYcTgr3FUImKavR8x9TeHQN96TziSwZ2E8rSpeVpmxD7Yu
 Vyh3eYdkqW80bc8xL7tErGmX5Fb5d0bMa97PmmmPTnztPWJOmwsgfVNusbiZjUG8Dg
 4Fbh9xobnkJRgb1RytzBGxyWs9z7K+iFUFvwBAE6RcYTQ+AMz+OZpJq6I0GSgTPdmQ
 5s8hbODEJcJhnca+3xdkr6D8Y0qUacL9S0tgQMLJYCzA2cDqzZGtA0uoVaG06M5NEv
 5rG4OOxf/kO1w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=iUYm40WR
Subject: [Buildroot] [PATCH 5/5] package/unixodbc: fix build with gcc 14.x
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
Cc: Gregory Dymarek <gregd72002@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...r-Fix-incompatible-pointer-to-intege.patch | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/unixodbc/0001-PostgreSQL-driver-Fix-incompatible-pointer-to-intege.patch

diff --git a/package/unixodbc/0001-PostgreSQL-driver-Fix-incompatible-pointer-to-intege.patch b/package/unixodbc/0001-PostgreSQL-driver-Fix-incompatible-pointer-to-intege.patch
new file mode 100644
index 0000000000..8efe6dae4e
--- /dev/null
+++ b/package/unixodbc/0001-PostgreSQL-driver-Fix-incompatible-pointer-to-intege.patch
@@ -0,0 +1,49 @@
+From 45f501e1be2db6b017cc242c79bfb9de32b332a1 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Mon, 29 Jan 2024 08:27:29 +0100
+Subject: [PATCH] PostgreSQL driver: Fix incompatible pointer-to-integer types
+
+These result in out-of-bounds stack writes on 64-bit architectures
+(caller has 4 bytes, callee writes 8 bytes), and seem to have gone
+unnoticed on little-endian architectures (although big-endian
+architectures must be broken).
+
+This change is required to avoid a build failure with GCC 14.
+
+Upstream: https://github.com/lurcher/unixODBC/commit/45f501e1be2db6b017cc242c79bfb9de32b332a1
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Drivers/Postgre7.1/info.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Drivers/Postgre7.1/info.c b/Drivers/Postgre7.1/info.c
+index 63ac91f..2216ecd 100644
+--- a/Drivers/Postgre7.1/info.c
++++ b/Drivers/Postgre7.1/info.c
+@@ -1779,14 +1779,14 @@ char *table_name;
+ char index_name[MAX_INFO_STRING];
+ short fields_vector[8];
+ char isunique[10], isclustered[10];
+-SDWORD index_name_len, fields_vector_len;
++SQLLEN index_name_len, fields_vector_len;
+ TupleNode *row;
+ int i;
+ HSTMT hcol_stmt;
+ StatementClass *col_stmt, *indx_stmt;
+ char column_name[MAX_INFO_STRING], relhasrules[MAX_INFO_STRING];
+ char **column_names = 0;
+-Int4 column_name_len;
++SQLLEN column_name_len;
+ int total_columns = 0;
+ char error = TRUE;
+ ConnInfo *ci;
+@@ -2136,7 +2136,7 @@ HSTMT htbl_stmt;
+ StatementClass *tbl_stmt;
+ char tables_query[STD_STATEMENT_LEN];
+ char attname[MAX_INFO_STRING];
+-SDWORD attname_len;
++SQLLEN attname_len;
+ char pktab[MAX_TABLE_LEN + 1];
+ Int2 result_cols;
+ 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
