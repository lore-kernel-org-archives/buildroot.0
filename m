Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39917C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93DAB4F6FE;
	Fri, 28 Feb 2025 17:22:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qzGpc9AfWfql; Fri, 28 Feb 2025 17:21:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEE4F4F661
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEE4F4F661;
	Fri, 28 Feb 2025 17:21:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1081E68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B9BD47036
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wf5_3iFKz6rG for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91F0047415
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91F0047415
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8642386143; Fri, 28 Feb 2025 16:30:45 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 22 Feb 2025 11:58:15 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2f0c31bffdb59fb224387e35134a6d5e09a81d57
X-Git-Newrev: 843a4faa6d2fd047c307178bd07549c32ec76eae
X-Patchwork-Hint: ignore
Message-Id: <20250228163045.8642386143@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libxml2: security bump
 to version 2.13.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: multipart/mixed; boundary="===============1435547276834129597=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1435547276834129597==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=843a4faa6d2fd047c307178bd07549c32ec76eae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes the following security vulnerabilities:

[CVE-2024-56171] Use-after-free in xmlSchemaIDCFillNodeTables
https://gitlab.gnome.org/GNOME/libxml2/-/issues/828

[CVE-2025-24928] Stack-buffer-overflow in xmlSnprintfElements
https://gitlab.gnome.org/GNOME/libxml2/-/issues/847

Null-deref in xmlPatMatch
https://gitlab.gnome.org/GNOME/libxml2/-/issues/861

https://www.openwall.com/lists/oss-security/2025/02/18/2

Drop now upstreamed patches:
https://gitlab.gnome.org/GNOME/libxml2/-/commit/fc72e0833a4e5724aef604e2fd9adb1014cb4844
https://gitlab.gnome.org/GNOME/libxml2/-/commit/539663626b91567159a70791c0f2b3b167135e9b

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../libxml2/0001-Fix-compilation-with-uclibc.patch | 114 ---------------------
 .../0002-Fix-Fix-compilation-with-uclibc.patch     |  31 ------
 package/libxml2/libxml2.hash                       |   4 +-
 package/libxml2/libxml2.mk                         |   2 +-
 4 files changed, 3 insertions(+), 148 deletions(-)

