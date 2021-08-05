Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C40FC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:22:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D49DA610FC
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D49DA610FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97420400CD;
	Thu,  5 Aug 2021 20:21:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5UxRUtLUSCMh; Thu,  5 Aug 2021 20:21:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52C1B40287;
	Thu,  5 Aug 2021 20:21:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 53C0E1BF3FD
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50AC5608B8
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:21:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sKv22mdDPSUS for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 20:21:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F3376078C
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 20:21:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E3F628C5E7; Thu,  5 Aug 2021 20:21:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 22:20:33 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 46f932fa9efe4a5fe160cac599345238e1053b1a
X-Git-Newrev: 623842cd35172e33d338fba82d3fc93ea00fc738
X-Patchwork-Hint: ignore
Message-Id: <20210805202141.E3F628C5E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/libcurl: security
 bump to version 7.78.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=623842cd35172e33d338fba82d3fc93ea00fc738
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Fixes CVE-2021-22922, CVE-2021-22923, CVE-2021-22924, CVE-2021-22925 &
CVE-2021-22926: https://curl.se/news.html

Changelog: https://curl.se/changes.html

Removed patch which is included in upstream release.
Switched _SITE to curl.se.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4edbd21befa43d686711a9990ee90e72c9a43304)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ove-incorrect-const-on-variable-that-is-m.patch | 32 ----------------------
 package/libcurl/Config.in                          |  2 +-
 package/libcurl/libcurl.hash                       |  4 +--
 package/libcurl/libcurl.mk                         |  6 ++--
 4 files changed, 6 insertions(+), 38 deletions(-)

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
index b89c46f5ef..0674701e03 100644
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
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
