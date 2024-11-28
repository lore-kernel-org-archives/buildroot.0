Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48447D70DEB
	for <buildroot@archiver.kernel.org>; Thu, 28 Nov 2024 18:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2A3E81447;
	Thu, 28 Nov 2024 18:50:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ODbuGGPFg30F; Thu, 28 Nov 2024 18:50:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8A2C8144A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8A2C8144A;
	Thu, 28 Nov 2024 18:50:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7163771F
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 18:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DB134075E
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 18:50:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZbPaCG68mav for <buildroot@buildroot.org>;
 Thu, 28 Nov 2024 18:50:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3528340713
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3528340713
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 18:50:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F04586712; Thu, 28 Nov 2024 18:50:23 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 28 Nov 2024 19:44:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed590a22e24bdc714d75005f7fe7a3ad3b001c4d
X-Git-Newrev: 20c2b2f76cda507a3b0dc12ea75b2b7e13bef10e
X-Patchwork-Hint: ignore
Message-Id: <20241128185023.1F04586712@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/postgresql: bump version to 16.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=20c2b2f76cda507a3b0dc12ea75b2b7e13bef10e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://www.postgresql.org/docs/release/16.6/

Note: this minor version bump fixes a bug introduced in postgresql
security bump to 16.5 fixing CVE-2024-10978.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
[Julien: add note in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 6a15f78628..88730dc353 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v16.5/postgresql-16.5.tar.bz2.sha256
-sha256  a6cbbb7037f98cb8afa7d3970b7c48040cf02b115e39253a0c037a8bb8e778f0  postgresql-16.5.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v16.6/postgresql-16.6.tar.bz2.sha256
+sha256  23369cdaccd45270ac5dcc30fa9da205d5be33fa505e1f17a0418d2caeca477b  postgresql-16.6.tar.bz2
 # License file, Locally calculated
 sha256  9bf20ee493926a7e17a74bc7f05089fbc014269667b1540bc35a6b194a40c9de  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 12693e625c..4656eba3d8 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 16.5
+POSTGRESQL_VERSION = 16.6
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
