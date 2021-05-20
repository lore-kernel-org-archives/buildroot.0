Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 147C6C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:27:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C920B61037
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C920B61037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A569A82D45;
	Tue,  3 Aug 2021 22:27:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bS0Xgzx5lV7P; Tue,  3 Aug 2021 22:27:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DE3F83C00;
	Tue,  3 Aug 2021 22:27:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1AE7D1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B912440521
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hJ8NqwJWB-0n for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2152D4053A
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7718E810E2; Tue,  3 Aug 2021 21:09:42 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 20 May 2021 21:45:23 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 59cbf375856d9de6981e3d44b172dfa873ffa78b
X-Git-Newrev: ebe83db65587f371a77efec362b19fd3c2502457
X-Patchwork-Hint: ignore
Message-Id: <20210803210942.7718E810E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Revert "package/assimp: fix
 static only build"
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

commit: https://git.buildroot.net/buildroot/commit/?id=ebe83db65587f371a77efec362b19fd3c2502457
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This reverts commit b44b5cb265e3764169aa4856f40e8e2db55cba22.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...rib-zlib-disable-dynamic-library-building.patch | 31 ----------------------
 1 file changed, 31 deletions(-)

diff --git a/package/assimp/0003-contrib-zlib-disable-dynamic-library-building.patch b/package/assimp/0003-contrib-zlib-disable-dynamic-library-building.patch
deleted file mode 100644
index 8661311be5..0000000000
--- a/package/assimp/0003-contrib-zlib-disable-dynamic-library-building.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 2b8684aded0c383be64bac0fa59e39870252963f Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Sun, 12 Apr 2020 18:19:13 +0200
-Subject: [PATCH] contrib/zlib: disable dynamic library building
-
-Fixes compile failure for static only toolchains (and assimp
-links against the static one).
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- contrib/zlib/CMakeLists.txt | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/contrib/zlib/CMakeLists.txt b/contrib/zlib/CMakeLists.txt
-index 9d1fcc94..78346233 100644
---- a/contrib/zlib/CMakeLists.txt
-+++ b/contrib/zlib/CMakeLists.txt
-@@ -195,10 +195,7 @@ if(MINGW)
-     set(ZLIB_DLL_SRCS ${CMAKE_CURRENT_BINARY_DIR}/zlib1rc.obj)
- endif(MINGW)
- 
--add_library(zlib SHARED ${ZLIB_SRCS} ${ZLIB_ASMS} ${ZLIB_DLL_SRCS} ${ZLIB_PUBLIC_HDRS} ${ZLIB_PRIVATE_HDRS})
- add_library(zlibstatic STATIC ${ZLIB_SRCS} ${ZLIB_ASMS} ${ZLIB_PUBLIC_HDRS} ${ZLIB_PRIVATE_HDRS})
--set_target_properties(zlib PROPERTIES DEFINE_SYMBOL ZLIB_DLL)
--set_target_properties(zlib PROPERTIES SOVERSION 1)
- 
- INSTALL( TARGETS zlibstatic
-          LIBRARY DESTINATION ${ASSIMP_LIB_INSTALL_DIR}
--- 
-2.26.0
-
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
