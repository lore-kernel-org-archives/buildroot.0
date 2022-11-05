Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749DAC47089
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EADD8124B;
	Mon,  5 Dec 2022 11:55:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EADD8124B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3rl-aLv_cinC; Mon,  5 Dec 2022 11:55:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 319AC8144B;
	Mon,  5 Dec 2022 11:55:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 319AC8144B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 49A0E1BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D69841655
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D69841655
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hL0NXxtgQEzP for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F40644167C
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F40644167C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2B4C85BA3; Mon,  5 Dec 2022 11:26:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 23:45:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6732e230354e0eb62345b039605a1933ba0ad3bf
X-Git-Newrev: d2d8f146a9f0ed3b66c4dd470bb76efdbb630a75
X-Patchwork-Hint: ignore
Message-Id: <20221205112607.E2B4C85BA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xerces: bump to version 3.2.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=d2d8f146a9f0ed3b66c4dd470bb76efdbb630a75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop second patch (already in version)

https://github.com/apache/xerces-c/compare/v3.2.3...v3.2.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...der-loadMsg-fix-memory-leak-when-transcod.patch | 87 ----------------------
 package/xerces/xerces.hash                         |  4 +-
 package/xerces/xerces.mk                           |  2 +-
 3 files changed, 3 insertions(+), 90 deletions(-)

