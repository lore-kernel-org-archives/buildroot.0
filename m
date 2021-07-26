Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A53FC4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 05:54:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0646360F42
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 05:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0646360F42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C66A9834E8;
	Mon, 26 Jul 2021 05:54:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sELb7p0zRwKZ; Mon, 26 Jul 2021 05:54:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 007CE83438;
	Mon, 26 Jul 2021 05:54:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2937C1BF3A9
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 05:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25E7683438
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 05:54:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EGZI02hOT-xB for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 05:53:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F54683410
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 05:53:59 +0000 (UTC)
Received: from fwd15.aul.t-online.de (fwd15.aul.t-online.de [172.20.27.63])
 by mailout04.t-online.de (Postfix) with SMTP id 222D012F1F;
 Mon, 26 Jul 2021 07:52:14 +0200 (CEST)
Received: from fli4l.lan.fli4l
 (GEeUEuZSgh6JGw98Ee9YeVHntmePl4edm1RxyisULthyVkn2sO0lPwMXsx-kYsDw5t@[91.58.13.189])
 by fwd15.t-online.de with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1m7tXB-2RFRq40; Mon, 26 Jul 2021 07:52:13 +0200
Received: from mahler.lan.fli4l ([192.168.1.1]:38014)
 by fli4l.lan.fli4l with esmtp (Exim 4.94.2)
 (envelope-from <bernd.kuhls@t-online.de>)
 id 1m7tXB-00070y-1B; Mon, 26 Jul 2021 07:52:13 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 07:52:13 +0200
Message-Id: <20210726055213.133600-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-ID: GEeUEuZSgh6JGw98Ee9YeVHntmePl4edm1RxyisULthyVkn2sO0lPwMXsx-kYsDw5t
X-TOI-EXPURGATEID: 150726::1627278733-0001577D-5694AE7A/0/0 CLEAN NORMAL
X-TOI-MSGID: 327942f6-c78a-4476-9215-44d379cf4a68
Subject: [Buildroot] [PATCH 1/1] package/libcurl: security bump to version
 7.78.0
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fixes CVE-2021-22922, CVE-2021-22923, CVE-2021-22924, CVE-2021-22925 &
CVE-2021-22926: https://curl.se/news.html

Changelog: https://curl.se/changes.html

Removed patch which is included in upstream release.
Switched _SITE to curl.se.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...ncorrect-const-on-variable-that-is-m.patch | 32 -------------------
 package/libcurl/Config.in                     |  2 +-
 package/libcurl/libcurl.hash                  |  4 +--
 package/libcurl/libcurl.mk                    |  6 ++--
 4 files changed, 6 insertions(+), 38 deletions(-)
 delete mode 100644 package/libcurl/0001-bearssl-remove-incorrect-const-on-variable-that-is-m.patch

diff --git a/package/libcurl/0001-bearssl-remove-incorrect-const-on-variable-that-is-m.patch b/package/libcurl/0001-bearssl-remove-incorrect-const-on-variable-that-is-m.patch
deleted file mode 100644
index b88791fa45..0000000000
--- a/package/libcurl/0001-bearssl-remove-incorrect-const-on-variable-that-is-m.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From a03ea6223950002eba8b1ef0df3133c62f387d6b Mon Sep 17 00:00:00 2001
-From: Michael Forney <mforney@mforney.org>
-Date: Tue, 25 May 2021 23:42:07 -0700
-Subject: [PATCH] bearssl: remove incorrect const on variable that is modified
-
-hostname may be set to NULL later on in this function if it is an
-IP address.
-
-Closes #7133
-
-[peter@korsgaard.com: backported from upstream]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- lib/vtls/bearssl.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/vtls/bearssl.c b/lib/vtls/bearssl.c
-index 7f729713d..40a5e7879 100644
---- a/lib/vtls/bearssl.c
-+++ b/lib/vtls/bearssl.c
-@@ -300,7 +300,7 @@ static CURLcode bearssl_connect_step1(struct Curl_easy *data,
-   struct ssl_connect_data *connssl = &conn->ssl[sockindex];
-   struct ssl_backend_data *backend = connssl->backend;
-   const char * const ssl_cafile = SSL_CONN_CONFIG(CAfile);
--  const char * const hostname = SSL_HOST_NAME();
-+  const char *hostname = SSL_HOST_NAME();
-   const bool verifypeer = SSL_CONN_CONFIG(verifypeer);
-   const bool verifyhost = SSL_CONN_CONFIG(verifyhost);
-   CURLcode ret;
--- 
-2.20.1
-
diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index 466f9ee3a1..afe6c7b9e7 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LIBCURL
 	  Telnet, and Dict servers, using any of the supported
 	  protocols.
 
-	  http://curl.haxx.se/
+	  https://curl.se/
 
 if BR2_PACKAGE_LIBCURL
 
diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 183321588f..5e5776d1e3 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.haxx.se/download/curl-7.77.0.tar.xz.asc
+# https://curl.se/download/curl-7.78.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  0f64582c54282f31c0de9f0a1a596b182776bd4df9a4c4a2a41bbeb54f62594b  curl-7.77.0.tar.xz
+sha256  be42766d5664a739c3974ee3dfbbcbe978a4ccb1fe628bb1d9b59ac79e445fb5  curl-7.78.0.tar.xz
 sha256  6fd1a1c008b5ef4c4741dd188c3f8af6944c14c25afa881eb064f98fb98358e7  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 53ff9836c1..4e3c6d4523 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.77.0
+LIBCURL_VERSION = 7.78.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
-LIBCURL_SITE = https://curl.haxx.se/download
+LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
 	$(if $(BR2_PACKAGE_ZLIB),zlib) \
 	$(if $(BR2_PACKAGE_RTMPDUMP),rtmpdump)
@@ -19,7 +19,7 @@ LIBCURL_INSTALL_STAGING = YES
 # We disable NTLM support because it uses fork(), which doesn't work
 # on non-MMU platforms. Moreover, this authentication method is
 # probably almost never used. See
-# http://curl.haxx.se/docs/manpage.html#--ntlm.
+# http://curl.se/docs/manpage.html#--ntlm.
 # Likewise, there is no compiler on the target, so libcurl-option (to
 # generate C code) isn't very useful
 LIBCURL_CONF_OPTS = --disable-manual --disable-ntlm-wb \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
