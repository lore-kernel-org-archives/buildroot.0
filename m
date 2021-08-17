Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64D68C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:12:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D02C360FD9
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:12:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D02C360FD9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A610F402A4;
	Thu, 26 Aug 2021 22:12:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xU78r2ok5ZGz; Thu, 26 Aug 2021 22:11:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C4F3426C4;
	Thu, 26 Aug 2021 22:11:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D63D31BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77F76614A9
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id soiefIWPGEeh for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF9AE614AE
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 507CE8DC52; Thu, 26 Aug 2021 22:01:31 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 23:20:22 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8ac2e5e46fd38b2da8cc292587e91d7b3d4710bf
X-Git-Newrev: 743f3a4c54ae96c75eb2bd55f9bf4d8a13d853e7
X-Patchwork-Hint: ignore
Message-Id: <20210826220131.507CE8DC52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/postgresql: security
 bump version to 13.4
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=743f3a4c54ae96c75eb2bd55f9bf4d8a13d853e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://www.postgresql.org/about/news/postgresql-134-128-1113-1018-9623-and-14-beta-3-released-2277/

Fixes CVE-2021-3677:
https://www.postgresql.org/support/security/CVE-2021-3677/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
