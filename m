Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661EAC04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 07:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FD7260782;
	Sat, 11 May 2024 07:02:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JKic759Kl-_8; Sat, 11 May 2024 07:02:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F34D561632
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F34D561632;
	Sat, 11 May 2024 07:02:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E6B2F1BF398
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 07:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D283642482
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 07:02:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r1PbEncIJEeE for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 07:02:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 631F64247C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 631F64247C
 for <buildroot@buildroot.org>; Sat, 11 May 2024 07:02:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55E2C86EC4; Sat, 11 May 2024 07:02:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 11 May 2024 09:01:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dfb6b104eabf9cbdb1b8d17cfb609c84f1fad3c6
X-Git-Newrev: 288bfd201b9bed458aa792d444559b6154ef8c45
X-Patchwork-Hint: ignore
Message-Id: <20240511070249.55E2C86EC4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxmlpp: bump to version 5.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=288bfd201b9bed458aa792d444559b6154ef8c45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://github.com/libxmlplusplus/libxmlplusplus/blob/5.2.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...1-Make-it-compatible-with-libxml2--2-12-0.patch | 145 ---------------------
 package/libxmlpp/libxmlpp.hash                     |   4 +-
 package/libxmlpp/libxmlpp.mk                       |   4 +-
 3 files changed, 4 insertions(+), 149 deletions(-)

