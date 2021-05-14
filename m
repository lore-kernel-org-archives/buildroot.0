Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA5F9C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:12:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABDBE60EBC
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ABDBE60EBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84C3A60862;
	Tue,  3 Aug 2021 21:12:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tbh_EuXnC1GB; Tue,  3 Aug 2021 21:12:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 782F860653;
	Tue,  3 Aug 2021 21:12:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 111FA1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F024E4047B
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EMvS4AH8mDuc for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CB004015B
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C6C6E87BB7; Tue,  3 Aug 2021 21:09:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 May 2021 09:40:14 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b544587806d9a17f0b27335bbb1a1b4ca347bc5a
X-Git-Newrev: a241dcec4188dbf30fbc8b65d7e6f2ece9da3d04
X-Patchwork-Hint: ignore
Message-Id: <20210803210935.C6C6E87BB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libxml2: security bump
 to version 2.9.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=a241dcec4188dbf30fbc8b65d7e6f2ece9da3d04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update libxml2 to version 2.9.11, which incorporates all the patches
carried by Buildroot (which are hence removed), and includes fixes for
CVE-2020-7595, CVE-2019-20388, CVE-2020-24977, and CVE-2021-3541 (at
least), as per

  https://gitlab.gnome.org/GNOME/libxml2/-/issues/186#note_1104945

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...finite-loop-in-xmlStringLenDecodeEntities.patch | 36 -------------------
 ...ix-memory-leak-in-xmlSchemaValidateStream.patch | 35 -------------------
 ...-out-of-bounds-read-with-xmllint--htmlout.patch | 40 ----------------------
 package/libxml2/libxml2.hash                       |  2 +-
 package/libxml2/libxml2.mk                         |  8 +----
 5 files changed, 2 insertions(+), 119 deletions(-)

