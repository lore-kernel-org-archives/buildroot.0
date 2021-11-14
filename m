Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA78AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 13:54:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7923D60F6B
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 13:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7923D60F6B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52E5B80CF4;
	Sun, 14 Nov 2021 13:54:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ncx4pUtvC-UZ; Sun, 14 Nov 2021 13:54:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BAA680CDA;
	Sun, 14 Nov 2021 13:53:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5672C1BF3E0
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 13:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 514C560592
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 13:53:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6o77Sn1s4rMF for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 13:53:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80DB760699
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 13:53:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 287508CA9B; Sun, 14 Nov 2021 13:49:27 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 14:53:17 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f250847551b4f1314ea69e026125c225605fd840
X-Git-Newrev: 0f31b1f19cd2f81c2e7fe7a0600c150b8f555fe2
X-Patchwork-Hint: ignore
Message-Id: <20211114134927.287508CA9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/postgresql: security
 bump version to 13.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f31b1f19cd2f81c2e7fe7a0600c150b8f555fe2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://www.postgresql.org/about/news/postgresql-141-135-129-1114-1019-and-9624-released-2349/

Fixes CVE-2021-23214 and CVE-2021-23222.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 2dcc1823d6..7e25c08aad 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,5 +1,5 @@
-# From https://ftp.postgresql.org/pub/source/v13.4/postgresql-13.4.tar.bz2.sha256
-sha256  ea93e10390245f1ce461a54eb5f99a48d8cabd3a08ce4d652ec2169a357bc0cd  postgresql-13.4.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v13.5/postgresql-13.5.tar.bz2.sha256
+sha256  9b81067a55edbaabc418aacef457dd8477642827499560b00615a6ea6c13f6b3  postgresql-13.5.tar.bz2
 
 # License file, Locally calculated
 sha256  31ccadc0a70e8e0e8a35c5833567b64388dfe34987d962e1911554e271294105  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 3b6c6e21e7..e40ab45c20 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 13.4
+POSTGRESQL_VERSION = 13.5
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
