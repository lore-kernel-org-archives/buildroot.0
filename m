Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15E9C433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 14:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46D1183E6A;
	Sun, 30 Jan 2022 14:57:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hyg-L5s-m_tK; Sun, 30 Jan 2022 14:57:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7013983E64;
	Sun, 30 Jan 2022 14:57:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A34AF1BF425
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EC7360692
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:57:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w2ucEmP8ZiFY for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 14:57:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3A1E600CC
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 14:57:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 16A6682747; Sun, 30 Jan 2022 14:50:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 15:57:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4fabac3f7fd55570e1ccddc023a64bef712d2fc
X-Git-Newrev: 61797c52f5deef2cb67e60cf075ca243078c8855
X-Patchwork-Hint: ignore
Message-Id: <20220130145021.16A6682747@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libuhttpd: bump to version 3.14.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=61797c52f5deef2cb67e60cf075ca243078c8855
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://github.com/zhaojh329/libuhttpd/releases/tag/v3.14.1
https://github.com/zhaojh329/libuhttpd/releases/tag/v3.14.0
https://github.com/zhaojh329/libuhttpd/releases/tag/v3.13.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-openssl.c-fix-build-with-wolfssl.patch    | 47 ----------------------
 package/libuhttpd/libuhttpd.hash                   |  2 +-
 package/libuhttpd/libuhttpd.mk                     |  2 +-
 3 files changed, 2 insertions(+), 49 deletions(-)

diff --git a/package/libuhttpd/0001-openssl.c-fix-build-with-wolfssl.patch b/package/libuhttpd/0001-openssl.c-fix-build-with-wolfssl.patch
deleted file mode 100644
index deb1a0f93b..0000000000
--- a/package/libuhttpd/0001-openssl.c-fix-build-with-wolfssl.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From e5c5ed1c64cfc715729c9bfbfdcc4be225f344ff Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 4 Aug 2021 11:32:39 +0200
-Subject: [PATCH] openssl.c: fix build with wolfssl
-
-Fix the following build failure with wolfssl:
-
-/tmp/instance-4/output-1/build/libuhttpd-3.12.1/src/ssl/openssl.c: In function 'ssl_context_new':
-/tmp/instance-4/output-1/build/libuhttpd-3.12.1/src/ssl/openssl.c:174:33: error: 'tls13_ciphersuites' undeclared (first use in this function)
-  174 |     SSL_CTX_set_ciphersuites(c, tls13_ciphersuites);
-      |                                 ^~~~~~~~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/d0fb629b40b05ad828775894fabed878692bb222
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/zhaojh329/ssl/pull/1]
----
- openssl.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/openssl.c b/openssl.c
-index 8f3d8b7..c42638c 100644
---- a/src/ssl/openssl.c
-+++ b/src/ssl/openssl.c
-@@ -71,14 +71,14 @@
-                 "TLS13-AES256-GCM-SHA384:"		\
-                 ecdhe_aead_ciphers
- #else
--# define tls13_ciphersuites	"TLS_CHACHA20_POLY1305_SHA256:"		\
--                "TLS_AES_128_GCM_SHA256:"		\
--                "TLS_AES_256_GCM_SHA384"
--
- # define top_ciphers							\
-                 ecdhe_aead_ciphers
- #endif
- 
-+# define tls13_ciphersuites	"TLS_CHACHA20_POLY1305_SHA256:"		\
-+                "TLS_AES_128_GCM_SHA256:"		\
-+                "TLS_AES_256_GCM_SHA384"
-+
- #define ecdhe_aead_ciphers						\
-                 "ECDHE-ECDSA-CHACHA20-POLY1305:"	\
-                 "ECDHE-ECDSA-AES128-GCM-SHA256:"	\
--- 
-2.30.2
-
diff --git a/package/libuhttpd/libuhttpd.hash b/package/libuhttpd/libuhttpd.hash
index 98bd6e513b..e4fde4eb64 100644
--- a/package/libuhttpd/libuhttpd.hash
+++ b/package/libuhttpd/libuhttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c234dd3d491c4daa047e28870c6e740529b2eff2dd027dafb6bf02d8dba286b0  libuhttpd-3.12.1.tar.gz
+sha256  512d4abfced0ec916d985d3d1eac7528e6676eecae6aca27fdaf313374e29f16  libuhttpd-3.14.1.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
index 3a99fe0613..b8cf935d01 100644
--- a/package/libuhttpd/libuhttpd.mk
+++ b/package/libuhttpd/libuhttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUHTTPD_VERSION = 3.12.1
+LIBUHTTPD_VERSION = 3.14.1
 LIBUHTTPD_SITE = https://github.com/zhaojh329/libuhttpd/releases/download/v$(LIBUHTTPD_VERSION)
 LIBUHTTPD_LICENSE = MIT
 LIBUHTTPD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
