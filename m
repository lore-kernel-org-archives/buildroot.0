Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81B9C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 16:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72AE74032E;
	Sun, 30 Oct 2022 16:15:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72AE74032E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wJZif893ZOsr; Sun, 30 Oct 2022 16:15:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DE88401D6;
	Sun, 30 Oct 2022 16:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DE88401D6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D3B801BF479
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AEB95401D6
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:14:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEB95401D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N73i-56sbfta for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 16:14:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89C28401BA
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 16:14:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89C28401BA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 75FDB87573; Sun, 30 Oct 2022 16:14:21 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 17:10:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e0f40892e921dc06e89ff543df754e434b608633
X-Git-Newrev: 69c9cc60a10a114b49830134ac2ad5f136bd057f
X-Patchwork-Hint: ignore
Message-Id: <20221030161421.75FDB87573@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sngrep: bump to version 1.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=69c9cc60a10a114b49830134ac2ad5f136bd057f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- pcre2 is an optional dependency since
  https://github.com/irontec/sngrep/commit/cac42deab5e94661e2495399bc40eaf75e0b46bc
- zlib is an optional dependency since
  https://github.com/irontec/sngrep/commit/c02f439d73f33c727909131cb4d9d01029d7492f

https://github.com/irontec/sngrep/blob/v1.6.0/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...e_openssl.h-fix-build-with-libressl-3.5.0.patch | 40 ----------------------
 package/sngrep/sngrep.hash                         |  6 ++--
 package/sngrep/sngrep.mk                           | 21 +++++++++---
 3 files changed, 19 insertions(+), 48 deletions(-)

diff --git a/package/sngrep/0001-src-capture_openssl.h-fix-build-with-libressl-3.5.0.patch b/package/sngrep/0001-src-capture_openssl.h-fix-build-with-libressl-3.5.0.patch
deleted file mode 100644
index 7dbb29ab00..0000000000
--- a/package/sngrep/0001-src-capture_openssl.h-fix-build-with-libressl-3.5.0.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 4e1406ad0df370ff8bf1d3a81aaadbb1cad2d761 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 29 Apr 2022 18:53:45 +0200
-Subject: [PATCH] src/capture_openssl.h: fix build with libressl >= 3.5.0
-
-Fix the following build failure with libressl >= 3.5.0:
-
-capture_openssl.c: In function 'P_hash':
-capture_openssl.c:101:18: error: storage size of 'hm' isn't known
-  101 |         HMAC_CTX hm;
-      |                  ^~
-
-Fixes:
- - http://autobuild.buildroot.org/results/f1e8cdb3ac35a30055ab79d41e6cc038e5339c37
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/irontec/sngrep/commit/4e1406ad0df370ff8bf1d3a81aaadbb1cad2d761]
----
- src/capture_openssl.h | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/src/capture_openssl.h b/src/capture_openssl.h
-index 780de494..1f87a5cd 100644
---- a/src/capture_openssl.h
-+++ b/src/capture_openssl.h
-@@ -67,10 +67,11 @@
- #endif
- 
- /* LibreSSL declares OPENSSL_VERSION_NUMBER == 2.0 but does not include most
-- * changes from OpenSSL >= 1.1 (new functions, macros, deprecations, ...)
-+ * changes from OpenSSL >= 1.1 (new functions, macros, deprecations, ...) until
-+ * version 3.5.0
-  */
- #if defined(LIBRESSL_VERSION_NUMBER)
--#define MODSSL_USE_OPENSSL_PRE_1_1_API (1)
-+#define MODSSL_USE_OPENSSL_PRE_1_1_API (LIBRESSL_VERSION_NUMBER < 0x30500000L)
- #else
- #define MODSSL_USE_OPENSSL_PRE_1_1_API (OPENSSL_VERSION_NUMBER < 0x10100000L)
- #endif
diff --git a/package/sngrep/sngrep.hash b/package/sngrep/sngrep.hash
index 33fa91ef5e..60a32022e6 100644
--- a/package/sngrep/sngrep.hash
+++ b/package/sngrep/sngrep.hash
@@ -1,6 +1,6 @@
-# From https://github.com/irontec/sngrep/releases/download/v1.4.7/sngrep-1.4.7.tar.gz.md5sum
-md5  78fe753e24f36ddaf627bc2b734f45ba  sngrep-1.4.7.tar.gz
+# From https://github.com/irontec/sngrep/releases/download/v1.6.0/sngrep-1.6.0.tar.gz.md5sum
+md5  1519ca6cd1167c0722debfb96e2ac173  sngrep-1.6.0.tar.gz
 
 # Locally computed
-sha256  3c96aadd8b8c6b7adb5552d6fb4234f2000f15109b0f6c5feb632c81306cc49b  sngrep-1.4.7.tar.gz
+sha256  fd80964d6560f2ff57b4f5bef2353d1a6f7c48d2f1a5f0a167c854bd2e801999  sngrep-1.6.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
index 841a7bb991..eedb99492f 100644
--- a/package/sngrep/sngrep.mk
+++ b/package/sngrep/sngrep.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-SNGREP_VERSION = 1.4.7
-SNGREP_SITE = $(call github,irontec,sngrep,v$(SNGREP_VERSION))
+SNGREP_VERSION = 1.6.0
+SNGREP_SITE = \
+	https://github.com/irontec/sngrep/releases/download/v$(SNGREP_VERSION)
 SNGREP_LICENSE = GPL-3.0+
 SNGREP_LICENSE_FILES = LICENSE
 SNGREP_AUTORECONF = YES
@@ -29,11 +30,21 @@ else
 SNGREP_CONF_OPTS += --without-gnutls --without-openssl
 endif
 
-ifeq ($(BR2_PACKAGE_PCRE),y)
+ifeq ($(BR2_PACKAGE_PCRE2),y)
+SNGREP_DEPENDENCIES += pcre2
+SNGREP_CONF_OPTS += --without-pcre --with-pcre2
+else ifeq ($(BR2_PACKAGE_PCRE),y)
 SNGREP_DEPENDENCIES += pcre
-SNGREP_CONF_OPTS += --with-pcre
+SNGREP_CONF_OPTS += --with-pcre --without-pcre2
 else
-SNGREP_CONF_OPTS += --without-pcre
+SNGREP_CONF_OPTS += --without-pcre --without-pcre2
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+SNGREP_DEPENDENCIES += zlib
+SNGREP_CONF_OPTS += --with-zlib
+else
+SNGREP_CONF_OPTS += --without-zlib
 endif
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