diff --git a/package/xerces/0002-InMemMsgLoader-loadMsg-fix-memory-leak-when-transcod.patch b/package/xerces/0002-InMemMsgLoader-loadMsg-fix-memory-leak-when-transcod.patch
deleted file mode 100644
index 76b37c63d9..0000000000
--- a/package/xerces/0002-InMemMsgLoader-loadMsg-fix-memory-leak-when-transcod.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From 1bdf6d8ba878c1fe1d779824be70001fc0bebd2c Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Fri, 27 Aug 2021 01:33:27 +0200
-Subject: [PATCH] InMemMsgLoader::loadMsg(): fix memory leak when transcoding
- fails.
-
-Seen with the IconvGNU transcoder when parsing "<aaa.xsdopengis.net/gml\x96".
-The reason is that XMLString::transcode(repText2, manager) throws a TranscodingException
-which causes the tmp1 string to leak.
-
-```
-0 0x8791409 in operator new(unsigned int) /src/llvm-project/compiler-rt/lib/asan/asan_new_delete.cpp:99:3
-1 0xbd147f7 in xercesc_4_0::MemoryManagerImpl::allocate(unsigned int) gdal/xerces-c/src/xercesc/internal/MemoryManagerImpl.cpp:40:18
-2 0xbe8c73e in xercesc_4_0::IconvGNULCPTranscoder::transcode(char const*, xercesc_4_0::MemoryManager*) gdal/xerces-c/src/xercesc/util/Transcoders/IconvGNU/IconvGNUTransService.cpp:870:32
-3 0xbc22ca2 in xercesc_4_0::XMLString::transcode(char const*, xercesc_4_0::MemoryManager*) gdal/xerces-c/src/xercesc/util/XMLString.cpp:621:25
-4 0xbe8f4ad in xercesc_4_0::InMemMsgLoader::loadMsg(unsigned int, char16_t*, unsigned int, char const*, char const*, char const*, char const*, xercesc_4_0::MemoryManager*) gdal/xerces-c/src/xercesc/util/MsgLoaders/InMemory/InMemMsgLoader.cpp:157:16
-5 0xbc20175 in xercesc_4_0::XMLException::loadExceptText(xercesc_4_0::XMLExcepts::Codes, char const*, char const*, char const*, char const*) gdal/xerces-c/src/xercesc/util/XMLException.cpp:241:23
-6 0xbc48bee in xercesc_4_0::UTFDataFormatException::UTFDataFormatException(char const*, unsigned long long, xercesc_4_0::XMLExcepts::Codes, char const*, char const*, char const*, char const*, xercesc_4_0::MemoryManager*) gdal/xerces-c/src/xercesc/util/UTFDataFormatException.hpp:31:1
-7 0xbc4824e in xercesc_4_0::XMLUTF8Transcoder::transcodeFrom(unsigned char const*, unsigned int, char16_t*, unsigned int, unsigned int&, unsigned char*) gdal/xerces-c/src/xercesc/util/XMLUTF8Transcoder.cpp:182:13
-8 0xbd27d7e in xercesc_4_0::XMLReader::xcodeMoreChars(char16_t*, unsigned char*, unsigned int) gdal/xerces-c/src/xercesc/internal/XMLReader.cpp:1926:34
-9 0xbd271dd in xercesc_4_0::XMLReader::refreshCharBuffer() gdal/xerces-c/src/xercesc/internal/XMLReader.cpp:571:19
-10 0xbd15c63 in xercesc_4_0::XMLReader::peekNextChar(char16_t&) gdal/xerces-c/src/xercesc/internal/XMLReader.hpp:767:14
-11 0xbd15aaf in xercesc_4_0::ReaderMgr::peekNextChar() gdal/xerces-c/src/xercesc/internal/ReaderMgr.cpp:158:21
-12 0xbd328da in xercesc_4_0::XMLScanner::scanProlog() gdal/xerces-c/src/xercesc/internal/XMLScanner.cpp:1241:45
-13 0xbd31ef4 in xercesc_4_0::XMLScanner::scanFirst(xercesc_4_0::InputSource const&, xercesc_4_0::XMLPScanToken&) gdal/xerces-c/src/xercesc/internal/XMLScanner.cpp:549:9
-14 0xbdadcff in xercesc_4_0::SAX2XMLReaderImpl::parseFirst(xercesc_4_0::InputSource const&, xercesc_4_0::XMLPScanToken&) gdal/xerces-c/src/xercesc/parsers/SAX2XMLReaderImpl.cpp:500:22
-```
-Upstream: https://github.com/apache/xerces-c/commit/1bdf6d8ba878c1fe1d779824be70001fc0bebd2c
-
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
-
----
- .../MsgLoaders/InMemory/InMemMsgLoader.cpp    | 31 ++++++++++++++-----
- 1 file changed, 23 insertions(+), 8 deletions(-)
-
-diff --git a/src/xercesc/util/MsgLoaders/InMemory/InMemMsgLoader.cpp b/src/xercesc/util/MsgLoaders/InMemory/InMemMsgLoader.cpp
-index cda103226..6971fde96 100644
---- a/src/xercesc/util/MsgLoaders/InMemory/InMemMsgLoader.cpp
-+++ b/src/xercesc/util/MsgLoaders/InMemory/InMemMsgLoader.cpp
-@@ -25,6 +25,7 @@
- // ---------------------------------------------------------------------------
- #include <xercesc/util/BitOps.hpp>
- #include <xercesc/util/PlatformUtils.hpp>
-+#include <xercesc/util/TranscodingException.hpp>
- #include <xercesc/util/XMLMsgLoader.hpp>
- #include <xercesc/util/XMLString.hpp>
- #include <xercesc/util/XMLUni.hpp>
-@@ -153,14 +154,28 @@ bool InMemMsgLoader::loadMsg(const  XMLMsgLoader::XMLMsgId  msgToLoad
-     XMLCh* tmp4 = 0;
-     
-     bool bRet = false;
--    if (repText1)
--        tmp1 = XMLString::transcode(repText1, manager);
--    if (repText2)
--        tmp2 = XMLString::transcode(repText2, manager);
--    if (repText3)
--        tmp3 = XMLString::transcode(repText3, manager);
--    if (repText4)
--        tmp4 = XMLString::transcode(repText4, manager);
-+    try
-+    {
-+        if (repText1)
-+            tmp1 = XMLString::transcode(repText1, manager);
-+        if (repText2)
-+            tmp2 = XMLString::transcode(repText2, manager);
-+        if (repText3)
-+            tmp3 = XMLString::transcode(repText3, manager);
-+        if (repText4)
-+            tmp4 = XMLString::transcode(repText4, manager);
-+    }
-+    catch( const TranscodingException& )
-+    {
-+        if (tmp1)
-+            manager->deallocate(tmp1);
-+        if (tmp2)
-+            manager->deallocate(tmp2);
-+        if (tmp3)
-+            manager->deallocate(tmp3);
-+        // Note: tmp4 cannot leak
-+        throw;
-+    }
- 
-     bRet = loadMsg(msgToLoad, toFill, maxChars, tmp1, tmp2, tmp3, tmp4, manager);
- 
--- 
-2.17.1
-
diff --git a/package/xerces/xerces.hash b/package/xerces/xerces.hash
index c75ce860e8..e6b5b922d2 100644
--- a/package/xerces/xerces.hash
+++ b/package/xerces/xerces.hash
@@ -1,5 +1,5 @@
-# From http://www.apache.org/dist/xerces/c/3/sources/xerces-c-3.2.3.tar.xz.sha256
-sha256  12fc99a9fc1d1a79bd0e927b8b5637a576d6656f45b0d5e70ee3694d379cc149  xerces-c-3.2.3.tar.xz
+# From http://www.apache.org/dist/xerces/c/3/sources/xerces-c-3.2.4.tar.xz.sha256
+sha256  075bc57940da0f9be6dd183c550c8ce0b9833e4550dc382048377a1a5e3b2bd9  xerces-c-3.2.4.tar.xz
 
 # Hash for license file
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index a3e5361b2e..08efa6fb5c 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XERCES_VERSION = 3.2.3
+XERCES_VERSION = 3.2.4
 XERCES_SOURCE = xerces-c-$(XERCES_VERSION).tar.xz
 XERCES_SITE = http://archive.apache.org/dist/xerces/c/3/sources
 XERCES_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
