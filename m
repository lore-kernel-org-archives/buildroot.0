Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B33C77B7C
	for <buildroot@archiver.kernel.org>; Fri, 12 May 2023 05:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8619042D2F;
	Fri, 12 May 2023 05:26:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8619042D2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YA8zJz0TPMkH; Fri, 12 May 2023 05:26:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAA0842D34;
	Fri, 12 May 2023 05:26:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAA0842D34
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 690BD1BF593
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 05:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4049042B90
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 05:26:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4049042B90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Y4tPYUrRv0b for <buildroot@lists.busybox.net>;
 Fri, 12 May 2023 05:26:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C31D42B53
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C31D42B53
 for <buildroot@buildroot.org>; Fri, 12 May 2023 05:26:38 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout12.t-online.de (Postfix) with SMTP id B654B6EF1;
 Fri, 12 May 2023 07:26:24 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.197.49]) by fwd86.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pxLIK-2g0JYP0; Fri, 12 May 2023 07:26:20 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:57038)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pxLIK-0001lO-1m;
 Fri, 12 May 2023 07:26:20 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 12 May 2023 07:26:20 +0200
Message-Id: <20230512052620.372820-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683869180-14ACBC77-0DC2281B/0/0 CLEAN NORMAL
X-TOI-MSGID: 9714260e-a6f5-4e58-8215-506b9b7ee3d4
Subject: [Buildroot] [PATCH 1/1] package/postgresql: security bump version
 to 15.3
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://www.postgresql.org/about/news/postgresql-153-148-1311-1215-and-1120-released-2637/

Fixes CVE-2023-2454 & CVE-2023-2455.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
