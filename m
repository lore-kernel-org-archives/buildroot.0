Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 749F1C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:30:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DCF66103C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2DCF66103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C0E283B03;
	Tue,  3 Aug 2021 22:30:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v_cE9rY6JVPz; Tue,  3 Aug 2021 22:30:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B41283AF5;
	Tue,  3 Aug 2021 22:30:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 044AB1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0B484059A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N9xt1cC8v_Rg for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24FBF400C7
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6BBA085F62; Tue,  3 Aug 2021 21:09:42 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 20 May 2021 21:45:23 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9e3e57394bd1268af5a79181080a8a9ad843b7f1
X-Git-Newrev: 59cbf375856d9de6981e3d44b172dfa873ffa78b
X-Patchwork-Hint: ignore
Message-Id: <20210803210942.6BBA085F62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Revert "package/assimp: fix
 musl zlib/zip related compile failure"
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=59cbf375856d9de6981e3d44b172dfa873ffa78b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This reverts commit b529a582ba4d7671597e95d7ab54ee652cbbc261 as it
raises a build failure with hiawatha because assimp installs its own
zlib library in staging directory.

Fixes:
 - http://autobuild.buildroot.org/results/9cac31962d48245a5579da692dbc9488292a397e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...-fix-ssize_t-typedef-mismatch-for-musl-co.patch | 50 ----------------------
 package/assimp/Config.in                           |  1 +
 package/assimp/assimp.mk                           |  3 +-
 3 files changed, 3 insertions(+), 51 deletions(-)

diff --git a/package/assimp/0002-contrib-zip-fix-ssize_t-typedef-mismatch-for-musl-co.patch b/package/assimp/0002-contrib-zip-fix-ssize_t-typedef-mismatch-for-musl-co.patch
deleted file mode 100644
index a9a30c4834..0000000000
--- a/package/assimp/0002-contrib-zip-fix-ssize_t-typedef-mismatch-for-musl-co.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 3fef857a570d1ef2c96401358fe8e239625b48c9 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Fri, 10 Apr 2020 18:11:50 +0200
-Subject: [PATCH] contrib/zip: fix ssize_t typedef mismatch for musl compile
-
-Musl uses defines __DEFINED_ssize_t to indicate ssize_t
-availability. So backport this part of upstream commit [1]
-to fixl musl compile.
-
-https://github.com/assimp/assimp/commit/f78446b14aff46db2ef27d062a275b6a01fd68b1
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- contrib/zip/src/zip.h | 13 +++++++++++--
- 1 file changed, 11 insertions(+), 2 deletions(-)
-
-diff --git a/contrib/zip/src/zip.h b/contrib/zip/src/zip.h
-index 5f39df50..4672eb3e 100644
---- a/contrib/zip/src/zip.h
-+++ b/contrib/zip/src/zip.h
-@@ -20,8 +20,9 @@ extern "C" {
- #endif
- 
- #if !defined(_SSIZE_T_DEFINED) && !defined(_SSIZE_T_DEFINED_) &&               \
--    !defined(_SSIZE_T) && !defined(_SSIZE_T_) && !defined(__ssize_t_defined)
--#define _SSIZE_T
-+    !defined(__DEFINED_ssize_t) && !defined(__ssize_t_defined) &&              \
-+    !defined(_SSIZE_T) && !defined(_SSIZE_T_)
-+
- // 64-bit Windows is the only mainstream platform
- // where sizeof(long) != sizeof(void*)
- #ifdef _WIN64
-@@ -29,6 +30,14 @@ typedef long long  ssize_t;  /* byte count or error */
- #else
- typedef long  ssize_t;  /* byte count or error */
- #endif
-+
-+#define _SSIZE_T_DEFINED
-+#define _SSIZE_T_DEFINED_
-+#define __DEFINED_ssize_t
-+#define __ssize_t_defined
-+#define _SSIZE_T
-+#define _SSIZE_T_
-+
- #endif
- 
- #ifndef MAX_PATH
--- 
-2.26.0
-
diff --git a/package/assimp/Config.in b/package/assimp/Config.in
index 9bdc054909..42bfee945d 100644
--- a/package/assimp/Config.in
+++ b/package/assimp/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_ASSIMP
 	bool "assimp"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_ZLIB
 	help
 	  Open Asset Import Library (assimp) is a portable Open Source
 	  library to import various well-known 3D model formats in a
diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index e1b9a23499..eddfbc48b0 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -8,6 +8,7 @@ ASSIMP_VERSION = 5.0.1
 ASSIMP_SITE = $(call github,assimp,assimp,v$(ASSIMP_VERSION))
 ASSIMP_LICENSE = BSD-3-Clause
 ASSIMP_LICENSE_FILES = LICENSE
+ASSIMP_DEPENDENCIES = zlib
 ASSIMP_INSTALL_STAGING = YES
 
 # relocation truncated to fit: R_68K_GOT16O. We also need to disable
@@ -36,7 +37,7 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 ASSIMP_CXXFLAGS += -O0
 endif
 
-ASSIMP_CONF_OPTS += -DASSIMP_BUILD_ZLIB=ON -DASSIMP_BUILD_TESTS=OFF \
+ASSIMP_CONF_OPTS += -DASSIMP_BUILD_TESTS=OFF \
 	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(ASSIMP_CXXFLAGS)"
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
