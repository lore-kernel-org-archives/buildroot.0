Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6536C021AA
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 20:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E4FB606F3;
	Mon, 17 Feb 2025 20:00:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JpDB1afim5FM; Mon, 17 Feb 2025 20:00:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E964160AE4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E964160AE4;
	Mon, 17 Feb 2025 20:00:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 61968C8
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4648081083
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:00:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lt9zq_4fedAh for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 20:00:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3155C8107C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3155C8107C
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:00:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E44E876DF; Mon, 17 Feb 2025 20:00:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Feb 2025 20:58:48 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: be2424f55cc22f66dd9e83fc12cad6928998a2cd
X-Git-Newrev: 2a24d3410d9e5909450a0aa9a034d5db7ec18529
X-Patchwork-Hint: ignore
Message-Id: <20250217200038.1E44E876DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/libcurl: bump
 version to 8.12.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a24d3410d9e5909450a0aa9a034d5db7ec18529
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Changelog: https://curl.se/ch/8.12.1.html

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f6770cc13e2a1fe01b4244e3a0a67b281dc510f9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0001-vtsl-eliminate-data-state-ssl_scache.patch | 147 ---------------------
 package/libcurl/libcurl.hash                       |   4 +-
 package/libcurl/libcurl.mk                         |   2 +-
 3 files changed, 3 insertions(+), 150 deletions(-)

