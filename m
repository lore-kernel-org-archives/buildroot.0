Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B564C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 13:02:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9B3A60F58
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 13:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9B3A60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DFB240383;
	Tue, 14 Sep 2021 13:02:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wbdTQQJViWAD; Tue, 14 Sep 2021 13:02:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2F574032D;
	Tue, 14 Sep 2021 13:02:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B7E481BF995
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 13:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A86E14031D
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 13:01:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gww6hb3zTDxc for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 13:01:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE0AC403CA
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 13:01:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EE5DA8B38C; Tue, 14 Sep 2021 12:59:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 14:56:37 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 599e2b13e0f7f5ee0b12e7182dad1b0e8f4b1eb1
X-Git-Newrev: c2f2862db0001e2f3427e5eaaee2ef56569abd4a
X-Patchwork-Hint: ignore
Message-Id: <20210914125931.EE5DA8B38C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/gd: security bump
 to version 2.3.3
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c2f2862db0001e2f3427e5eaaee2ef56569abd4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

- Fix CVE-2021-40145: ** DISPUTED ** gdImageGd2Ptr in gd_gd2.c in the GD
  Graphics Library (aka LibGD) through 2.3.2 has a double free. NOTE:
  the vendor's position is "The GD2 image format is a proprietary image
  format of libgd. It has to be regarded as being obsolete, and should
  only be used for development and testing purposes."
- Drop patch (already in version)
- Update hash of COPYING (duplicate merged and title added with
  https://github.com/libgd/libgd/commit/82d260950589563a1af9c56f4ce5fde843a695ae
  https://github.com/libgd/libgd/commit/6013c7bcf6eb795dba584f92d3824ebd3ae60202)

https://github.com/libgd/libgd/releases/tag/gd-2.3.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a052ecb5b8bb11a9e882b5a4df6a475877a9b75e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...d-out-of-bands-in-reading-tga-header-file.patch | 29 ----------------------
 package/gd/gd.hash                                 |  4 +--
 package/gd/gd.mk                                   |  5 +---
 3 files changed, 3 insertions(+), 35 deletions(-)

diff --git a/package/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch b/package/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch
deleted file mode 100644
index a42bfb402e..0000000000
--- a/package/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 8b111b2b4a4842179be66db68d84dda91a246032 Mon Sep 17 00:00:00 2001
-From: maryam ebrahimzadeh <maryam.ebr@student.sharif.edu>
-Date: Mon, 19 Jul 2021 10:07:13 +0430
-Subject: [PATCH] fix read out-of-bands in reading tga header file
-
-[Retrieved from:
-https://github.com/libgd/libgd/commit/8b111b2b4a4842179be66db68d84dda91a246032]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/gd_tga.c | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/src/gd_tga.c b/src/gd_tga.c
-index cae9428da..286febb28 100644
---- a/src/gd_tga.c
-+++ b/src/gd_tga.c
-@@ -191,7 +191,11 @@ int read_header_tga(gdIOCtx *ctx, oTga *tga)
- 			return -1;
- 		}
- 
--		gdGetBuf(tga->ident, tga->identsize, ctx);
-+		
-+		if (gdGetBuf(tga->ident, tga->identsize, ctx) != tga->identsize) {
-+			gd_error("fail to read header ident");
-+			return -1;
-+		}
- 	}
- 
- 	return 1;
diff --git a/package/gd/gd.hash b/package/gd/gd.hash
index 25e64e801b..d0b1e97675 100644
--- a/package/gd/gd.hash
+++ b/package/gd/gd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  478a047084e0d89b83616e4c2cf3c9438175fb0cc55d8c8967f06e0427f7d7fb  libgd-2.3.2.tar.xz
-sha256  4d80b4af6c38d7a65128c881623dee2a5daee6b3a6ccab74a5cdfa0dfda96da7  COPYING
+sha256  3fe822ece20796060af63b7c60acb151e5844204d289da0ce08f8fdf131e5a61  libgd-2.3.3.tar.xz
+sha256  005f4b6b0141d1bd11d371bbf7d4f67947f85a4906b7f5465f942204cf918ba3  COPYING
diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index ced97de5ee..ea8f067a87 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GD_VERSION = 2.3.2
+GD_VERSION = 2.3.3
 GD_SOURCE = libgd-$(GD_VERSION).tar.xz
 GD_SITE = https://github.com/libgd/libgd/releases/download/gd-$(GD_VERSION)
 GD_INSTALL_STAGING = YES
@@ -15,9 +15,6 @@ GD_CPE_ID_PRODUCT = libgd
 GD_CONF_OPTS = --without-x --disable-rpath --disable-werror
 GD_DEPENDENCIES = host-pkgconf
 
-# 0001-fix-read-out-of-bands-in-reading-tga-header-file.patch
-GD_IGNORE_CVES += CVE-2021-38115
-
 # gd forgets to link utilities with -pthread even though it uses
 # pthreads, causing linking errors with static linking
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
