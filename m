Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5C3C00528
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 20:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90FA66101F;
	Sun, 30 Jul 2023 20:46:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90FA66101F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sCL6oBHeKqmZ; Sun, 30 Jul 2023 20:46:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A35E661029;
	Sun, 30 Jul 2023 20:46:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A35E661029
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 23AF01BF31E
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 20:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6727860B0D
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 20:44:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6727860B0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jElVVLvb8Yno for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 20:44:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7450B61019
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 20:44:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7450B61019
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 620FF83CD6; Sun, 30 Jul 2023 20:44:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 22:43:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 18173cba92ed0e7414fa8251bf48200d50d3d1fb
X-Git-Newrev: 3fd79fcb61b95b48e8d00bf7b42ca246e7e6f4cf
X-Patchwork-Hint: ignore
Message-Id: <20230730204443.620FF83CD6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gerbera: bump version to 1.12.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3fd79fcb61b95b48e8d00bf7b42ca246e7e6f4cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                               |  1 -
 package/gerbera/0001-Fix-build-with-fmt-9-0.patch | 36 -----------------------
 package/gerbera/gerbera.hash                      |  2 +-
 package/gerbera/gerbera.mk                        |  2 +-
 4 files changed, 2 insertions(+), 39 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index b3db922529..27c66d0bbe 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -531,7 +531,6 @@ package/gengetopt/0001-configure.ac-add-disable-doc-option.patch Upstream
 package/genpart/0001-fix-return-code.patch Upstream
 package/genromfs/0001-build-system.patch Sob Upstream
 package/gensio/0001-Fix-missing-EVP_PKEY_ED25519-build-error-on-libressl.patch Upstream
-package/gerbera/0001-Fix-build-with-fmt-9-0.patch Upstream
 package/gerbera/S99gerbera Indent
 package/gettext-gnu/0001-error_print_progname.patch Upstream
 package/gettext-gnu/0002-restore-the-ability-to-buld-gettext-tools-seperately-part1.patch Upstream
diff --git a/package/gerbera/0001-Fix-build-with-fmt-9-0.patch b/package/gerbera/0001-Fix-build-with-fmt-9-0.patch
deleted file mode 100644
index 63ae8382a3..0000000000
--- a/package/gerbera/0001-Fix-build-with-fmt-9-0.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From d7b8fafbc94405c20753fed569abd8878cccde89 Mon Sep 17 00:00:00 2001
-From: Felix Yan <felixonmars@archlinux.org>
-Date: Fri, 19 Aug 2022 15:22:10 +0300
-Subject: [PATCH] Fix build with fmt 9.0
-
-Fixes #2681
-
-[Retrieved from:
-https://github.com/gerbera/gerbera/commit/d7b8fafbc94405c20753fed569abd8878cccde89]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/database/sql_format.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/database/sql_format.h b/src/database/sql_format.h
-index 32dc00efa..e4e1909a8 100644
---- a/src/database/sql_format.h
-+++ b/src/database/sql_format.h
-@@ -42,7 +42,7 @@ struct SQLIdentifier {
- template <>
- struct fmt::formatter<SQLIdentifier> : formatter<std::string_view> {
-     template <typename FormatContext>
--    auto format(const SQLIdentifier& tn, FormatContext& ctx) -> decltype(ctx.out())
-+    auto format(const SQLIdentifier& tn, FormatContext& ctx) const -> decltype(ctx.out())
-     {
-         return format_to(ctx.out(), "{}{}{}", tn.quote_begin, tn.name, tn.quote_end);
-     }
-@@ -61,7 +61,7 @@ struct ColumnUpdate {
- template <>
- struct fmt::formatter<ColumnUpdate> : formatter<std::string_view> {
-     template <typename FormatContext>
--    auto format(const ColumnUpdate& a, FormatContext& ctx) -> decltype(ctx.out())
-+    auto format(const ColumnUpdate& a, FormatContext& ctx) const -> decltype(ctx.out())
-     {
-         return format_to(ctx.out(), "{} = {}", a.column, a.value);
-     }
diff --git a/package/gerbera/gerbera.hash b/package/gerbera/gerbera.hash
index 89ac9ad55a..ee6e3d9b3a 100644
--- a/package/gerbera/gerbera.hash
+++ b/package/gerbera/gerbera.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  bd6c7b2c6380e2e265a998bbc0df9eec14b9c6a65bc91e7f2c0ae0b67fd0c9cf  gerbera-1.10.0.tar.gz
+sha256  2144a7c4a13e8b43aa0c911fbeae65f05e2c42254ddd03be5c41f5fcf103a93c  gerbera-1.12.1.tar.gz
 sha256  cae4138373be41fd2be75faf41ce7efbcf49fb17d0e05ad1c51cc01ac335b9b6  LICENSE.md
diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
index 6acdfb86ac..c60d49b0f9 100644
--- a/package/gerbera/gerbera.mk
+++ b/package/gerbera/gerbera.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GERBERA_VERSION = 1.10.0
+GERBERA_VERSION = 1.12.1
 GERBERA_SITE = $(call github,gerbera,gerbera,v$(GERBERA_VERSION))
 GERBERA_LICENSE = GPL-2.0
 GERBERA_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
