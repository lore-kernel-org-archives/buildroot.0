Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A12C5321D
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 08:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45D2D404EC;
	Mon, 26 Aug 2024 08:06:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JmiE0GcjR9k9; Mon, 26 Aug 2024 08:06:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0144C4056D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0144C4056D;
	Mon, 26 Aug 2024 08:06:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 818A01BF2A1
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 08:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DD7660744
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 08:06:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TuUneqkaawAd for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 08:06:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A163E60723
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A163E60723
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 08:06:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B8F086315; Mon, 26 Aug 2024 08:06:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 26 Aug 2024 10:01:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e33db30aab02188c8b3aae6451d26288d06d7a15
X-Git-Newrev: 10088427cf3b714db85a1d10e6a023c2639bd790
X-Patchwork-Hint: ignore
Message-Id: <20240826080613.9B8F086315@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/postgresql: security bump version
 to 16.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=10088427cf3b714db85a1d10e6a023c2639bd790
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
 - https://www.postgresql.org/docs/release/16.4/
 - https://www.postgresql.org/about/news/postgresql-164-158-1413-1316-1220-and-17-beta-3-released-2910/

Fixes CVE-2024-7348:
 - https://www.postgresql.org/support/security/CVE-2024-7348/

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index d917a03ebb..1d9a9081b7 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v16.2/postgresql-16.3.tar.bz2.sha256
-sha256  331963d5d3dc4caf4216a049fa40b66d6bcb8c730615859411b9518764e60585  postgresql-16.3.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v16.4/postgresql-16.4.tar.bz2.sha256
+sha256  971766d645aa73e93b9ef4e3be44201b4f45b5477095b049125403f9f3386d6f  postgresql-16.4.tar.bz2
 # License file, Locally calculated
 sha256  9bf20ee493926a7e17a74bc7f05089fbc014269667b1540bc35a6b194a40c9de  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 0a1d98079a..4021a54300 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 16.3
+POSTGRESQL_VERSION = 16.4
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
