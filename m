Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C324606B3A8
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 20:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GkhPpxkT
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17986407E4;
	Wed,  4 Nov 2026 20:38:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 29Hm_z2wQQNF; Wed,  4 Nov 2026 20:38:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 047A8407F2
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793824683;
	b=kcqNQzMxoomfcgEx8Dss8CRYddAwunAQ4f878qSRueBTgmL1FOvXk5QYL8kQgpEUcmwu
	 lGzqbm3uQUUrF1D3tjF9vvmT3sQidBakoEzjTyBAJQ/cULgHz59Vxe3UEuKn4/t4LLR5i
	 Bp8jr4XlxmPola8iCFnkN5Q/kbNt9OZepbGZZ7qL06M8EJmO4SBHfMKe/9HSzJcMm53aA
	 G0lZs9eO8NIObnPXoJlKwP0oakcJjlB6sKIyG6P8L0ljvzNtcoqHVV59wZ13DxaS9XrRB
	 7M5rYnM1Zy05StO8b+acK05fRUmbmyDo5JCRX9JiZXmXRX8qmXJ+xj2sb2nhBc4ksow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793824683;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=wWkKZisrut8fIiajUZyRuM3zi2BLyaC7yGCPFubyeEI=;
	b=fc/L5x8U+uIvp2JdNoKyVZdC2rg16wSo7B806QwmC2jPmQoiSe/f5etay+05waVG2EjL
	 7EvQAekt+CnXr7tX/DdftM+PGj32Vpz65H+SNk9SM7VjV/ZNLZ+Zghw2gUCxAK51aB4V3
	 DymatrhLXp5GOs3FLol+dBkOxwlQGMQvui5iZkSSFPRAkinGmj6r94X/kJTdIJPfnsWjF
	 Oj/zxaD/9kspYSrWEhnP1UN6rRAXkwjllkpWhHXrOpwj46x0oAlsud/DkbBSuOZJoyuF1
	 Hk86LBmrs2bVWiPpmpHXaTi/SGz3cTHds0tjzQ8WUSQW00qN4il7cKJYsBApilbrYDA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793824683;
	bh=wWkKZisrut8fIiajUZyRuM3zi2BLyaC7yGCPFubyeEI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GkhPpxkT2Rxdy28//AQq8MfZSUj88Tq2hiLqHmYcPYP3J5ZDOMsnUtOgsQ1BOSB/t
	 96WwoMZcVr78R/7bapUu8agdteEVqkdl6k8z2LEq2zJpkFMjIzd+JKBM78cKWy1ZIt
	 NuC/C8V6YMUxND8YhPLq+6RNFnyVpkMjcFEtoKYfRXg2UAqswGopRj8oNGzTG69SUY
	 1nHyK3fBi/CvhV3RmjxZSRxwWqugRuDbeYQh5ic1K5gr6swpnICSbXOcqbt+0qcGoK
	 qsK9plFILjsfr8fpSuwQqPiwkO4MU2tO14/sy8uDpFd9fFqtiYxsQHO0bZmGo6Ro0n
	 hJgkM2bDZmFSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 047A8407F2;
	Wed,  4 Nov 2026 20:38:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BEE8E31F
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B06984013C
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:38:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uoOktJB9HBrV for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 20:38:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D29E54008E
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D29E54008E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:38:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E023F9DE42; Wed,  4 Nov 2026 20:36:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 21:19:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2ed88525fe8b5f6077253dc5ec703fa53a69b5c9
X-Git-Newrev: c502c8d6103051bb8286b591d7d3ac5945d7bdf7
X-Patchwork-Hint: ignore
Message-Id: <20261104203629.E023F9DE42@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxmlsec1: bump to version 1.3.13
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6686264726872486119=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6686264726872486119==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c502c8d6103051bb8286b591d7d3ac5945d7bdf7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog available at:
https://github.com/lsh123/xmlsec/releases/tag/1.3.13

While at it, update the hash file to mention the hash found in the
release page rather than mentioning a computed hash. The hash for the
Copyright file has changed: the diff is only about some typos though,
see https://github.com/lsh123/xmlsec/commit/b6d69c09f4bc51845dbe90f0da82c9eb04bd671e

The v1.3.13 does not build immediately without some help:

- the configure step fails, because it fails to build some test program.
  This test program fails to build because _FORTIFY_SOURCE is defined
  twice, it is passed as _FORTIFY_SOURCE=1 by default by buildroot, and
  this new libxmlsec1 version has hardening enabled by default, which
  sets _FORTIFY_SOURCE=2. This issue is fixed by preserving the former
  behavior, ie passing --disable-hardening at configure time.
