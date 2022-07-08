Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77781C43334
	for <buildroot@archiver.kernel.org>; Fri,  8 Jul 2022 07:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 285308465B;
	Fri,  8 Jul 2022 07:37:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 285308465B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Ewz5lXjj96d; Fri,  8 Jul 2022 07:37:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04211845C9;
	Fri,  8 Jul 2022 07:36:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04211845C9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DAA711BF403
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 07:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE5FA8457C
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 07:36:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE5FA8457C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PrYmxzSPdoPm for <buildroot@lists.busybox.net>;
 Fri,  8 Jul 2022 07:36:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D17ED845C9
 for <buildroot@buildroot.org>; Fri,  8 Jul 2022 07:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D17ED845C9
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B7F6B82EAE; Fri,  8 Jul 2022 07:23:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 8 Jul 2022 09:34:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f941dfb61f008ade087130f0c82d80d32c57af2c
X-Git-Newrev: 70532a8e09ee369e4a589089b0f09b2cc648099a
X-Patchwork-Hint: ignore
Message-Id: <20220708072313.B7F6B82EAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tvheadend: bump version
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
Content-Type: multipart/mixed; boundary="===============4222232977572684584=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4222232977572684584==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=70532a8e09ee369e4a589089b0f09b2cc648099a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches included in upstream version.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../tvheadend/0002-fix-build-with-libressl.patch   | 47 ----------------------
 package/tvheadend/0003-Fix-FTBFS-in-utils-c.patch  | 28 -------------
 package/tvheadend/tvheadend.hash                   |  2 +-
 package/tvheadend/tvheadend.mk                     |  2 +-
 4 files changed, 2 insertions(+), 77 deletions(-)

diff --git a/package/tvheadend/0002-fix-build-with-libressl.patch b/package/tvheadend/0002-fix-build-with-libressl.patch
deleted file mode 100644
index c99dacdbeb..0000000000
--- a/package/tvheadend/0002-fix-build-with-libressl.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From ea65f8025a9124cd7353b21f167968bdb897306f Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 6 Apr 2022 21:54:25 +0200
-Subject: [PATCH] fix build with libressl
-
-Fix the following build failure with libressl raised since
-https://github.com/tvheadend/tvheadend/commit/e61acb8ad4a3411f4e7acfd8133d222299f6d47e:
-
-utils.c:(.text+0x1614): undefined reference to `EVP_sha512_256'
-
-Fixes:
- - http://autobuild.buildroot.org/results/cb18f6533806f3729f9718bdcc719384be375b66
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/tvheadend/tvheadend/commit/ea65f8025a9124cd7353b21f167968bdb897306f]
----
- src/http.c  | 2 +-
- src/utils.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/http.c b/src/http.c
-index 06d5e76172..72a498317c 100644
---- a/src/http.c
-+++ b/src/http.c
-@@ -412,7 +412,7 @@ http_send_header(http_connection_t *hc, int rc, const char *content,
-         http_auth_header(&hdrs, realm,
-                          config.http_auth_algo == HTTP_AUTH_ALGO_SHA256 ?
-                            "SHA-256" :
--#if OPENSSL_VERSION_NUMBER >= 0x1010101fL
-+#if OPENSSL_VERSION_NUMBER >= 0x1010101fL && !defined(LIBRESSL_VERSION_NUMBER)
-                              "SHA-512-256",
- #else
-                              "SHA-256",
-diff --git a/src/utils.c b/src/utils.c
-index d8ffe4ad5c..eecb10e116 100644
---- a/src/utils.c
-+++ b/src/utils.c
-@@ -616,7 +616,7 @@ sha256sum ( const char *str, int lowercase )
- char *
- sha512sum256 ( const char *str, int lowercase )
- {
--#if OPENSSL_VERSION_NUMBER >= 0x1010101fL
-+#if OPENSSL_VERSION_NUMBER >= 0x1010101fL && !defined(LIBRESSL_VERSION_NUMBER)
-   return openssl_hash_hexstr(str, lowercase, EVP_sha512_256(), 32);
- #else
-   return NULL;
diff --git a/package/tvheadend/0003-Fix-FTBFS-in-utils-c.patch b/package/tvheadend/0003-Fix-FTBFS-in-utils-c.patch
deleted file mode 100644
index 2caa281490..0000000000
--- a/package/tvheadend/0003-Fix-FTBFS-in-utils-c.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From fd01737270d98c28465c86a688bd7d1c640486c5 Mon Sep 17 00:00:00 2001
-From: Michael Marley <michael@michaelmarley.com>
-Date: Wed, 6 Apr 2022 21:47:49 -0400
-Subject: [PATCH] Fix FTBFS in utils.c
-
-U+0020 SPACE and U+00A0 NO-BREAK SPACE look the same, but they
-aren't the same.
-
-[Retrieved from:
-https://github.com/tvheadend/tvheadend/commit/fd01737270d98c28465c86a688bd7d1c640486c5]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/utils.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/utils.c b/src/utils.c
-index eecb10e116..bc6401d22f 100644
---- a/src/utils.c
-+++ b/src/utils.c
-@@ -616,7 +616,7 @@ sha256sum ( const char *str, int lowercase )
- char *
- sha512sum256 ( const char *str, int lowercase )
- {
--#if OPENSSL_VERSION_NUMBER >= 0x1010101fL && !defined(LIBRESSL_VERSION_NUMBER)
-+#if OPENSSL_VERSION_NUMBER >= 0x1010101fL && !defined(LIBRESSL_VERSION_NUMBER)
-   return openssl_hash_hexstr(str, lowercase, EVP_sha512_256(), 32);
- #else
-   return NULL;
diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 44ff745221..98499eb955 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  10b8e8387cf341a8c639b3ecbab17dd245dc109afd6c99ca6b7fc3f2b5efc50e  tvheadend-1295dd2be863f5beb764290fce9317b24193dfc0.tar.gz
+sha256  ed32401d1ed85f9e2d28d122a046c3f2c01b6ca5c0da1a7d78fa8f400e858107  tvheadend-fbc94aee8bfdd25baba87ab62a39234da20e8dd2.tar.gz
 sha256  54dc3cbc00bf126bcba43e2af7f3ad1dc00f335985da1409fa943c7b7256d942  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index d2547b8746..1d1a714505 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 1295dd2be863f5beb764290fce9317b24193dfc0
+TVHEADEND_VERSION = fbc94aee8bfdd25baba87ab62a39234da20e8dd2
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md

--===============4222232977572684584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4222232977572684584==--
