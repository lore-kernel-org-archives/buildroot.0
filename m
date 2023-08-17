Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2549C52CDC
	for <buildroot@archiver.kernel.org>; Thu, 17 Aug 2023 16:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0473141E42;
	Thu, 17 Aug 2023 16:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0473141E42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uyp20i5emKbX; Thu, 17 Aug 2023 16:22:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08B4041E4B;
	Thu, 17 Aug 2023 16:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08B4041E4B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F09371BF34C
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 16:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7EC981204
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 16:22:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7EC981204
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7qj0GaCcu7S8 for <buildroot@lists.busybox.net>;
 Thu, 17 Aug 2023 16:22:53 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 441A583FBC
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 16:22:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 441A583FBC
Received: from fli4l.lan.fli4l (p4fd6c625.dip0.t-ipconnect.de [79.214.198.37])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 40AC3A4C00BA;
 Thu, 17 Aug 2023 18:22:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46138)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qWflp-0007vJ-1z;
 Thu, 17 Aug 2023 18:22:49 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 17 Aug 2023 18:22:49 +0200
Message-Id: <20230817162249.449943-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1692289370;
 bh=qiBgb4iN3gBV20X4QLv54a2VM6u172WIaqTkQtVnntk=;
 h=From:To:Cc:Subject:Date:From;
 b=hGvb9G2OsqD9rTV2inrWjg0suIH42IbQxGY+meL6ESZOB5DDq1iniimLAfZQJGdHa
 fDdDFBviu3JODEpHIlkCVIcGqenyKIN6mrx29l7GGQKJh3dXBnBV25XcwZqRnCzATZ
 QYy85SDIbfwK1hce9WLTBClt4wBpib3+DvgwbZ3hyX80j0UfjAUmyZWDOX0UFNQk9C
 ci9L2hLN3Dk8n4muBwjN0DeNR6BtQ2ePWKzHGPJsnBtrus9fWQXGg8uXs6tRaQc1MS
 LZnsJ3D1bTTq2h28Oc9DMr/V4O5krgnmTuDSF35VvJ4J7tKIKKr95gM/ED38VAhIMt
 gidmynj8bPBaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=hGvb9G2O
Subject: [Buildroot] [PATCH 1/1] package/postgresql: security bump version
 to 15.4
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
https://www.postgresql.org/about/news/postgresql-154-149-1312-1216-1121-and-postgresql-16-beta-3-released-2689/

Fixes CVE-2023-39417 & CVE-2023-39418.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index da6ec7f311..0640f883a7 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v15.3/postgresql-15.3.tar.bz2.sha256
-sha256  ffc7d4891f00ffbf5c3f4eab7fbbced8460b8c0ee63c5a5167133b9e6599d932  postgresql-15.3.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v15.4/postgresql-15.4.tar.bz2.sha256
+sha256  baec5a4bdc4437336653b6cb5d9ed89be5bd5c0c58b94e0becee0a999e63c8f9  postgresql-15.4.tar.bz2
 # License file, Locally calculated
 sha256  1a7d13c3ab31961b91ba256f77d6e82e0b54bf992253060fe93bdb5466df416a  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index ca11a8191f..b951b14aa0 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 15.3
+POSTGRESQL_VERSION = 15.4
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
