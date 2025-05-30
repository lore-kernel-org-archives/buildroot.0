Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84715C71141
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 08:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20E58616D6;
	Thu, 12 Jun 2025 08:40:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lgeNXHekP4oV; Thu, 12 Jun 2025 08:40:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27DF6616DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27DF6616DF;
	Thu, 12 Jun 2025 08:40:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7709F1BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D9F1405A2
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uQJgM8T5kMul for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 08:38:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 577524214C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 577524214C
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54924817E6; Thu, 12 Jun 2025 08:38:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 30 May 2025 21:52:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c87a81dec00b027d4e7ab38a36804110cfec736
X-Git-Newrev: 5cff68d42c80e2ce619a3dc7c0f6c87d0f037e8f
X-Patchwork-Hint: ignore
Message-Id: <20250612083831.54924817E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/timescaledb: bump version to 2.20.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5cff68d42c80e2ce619a3dc7c0f6c87d0f037e8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://github.com/timescale/timescaledb/blob/2.20.0/CHANGELOG.md

Add the PG_PATH variable to ensure that CMake can find the "pg_config" program.
Otherwise, the following error will be reported.
CMake Error at CMakeLists.txt:85 (message):
  Unable to find 'pg_config'

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index 3318d4614f..4ca325b2d7 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ef2c9019f3e292f77e274a95386e550cb8c358ec0e053f6b7097565f61381e01  timescaledb-2.19.3.tar.gz
+sha256  b6ac4c29ef29e93249fcc25bf193dab2637422797360b12e00fd73067138a953  timescaledb-2.20.0.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 024a72d4f4..00e2eb81ea 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.19.3
+TIMESCALEDB_VERSION = 2.20.0
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
@@ -23,6 +23,7 @@ TIMESCALEDB_CONF_OPTS = \
 	-DPG_PKGLIBDIR=lib/postgresql \
 	-DPG_SHAREDIR=share/postgresql \
 	-DPG_BINDIR=bin \
+	-DPG_PATH="$(STAGING_DIR)/usr" \
 	-DPG_CPPFLAGS="$(TARGET_CPPFLAGS) " \
 	-DPG_CFLAGS="$(TARGET_CFLAGS) " \
 	-DPG_LDFLAGS="$(TARGET_LDFLAGS) " \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
