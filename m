Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6601ECA101E
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 14:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3710940520;
	Sun,  1 Sep 2024 14:58:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zJCNPWhxmlcM; Sun,  1 Sep 2024 14:58:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE8EA4056F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE8EA4056F;
	Sun,  1 Sep 2024 14:58:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4DE721BF2B6
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 14:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4739E40343
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 14:57:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wz4LtdFtiLuN for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 14:57:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33CD940304
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33CD940304
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 14:57:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 224948691B; Sun,  1 Sep 2024 14:57:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Sep 2024 16:40:43 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: aa3e78f18d4ea73a8242c41bca73fbe943b157c2
X-Git-Newrev: ba2fc580737b762420c2f2c751fbd1ea30bc2739
X-Patchwork-Hint: ignore
Message-Id: <20240901145754.224948691B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/libcurl: fix
 build with mbedtls
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

commit: https://git.buildroot.net/buildroot/commit/?id=ba2fc580737b762420c2f2c751fbd1ea30bc2739
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Add upstream patch to fix compatibility with mbedtls version 2.28.x, which
is broken since commit 50bdb2a3b7 (package/libcurl: bump version to 8.8.0).

Fixes:
http://autobuild.buildroot.net/results/66ba878386e4e478645edb6a282e82820b8dad7f
http://autobuild.buildroot.net/results/7a4d9595197cf23080a23dfe9bc0e60b8145af6e
http://autobuild.buildroot.net/results/9add7283813388daa95b16ef76acb3c4e9ea7c2f

[Peter: mention when this issue was introduced]
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d611acf8e9f9d598f001fec65c974b0c3f20a1f6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-mbedtls-check-version-for-cipher-id.patch | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/libcurl/0001-mbedtls-check-version-for-cipher-id.patch b/package/libcurl/0001-mbedtls-check-version-for-cipher-id.patch
new file mode 100644
index 0000000000..b7d674acfe
--- /dev/null
+++ b/package/libcurl/0001-mbedtls-check-version-for-cipher-id.patch
@@ -0,0 +1,56 @@
+From 0c4b4c1e93c8e869af230090f32346fdfd548f21 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Wed, 22 May 2024 14:44:56 +0200
+Subject: [PATCH] mbedtls: check version for cipher id
+
+mbedtls_ssl_get_ciphersuite_id_from_ssl() seems to have been added in
+mbedtls 3.2.0. Check for that version.
+
+Closes #13749
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+Upstream: https://github.com/curl/curl/commit/0c4b4c1e93c8e869af230090f32346fdfd548f21
+---
+ lib/vtls/mbedtls.c | 19 ++++++++++++-------
+ 1 file changed, 12 insertions(+), 7 deletions(-)
+
+diff --git a/lib/vtls/mbedtls.c b/lib/vtls/mbedtls.c
+index ec0b10dd9a9f..98a4ea01b183 100644
+--- a/lib/vtls/mbedtls.c
++++ b/lib/vtls/mbedtls.c
+@@ -902,8 +902,6 @@ mbed_connect_step2(struct Curl_cfilter *cf, struct Curl_easy *data)
+     (struct mbed_ssl_backend_data *)connssl->backend;
+   struct ssl_primary_config *conn_config = Curl_ssl_cf_get_primary_config(cf);
+   const mbedtls_x509_crt *peercert;
+-  char cipher_str[64];
+-  uint16_t cipher_id;
+ #ifndef CURL_DISABLE_PROXY
+   const char * const pinnedpubkey = Curl_ssl_cf_is_proxy(cf)?
+     data->set.str[STRING_SSL_PINNEDPUBLICKEY_PROXY]:
+@@ -932,11 +930,18 @@ mbed_connect_step2(struct Curl_cfilter *cf, struct Curl_easy *data)
+     return CURLE_SSL_CONNECT_ERROR;
+   }
+ 
+-  cipher_id = (uint16_t)
+-              mbedtls_ssl_get_ciphersuite_id_from_ssl(&backend->ssl);
+-  mbed_cipher_suite_get_str(cipher_id, cipher_str, sizeof(cipher_str), true);
+-  infof(data, "mbedTLS: Handshake complete, cipher is %s", cipher_str);
+-
++#if MBEDTLS_VERSION_NUMBER >= 0x03020000
++  {
++    char cipher_str[64];
++    uint16_t cipher_id;
++    cipher_id = (uint16_t)
++                mbedtls_ssl_get_ciphersuite_id_from_ssl(&backend->ssl);
++    mbed_cipher_suite_get_str(cipher_id, cipher_str, sizeof(cipher_str), true);
++    infof(data, "mbedTLS: Handshake complete, cipher is %s", cipher_str);
++  }
++#else
++  infof(data, "mbedTLS: Handshake complete");
++#endif
+   ret = mbedtls_ssl_get_verify_result(&backend->ssl);
+ 
+   if(!conn_config->verifyhost)
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