diff --git a/package/libxmlpp/0001-Make-it-compatible-with-libxml2--2-12-0.patch b/package/libxmlpp/0001-Make-it-compatible-with-libxml2--2-12-0.patch
deleted file mode 100644
index b9100b4966..0000000000
--- a/package/libxmlpp/0001-Make-it-compatible-with-libxml2--2-12-0.patch
+++ /dev/null
@@ -1,145 +0,0 @@
-From 49471812d57adfb22dcce3cbea1a8956658731b9 Mon Sep 17 00:00:00 2001
-From: Kjell Ahlstedt <kjellahlstedt@gmail.com>
-Date: Sat, 18 Nov 2023 18:34:07 +0100
-Subject: [PATCH] Make it compatible with libxml2 >= 2.12.0
-
-* libxml++/document.cc:
-* libxml++/dtd.cc:
-* libxml++/nodes/entitydeclaration.cc:
-* libxml++/nodes/entityreference.cc:
-* libxml++/validators/relaxngvalidator.cc: Modify #include directives.
-* libxml++/keepblanks.cc: Ignore deprecation of xmlKeepBlanksDefault().
-* tests/saxparser_chunk_parsing_inconsistent_state/main.cc:
-Accept that MySaxParser::on_start_document() can be called before
-MySaxParser::on_error().
-
-Upstream: https://github.com/libxmlplusplus/libxmlplusplus/commit/49471812d57adfb22dcce3cbea1a8956658731b9
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- libxml++/document.cc                                   |  1 +
- libxml++/dtd.cc                                        |  2 +-
- libxml++/keepblanks.cc                                 |  5 ++++-
- libxml++/nodes/entitydeclaration.cc                    |  2 +-
- libxml++/nodes/entityreference.cc                      |  2 +-
- libxml++/validators/relaxngvalidator.cc                |  1 +
- .../saxparser_chunk_parsing_inconsistent_state/main.cc | 10 +++++++++-
- 7 files changed, 18 insertions(+), 5 deletions(-)
-
-diff --git a/libxml++/document.cc b/libxml++/document.cc
-index da0a8f5..d5476c6 100644
---- a/libxml++/document.cc
-+++ b/libxml++/document.cc
-@@ -16,6 +16,7 @@
- 
- #include <libxml/tree.h>
- #include <libxml/xinclude.h>
-+#include <libxml/xmlsave.h>
- #include <libxml/parser.h> // XML_PARSE_NOXINCNODE, XML_PARSE_NOBASEFIX
- 
- #include <iostream>
-diff --git a/libxml++/dtd.cc b/libxml++/dtd.cc
-index 238b3a0..8014c07 100644
---- a/libxml++/dtd.cc
-+++ b/libxml++/dtd.cc
-@@ -8,7 +8,7 @@
- #include <libxml++/exceptions/parse_error.h>
- #include <libxml++/io/istreamparserinputbuffer.h>
- 
--#include <libxml/tree.h>
-+#include <libxml/parser.h>
- 
- #include <sstream>
- 
-diff --git a/libxml++/keepblanks.cc b/libxml++/keepblanks.cc
-index 4228b8d..56b00cf 100644
---- a/libxml++/keepblanks.cc
-+++ b/libxml++/keepblanks.cc
-@@ -5,8 +5,11 @@
-  * included with libxml++ as the file COPYING.
-  */
- 
--#include <libxml++/keepblanks.h>
-+// xmlKeepBlanksDefault() is deprecated since libxml2 2.12.0.
-+// Ignore deprecations here.
-+#define XML_DEPRECATED
- 
-+#include <libxml++/keepblanks.h>
- #include <libxml/globals.h>
- 
- namespace xmlpp
-diff --git a/libxml++/nodes/entitydeclaration.cc b/libxml++/nodes/entitydeclaration.cc
-index 0a6390e..d5bfa75 100644
---- a/libxml++/nodes/entitydeclaration.cc
-+++ b/libxml++/nodes/entitydeclaration.cc
-@@ -5,7 +5,7 @@
-  */
- 
- #include <libxml++/nodes/entitydeclaration.h>
--#include <libxml/tree.h>
-+#include <libxml/entities.h>
- 
- namespace xmlpp
- {
-diff --git a/libxml++/nodes/entityreference.cc b/libxml++/nodes/entityreference.cc
-index 19b1b22..278a126 100644
---- a/libxml++/nodes/entityreference.cc
-+++ b/libxml++/nodes/entityreference.cc
-@@ -6,7 +6,7 @@
- 
- #include <libxml++/nodes/entityreference.h>
- 
--#include <libxml/tree.h>
-+#include <libxml/entities.h>
- 
- namespace xmlpp
- {
-diff --git a/libxml++/validators/relaxngvalidator.cc b/libxml++/validators/relaxngvalidator.cc
-index 9bb10c2..68a814c 100644
---- a/libxml++/validators/relaxngvalidator.cc
-+++ b/libxml++/validators/relaxngvalidator.cc
-@@ -22,6 +22,7 @@
- #include "libxml++/parsers/domparser.h"
- #include "libxml++/relaxngschema.h"
- 
-+#include <libxml/tree.h>
- #include <libxml/relaxng.h>
- 
- namespace xmlpp
-diff --git a/tests/saxparser_chunk_parsing_inconsistent_state/main.cc b/tests/saxparser_chunk_parsing_inconsistent_state/main.cc
-index 07cc3ef..53f55b3 100644
---- a/tests/saxparser_chunk_parsing_inconsistent_state/main.cc
-+++ b/tests/saxparser_chunk_parsing_inconsistent_state/main.cc
-@@ -24,10 +24,14 @@
- 
- class MySaxParser : public xmlpp::SaxParser
- {
-+public:
-+  bool throw_on_start_doc = true;
-+
- protected:
-   void on_start_document() override
-   {
--    throw std::runtime_error("some custom runtime exception");
-+    if (throw_on_start_doc)
-+      throw std::runtime_error("some custom runtime exception");
-   }
-   void on_error(const xmlpp::ustring& /* text */) override
-   {
-@@ -43,6 +47,9 @@ int main()
-     bool exceptionThrown = false;
-     try
-     {
-+      // Depending on the libxml2 version, MySaxParser::on_start_document()
-+      // may or may not be called before MySaxParser::on_error().
-+      parser.throw_on_start_doc = false;
-       parser.parse_chunk("<?");
-       parser.finish_chunk_parsing();
-     }
-@@ -61,6 +68,7 @@ int main()
-     exceptionThrown = false;
-     try
-     {
-+      parser.throw_on_start_doc = true;
-       std::stringstream ss("<root></root>");
-       parser.parse_stream(ss);
-     }
diff --git a/package/libxmlpp/libxmlpp.hash b/package/libxmlpp/libxmlpp.hash
index 1c1342a105..84084b1e35 100644
--- a/package/libxmlpp/libxmlpp.hash
+++ b/package/libxmlpp/libxmlpp.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libxml++/5.0/libxml++-5.0.2.sha256sum
-sha256  7c17cc3e5a2214314dee5a1354f4b436f266ded6185232a0534f352a76240d5a  libxml++-5.0.2.tar.xz
+# From https://download.gnome.org/sources/libxml++/5.2/libxml++-5.2.0.sha256sum
+sha256  e41b8eae55210511585ae638615f00db7f982c0edea94699865f582daf03b44f  libxml++-5.2.0.tar.xz
 
 # Hash for license file
 sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
diff --git a/package/libxmlpp/libxmlpp.mk b/package/libxmlpp/libxmlpp.mk
index dacd5c1eae..e8fbb75b61 100644
--- a/package/libxmlpp/libxmlpp.mk
+++ b/package/libxmlpp/libxmlpp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBXMLPP_VERSION_MAJOR = 5.0
-LIBXMLPP_VERSION = $(LIBXMLPP_VERSION_MAJOR).2
+LIBXMLPP_VERSION_MAJOR = 5.2
+LIBXMLPP_VERSION = $(LIBXMLPP_VERSION_MAJOR).0
 LIBXMLPP_LICENSE = LGPL-2.1 (library), LGPL-2.0+ (examples)
 LIBXMLPP_LICENSE_FILES = COPYING
 LIBXMLPP_SOURCE = libxml++-$(LIBXMLPP_VERSION).tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