diff --git a/package/libcurl/0001-vtsl-eliminate-data-state-ssl_scache.patch b/package/libcurl/0001-vtsl-eliminate-data-state-ssl_scache.patch
deleted file mode 100644
index 775aaa667f..0000000000
--- a/package/libcurl/0001-vtsl-eliminate-data-state-ssl_scache.patch
+++ /dev/null
@@ -1,147 +0,0 @@
-https://github.com/curl/curl/issues/16236#issuecomment-2645385845
-https://github.com/curl/curl/commit/242a1439e7d8cdb72ae6a2fa2e705e2d9a2b7501
-
-Fixes curl bug https://github.com/curl/curl/issues/16236 "that caused
-a segfault in kodi".
-
-Instead of adding upstream commit
-https://github.com/curl/curl/commit/242a1439e7d8cdb72ae6a2fa2e705e2d9a2b7501
-which does not apply cleanly on libcurl 8.12.0 we use the Gentoo version:
-https://github.com/gentoo/gentoo/blob/master/net-misc/curl/files/curl-8.12.0-multi.patch
-
-Upstream: https://github.com/curl/curl/commit/242a1439e7d8cdb72ae6a2fa2e705e2d9a2b7501
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-
---- a/lib/setopt.c
-+++ b/lib/setopt.c
-@@ -1584,10 +1584,6 @@ static CURLcode setopt_pointers(struct Curl_easy *data, CURLoption option,
-       if(data->share->hsts == data->hsts)
-         data->hsts = NULL;
- #endif
--#ifdef USE_SSL
--      if(data->share->ssl_scache == data->state.ssl_scache)
--        data->state.ssl_scache = data->multi ? data->multi->ssl_scache : NULL;
--#endif
- #ifdef USE_LIBPSL
-       if(data->psl == &data->share->psl)
-         data->psl = data->multi ? &data->multi->psl : NULL;
-@@ -1628,10 +1624,6 @@ static CURLcode setopt_pointers(struct Curl_easy *data, CURLoption option,
-         data->hsts = data->share->hsts;
-       }
- #endif
--#ifdef USE_SSL
--      if(data->share->ssl_scache)
--        data->state.ssl_scache = data->share->ssl_scache;
--#endif
- #ifdef USE_LIBPSL
-       if(data->share->specifier & (1 << CURL_LOCK_DATA_PSL))
-         data->psl = &data->share->psl;
---- a/lib/transfer.c
-+++ b/lib/transfer.c
-@@ -567,12 +567,6 @@ CURLcode Curl_pretransfer(struct Curl_easy *data)
- #endif
-   data->state.httpreq = data->set.method;
- 
--#ifdef USE_SSL
--  if(!data->state.ssl_scache)
--    /* There was no ssl session cache set via a share, use the multi one */
--    data->state.ssl_scache = data->multi->ssl_scache;
--#endif
--
-   data->state.requests = 0;
-   data->state.followlocation = 0; /* reset the location-follow counter */
-   data->state.this_is_a_follow = FALSE; /* reset this */
---- a/lib/urldata.h
-+++ b/lib/urldata.h
-@@ -1199,7 +1199,6 @@ struct UrlState {
-   curl_prot_t first_remote_protocol;
- 
-   int retrycount; /* number of retries on a new connection */
--  struct Curl_ssl_scache *ssl_scache; /* TLS session pool */
-   int os_errno;  /* filled in with errno whenever an error occurs */
-   long followlocation; /* redirect counter */
-   int requests; /* request counter: redirects + authentication retakes */
---- a/lib/vtls/vtls_scache.c
-+++ b/lib/vtls/vtls_scache.c
-@@ -82,6 +82,17 @@ struct Curl_ssl_scache {
-   long age;
- };
- 
-+static struct Curl_ssl_scache *cf_ssl_scache_get(struct Curl_easy *data)
-+{
-+  struct Curl_ssl_scache *scache = NULL;
-+  /* If a share is present, its ssl_scache has preference over the multi */
-+  if(data->share && data->share->ssl_scache)
-+    scache = data->share->ssl_scache;
-+  else if(data->multi && data->multi->ssl_scache)
-+    scache = data->multi->ssl_scache;
-+  return scache;
-+}
-+
- static void cf_ssl_scache_clear_session(struct Curl_ssl_session *s)
- {
-   if(s->sdata) {
-@@ -792,7 +803,7 @@ CURLcode Curl_ssl_scache_put(struct Curl_cfilter *cf,
-                              const char *ssl_peer_key,
-                              struct Curl_ssl_session *s)
- {
--  struct Curl_ssl_scache *scache = data->state.ssl_scache;
-+  struct Curl_ssl_scache *scache = cf_ssl_scache_get(data);
-   struct ssl_config_data *ssl_config = Curl_ssl_cf_get_config(cf, data);
-   CURLcode result;
-   DEBUGASSERT(ssl_config);
-@@ -826,7 +837,7 @@ CURLcode Curl_ssl_scache_take(struct Curl_cfilter *cf,
-                               const char *ssl_peer_key,
-                               struct Curl_ssl_session **ps)
- {
--  struct Curl_ssl_scache *scache = data->state.ssl_scache;
-+  struct Curl_ssl_scache *scache = cf_ssl_scache_get(data);
-   struct ssl_primary_config *conn_config = Curl_ssl_cf_get_primary_config(cf);
-   struct Curl_ssl_scache_peer *peer = NULL;
-   struct Curl_llist_node *n;
-@@ -870,7 +881,7 @@ CURLcode Curl_ssl_scache_add_obj(struct Curl_cfilter *cf,
-                                  void *sobj,
-                                  Curl_ssl_scache_obj_dtor *sobj_free)
- {
--  struct Curl_ssl_scache *scache = data->state.ssl_scache;
-+  struct Curl_ssl_scache *scache = cf_ssl_scache_get(data);
-   struct ssl_primary_config *conn_config = Curl_ssl_cf_get_primary_config(cf);
-   struct Curl_ssl_scache_peer *peer = NULL;
-   CURLcode result;
-@@ -898,7 +909,7 @@ bool Curl_ssl_scache_get_obj(struct Curl_cfilter *cf,
-                              const char *ssl_peer_key,
-                              void **sobj)
- {
--  struct Curl_ssl_scache *scache = data->state.ssl_scache;
-+  struct Curl_ssl_scache *scache = cf_ssl_scache_get(data);
-   struct ssl_primary_config *conn_config = Curl_ssl_cf_get_primary_config(cf);
-   struct Curl_ssl_scache_peer *peer = NULL;
-   CURLcode result;
-@@ -924,7 +935,7 @@ void Curl_ssl_scache_remove_all(struct Curl_cfilter *cf,
-                                 struct Curl_easy *data,
-                                 const char *ssl_peer_key)
- {
--  struct Curl_ssl_scache *scache = data->state.ssl_scache;
-+  struct Curl_ssl_scache *scache = cf_ssl_scache_get(data);
-   struct ssl_primary_config *conn_config = Curl_ssl_cf_get_primary_config(cf);
-   struct Curl_ssl_scache_peer *peer = NULL;
-   CURLcode result;
-@@ -1021,7 +1032,7 @@ CURLcode Curl_ssl_session_import(struct Curl_easy *data,
-                                  const unsigned char *shmac, size_t shmac_len,
-                                  const unsigned char *sdata, size_t sdata_len)
- {
--  struct Curl_ssl_scache *scache = data->state.ssl_scache;
-+  struct Curl_ssl_scache *scache = cf_ssl_scache_get(data);
-   struct Curl_ssl_scache_peer *peer = NULL;
-   struct Curl_ssl_session *s = NULL;
-   bool locked = FALSE;
-@@ -1092,7 +1103,7 @@ CURLcode Curl_ssl_session_export(struct Curl_easy *data,
-                                  curl_ssls_export_cb *export_fn,
-                                  void *userptr)
- {
--  struct Curl_ssl_scache *scache = data->state.ssl_scache;
-+  struct Curl_ssl_scache *scache = cf_ssl_scache_get(data);
-   struct Curl_ssl_scache_peer *peer;
-   struct dynbuf sbuf, hbuf;
-   struct Curl_llist_node *n;
diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index a79635ed21..4a26a1774d 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-8.12.0.tar.xz.asc
+# https://curl.se/download/curl-8.12.1.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  9a4628c764be6b1a9909567c13e8e771041609df43b2158fcac4e05ea7097e5d  curl-8.12.0.tar.xz
+sha256  0341f1ed97a26c811abaebd37d62b833956792b7607ea3f15d001613c76de202  curl-8.12.1.tar.xz
 sha256  e18f1989333b70044b2adfb7dc2f905d0119dbdcac3bc9f4bc9d540e3a29de5b  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 56a5761d68..2066ba0388 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.12.0
+LIBCURL_VERSION = 8.12.1
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