diff --git a/package/libxml2/0001-Fix-infinite-loop-in-xmlStringLenDecodeEntities.patch b/package/libxml2/0001-Fix-infinite-loop-in-xmlStringLenDecodeEntities.patch
deleted file mode 100644
index a79adc3f85..0000000000
--- a/package/libxml2/0001-Fix-infinite-loop-in-xmlStringLenDecodeEntities.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 0e1a49c8907645d2e155f0d89d4d9895ac5112b5 Mon Sep 17 00:00:00 2001
-From: Zhipeng Xie <xiezhipeng1@huawei.com>
-Date: Thu, 12 Dec 2019 17:30:55 +0800
-Subject: [PATCH] Fix infinite loop in xmlStringLenDecodeEntities
-
-When ctxt->instate == XML_PARSER_EOF,xmlParseStringEntityRef
-return NULL which cause a infinite loop in xmlStringLenDecodeEntities
-
-Found with libFuzzer.
-
-Fixes CVE-2020-7595: xmlStringLenDecodeEntities in parser.c in libxml2
-2.9.10 has an infinite loop in a certain end-of-file situation.
-
-Signed-off-by: Zhipeng Xie <xiezhipeng1@huawei.com>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- parser.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/parser.c b/parser.c
-index d1c31963..a34bb6cd 100644
---- a/parser.c
-+++ b/parser.c
-@@ -2646,7 +2646,8 @@ xmlStringLenDecodeEntities(xmlParserCtxtPtr ctxt, const xmlChar *str, int len,
-     else
-         c = 0;
-     while ((c != 0) && (c != end) && /* non input consuming loop */
--	   (c != end2) && (c != end3)) {
-+           (c != end2) && (c != end3) &&
-+           (ctxt->instate != XML_PARSER_EOF)) {
- 
- 	if (c == 0) break;
-         if ((c == '&') && (str[1] == '#')) {
--- 
-2.20.1
-
diff --git a/package/libxml2/0002-Fix-memory-leak-in-xmlSchemaValidateStream.patch b/package/libxml2/0002-Fix-memory-leak-in-xmlSchemaValidateStream.patch
deleted file mode 100644
index 2aeddf6775..0000000000
--- a/package/libxml2/0002-Fix-memory-leak-in-xmlSchemaValidateStream.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 7ffcd44d7e6c46704f8af0321d9314cd26e0e18a Mon Sep 17 00:00:00 2001
-From: Zhipeng Xie <xiezhipeng1@huawei.com>
-Date: Tue, 20 Aug 2019 16:33:06 +0800
-Subject: [PATCH] Fix memory leak in xmlSchemaValidateStream
-
-When ctxt->schema is NULL, xmlSchemaSAXPlug->xmlSchemaPreRun
-alloc a new schema for ctxt->schema and set vctxt->xsiAssemble
-to 1. Then xmlSchemaVStart->xmlSchemaPreRun initialize
-vctxt->xsiAssemble to 0 again which cause the alloced schema
-can not be freed anymore.
-
-Found with libFuzzer.
-
-Signed-off-by: Zhipeng Xie <xiezhipeng1@huawei.com>
-[import into Buildroot]
-Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
----
- xmlschemas.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/xmlschemas.c b/xmlschemas.c
-index 301c8449..39d92182 100644
---- a/xmlschemas.c
-+++ b/xmlschemas.c
-@@ -28090,7 +28090,6 @@ xmlSchemaPreRun(xmlSchemaValidCtxtPtr vctxt) {
-     vctxt->nberrors = 0;
-     vctxt->depth = -1;
-     vctxt->skipDepth = -1;
--    vctxt->xsiAssemble = 0;
-     vctxt->hasKeyrefs = 0;
- #ifdef ENABLE_IDC_NODE_TABLES_TEST
-     vctxt->createIDCNodeTables = 1;
--- 
-2.24.1
-
diff --git a/package/libxml2/0003-Fix-out-of-bounds-read-with-xmllint--htmlout.patch b/package/libxml2/0003-Fix-out-of-bounds-read-with-xmllint--htmlout.patch
deleted file mode 100644
index 460f2a3ae6..0000000000
--- a/package/libxml2/0003-Fix-out-of-bounds-read-with-xmllint--htmlout.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 50f06b3efb638efb0abd95dc62dca05ae67882c2 Mon Sep 17 00:00:00 2001
-From: Nick Wellnhofer <wellnhofer@aevum.de>
-Date: Fri, 7 Aug 2020 21:54:27 +0200
-Subject: [PATCH] Fix out-of-bounds read with 'xmllint --htmlout'
-
-Make sure that truncated UTF-8 sequences don't cause an out-of-bounds
-array access.
-
-Thanks to @SuhwanSong and the Agency for Defense Development (ADD) for
-the report.
-
-Fixes #178.
-
-[Retrieved from:
-https://gitlab.gnome.org/GNOME/libxml2/-/commit/50f06b3efb638efb0abd95dc62dca05ae67882c2]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- xmllint.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/xmllint.c b/xmllint.c
-index f6a8e4636..c647486f3 100644
---- a/xmllint.c
-+++ b/xmllint.c
-@@ -528,6 +528,12 @@ static void
- xmlHTMLEncodeSend(void) {
-     char *result;
- 
-+    /*
-+     * xmlEncodeEntitiesReentrant assumes valid UTF-8, but the buffer might
-+     * end with a truncated UTF-8 sequence. This is a hack to at least avoid
-+     * an out-of-bounds read.
-+     */
-+    memset(&buffer[sizeof(buffer)-4], 0, 4);
-     result = (char *) xmlEncodeEntitiesReentrant(NULL, BAD_CAST buffer);
-     if (result) {
- 	xmlGenericError(xmlGenericErrorContext, "%s", result);
--- 
-GitLab
-
diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index d890713a7c..563a5f89c9 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	aafee193ffb8fe0c82d4afef6ef91972cbaf5feea100edc2f262750611b4be1f	libxml2-2.9.10.tar.gz
+sha256	886f696d5d5b45d780b2880645edf9e0c62a4fd6841b853e824ada4e02b4d331	libxml2-2.9.11.tar.gz
 # License files, locally calculated
 sha256	c5c63674f8a83c4d2e385d96d1c670a03cb871ba2927755467017317878574bd	COPYING
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index e472970fde..f39e688781 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -4,17 +4,11 @@
 #
 ################################################################################
 
-LIBXML2_VERSION = 2.9.10
+LIBXML2_VERSION = 2.9.11
 LIBXML2_SITE = http://xmlsoft.org/sources
 LIBXML2_INSTALL_STAGING = YES
 LIBXML2_LICENSE = MIT
 LIBXML2_LICENSE_FILES = COPYING
-# 0001-Fix-infinite-loop-in-xmlStringLenDecodeEntities.patch
-LIBXML2_IGNORE_CVES += CVE-2020-7595
-# 0002-Fix-memory-leak-in-xmlSchemaValidateStream.patch
-LIBXML2_IGNORE_CVES += CVE-2019-20388
-# 0003-Fix-out-of-bounds-read-with-xmllint--htmlout.patch
-LIBXML2_IGNORE_CVES += CVE-2020-24977
 LIBXML2_CPE_ID_VENDOR = xmlsoft
 LIBXML2_CONFIG_SCRIPTS = xml2-config
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