- the toolchain wrapper raises an error about some system headers being
  included:
    aarch64-linux-gcc: ERROR: unsafe header/library path used in \
    cross-compilation: '-I/usr/include/xmlsec1'
  This error is due to some fuzzer program now being part of the
  standard build, and missing some cflags. The corresponding patch has
  been sent and integrated upstream, and backported in this commit
- The same fuzzer keep on using some DES related APIs even when
  --disable-des is passed. The issue is already fixed upstream, this
  commit backports this patch as well.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...01-Fix-no-des-build-error-in-fuzzers-1413.patch | 42 ++++++++++++++
 ...d-correctly-pass-crypto-cflags-to-fuzzer-.patch | 67 ++++++++++++++++++++++
 package/libxmlsec1/libxmlsec1.hash                 |  5 +-
 package/libxmlsec1/libxmlsec1.mk                   |  5 +-
 4 files changed, 115 insertions(+), 4 deletions(-)

diff --git a/package/libxmlsec1/0001-Fix-no-des-build-error-in-fuzzers-1413.patch b/package/libxmlsec1/0001-Fix-no-des-build-error-in-fuzzers-1413.patch
new file mode 100644
index 0000000000..6ae2e8dc94
--- /dev/null
+++ b/package/libxmlsec1/0001-Fix-no-des-build-error-in-fuzzers-1413.patch
@@ -0,0 +1,42 @@
+From 23a3a4b7005aa073c08c189c9389eacbd4f4d787 Mon Sep 17 00:00:00 2001
+From: lsh123 <aleksey@aleksey.com>
+Date: Tue, 27 Oct 2026 17:50:54 -0400
+Subject: [PATCH] Fix no-des build error in fuzzers (#1413)
+
+Upstream: https://github.com/lsh123/xmlsec/commit/23a3a4b7005aa073c08c189c9389eacbd4f4d787
+Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
+---
+ apps/oss-fuzz/xmlsec_enc_target.c | 17 ++++++++++++++---
+ 1 file changed, 14 insertions(+), 3 deletions(-)
+
+diff --git a/apps/oss-fuzz/xmlsec_enc_target.c b/apps/oss-fuzz/xmlsec_enc_target.c
+index 05ce8219aab6..7b21573399d6 100644
+--- a/apps/oss-fuzz/xmlsec_enc_target.c
++++ b/apps/oss-fuzz/xmlsec_enc_target.c
+@@ -104,9 +104,20 @@ static int load_sym_keys(void) {
+     int i;
+ 
+     for (i = 0; i < G_SYM_NKEYS; ++i) {
+-        xmlSecKeyDataId id = g_sym_keys[i].is_des ?
+-            xmlSecOpenSSLKeyDataDesId :
+-            xmlSecOpenSSLKeyDataAesId;
++        xmlSecKeyDataId id = xmlSecKeyDataIdUnknown;
++        if (g_sym_keys[i].is_des == 1) {
++#ifndef XMLSEC_NO_DES
++            id = xmlSecOpenSSLKeyDataDesId;
++#endif /* XMLSEC_NO_DES */
++        } else {
++#ifndef XMLSEC_NO_AES
++            id = xmlSecOpenSSLKeyDataAesId;
++#endif /* XMLSEC_NO_AES */
++        }
++        if (id == xmlSecKeyDataIdUnknown) {
++            /* skip test if algorithm is not supported */
++            continue;
++        }
+         xmlSecKeyPtr key = xmlSecKeyReadMemory(id,
+             (const xmlSecByte*)g_sym_keys[i].material,
+             g_sym_keys[i].size);
+-- 
+2.56.0
+
diff --git a/package/libxmlsec1/0002-xmlsec-build-correctly-pass-crypto-cflags-to-fuzzer-.patch b/package/libxmlsec1/0002-xmlsec-build-correctly-pass-crypto-cflags-to-fuzzer-.patch
new file mode 100644
index 0000000000..0d276fb6d6
--- /dev/null
+++ b/package/libxmlsec1/0002-xmlsec-build-correctly-pass-crypto-cflags-to-fuzzer-.patch
@@ -0,0 +1,67 @@
+From cf60007b5b35ba81d148f20bebd8a0f1d847f5ed Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@gmail.com>
+Date: Mon, 2 Nov 2026 15:50:24 +0100
+Subject: [PATCH] (xmlsec-build) correctly pass crypto cflags to fuzzer
+ programs (#1443)
+
+Upstream: https://github.com/lsh123/xmlsec/commit/cf60007b5b35ba81d148f20bebd8a0f1d847f5ed
+Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
+---
+ apps/Makefile.am | 13 +++++++++----
+ 1 file changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/apps/Makefile.am b/apps/Makefile.am
+index 8b3fda22fc0b..a3f3086aee8a 100644
+--- a/apps/Makefile.am
++++ b/apps/Makefile.am
+@@ -140,6 +140,7 @@ xmlsec_fuzzer_CFLAGS = \
+ 	-I../include \
+ 	-I$(top_srcdir)/include \
+ 	$(XMLSEC_DEFINES) \
++	$(XMLSEC_CRYPTO_CFLAGS) \
+ 	$(LIBXML_CFLAGS) \
+ 	$(NULL)
+ 
+@@ -205,7 +206,8 @@ xmlsec_dsig_verify_fuzzer_CFLAGS = \
+ 	-I../include \
+ 	-I$(top_srcdir)/include \
+ 	$(XMLSEC_DEFINES) \
+-	$(XMLSEC_OPENSSL_CFLAGS) \
++	$(XMLSEC_CRYPTO_CFLAGS) \
++	$(CRYPTO_INCLUDES) \
+ 	$(LIBXML_CFLAGS) \
+ 	$(NULL)
+ 
+@@ -240,7 +242,8 @@ xmlsec_keyinfo_fuzzer_CFLAGS = \
+ 	-I../include \
+ 	-I$(top_srcdir)/include \
+ 	$(XMLSEC_DEFINES) \
+-	$(XMLSEC_OPENSSL_CFLAGS) \
++	$(XMLSEC_CRYPTO_CFLAGS) \
++	$(CRYPTO_INCLUDES) \
+ 	$(LIBXML_CFLAGS) \
+ 	$(NULL)
+ 
+@@ -275,7 +278,8 @@ xmlsec_keyload_fuzzer_CFLAGS = \
+ 	-I../include \
+ 	-I$(top_srcdir)/include \
+ 	$(XMLSEC_DEFINES) \
+-	$(XMLSEC_OPENSSL_CFLAGS) \
++	$(XMLSEC_CRYPTO_CFLAGS) \
++	$(CRYPTO_INCLUDES) \
+ 	$(LIBXML_CFLAGS) \
+ 	$(NULL)
+ 
+@@ -310,7 +314,8 @@ xmlsec_enc_fuzzer_CFLAGS = \
+ 	-I../include \
+ 	-I$(top_srcdir)/include \
+ 	$(XMLSEC_DEFINES) \
+-	$(XMLSEC_OPENSSL_CFLAGS) \
++	$(XMLSEC_CRYPTO_CFLAGS) \
++	$(CRYPTO_INCLUDES) \
+ 	$(LIBXML_CFLAGS) \
+ 	$(NULL)
+ 
+-- 
+2.56.0
+
diff --git a/package/libxmlsec1/libxmlsec1.hash b/package/libxmlsec1/libxmlsec1.hash
index d9cb16a1c2..6d879927aa 100644
--- a/package/libxmlsec1/libxmlsec1.hash
+++ b/package/libxmlsec1/libxmlsec1.hash
@@ -1,3 +1,4 @@
+# From https://github.com/lsh123/xmlsec/releases/tag/1.3.13
+sha256  7e500061eed734c55d74c786998e7562e55b1aaa72a2dff8ce3130b4c5b832d5  xmlsec1-1.3.13.tar.gz
 # Locally computed
-sha256  24045199af12d93fe5fdbbbf7e386e823e4842071e9432e2b90ac108b889a923  xmlsec1-1.3.12.tar.gz
-sha256  a6d217151f3d423e06639c075bad8e442ea1936828d3a660105122ef78ecd96d  Copyright
+sha256  f231f0d37ce33c00afef1cde60b7ff365355ae5dbb7a7095e61300c7207fa3c7  Copyright
diff --git a/package/libxmlsec1/libxmlsec1.mk b/package/libxmlsec1/libxmlsec1.mk
index 88f0ae9fd9..b74956deb7 100644
--- a/package/libxmlsec1/libxmlsec1.mk
+++ b/package/libxmlsec1/libxmlsec1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXMLSEC1_VERSION = 1.3.12
+LIBXMLSEC1_VERSION = 1.3.13
 LIBXMLSEC1_SOURCE = xmlsec1-$(LIBXMLSEC1_VERSION).tar.gz
 LIBXMLSEC1_SITE = https://github.com/lsh123/xmlsec/releases/download/$(LIBXMLSEC1_VERSION)
 LIBXMLSEC1_LICENSE = MIT
@@ -20,7 +20,8 @@ LIBXMLSEC1_CONF_OPTS = \
 	--without-gnutls \
 	--without-gcrypt \
 	--without-nss \
-	--disable-des
+	--disable-des \
+	--disable-hardening
 
 # xmlsec_unit_tests needs xmlDebugDumpDocument() from libxml2 which is not
 # present in buildroot because libxml2 is build with -without-debug

--===============6686264726872486119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6686264726872486119==--
