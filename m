Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8194FC433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42294402A8;
	Mon,  6 Dec 2021 18:44:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xBeiFgY1Wb_j; Mon,  6 Dec 2021 18:44:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BBA641C55;
	Mon,  6 Dec 2021 18:44:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 219DC1BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DE1541C52
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CXPp-oyriu7d for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82AC841C21
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1A28781503; Mon,  6 Dec 2021 18:07:43 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 23:08:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f525e0e78fd806a9307c8b41996e37fb727b9bd4
X-Git-Newrev: b4bdf704fea59db81433bbc07585e4c4db258d9a
X-Patchwork-Hint: ignore
Message-Id: <20211206180743.1A28781503@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/taglib: bump to version 1.12
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
Content-Type: multipart/mixed; boundary="===============1498009255209017921=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1498009255209017921==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b4bdf704fea59db81433bbc07585e4c4db258d9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patches (already in version)
- Update indentation in hash file (two spaces)

https://github.com/taglib/taglib/releases/tag/v1.12

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...aglib-config-file-for-cross-compiling-906.patch | 66 ----------------------
 ...is-an-instance-of-TextIdentificationFrame.patch | 33 -----------
 ...B-read-when-loading-invalid-ogg-flac-file.patch | 45 ---------------
 package/taglib/taglib.hash                         |  6 +-
 package/taglib/taglib.mk                           |  8 +--
 5 files changed, 4 insertions(+), 154 deletions(-)

