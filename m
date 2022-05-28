Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC3DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 09:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 169E46F4CA;
	Sat, 28 May 2022 09:19:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HyNbFR1-0tZc; Sat, 28 May 2022 09:19:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2F0F61098;
	Sat, 28 May 2022 09:19:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E3D541BF5DA
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 09:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D72F60B26
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 09:17:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id liUKUwNfGb7G for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 09:17:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 879626108B
 for <buildroot@buildroot.org>; Sat, 28 May 2022 09:17:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4952C84245; Sat, 28 May 2022 09:05:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 11:16:18 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: e2fb74103e3b5dac0a76de59152583ca9473c0cf
X-Git-Newrev: 070e6cff51c782604f88e2bbfb8613dfdc7b9e02
X-Patchwork-Hint: ignore
Message-Id: <20220528090538.4952C84245@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libcurl: security
 bump to version 7.83.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=070e6cff51c782604f88e2bbfb8613dfdc7b9e02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fixes the following security issues:

- CVE-2022-27778: curl removes wrong file on error
  https://curl.se/docs/CVE-2022-27778.html

- CVE-2022-27779: cookie for trailing dot TLD
  https://curl.se/docs/CVE-2022-27779.html

- CVE-2022-27780: percent-encoded path separator in URL host
  https://curl.se/docs/CVE-2022-27780.html

- CVE-2022-27781: CERTINFO never-ending busy-loop
  https://curl.se/docs/CVE-2022-27781.html

- CVE-2022-27782: TLS and SSH connection too eager reuse
  https://curl.se/docs/CVE-2022-27782.html

- CVE-2022-30115: HSTS bypass via trailing dot
  https://curl.se/docs/CVE-2022-30115.html

Drop now upstreamed 0001-mbedtls-fix-compile-when-h2-enabled.patch

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit de2961462bbb57985f73dfad18cc7a33d03fc433)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-mbedtls-fix-compile-when-h2-enabled.patch | 32 ----------------------
 package/libcurl/libcurl.hash                       |  4 +--
 package/libcurl/libcurl.mk                         |  2 +-
 3 files changed, 3 insertions(+), 35 deletions(-)

diff --git a/package/libcurl/0001-mbedtls-fix-compile-when-h2-enabled.patch b/package/libcurl/0001-mbedtls-fix-compile-when-h2-enabled.patch
deleted file mode 100644
index 61cbabd84a..0000000000
--- a/package/libcurl/0001-mbedtls-fix-compile-when-h2-enabled.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 6eb7fb37d901ed1e4ce07cbd628ee11bf02db1f3 Mon Sep 17 00:00:00 2001
-From: Daniel Stenberg <daniel@haxx.se>
-Date: Thu, 28 Apr 2022 17:11:50 +0200
-Subject: [PATCH] mbedtls: fix compile when h2-enabled
-
-Fixes #8766
-Reported-by: LigH-de on github
-Closes #8768
-
-Downloaded from upstream commit
-https://github.com/curl/curl/commit/6eb7fb37d901ed1e4ce07cbd628ee11bf02db1f3
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- lib/vtls/mbedtls.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lib/vtls/mbedtls.c b/lib/vtls/mbedtls.c
-index 64f57c5d8321..5f9b87e6b75b 100644
---- a/lib/vtls/mbedtls.c
-+++ b/lib/vtls/mbedtls.c
-@@ -815,8 +815,8 @@ mbed_connect_step2(struct Curl_easy *data, struct connectdata *conn,
-     if(next_protocol) {
-       infof(data, VTLS_INFOF_ALPN_ACCEPTED_1STR, next_protocol);
- #ifdef USE_HTTP2
--      if(!strncmp(next_protocol, ALPN_H2, ALPN_H2_LEN) &&
--         !next_protocol[ALPN_H2_LEN]) {
-+      if(!strncmp(next_protocol, ALPN_H2, ALPN_H2_LENGTH) &&
-+         !next_protocol[ALPN_H2_LENGTH]) {
-         conn->negnpn = CURL_HTTP_VERSION_2;
-       }
-       else
diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 64a1129a90..8672380f09 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-7.83.0.tar.xz.asc
+# https://curl.se/download/curl-7.83.1.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  bbff0e6b5047e773f3c3b084d80546cc1be4e354c09e419c2d0ef6116253511a  curl-7.83.0.tar.xz
+sha256  2cb9c2356e7263a1272fd1435ef7cdebf2cd21400ec287b068396deb705c22c4  curl-7.83.1.tar.xz
 sha256  321b1a09ebc30410f2e837c072e5521cf7095b757193af4a7dae1086e36ed31a  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index ea8529c914..15943f7512 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.83.0
+LIBCURL_VERSION = 7.83.1
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