diff --git a/package/libxml2/0001-Fix-compilation-with-uclibc.patch b/package/libxml2/0001-Fix-compilation-with-uclibc.patch
deleted file mode 100644
index aedad27e05..0000000000
--- a/package/libxml2/0001-Fix-compilation-with-uclibc.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From fc72e0833a4e5724aef604e2fd9adb1014cb4844 Mon Sep 17 00:00:00 2001
-From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Date: Mon, 16 Dec 2024 17:23:23 +0100
-Subject: [PATCH] Fix compilation with uclibc
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The patch fixes the following errors and warnings raised by the
-compilation of the library with uClibc:
-
-encoding.c: In function ‘xmlEncInputChunk’:
-encoding.c:2209:32: warning: comparison between pointer and integer
- 2209 |     else if (handler->iconv_in != NULL) {
-      |                                ^~
-encoding.c: In function ‘xmlEncOutputChunk’:
-encoding.c:2269:33: warning: comparison between pointer and integer
- 2269 |     else if (handler->iconv_out != NULL) {
-      |                                 ^~
-encoding.c: In function ‘xmlCharEncCloseFunc’:
-encoding.c:2681:29: warning: comparison between pointer and integer
- 2681 |     if ((handler->iconv_out != NULL) || (handler->iconv_in != NULL)) {
-      |                             ^~
-encoding.c:2681:60: warning: comparison between pointer and integer
- 2681 |     if ((handler->iconv_out != NULL) || (handler->iconv_in != NULL)) {
-      |                                                            ^~
-encoding.c:2683:32: warning: comparison between pointer and integer
- 2683 |         if (handler->iconv_out != NULL) {
-      |                                ^~
-encoding.c:2686:32: error: assignment to ‘iconv_t’ {aka ‘long int’} from ‘void *’ makes integer from pointer without a cast [-Wint-conversion]
- 2686 |             handler->iconv_out = NULL;
-      |                                ^
-encoding.c:2688:31: warning: comparison between pointer and integer
- 2688 |         if (handler->iconv_in != NULL) {
-      |                               ^~
-encoding.c:2691:31: error: assignment to ‘iconv_t’ {aka ‘long int’} from ‘void *’ makes integer from pointer without a cast [-Wint-conversion]
- 2691 |             handler->iconv_in = NULL;
-      |                               ^
-make[4]: *** [Makefile:1147: libxml2_la-encoding.lo] Error 1
-
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Upstream: https://gitlab.gnome.org/GNOME/libxml2/-/commit/fc72e0833a4e5724aef604e2fd9adb1014cb4844
----
- encoding.c | 20 ++++++++++----------
- 1 file changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/encoding.c b/encoding.c
-index 14ffafddbc02..41ecde1885e4 100644
---- a/encoding.c
-+++ b/encoding.c
-@@ -1264,7 +1264,7 @@ DECLARE_ISO_FUNCS(16)
- #endif /* LIBXML_ISO8859X_ENABLED */
- 
- #ifdef LIBXML_ICONV_ENABLED
--  #define EMPTY_ICONV , (iconv_t) 0, (iconv_t) 0
-+  #define EMPTY_ICONV , (iconv_t) -1, (iconv_t) -1
- #else
-   #define EMPTY_ICONV
- #endif
-@@ -1389,8 +1389,8 @@ xmlNewCharEncodingHandler(const char *name,
-     handler->name = up;
- 
- #ifdef LIBXML_ICONV_ENABLED
--    handler->iconv_in = NULL;
--    handler->iconv_out = NULL;
-+    handler->iconv_in = (iconv_t) -1;
-+    handler->iconv_out = (iconv_t) -1;
- #endif
- #ifdef LIBXML_ICU_ENABLED
-     handler->uconv_in = NULL;
-@@ -2200,7 +2200,7 @@ xmlEncInputChunk(xmlCharEncodingHandler *handler, unsigned char *out,
-         }
-     }
- #ifdef LIBXML_ICONV_ENABLED
--    else if (handler->iconv_in != NULL) {
-+    else if (handler->iconv_in != (iconv_t) -1) {
-         ret = xmlIconvWrapper(handler->iconv_in, out, outlen, in, inlen);
-     }
- #endif /* LIBXML_ICONV_ENABLED */
-@@ -2260,7 +2260,7 @@ xmlEncOutputChunk(xmlCharEncodingHandler *handler, unsigned char *out,
-         }
-     }
- #ifdef LIBXML_ICONV_ENABLED
--    else if (handler->iconv_out != NULL) {
-+    else if (handler->iconv_out != (iconv_t) -1) {
-         ret = xmlIconvWrapper(handler->iconv_out, out, outlen, in, inlen);
-     }
- #endif /* LIBXML_ICONV_ENABLED */
-@@ -2672,17 +2672,17 @@ xmlCharEncCloseFunc(xmlCharEncodingHandler *handler) {
-      * Iconv handlers can be used only once, free the whole block.
-      * and the associated icon resources.
-      */
--    if ((handler->iconv_out != NULL) || (handler->iconv_in != NULL)) {
-+    if ((handler->iconv_out != (iconv_t) -1) || (handler->iconv_in != (iconv_t) -1)) {
-         tofree = 1;
--	if (handler->iconv_out != NULL) {
-+	if (handler->iconv_out != (iconv_t) -1) {
- 	    if (iconv_close(handler->iconv_out))
- 		ret = -1;
--	    handler->iconv_out = NULL;
-+	    handler->iconv_out = (iconv_t) -1;
- 	}
--	if (handler->iconv_in != NULL) {
-+	if (handler->iconv_in != (iconv_t) -1) {
- 	    if (iconv_close(handler->iconv_in))
- 		ret = -1;
--	    handler->iconv_in = NULL;
-+	    handler->iconv_in = (iconv_t) -1;
- 	}
-     }
- #endif /* LIBXML_ICONV_ENABLED */
--- 
-2.43.0
-
diff --git a/package/libxml2/0002-Fix-Fix-compilation-with-uclibc.patch b/package/libxml2/0002-Fix-Fix-compilation-with-uclibc.patch
deleted file mode 100644
index 76ea711962..0000000000
--- a/package/libxml2/0002-Fix-Fix-compilation-with-uclibc.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 539663626b91567159a70791c0f2b3b167135e9b Mon Sep 17 00:00:00 2001
-From: Nick Wellnhofer <wellnhofer@aevum.de>
-Date: Thu, 16 Jan 2025 15:50:46 +0100
-Subject: [PATCH] Fix "Fix compilation with uclibc"
-
-The ICU code must initialize the iconv members as well.
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-Upstream: https://gitlab.gnome.org/GNOME/libxml2/-/commit/539663626b91567159a70791c0f2b3b167135e9b
----
- encoding.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/encoding.c b/encoding.c
-index 41ecde18..0ce8d479 100644
---- a/encoding.c
-+++ b/encoding.c
-@@ -1641,6 +1641,10 @@ xmlCreateUconvHandler(const char *name, xmlCharEncodingHandler **out) {
-     }
-     enc->input = NULL;
-     enc->output = NULL;
-+#ifdef LIBXML_ICONV_ENABLED
-+    enc->iconv_in = (iconv_t) -1;
-+    enc->iconv_out = (iconv_t) -1;
-+#endif
-     enc->uconv_in = ucv_in;
-     enc->uconv_out = ucv_out;
- 
--- 
-2.34.1
-
diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index eb92ad4324..88c7f5b9ff 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libxml2/2.13/libxml2-2.13.5.sha256sum
-sha256  74fc163217a3964257d3be39af943e08861263c4231f9ef5b496b6f6d4c7b2b6  libxml2-2.13.5.tar.xz
+# From https://download.gnome.org/sources/libxml2/2.13/libxml2-2.13.6.sha256sum
+sha256  f453480307524968f7a04ec65e64f2a83a825973bcd260a2e7691be82ae70c96  libxml2-2.13.6.tar.xz
 # License files, locally calculated
 sha256  c99aae1afe013e50b8b3701e089222b351258043c3025b64053a233fd25b4be7  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index a8cb86ab2f..148fcd8762 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXML2_VERSION_MAJOR = 2.13
-LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).5
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).6
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
 	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)

--===============1435547276834129597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1435547276834129597==--
