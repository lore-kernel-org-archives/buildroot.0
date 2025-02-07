Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4C9C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDE4E70932;
	Fri, 28 Feb 2025 17:16:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U-LGIjSMMrLI; Fri, 28 Feb 2025 17:16:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 937086FC92
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 937086FC92;
	Fri, 28 Feb 2025 17:16:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1ABD368
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D97CA43AB1
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZXmdgEXlkJT8 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 429C142542
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 429C142542
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A93986780; Fri, 28 Feb 2025 16:30:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 7 Feb 2025 20:29:40 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3fb7ff3dc6c252c4f82f3c65c43c2b89469e8843
X-Git-Newrev: 2da031c2e54cb19efae41fb666064551cfccb59e
X-Patchwork-Hint: ignore
Message-Id: <20250228163036.3A93986780@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libcurl: security bump
 to version 8.12.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2da031c2e54cb19efae41fb666064551cfccb59e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog:
https://curl.se/ch/8.12.0.html

Fixes the following security issues:
- CVE-2025-0167: netrc and default credential leak.
  https://curl.se/docs/CVE-2025-0167.html
- CVE-2025-0665: eventfd double close.
  https://curl.se/docs/CVE-2025-0665.html
- CVE-2025-0725: gzip integer overflow.
  https://curl.se/docs/CVE-2025-0725.html

Drop upstream patch - 0001-curl_trc-fix-build-with-verbose-messages-disabled.patch
see https://github.com/curl/curl/commit/80257779179ce994b647daca60d7b1c4980b130b

Updated hash of the COPYING file (copyright year bump)

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-fix-build-with-verbose-messages-disabled.patch | 44 ----------------------
 package/libcurl/libcurl.hash                       |  6 +--
 package/libcurl/libcurl.mk                         |  2 +-
 3 files changed, 4 insertions(+), 48 deletions(-)

diff --git a/package/libcurl/0001-curl_trc-fix-build-with-verbose-messages-disabled.patch b/package/libcurl/0001-curl_trc-fix-build-with-verbose-messages-disabled.patch
deleted file mode 100644
index ffa44b87b6..0000000000
--- a/package/libcurl/0001-curl_trc-fix-build-with-verbose-messages-disabled.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 58d490091d097ba2ad108cc66c97e242e5aacb9c Mon Sep 17 00:00:00 2001
-Message-ID: <58d490091d097ba2ad108cc66c97e242e5aacb9c.1727153835.git.baruch@tkos.co.il>
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 24 Sep 2024 07:52:13 +0300
-Subject: [PATCH] curl_trc: fix build with verbose messages disabled
-
-Add empty definition of Curl_trc_ws() to fix this following build error:
-
-In file included from sendf.h:29,
-                 from ws.c:35:
-ws.c: In function 'Curl_ws_accept':
-curl_trc.h:100:10: error: implicit declaration of function 'Curl_trc_ws'; did you mean 'Curl_trc_ftp'? [-Wimplicit-function-declaration]
-  100 |          Curl_trc_ws(data, __VA_ARGS__); } while(0)
-      |          ^~~~~~~~~~~
-ws.c:779:5: note: in expansion of macro 'CURL_TRC_WS'
-  779 |     CURL_TRC_WS(data, "WS, using chunk size %zu", chunk_size);
-      |     ^~~~~~~~~~~
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-Upstream: https://github.com/curl/curl/pull/15026
----
- lib/curl_trc.h | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/lib/curl_trc.h b/lib/curl_trc.h
-index 5f675b453fd3..1801d33cea7c 100644
---- a/lib/curl_trc.h
-+++ b/lib/curl_trc.h
-@@ -226,6 +226,12 @@ static void Curl_trc_smtp(struct Curl_easy *data, const char *fmt, ...)
-   (void)data; (void)fmt;
- }
- #endif
-+#if defined(USE_WEBSOCKETS) && !defined(CURL_DISABLE_HTTP)
-+static void Curl_trc_ws(struct Curl_easy *data, const char *fmt, ...)
-+{
-+  (void)data; (void)fmt;
-+}
-+#endif
- 
- #endif /* !defined(CURL_DISABLE_VERBOSE_STRINGS) */
- 
--- 
-2.45.2
-
diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index c2ddee2cc2..a79635ed21 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-8.11.1.tar.xz.asc
+# https://curl.se/download/curl-8.12.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  c7ca7db48b0909743eaef34250da02c19bc61d4f1dcedd6603f109409536ab56  curl-8.11.1.tar.xz
-sha256  adb1fc06547fd136244179809f7b7c2d2ae6c4534f160aa513af9b6a12866a32  COPYING
+sha256  9a4628c764be6b1a9909567c13e8e771041609df43b2158fcac4e05ea7097e5d  curl-8.12.0.tar.xz
+sha256  e18f1989333b70044b2adfb7dc2f905d0119dbdcac3bc9f4bc9d540e3a29de5b  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 845bf43418..56a5761d68 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.11.1
+LIBCURL_VERSION = 8.12.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
