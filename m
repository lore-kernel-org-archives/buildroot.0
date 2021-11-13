Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 098A7C433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 17:10:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C724B6113B
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 17:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C724B6113B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 856AD4027C;
	Sat, 13 Nov 2021 17:10:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4PCKJOi_--FB; Sat, 13 Nov 2021 17:10:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 982F740154;
	Sat, 13 Nov 2021 17:10:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 93CA81BF370
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 17:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8378E80E00
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 17:10:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e2R8O124za2y for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 17:10:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84CBA80DFD
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 17:10:23 +0000 (UTC)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
 by mailout03.t-online.de (Postfix) with SMTP id A45426C25;
 Sat, 13 Nov 2021 18:07:10 +0100 (CET)
Received: from fli4l.lan.fli4l ([91.58.5.80]) by fwd88.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mlwUg-454lhh0; Sat, 13 Nov 2021 18:07:10 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:57768)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mlwUf-0002lH-IP;
 Sat, 13 Nov 2021 18:07:09 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 18:07:09 +0100
Message-Id: <20211113170709.2795770-3-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211113170709.2795770-1-bernd.kuhls@t-online.de>
References: <20211113170709.2795770-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1636823230-00001485-1B38DCED/0/0 CLEAN NORMAL
X-TOI-MSGID: 61b28f32-1198-4da2-bdae-45b993d7741d
Subject: [Buildroot] [PATCH/next v2 3/3] package/postgresql: bump version to
 14.1
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>, Peter Seiderer <ps.report@gmx.net>,
 Will Newton <will.newton@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://www.postgresql.org/about/news/postgresql-14-released-2318/
https://www.postgresql.org/about/news/postgresql-141-135-129-1114-1019-and-9624-released-2349/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: no changes, added bump for timescaledb to patch series.

 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 7e25c08aad..c2017a1226 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,5 +1,5 @@
-# From https://ftp.postgresql.org/pub/source/v13.5/postgresql-13.5.tar.bz2.sha256
-sha256  9b81067a55edbaabc418aacef457dd8477642827499560b00615a6ea6c13f6b3  postgresql-13.5.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v14.1/postgresql-14.1.tar.bz2.sha256
+sha256  4d3c101ea7ae38982f06bdc73758b53727fb6402ecd9382006fa5ecc7c2ca41f  postgresql-14.1.tar.bz2
 
 # License file, Locally calculated
 sha256  31ccadc0a70e8e0e8a35c5833567b64388dfe34987d962e1911554e271294105  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index e40ab45c20..32aef0c68c 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 13.5
+POSTGRESQL_VERSION = 14.1
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
