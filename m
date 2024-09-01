Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1DCCA101E
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 14:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E3524058E;
	Sun,  1 Sep 2024 14:58:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XaG0xCAAZrJm; Sun,  1 Sep 2024 14:58:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C132C40519
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C132C40519;
	Sun,  1 Sep 2024 14:58:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7AD281BF2B6
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 14:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6829440433
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 14:57:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sZMEsyhyYDJe for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 14:57:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33B074021C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33B074021C
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 14:57:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E9AF8691D; Sun,  1 Sep 2024 14:57:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Sep 2024 16:41:00 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: ba2fc580737b762420c2f2c751fbd1ea30bc2739
X-Git-Newrev: b4c2cc92191a4034b30fdbeccbaeb31213cafd12
X-Patchwork-Hint: ignore
Message-Id: <20240901145754.2E9AF8691D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/libcurl: security
 bump to version 8.9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b4c2cc92191a4034b30fdbeccbaeb31213cafd12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Removed patch which is included in this release.

Changelog: https://curl.se/changes.html#8_9_0

Fixes
CVE-2024-6197: https://curl.se/docs/CVE-2024-6197.html
CVE-2024-6874 (Apple-only): https://curl.se/docs/CVE-2024-6874.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e6816ece5b425fce6fc3e080178ff04060b8ef08)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-mbedtls-check-version-for-cipher-id.patch | 56 ----------------------
 package/libcurl/libcurl.hash                       |  4 +-
 package/libcurl/libcurl.mk                         |  2 +-
 3 files changed, 3 insertions(+), 59 deletions(-)

diff --git a/package/libcurl/0001-mbedtls-check-version-for-cipher-id.patch b/package/libcurl/0001-mbedtls-check-version-for-cipher-id.patch
deleted file mode 100644
index b7d674acfe..0000000000
--- a/package/libcurl/0001-mbedtls-check-version-for-cipher-id.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 0c4b4c1e93c8e869af230090f32346fdfd548f21 Mon Sep 17 00:00:00 2001
-From: Stefan Eissing <stefan@eissing.org>
-Date: Wed, 22 May 2024 14:44:56 +0200
-Subject: [PATCH] mbedtls: check version for cipher id
-
-mbedtls_ssl_get_ciphersuite_id_from_ssl() seems to have been added in
-mbedtls 3.2.0. Check for that version.
-
-Closes #13749
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-Upstream: https://github.com/curl/curl/commit/0c4b4c1e93c8e869af230090f32346fdfd548f21
----
- lib/vtls/mbedtls.c | 19 ++++++++++++-------
- 1 file changed, 12 insertions(+), 7 deletions(-)
-
-diff --git a/lib/vtls/mbedtls.c b/lib/vtls/mbedtls.c
-index ec0b10dd9a9f..98a4ea01b183 100644
---- a/lib/vtls/mbedtls.c
-+++ b/lib/vtls/mbedtls.c
-@@ -902,8 +902,6 @@ mbed_connect_step2(struct Curl_cfilter *cf, struct Curl_easy *data)
-     (struct mbed_ssl_backend_data *)connssl->backend;
-   struct ssl_primary_config *conn_config = Curl_ssl_cf_get_primary_config(cf);
-   const mbedtls_x509_crt *peercert;
--  char cipher_str[64];
--  uint16_t cipher_id;
- #ifndef CURL_DISABLE_PROXY
-   const char * const pinnedpubkey = Curl_ssl_cf_is_proxy(cf)?
-     data->set.str[STRING_SSL_PINNEDPUBLICKEY_PROXY]:
-@@ -932,11 +930,18 @@ mbed_connect_step2(struct Curl_cfilter *cf, struct Curl_easy *data)
-     return CURLE_SSL_CONNECT_ERROR;
-   }
- 
--  cipher_id = (uint16_t)
--              mbedtls_ssl_get_ciphersuite_id_from_ssl(&backend->ssl);
--  mbed_cipher_suite_get_str(cipher_id, cipher_str, sizeof(cipher_str), true);
--  infof(data, "mbedTLS: Handshake complete, cipher is %s", cipher_str);
--
-+#if MBEDTLS_VERSION_NUMBER >= 0x03020000
-+  {
-+    char cipher_str[64];
-+    uint16_t cipher_id;
-+    cipher_id = (uint16_t)
-+                mbedtls_ssl_get_ciphersuite_id_from_ssl(&backend->ssl);
-+    mbed_cipher_suite_get_str(cipher_id, cipher_str, sizeof(cipher_str), true);
-+    infof(data, "mbedTLS: Handshake complete, cipher is %s", cipher_str);
-+  }
-+#else
-+  infof(data, "mbedTLS: Handshake complete");
-+#endif
-   ret = mbedtls_ssl_get_verify_result(&backend->ssl);
- 
-   if(!conn_config->verifyhost)
--- 
-2.43.0
-
diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 7ba45b79d7..fa325efd7d 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-8.8.0.tar.xz.asc
+# https://curl.se/download/curl-8.9.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  0f58bb95fc330c8a46eeb3df5701b0d90c9d9bfcc42bd1cd08791d12551d4400  curl-8.8.0.tar.xz
+sha256  ff09b2791ca56d25fd5c3f3a4927dce7c8a9dc4182200c487ca889fba1fdd412  curl-8.9.0.tar.xz
 sha256  adb1fc06547fd136244179809f7b7c2d2ae6c4534f160aa513af9b6a12866a32  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 172dd22071..966885aeda 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.8.0
+LIBCURL_VERSION = 8.9.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
