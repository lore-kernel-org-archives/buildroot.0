Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FFC107BCFE
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8445460F7B;
	Sat, 14 Mar 2026 07:49:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W_cl-SG34dES; Sat, 14 Mar 2026 07:49:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B40760F89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773474598;
	bh=//csUuKYurJtN3CVZzmBHL6GA2Doa1t+qsm3WKVGnbs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mdGNWiso8CCdUtaNb9rCzdLxJ74B2Lx5VKJJECmNgBH901y2r4eNgpST0P64PEm/U
	 vNvn72s/WF+ZlfL7vkcKyc4PVc0olWDJ6ORhF6I3zFD8mztmu+lF5GQzjAfZQosQ/W
	 Iwy4l2h0gL6svpvTsrmm9nWE21zxZL50ihmF0skSUnNmkaLMs8nZS5MITodEsVY1Ty
	 ShU2nrja+QlDxO8oJ80W1P5/bVIRyqed+36a83nB9VH23yJmR0iXArqtm5OBJQOGYG
	 cba8uGirj1dVQSxOj3tgTdM+V9sKL9ias99x8ikJc1Spm/ZJ3jyIoxD/A5r3ACU9go
	 kDigkeJDXxoWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B40760F89;
	Sat, 14 Mar 2026 07:49:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 01DCE1B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B625860EF4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LsAPvfsiZ59g for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:49:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC2E160EF6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC2E160EF6
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1474083D2D; Sat, 14 Mar 2026 07:49:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 16:10:17 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: bbbad699ae7d4a3409efaf97c47dd491d4eeca7a
X-Git-Newrev: 70302f9267f15e2f132731ef2b04a24f69bc9c28
X-Patchwork-Hint: ignore
Message-Id: <20260314074936.1474083D2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/postgresql: bump
 version to 18.3
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/70302f9267f15e2f132731ef2b04a24f69bc9c28
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://www.postgresql.org/about/news/postgresql-183-179-1613-1517-and-1422-released-3246/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d62b605c1aac355c6aae79a13d75f0ba8ce7ecd7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 8d47db5b7f..58eab8e548 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v18.2/postgresql-18.2.tar.bz2.sha256
-sha256  5245bd1b79700d55b8e0575be0325ef61e7bbef627e6a616e4cf36ad4687be36  postgresql-18.2.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v18.3/postgresql-18.3.tar.bz2.sha256
+sha256  d95663fbbf3a80f81a9d98d895266bdcb74ba274bcc04ef6d76630a72dee016f  postgresql-18.3.tar.bz2
 # License file, Locally calculated
 sha256  3d6af92ff8a4c2cdf69afb1cf44edea727922f5cd0cf8b5f72b11cdecac8fdfd  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 542fe05264..fed3887ef5 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 18.2
+POSTGRESQL_VERSION = 18.3
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
