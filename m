Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33445C001DF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 17:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BF664109F;
	Sun, 30 Jul 2023 17:12:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BF664109F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QIXh7wj2Kdc9; Sun, 30 Jul 2023 17:12:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B402410DC;
	Sun, 30 Jul 2023 17:12:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B402410DC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 27BA31BF3BC
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 17:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0617481761
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 17:12:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0617481761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 232W-cMUNj7Z for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 17:12:36 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43652813BC
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 17:12:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43652813BC
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9BA6BA4C036A;
 Sun, 30 Jul 2023 19:12:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60884)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qQ9y4-00088q-1D;
 Sun, 30 Jul 2023 19:12:32 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 19:12:28 +0200
Message-Id: <20230730171232.3381097-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690737152;
 bh=3VRsQH9IhROxRllOIdKxTn5kgC2q5Z2BO8C27yYJPfA=;
 h=From:To:Cc:Subject:Date:From;
 b=gr7yTVDGKIgiKJ9wZmXrn+00MhgANbb0FxAzS3O10QCsj9RqpNAg9FVAUdIxIAw36
 d+qHwNX3SqPhhH/ouhff7LMYyIpv0K7g5DGlG6zUIC7JBBm9Md4cX0SkgrUGDoj1ru
 +x9bwdMMuMikWNja095mkSCbDUG6mFNkdOM2Ch5ceQiQWqPwHMHVq8daGFDFrU70lB
 ip8FZeHuNdalRYgo7S1jdAtZECucUR4eES0vDOJhA8jjOmqq5Upuh4ljlBJIFSaUdr
 mpkvXMmfk2m20FD0hvKwDnmTGf5pRbbHzEa4djywnI5IuffG2No9qy/mkh/3qaWP9g
 sSCcRcIUugG8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=gr7yTVDG
Subject: [Buildroot] [PATCH 1/5] package/gerbera: bump version to 1.12.1
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
Cc: Semyon Kolganov <semenak94@mail.ru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  1 -
 .../gerbera/0001-Fix-build-with-fmt-9-0.patch | 36 -------------------
 package/gerbera/gerbera.hash                  |  2 +-
 package/gerbera/gerbera.mk                    |  2 +-
 4 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 package/gerbera/0001-Fix-build-with-fmt-9-0.patch

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
