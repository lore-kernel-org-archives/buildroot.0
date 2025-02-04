Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2C5C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3346950843;
	Fri, 28 Feb 2025 17:13:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7AHEoD-fmvnn; Fri, 28 Feb 2025 17:13:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70C5B5083C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70C5B5083C;
	Fri, 28 Feb 2025 17:13:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 148351DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B4C44249C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1OZouZyBqmSR for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36A0442F4D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36A0442F4D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D6F37FDE0; Fri, 28 Feb 2025 16:30:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 17:43:33 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: dc55e7eb518e1c0d81d1ed1cb9b0f0ae6f75a454
X-Git-Newrev: 9cd3464afa13fd0190fb3e94fd850cc8063cf297
X-Patchwork-Hint: ignore
Message-Id: <20250228163032.2D6F37FDE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/taglib: bump version
 to 2.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=9cd3464afa13fd0190fb3e94fd850cc8063cf297
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog: https://github.com/taglib/taglib/blob/master/CHANGELOG.md

Needs utfcpp:
https://github.com/taglib/taglib/commit/6ed0ca28db0d12a75572c0f5dcefdc5ebb34cc21

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/taglib/Config.in   | 1 +
 package/taglib/taglib.hash | 2 +-
 package/taglib/taglib.mk   | 5 +++--
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/taglib/Config.in b/package/taglib/Config.in
index 6a87a13215..5b641a9653 100644
--- a/package/taglib/Config.in
+++ b/package/taglib/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_TAGLIB
 	bool "taglib"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_UTFCPP
 	help
 	  TagLib is a library for reading and editing the meta-data of
 	  several popular audio formats. Currently it supports both
diff --git a/package/taglib/taglib.hash b/package/taglib/taglib.hash
index e83aa451f3..bbf5dd26d5 100644
--- a/package/taglib/taglib.hash
+++ b/package/taglib/taglib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  c8da2b10f1bfec2cd7dbfcd33f4a2338db0765d851a50583d410bacf055cfd0b  taglib-1.13.1.tar.gz
+sha256  0de288d7fe34ba133199fd8512f19cc1100196826eafcb67a33b224ec3a59737  taglib-2.0.2.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256  53692a2ed6c6a2c6ec9b32dd0b820dfae91e0a1fcdf625ca9ed0bdf8705fcc4f  COPYING.MPL
diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index 9bdf05b85d..4ac51cf162 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-TAGLIB_VERSION = 1.13.1
-TAGLIB_SITE = http://taglib.github.io/releases
+TAGLIB_VERSION = 2.0.2
+TAGLIB_SITE = https://taglib.org/releases
 TAGLIB_INSTALL_STAGING = YES
+TAGLIB_DEPENDENCIES = utfcpp
 TAGLIB_LICENSE = LGPL-2.1 or MPL-1.1
 TAGLIB_LICENSE_FILES = COPYING.LGPL COPYING.MPL
 TAGLIB_CPE_ID_VENDOR = taglib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
