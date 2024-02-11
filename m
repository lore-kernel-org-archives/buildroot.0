Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF7CC4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 15:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 196EB4025D;
	Sun, 11 Feb 2024 15:11:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eQRkaqGW9rmx; Sun, 11 Feb 2024 15:11:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CC4740339
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CC4740339;
	Sun, 11 Feb 2024 15:11:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 51A7B1BF403
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F7FD820D8
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:11:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b2hHcl2Eqgju for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 15:11:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 690F9820D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 690F9820D6
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 15:11:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C55EB874CD; Sun, 11 Feb 2024 15:11:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 16:09:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 622fec1bb39fb1ca6aa9c5a9df2f93b3246be4a8
X-Git-Newrev: 5cee6b6be6524e443012d130e09b0e6983b0ff90
X-Patchwork-Hint: ignore
Message-Id: <20240211151102.C55EB874CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcurl: bump version to 8.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=5cee6b6be6524e443012d130e09b0e6983b0ff90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://curl.se/changes.html#8_6_0

Removed patch which was included in upstream release.

Updated license hash due to copyright year bump:
https://github.com/curl/curl/commit/57cc70e559aa065426021e22e2af8166af6084f6

Added configure options for optional libpsl support due to upstream
commit which throws an error during configure when libpsl is missing and
--without-libpsl was not used:
https://github.com/curl/curl/commit/2998874bb61ac6ef3b72d6a61467cd2aaf6e53ea

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...001-gnutls-fix-build-with-disable-verbose.patch | 60 ----------------------
 package/libcurl/libcurl.hash                       |  6 +--
 package/libcurl/libcurl.mk                         |  9 +++-
 3 files changed, 11 insertions(+), 64 deletions(-)

diff --git a/package/libcurl/0001-gnutls-fix-build-with-disable-verbose.patch b/package/libcurl/0001-gnutls-fix-build-with-disable-verbose.patch
deleted file mode 100644
index 25e389c972..0000000000
--- a/package/libcurl/0001-gnutls-fix-build-with-disable-verbose.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 0d9f9c5ea8c15c70eb420242b60179d9083c70b7 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Mon, 11 Dec 2023 20:45:01 +0200
-Subject: [PATCH] gnutls: fix build with --disable-verbose
-
-infof() parameters must be defined event with --disable-verbose since
-commit dac293cfb702 ("lib: apache style infof and trace
-macros/functions").
-
-Move also 'ptr' definition under !CURL_DISABLE_VERBOSE_STRINGS.
-
-Fixes the following build failure:
-
-In file included from ../lib/sendf.h:29,
-                 from vtls/gtls.c:44:
-vtls/gtls.c: In function 'Curl_gtls_verifyserver':
-vtls/gtls.c:841:34: error: 'version' undeclared (first use in this function); did you mean 'session'?
-  841 |         gnutls_protocol_get_name(version), ptr);
-      |                                  ^~~~~~~
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-Upstream: https://github.com/curl/curl/commit/af520ac9fec7d88e942f05fdcd90704adb9fa566
----
- lib/vtls/gtls.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/lib/vtls/gtls.c b/lib/vtls/gtls.c
-index f42b6d6691de..b95c5be3c5e5 100644
---- a/lib/vtls/gtls.c
-+++ b/lib/vtls/gtls.c
-@@ -818,16 +818,17 @@ Curl_gtls_verifyserver(struct Curl_easy *data,
-   char certname[65] = ""; /* limited to 64 chars by ASN.1 */
-   size_t size;
-   time_t certclock;
--  const char *ptr;
-   int rc;
-   CURLcode result = CURLE_OK;
- #ifndef CURL_DISABLE_VERBOSE_STRINGS
-+  const char *ptr;
-   unsigned int algo;
-   unsigned int bits;
-   gnutls_protocol_t version = gnutls_protocol_get_version(session);
- #endif
-   long * const certverifyresult = &ssl_config->certverifyresult;
- 
-+#ifndef CURL_DISABLE_VERBOSE_STRINGS
-   /* the name of the cipher suite used, e.g. ECDHE_RSA_AES_256_GCM_SHA384. */
-   ptr = gnutls_cipher_suite_get_name(gnutls_kx_get(session),
-                                      gnutls_cipher_get(session),
-@@ -835,6 +836,7 @@ Curl_gtls_verifyserver(struct Curl_easy *data,
- 
-   infof(data, "SSL connection using %s / %s",
-         gnutls_protocol_get_name(version), ptr);
-+#endif
- 
-   /* This function will return the peer's raw certificate (chain) as sent by
-      the peer. These certificates are in raw format (DER encoded for
--- 
-2.43.0
-
diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index d5c20d29d3..1f3dce0fd5 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-8.5.0.tar.xz.asc
+# https://curl.se/download/curl-8.6.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  42ab8db9e20d8290a3b633e7fbb3cec15db34df65fd1015ef8ac1e4723750eeb  curl-8.5.0.tar.xz
-sha256  b1d7feb949ea5023552029fbe0bf5db4f23c2f85e9b8e51e18536f0ecbf9c524  COPYING
+sha256  3ccd55d91af9516539df80625f818c734dc6f2ecf9bada33c76765e99121db15  curl-8.6.0.tar.xz
+sha256  adb1fc06547fd136244179809f7b7c2d2ae6c4534f160aa513af9b6a12866a32  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 83845b8e87..9dafe90c82 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.5.0
+LIBCURL_VERSION = 8.6.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
@@ -112,6 +112,13 @@ else
 LIBCURL_CONF_OPTS += --without-libidn2
 endif
 
+ifeq ($(BR2_PACKAGE_LIBPSL),y)
+LIBCURL_DEPENDENCIES += libpsl
+LIBCURL_CONF_OPTS += --with-libpsl
+else
+LIBCURL_CONF_OPTS += --without-libpsl
+endif
+
 # Configure curl to support libssh2
 ifeq ($(BR2_PACKAGE_LIBSSH2),y)
 LIBCURL_DEPENDENCIES += libssh2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