diff --git a/package/taglib/0001-fix-taglib-config-file-for-cross-compiling-906.patch b/package/taglib/0001-fix-taglib-config-file-for-cross-compiling-906.patch
deleted file mode 100644
index 2c6ebd74db..0000000000
--- a/package/taglib/0001-fix-taglib-config-file-for-cross-compiling-906.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 7470f92a67375d00e53b3785a88fa7b26ad6f1da Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Fri, 17 May 2019 13:13:35 +0200
-Subject: [PATCH] fix taglib-config file for cross compiling (#906)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The current taglib-config program does not work for cross-compiling as it only
-returns the paths to the host, which breaks building programs which uses
-`taglib-config` to link against taglib.
-
-Fix this by passing sysroot to the `prefix` and `exec_prefix` fields.
-
-Backported from: 7470f92a67375d00e53b3785a88fa7b26ad6f1da
-
-Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
----
- CMakeLists.txt      |  2 +-
- taglib-config.cmake | 10 +++++-----
- 2 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 2de06324..1a0302c4 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -105,7 +105,7 @@ math(EXPR TAGLIB_SOVERSION_PATCH "${TAGLIB_SOVERSION_REVISION}")
- include(ConfigureChecks.cmake)
- 
- if(NOT WIN32)
--  configure_file("${CMAKE_CURRENT_SOURCE_DIR}/taglib-config.cmake" "${CMAKE_CURRENT_BINARY_DIR}/taglib-config")
-+  configure_file("${CMAKE_CURRENT_SOURCE_DIR}/taglib-config.cmake" "${CMAKE_CURRENT_BINARY_DIR}/taglib-config" @ONLY)
-   install(PROGRAMS "${CMAKE_CURRENT_BINARY_DIR}/taglib-config" DESTINATION "${BIN_INSTALL_DIR}")
- endif()
- 
-diff --git a/taglib-config.cmake b/taglib-config.cmake
-index 2bc2811a..96ef6883 100644
---- a/taglib-config.cmake
-+++ b/taglib-config.cmake
-@@ -14,10 +14,10 @@ EOH
- 	exit 1;
- }
- 
--prefix=${CMAKE_INSTALL_PREFIX}
--exec_prefix=${CMAKE_INSTALL_PREFIX}
--libdir=${LIB_INSTALL_DIR}
--includedir=${INCLUDE_INSTALL_DIR}
-+prefix=@CMAKE_SYSROOT@@CMAKE_INSTALL_PREFIX@
-+exec_prefix=@CMAKE_SYSROOT@@CMAKE_INSTALL_PREFIX@
-+libdir=${exec_prefix}/lib
-+includedir=${prefix}/include
- 
- flags=""
- 
-@@ -35,7 +35,7 @@ do
- 	  flags="$flags -I$includedir/taglib"
- 	  ;;
-     --version)
--	  echo ${TAGLIB_LIB_VERSION_STRING}
-+	  echo @TAGLIB_LIB_VERSION_STRING@
- 	  ;;
-     --prefix)
- 	  echo $prefix
--- 
-2.22.0
-
diff --git a/package/taglib/0002-Don-t-assume-TDRC-is-an-instance-of-TextIdentificationFrame.patch b/package/taglib/0002-Don-t-assume-TDRC-is-an-instance-of-TextIdentificationFrame.patch
deleted file mode 100644
index c7ca9500d2..0000000000
--- a/package/taglib/0002-Don-t-assume-TDRC-is-an-instance-of-TextIdentificationFrame.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From eb9ded1206f18f2c319157337edea2533a40bea6 Mon Sep 17 00:00:00 2001
-From: "Stephen F. Booth" <me@sbooth.org>
-Date: Sun, 23 Jul 2017 10:11:09 -0400
-Subject: [PATCH] Don't assume TDRC is an instance of TextIdentificationFrame
-
-If TDRC is encrypted, FrameFactory::createFrame() returns UnknownFrame
-which causes problems in rebuildAggregateFrames() when it is assumed
-that TDRC is a TextIdentificationFrame
-[Retrieved from:
-https://github.com/taglib/taglib/pull/831/commits/eb9ded1206f18f2c319157337edea2533a40bea6]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- taglib/mpeg/id3v2/id3v2framefactory.cpp | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/taglib/mpeg/id3v2/id3v2framefactory.cpp b/taglib/mpeg/id3v2/id3v2framefactory.cpp
-index 759a9b7be..9347ab869 100644
---- a/taglib/mpeg/id3v2/id3v2framefactory.cpp
-+++ b/taglib/mpeg/id3v2/id3v2framefactory.cpp
-@@ -334,10 +334,11 @@ void FrameFactory::rebuildAggregateFrames(ID3v2::Tag *tag) const
-      tag->frameList("TDAT").size() == 1)
-   {
-     TextIdentificationFrame *tdrc =
--      static_cast<TextIdentificationFrame *>(tag->frameList("TDRC").front());
-+      dynamic_cast<TextIdentificationFrame *>(tag->frameList("TDRC").front());
-     UnknownFrame *tdat = static_cast<UnknownFrame *>(tag->frameList("TDAT").front());
- 
--    if(tdrc->fieldList().size() == 1 &&
-+    if(tdrc &&
-+       tdrc->fieldList().size() == 1 &&
-        tdrc->fieldList().front().size() == 4 &&
-        tdat->data().size() >= 5)
-     {
diff --git a/package/taglib/0003-Fixed-OOB-read-when-loading-invalid-ogg-flac-file.patch b/package/taglib/0003-Fixed-OOB-read-when-loading-invalid-ogg-flac-file.patch
deleted file mode 100644
index b245659c20..0000000000
--- a/package/taglib/0003-Fixed-OOB-read-when-loading-invalid-ogg-flac-file.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 2c4ae870ec086f2ddd21a47861a3709c36faac45 Mon Sep 17 00:00:00 2001
-From: Scott Gayou <github.scott@gmail.com>
-Date: Tue, 9 Oct 2018 18:46:55 -0500
-Subject: [PATCH] Fixed OOB read when loading invalid ogg flac file. (#868)
- (#869)
-
-CVE-2018-11439 is caused by a failure to check the minimum length
-of a ogg flac header. This header is detailed in full at:
-https://xiph.org/flac/ogg_mapping.html. Added more strict checking
-for entire header.
-[Retrieved from:
-https://github.com/taglib/taglib/commit/2c4ae870ec086f2ddd21a47861a3709c36faac45]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- taglib/ogg/flac/oggflacfile.cpp | 14 ++++++++++++--
- 1 file changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/taglib/ogg/flac/oggflacfile.cpp b/taglib/ogg/flac/oggflacfile.cpp
-index 53d04508a..07ea9dccc 100644
---- a/taglib/ogg/flac/oggflacfile.cpp
-+++ b/taglib/ogg/flac/oggflacfile.cpp
-@@ -231,11 +231,21 @@ void Ogg::FLAC::File::scan()
- 
-   if(!metadataHeader.startsWith("fLaC"))  {
-     // FLAC 1.1.2+
-+    // See https://xiph.org/flac/ogg_mapping.html for the header specification.
-+    if(metadataHeader.size() < 13)
-+      return;
-+
-+    if(metadataHeader[0] != 0x7f)
-+      return;
-+
-     if(metadataHeader.mid(1, 4) != "FLAC")
-       return;
- 
--    if(metadataHeader[5] != 1)
--      return; // not version 1
-+    if(metadataHeader[5] != 1 && metadataHeader[6] != 0)
-+      return; // not version 1.0
-+
-+    if(metadataHeader.mid(9, 4) != "fLaC")
-+      return;
- 
-     metadataHeader = metadataHeader.mid(13);
-   }
diff --git a/package/taglib/taglib.hash b/package/taglib/taglib.hash
index 4b99e86d68..38a44b41a5 100644
--- a/package/taglib/taglib.hash
+++ b/package/taglib/taglib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 b6d1a5a610aae6ff39d93de5efd0fdc787aa9e9dc1e7026fa4c961b26563526b  taglib-1.11.1.tar.gz
-sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
-sha256 53692a2ed6c6a2c6ec9b32dd0b820dfae91e0a1fcdf625ca9ed0bdf8705fcc4f  COPYING.MPL
+sha256  7fccd07669a523b07a15bd24c8da1bbb92206cb19e9366c3692af3d79253b703  taglib-1.12.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
+sha256  53692a2ed6c6a2c6ec9b32dd0b820dfae91e0a1fcdf625ca9ed0bdf8705fcc4f  COPYING.MPL
diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index f31f1046a5..9513e0d0e1 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -4,19 +4,13 @@
 #
 ################################################################################
 
-TAGLIB_VERSION = 1.11.1
+TAGLIB_VERSION = 1.12
 TAGLIB_SITE = http://taglib.github.io/releases
 TAGLIB_INSTALL_STAGING = YES
 TAGLIB_LICENSE = LGPL-2.1 or MPL-1.1
 TAGLIB_LICENSE_FILES = COPYING.LGPL COPYING.MPL
 TAGLIB_CPE_ID_VENDOR = taglib
 
-# 0002-Don-t-assume-TDRC-is-an-instance-of-TextIdentificationFrame.patch
-TAGLIB_IGNORE_CVES += CVE-2017-12678
-
-# 0003-Fixed-OOB-read-when-loading-invalid-ogg-flac-file.patch
-TAGLIB_IGNORE_CVES += CVE-2018-11439
-
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 TAGLIB_DEPENDENCIES += zlib
 endif

--===============1498009255209017921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1498009255209017921==--
