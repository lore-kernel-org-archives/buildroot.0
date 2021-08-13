Return-Path: <SRS0=Wz+O=NE=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A388DC4338F
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 04:36:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 215EE60EB5
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 04:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 215EE60EB5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3AE6605E2;
	Fri, 13 Aug 2021 04:36:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tr_rOr2gN2F1; Fri, 13 Aug 2021 04:36:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6285B60640;
	Fri, 13 Aug 2021 04:36:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 612141BF302
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 04:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B70F4035C
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 04:36:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fs1t3MX_hLXj for <buildroot@lists.busybox.net>;
 Fri, 13 Aug 2021 04:36:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE58C400D2
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 04:36:03 +0000 (UTC)
Received: from fwd07.aul.t-online.de (fwd07.aul.t-online.de [172.20.27.150])
 by mailout04.t-online.de (Postfix) with SMTP id E00F57F4A;
 Fri, 13 Aug 2021 06:35:59 +0200 (CEST)
Received: from fli4l.lan.fli4l
 (TQVBKeZUrh8bqfRIhUUulaSEyoIIdI7sENjIZ4gjV7Htn4cqOZIZ-A9OmNxkzcwZEo@[79.214.196.191])
 by fwd07.t-online.de with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mEOvE-0YB0sa0; Fri, 13 Aug 2021 06:35:56 +0200
Received: from mahler.lan.fli4l ([192.168.1.1]:56000)
 by fli4l.lan.fli4l with esmtp (Exim 4.94.2)
 (envelope-from <bernd.kuhls@t-online.de>)
 id 1mEOvD-0006Ub-N1; Fri, 13 Aug 2021 06:35:56 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 13 Aug 2021 06:35:55 +0200
Message-Id: <20210813043555.35590-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-ID: TQVBKeZUrh8bqfRIhUUulaSEyoIIdI7sENjIZ4gjV7Htn4cqOZIZ-A9OmNxkzcwZEo
X-TOI-EXPURGATEID: 150726::1628829356-00011901-1F7121E6/0/0 CLEAN NORMAL
X-TOI-MSGID: 850aaf57-c5f9-4989-bc9c-d9e5323881d6
Subject: [Buildroot] [PATCH 1/1] package/postgresql: security bump version
 to 13.4
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Release notes:
https://www.postgresql.org/about/news/postgresql-134-128-1113-1018-9623-and-14-beta-3-released-2277/

Fixes CVE-2021-3677:
https://www.postgresql.org/support/security/CVE-2021-3677/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index caa8a1f5e7..2dcc1823d6 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,5 +1,5 @@
-# From https://ftp.postgresql.org/pub/source/v13.3/postgresql-13.3.tar.bz2.sha256
-sha256  3cd9454fa8c7a6255b6743b767700925ead1b9ab0d7a0f9dcb1151010f8eb4a1  postgresql-13.3.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v13.4/postgresql-13.4.tar.bz2.sha256
+sha256  ea93e10390245f1ce461a54eb5f99a48d8cabd3a08ce4d652ec2169a357bc0cd  postgresql-13.4.tar.bz2
 
 # License file, Locally calculated
 sha256  31ccadc0a70e8e0e8a35c5833567b64388dfe34987d962e1911554e271294105  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 143bcd895a..3b6c6e21e7 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 13.3
+POSTGRESQL_VERSION = 13.4
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
