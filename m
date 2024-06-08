Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007B8C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 19:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C468C84C47;
	Sat,  8 Jun 2024 19:17:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m30lQiFfS-Vf; Sat,  8 Jun 2024 19:17:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E08C84C69
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E08C84C69;
	Sat,  8 Jun 2024 19:17:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B2CC1BF407
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09EAF401A1
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OhmS-nZotSCh for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 19:15:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9D604042A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9D604042A
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 19:15:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2A1087C6F; Sat,  8 Jun 2024 19:15:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 20:09:29 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 6720ffa694790e66bd181553151f81ffd36ea351
X-Git-Newrev: 32fbe9e54c072dfec5b5753e2491e2c3c65f6ee1
X-Patchwork-Hint: ignore
Message-Id: <20240608191501.E2A1087C6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/zip: download
 from sourceforge
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

commit: https://git.buildroot.net/buildroot/commit/?id=32fbe9e54c072dfec5b5753e2491e2c3c65f6ee1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The tarball (with .tar.gz extension but same content) is also available over
https from sourceforge, so use that instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit e5993e6cd493dd6329bbf54cd7c19c5862a8a1e6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zip/zip.hash | 2 +-
 package/zip/zip.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/zip/zip.hash b/package/zip/zip.hash
index eb4bbf3b03..cbb96beb31 100644
--- a/package/zip/zip.hash
+++ b/package/zip/zip.hash
@@ -1,3 +1,3 @@
 # Locally calculated from download (no sig, hash)
-sha256  f0e8bb1f9b7eb0b01285495a2699df3a4b766784c1765a8f1aeedf63c0806369  zip30.tgz
+sha256  f0e8bb1f9b7eb0b01285495a2699df3a4b766784c1765a8f1aeedf63c0806369  zip30.tar.gz
 sha256  8ecd6c1bab449127eb665cef1561e73a8bce52e217375f6f466939e137b1e110  LICENSE
diff --git a/package/zip/zip.mk b/package/zip/zip.mk
index 3aa59e7ba7..0457ba9414 100644
--- a/package/zip/zip.mk
+++ b/package/zip/zip.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 ZIP_VERSION = 3.0
-# The version is really 3.0, but the tarball is named zip30.tgz
-ZIP_SOURCE = zip$(subst .,,$(ZIP_VERSION)).tgz
-ZIP_SITE = ftp://ftp.info-zip.org/pub/infozip/src
+# The version is really 3.0, but the tarball is named zip30.tar.gz
+ZIP_SOURCE = zip$(subst .,,$(ZIP_VERSION)).tar.gz
+ZIP_SITE = https://sourceforge.net/projects/infozip/files/Zip%203.x%20%28latest%29/$(ZIP_VERSION)
 ZIP_LICENSE = Info-ZIP
 ZIP_LICENSE_FILES = LICENSE
 ZIP_CPE_ID_VENDOR = info-zip_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
