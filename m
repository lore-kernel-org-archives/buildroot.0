Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDEFDC678DB
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 14:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D76181B25;
	Sun,  5 Mar 2023 14:27:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D76181B25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id srACXfs2lH91; Sun,  5 Mar 2023 14:27:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B023A81CA0;
	Sun,  5 Mar 2023 14:27:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B023A81CA0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C27071BF41B
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 14:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA22740907
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 14:27:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA22740907
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LetQR_yyDiSc for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 14:27:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96BCD408F9
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 14:27:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96BCD408F9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83D398629D; Sun,  5 Mar 2023 14:27:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Mar 2023 15:22:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5c6ff24dccb7fec54e7fa43af9f987b95eba1f8
X-Git-Newrev: 0c29b4281d5a1c55739c62438f8d7676d7a16823
X-Patchwork-Hint: ignore
Message-Id: <20230305142700.83D398629D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/exfat: security bump to version
 1.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c29b4281d5a1c55739c62438f8d7676d7a16823
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Fix CVE-2022-29973: relan exFAT 1.3.0 allows local users to obtain
  sensitive information (data from deleted files in the filesystem) in
  certain situations involving offsets beyond ValidDataLength.
- libfuse3 is supported since
  https://github.com/relan/exfat/commit/7cbc1544a4f68d8b4d33b187a053fc554405c56e

https://github.com/relan/exfat/releases/tag/v1.4.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exfat/Config.in  | 2 +-
 package/exfat/exfat.hash | 2 +-
 package/exfat/exfat.mk   | 6 ++++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/exfat/Config.in b/package/exfat/Config.in
index c0b4eabe11..c0ed2570d9 100644
--- a/package/exfat/Config.in
+++ b/package/exfat/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_EXFAT
 	depends on BR2_USE_MMU # libfuse
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS # libfuse
-	select BR2_PACKAGE_LIBFUSE
+	select BR2_PACKAGE_LIBFUSE3 if !BR2_PACKAGE_LIBFUSE
 	help
 	  A full-featured exFAT file system implementation for GNU/Linux
 	  and other Unix-like systems as a FUSE module.
diff --git a/package/exfat/exfat.hash b/package/exfat/exfat.hash
index b40fc7f0e5..c6082a403a 100644
--- a/package/exfat/exfat.hash
+++ b/package/exfat/exfat.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  07652136064da5e4d32df5555f88c138ffa4835a23b88a5bae2015f21006e0d3  fuse-exfat-1.3.0.tar.gz
+sha256  a1cfedc55e0e7a12c184605aa0f0bf44b24a3fb272449b20b2c8bbe6edb3001e  fuse-exfat-1.4.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/exfat/exfat.mk b/package/exfat/exfat.mk
index c0ef77a113..a8efe5b0ba 100644
--- a/package/exfat/exfat.mk
+++ b/package/exfat/exfat.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
-EXFAT_VERSION = 1.3.0
+EXFAT_VERSION = 1.4.0
 EXFAT_SITE = https://github.com/relan/exfat/releases/download/v$(EXFAT_VERSION)
 EXFAT_SOURCE = fuse-exfat-$(EXFAT_VERSION).tar.gz
-EXFAT_DEPENDENCIES = libfuse host-pkgconf
+EXFAT_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_LIBFUSE3),libfuse3,libfuse) \
+	host-pkgconf
 EXFAT_LICENSE = GPL-2.0+
 EXFAT_LICENSE_FILES = COPYING
 EXFAT_CPE_ID_VENDOR = exfat_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
