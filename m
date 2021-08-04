Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24DE6C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 11:12:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D90A360E97
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 11:12:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D90A360E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A772F40239;
	Wed,  4 Aug 2021 11:12:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KFS0XyDBd2cx; Wed,  4 Aug 2021 11:12:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5DBA4011B;
	Wed,  4 Aug 2021 11:11:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1882F1BF9CB
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 11:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07EEF40477
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 11:11:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7BTNYf9P04S8 for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 11:11:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0430403F0
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 11:11:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C52098B4BE; Wed,  4 Aug 2021 11:11:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 13:04:26 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 9eb4f576e7f3494d327b7be08945d2caa21b3c2f
X-Git-Newrev: cbb7134a4f9db9599c75df2b3d2fa0d55c48155e
X-Patchwork-Hint: ignore
Message-Id: <20210804111102.C52098B4BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/exiv2: fix patch
 with stack protector flag
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

commit: https://git.buildroot.net/buildroot/commit/?id=cbb7134a4f9db9599c75df2b3d2fa0d55c48155e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

One of the files have CRLF line endings, which have been lost in the
process, causing build issues. Also, we update the upstream status of
the patch.

Fixes:

  http://autobuild.buildroot.net/results/31744f8476819c725f8c0024529515bb8059582d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a6a1810711f8d634fe04ab33d24929595d227782)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-add-BUILD_WITH_STACK_PROTECTOR-option.patch | 40 ++++++++++++----------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/package/exiv2/0001-add-BUILD_WITH_STACK_PROTECTOR-option.patch b/package/exiv2/0001-add-BUILD_WITH_STACK_PROTECTOR-option.patch
index c82061661b..18684ebbfa 100644
--- a/package/exiv2/0001-add-BUILD_WITH_STACK_PROTECTOR-option.patch
+++ b/package/exiv2/0001-add-BUILD_WITH_STACK_PROTECTOR-option.patch
@@ -1,6 +1,6 @@
-From 8651c9f823ace70b6609b10aeef0c0740636b570 Mon Sep 17 00:00:00 2001
+From 4bb57da5fb0bb0d7e747b9e325e9ec0876ffc1f9 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 1 Jul 2021 19:31:25 +0200
+Date: Sat, 31 Jul 2021 16:36:50 +0200
 Subject: [PATCH] add BUILD_WITH_STACK_PROTECTOR option
 
 Add BUILD_WITH_STACK_PROTECTOR to avoid the following build failure with
@@ -15,38 +15,40 @@ enable SSP support
 Fixes:
  - http://autobuild.buildroot.org/results/ae4635899124c602c70d2b342a76f95c34aa4a3d
 
+Upstream: https://github.com/Exiv2/exiv2/commit/f31c0eba098889899d29b7b0da830aee2b62a7b8
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/Exiv2/exiv2/pull/1756]
 ---
  CMakeLists.txt            | 1 +
- cmake/compilerFlags.cmake | 2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
+ cmake/compilerFlags.cmake | 4 ++--
+ 2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 9fe8b5f9..aabb3dca 100644
+index 6f0da06a..0746ee14 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -52,6 +52,7 @@ mark_as_advanced(
+@@ -47,6 +47,7 @@ mark_as_advanced(
      EXIV2_TEAM_USE_SANITIZERS
  )
  
 +option( BUILD_WITH_STACK_PROTECTOR    "Build with stack protector"                            ON )
  option( BUILD_WITH_CCACHE             "Use ccache to speed up compilations"                   OFF )
  option( BUILD_WITH_COVERAGE           "Add compiler flags to generate coverage stats"         OFF )
- include(cmake/gcovr.cmake REQUIRED)
+ 
 diff --git a/cmake/compilerFlags.cmake b/cmake/compilerFlags.cmake
-index c8a85c59..20f6ac53 100644
+index 35faf501..0a646e50 100644
 --- a/cmake/compilerFlags.cmake
 +++ b/cmake/compilerFlags.cmake
-@@ -44,7 +44,7 @@ if ( MINGW OR UNIX OR MSYS ) # MINGW, Linux, APPLE, CYGWIN
-             if(HAS_FCF_PROTECTION)
-                 add_compile_options(-fcf-protection)
-             endif()
--            if(HAS_FSTACK_PROTECTOR_STRONG)
-+            if(BUILD_WITH_STACK_PROTECTOR AND HAS_FSTACK_PROTECTOR_STRONG)
-                 add_compile_options(-fstack-protector-strong)
-             endif()
-         endif()
+@@ -33,8 +33,8 @@ if ( MINGW OR UNIX OR MSYS ) # MINGW, Linux, APPLE, CYGWIN
+             endif()
+             if(HAS_FCF_PROTECTION)
+                 add_compile_options(-fcf-protection)
+-            endif()
+-            if(HAS_FSTACK_PROTECTOR_STRONG)
++              endif()
++	    if(BUILD_WITH_STACK_PROTECTOR AND HAS_FSTACK_PROTECTOR_STRONG)
+                 add_compile_options(-fstack-protector-strong)
+             endif()
+         endif()
 -- 
-2.30.2
+2.31.1
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
