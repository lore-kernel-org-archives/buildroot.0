Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB70C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:27:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF47460F45
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CF47460F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA51F4049A;
	Tue,  3 Aug 2021 21:26:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dGY6R1ZeMqjc; Tue,  3 Aug 2021 21:26:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E68FA40497;
	Tue,  3 Aug 2021 21:26:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E7ED1BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6BD8835A6
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CaZwEDKTflyW for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E536C837A4
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3A6B2843F5; Tue,  3 Aug 2021 21:09:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 28 May 2021 14:19:33 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1f1d220419515c44275b21b55ac1382f4192c2f1
X-Git-Newrev: eae15d62c6a857f43d6f21af9a30f38994b3efc5
X-Patchwork-Hint: ignore
Message-Id: <20210803210946.3A6B2843F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libcurl: security bump
 to version 7.77.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=eae15d62c6a857f43d6f21af9a30f38994b3efc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes the following security issues:

- CVE-2021-22897: schannel cipher selection surprise
  https://curl.se/docs/CVE-2021-22897.html

- CVE-2021-22898: TELNET stack contents disclosure
  https://curl.se/docs/CVE-2021-22898.html

- CVE-2021-22901: TLS session caching disaster
  https://curl.se/docs/CVE-2021-22901.html

Unconditionally disable the ldap(s) options.  These require external
libraries, but the options were ignored if the needed libraries weren't
available. This is now changed to be a fatal error since

https://github.com/curl/curl/commit/dae382a1a1481a94b708c82d5aa9fa7253084160

Additionally, add a post-7.77.0 upstream patch to fix compilation with
bearssl.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[yann.morin.1998@free.fr: annotate the patch, that it is a backport]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...ove-incorrect-const-on-variable-that-is-m.patch | 32 ++++++++++++++++++++++
 package/libcurl/libcurl.hash                       |  4 +--
 package/libcurl/libcurl.mk                         |  8 ++----
 3 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/package/libcurl/0001-bearssl-remove-incorrect-const-on-variable-that-is-m.patch b/package/libcurl/0001-bearssl-remove-incorrect-const-on-variable-that-is-m.patch
new file mode 100644
index 0000000000..b88791fa45
--- /dev/null
+++ b/package/libcurl/0001-bearssl-remove-incorrect-const-on-variable-that-is-m.patch
@@ -0,0 +1,32 @@
+From a03ea6223950002eba8b1ef0df3133c62f387d6b Mon Sep 17 00:00:00 2001
+From: Michael Forney <mforney@mforney.org>
+Date: Tue, 25 May 2021 23:42:07 -0700
+Subject: [PATCH] bearssl: remove incorrect const on variable that is modified
+
+hostname may be set to NULL later on in this function if it is an
+IP address.
+
+Closes #7133
+
+[peter@korsgaard.com: backported from upstream]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ lib/vtls/bearssl.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/vtls/bearssl.c b/lib/vtls/bearssl.c
+index 7f729713d..40a5e7879 100644
+--- a/lib/vtls/bearssl.c
++++ b/lib/vtls/bearssl.c
+@@ -300,7 +300,7 @@ static CURLcode bearssl_connect_step1(struct Curl_easy *data,
+   struct ssl_connect_data *connssl = &conn->ssl[sockindex];
+   struct ssl_backend_data *backend = connssl->backend;
+   const char * const ssl_cafile = SSL_CONN_CONFIG(CAfile);
+-  const char * const hostname = SSL_HOST_NAME();
++  const char *hostname = SSL_HOST_NAME();
+   const bool verifypeer = SSL_CONN_CONFIG(verifypeer);
+   const bool verifyhost = SSL_CONN_CONFIG(verifyhost);
+   CURLcode ret;
+-- 
+2.20.1
+
diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 9ee98f1e13..183321588f 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.haxx.se/download/curl-7.76.1.tar.xz.asc
+# https://curl.haxx.se/download/curl-7.77.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  64bb5288c39f0840c07d077e30d9052e1cbb9fa6c2dc52523824cc859e679145  curl-7.76.1.tar.xz
+sha256  0f64582c54282f31c0de9f0a1a596b182776bd4df9a4c4a2a41bbeb54f62594b  curl-7.77.0.tar.xz
 sha256  6fd1a1c008b5ef4c4741dd188c3f8af6944c14c25afa881eb064f98fb98358e7  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index f2cfd72897..53ff9836c1 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.76.1
+LIBCURL_VERSION = 7.77.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
@@ -24,7 +24,7 @@ LIBCURL_INSTALL_STAGING = YES
 # generate C code) isn't very useful
 LIBCURL_CONF_OPTS = --disable-manual --disable-ntlm-wb \
 	--enable-hidden-symbols --with-random=/dev/urandom --disable-curldebug \
-	--disable-libcurl-option
+	--disable-libcurl-option --disable-ldap --disable-ldaps
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 LIBCURL_CONF_OPTS += --enable-threaded-resolver
@@ -150,8 +150,6 @@ LIBCURL_CONF_OPTS += \
 	--enable-dict \
 	--enable-gopher \
 	--enable-imap \
-	--enable-ldap \
-	--enable-ldaps \
 	--enable-pop3 \
 	--enable-rtsp \
 	--enable-smb \
@@ -163,8 +161,6 @@ LIBCURL_CONF_OPTS += \
 	--disable-dict \
 	--disable-gopher \
 	--disable-imap \
-	--disable-ldap \
-	--disable-ldaps \
 	--disable-pop3 \
 	--disable-rtsp \
 	--disable-smb \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
