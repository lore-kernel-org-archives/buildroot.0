Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A5CC77B7C
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 10:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C83DD614D1;
	Thu,  4 May 2023 10:02:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C83DD614D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rUGaoUUAGprs; Thu,  4 May 2023 10:02:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D55C2614DF;
	Thu,  4 May 2023 10:02:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D55C2614DF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E49C1BF3CD
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 10:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46DE141F9F
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 10:02:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46DE141F9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UCZvXwvn9Ajc for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 10:02:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67B4241F9E
 for <buildroot@buildroot.org>; Thu,  4 May 2023 10:02:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67B4241F9E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5360A85B5E; Thu,  4 May 2023 10:02:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 4 May 2023 12:01:21 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 0ed29418ea59c28fe6f3cd4f8db9aa23a63b7241
X-Git-Newrev: 7d8b699c292dce2ea1f73b12adf8fa62ed8e5a44
X-Patchwork-Hint: ignore
Message-Id: <20230504100208.5360A85B5E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/postgresql:
 security bump to version 14.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d8b699c292dce2ea1f73b12adf8fa62ed8e5a44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Release notes: https://www.postgresql.org/docs/release/14.7/

Fixes: https://security-tracker.debian.org/tracker/CVE-2022-41862
Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 26bb626943..83b27a5fc0 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v14.6/postgresql-14.6.tar.bz2.sha256
-sha256  508840fc1809d39ab72274d5f137dabb9fd7fb4f933da4168aeebb20069edf22  postgresql-14.6.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v14.7/postgresql-14.7.tar.bz2.sha256
+sha256  cef60f0098fa8101c1546f4254e45b722af5431337945b37af207007630db331  postgresql-14.7.tar.bz2
 # License file, Locally calculated
 sha256  f6d6616acdb598742e2a7c64fa0551c1c72c309d279fd2d90370e5fdd41c8945  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 30a4d45737..a43c6bb953 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 14.6
+POSTGRESQL_VERSION = 14.7
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
