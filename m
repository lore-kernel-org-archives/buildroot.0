Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADEF8C282C5
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 13:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 756A1836E1;
	Fri, 28 Feb 2025 13:57:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 71w6deN0V-9d; Fri, 28 Feb 2025 13:57:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80A0E8386E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80A0E8386E;
	Fri, 28 Feb 2025 13:57:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F54A94F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 13:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 079FF60AA5
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 13:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ZEVnS5fPOaO for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 13:57:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B93E6079D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B93E6079D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 13:57:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33E0087CD9; Fri, 28 Feb 2025 13:57:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Feb 2025 14:53:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2ef5e56d1f4f52e10ed1b04953f99d262002a7e5
X-Git-Newrev: 5297c761baf7430e961f4a406c7447d2e776414f
X-Patchwork-Hint: ignore
Message-Id: <20250228135747.33E0087CD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/postgresql: bump version to 17.4
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5297c761baf7430e961f4a406c7447d2e776414f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://www.postgresql.org/docs/release/17.4/
https://www.postgresql.org/about/news/postgresql-174-168-1512-1417-and-1320-released-3018/

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index e582510832..1c77119207 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v17.3/postgresql-17.3.tar.bz2.sha256
-sha256  13c18b35bf67a97bd639925fc581db7fd2aae4d3548eac39fcdb8da74ace2bea  postgresql-17.3.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v17.4/postgresql-17.4.tar.bz2.sha256
+sha256  c4605b73fea11963406699f949b966e5d173a7ee0ccaef8938dec0ca8a995fe7  postgresql-17.4.tar.bz2
 # License file, Locally calculated
 sha256  e3822c4797fadcab31a3fc73f75c28ac20c73d72b565da91e9974cf9398ef4d2  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index a9ca9f4ee1..2b6e78b941 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 17.3
+POSTGRESQL_VERSION = 17.4
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
