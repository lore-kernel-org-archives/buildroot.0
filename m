Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D558EB64DD
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 21:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED6AE41883;
	Tue, 25 Jul 2023 21:15:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED6AE41883
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lk7SKOm8lQPR; Tue, 25 Jul 2023 21:15:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A11541926;
	Tue, 25 Jul 2023 21:15:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A11541926
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E03401BF47A
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C57D7418BC
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C57D7418BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eomxH-S17lVz for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 21:15:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A38BF418AD
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 21:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A38BF418AD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8EAA2834A7; Tue, 25 Jul 2023 21:15:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 23:08:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b285598e8287033e3b751e174523000d52a8ad0
X-Git-Newrev: 9325ba4754fea800658bb3aec99f28bba3d2acf3
X-Patchwork-Hint: ignore
Message-Id: <20230725211501.8EAA2834A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libubootenv: bump to version 0.3.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=9325ba4754fea800658bb3aec99f28bba3d2acf3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...01-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch | 9 ++++-----
 package/libubootenv/libubootenv.hash                             | 2 +-
 package/libubootenv/libubootenv.mk                               | 4 ++--
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch b/package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch
index 9040e1267e..9c5438f30e 100644
--- a/package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch
+++ b/package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch
@@ -29,7 +29,7 @@ diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
 index 4b71bc5..0b515f4 100644
 --- a/src/CMakeLists.txt
 +++ b/src/CMakeLists.txt
-@@ -12,18 +12,16 @@ SET(include_HEADERS
+@@ -15,17 +15,15 @@ SET(include_HEADERS
  
  include(GNUInstallDirs) # for the CMAKE_INSTALL_LIBDIR variable
  
@@ -40,16 +40,15 @@ index 4b71bc5..0b515f4 100644
 -ADD_LIBRARY(ubootenv_static STATIC ${libubootenv_SOURCES} ${include_HEADERS})
 -SET_TARGET_PROPERTIES(ubootenv_static PROPERTIES OUTPUT_NAME ubootenv)
  add_executable(fw_printenv fw_printenv.c)
- add_executable(fw_setenv fw_setenv.c)
- target_link_libraries(ubootenv z)
+ target_link_libraries(ubootenv z yaml)
  target_link_libraries(fw_printenv ubootenv)
- target_link_libraries(fw_setenv ubootenv)
+ add_custom_target(fw_setenv ALL ${CMAKE_COMMAND} -E create_symlink fw_printenv fw_setenv)
  
 -install (TARGETS ubootenv ubootenv_static DESTINATION ${CMAKE_INSTALL_LIBDIR})
 +install (TARGETS ubootenv DESTINATION ${CMAKE_INSTALL_LIBDIR})
  install (FILES libuboot.h DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
  install (TARGETS fw_printenv DESTINATION ${CMAKE_INSTALL_BINDIR})
- install (TARGETS fw_setenv DESTINATION ${CMAKE_INSTALL_BINDIR})
+ install (PROGRAMS ${CMAKE_CURRENT_BINARY_DIR}/fw_setenv DESTINATION ${CMAKE_INSTALL_BINDIR})
 -- 
 2.30.2
 
diff --git a/package/libubootenv/libubootenv.hash b/package/libubootenv/libubootenv.hash
index 6863b7fcf7..b881994bfd 100644
--- a/package/libubootenv/libubootenv.hash
+++ b/package/libubootenv/libubootenv.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  8fc9498b557bbf4ae4d39a2dbd15a2ef44f8ea8de4686cc971c6788a65cd1ec0  libubootenv-0.3.3.tar.gz
+sha256  78faadcfac67e50273e5d4e95e6cf6fee3d486ce9dc568d1fe25312271a88768  libubootenv-0.3.4.tar.gz
 sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1-or-later.txt
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSES/MIT.txt
diff --git a/package/libubootenv/libubootenv.mk b/package/libubootenv/libubootenv.mk
index e841e0b843..b4c9588107 100644
--- a/package/libubootenv/libubootenv.mk
+++ b/package/libubootenv/libubootenv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUBOOTENV_VERSION = 0.3.3
+LIBUBOOTENV_VERSION = 0.3.4
 LIBUBOOTENV_SITE = $(call github,sbabic,libubootenv,v$(LIBUBOOTENV_VERSION))
 LIBUBOOTENV_LICENSE = LGPL-2.1+, MIT, CC0-1.0
 LIBUBOOTENV_LICENSE_FILES = LICENSES/CC0-1.0.txt \
@@ -12,6 +12,6 @@ LIBUBOOTENV_LICENSE_FILES = LICENSES/CC0-1.0.txt \
 	LICENSES/MIT.txt
 
 LIBUBOOTENV_INSTALL_STAGING = YES
-LIBUBOOTENV_DEPENDENCIES = zlib
+LIBUBOOTENV_DEPENDENCIES = libyaml zlib
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
