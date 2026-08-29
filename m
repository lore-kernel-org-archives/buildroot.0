Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466EFC79F82
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED49381004;
	Fri,  4 Sep 2026 16:22:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1u8JRdz2RqDc; Fri,  4 Sep 2026 16:22:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7AB5C811CA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788538964;
	b=Io23tjnkbWMLM/MbrPcHRWNLjl4rGb/Bi5fogAKQmcC2Vpj4oz3WLQW2dl9XD65Goavl
	 RuB0L/zCjjUciqdAgcHeiIHGswuzU/WbcUEeJEXXzQ8wF+egXLeHBmehNxNK3TsnokrxT
	 y9SvhgeRRzVDDApDCCdBcDsirsdRDyKTFfip1lntR0NaqIC151eNlOKP4zOzO3lLNlZk6
	 6hmFw9F7JnMQr2NjCl7qKBHo1wV1EeZYB4x4DezJaIc9pZu82Ha7lxwluAYJfwh29SRLo
	 9iL1TsWngsF99E5pFlA96yHaUWABYukqK+0iQ0tNOVEV/7xfXN66efu6sjakYJivs2A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788538964;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=2u/0piw6NFd35Fp8ZmlAgpBW5//Z6x5S6cN9/yjRbqI=;
	b=byQzYi0s+Qc01FK1wPF4y54EPlfNOr7x6VU8bju/EZbkjJEOQRFBcGPZ3M9dt9fUTNS/
	 M82y8C67uKNDM1lbmgWciVDyJx5iTKbCKjP0CYYiI+yWANigbUTXVYMoNvykpgLeKS1qj
	 0Ml8pCVEFNJtSvaovHYCWzsK5Nkeb/VTegjbMGcsmj0MS+4VHTDoOa0WRuQp/hLinfGaZ
	 rMJD0q/5aQBr1irKvjcjGYhyTYRdAS5neNZG7CRnrx4+KwJjKWzFmGJVa7m6wAFSVC2tq
	 jiTaPFBOtVin10DETc2oRBggYvMd3rpAM5chH1gIxPwQn8twqtY4ZkqcqqiNzfLZynw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788538964;
	bh=2u/0piw6NFd35Fp8ZmlAgpBW5//Z6x5S6cN9/yjRbqI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nYee4+C/hQQyGMYS4GrOJpCY8epW6FzPr/2on3roLwKcqtSYPMhT4hO42L3gKYXAm
	 cp9ipuqmdMBuxilBZTMRBK0t9ltVEDc+bvRRgA14mH+ax9mnc261kk0wJsVpr5b7Xa
	 WTDNRqdhGnVA7UySFAfLPNUAu+524SsKx00WUWVCrSfs+4IRjpRXNIcWhG3UymwKF0
	 8sPh6efCO7eOhO/gcEpt+L5Amdq8QgGr7X0fKTKVZzQEKeUOXl3zg92d7V+kusKFIW
	 WwMo+/9umHVGhXCZMsPi+We85UkSya2dFVt0lVwxungRtpRJcie8JQsr15NoPhxC2G
	 EW5tbXx1fIwRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AB5C811CA;
	Fri,  4 Sep 2026 16:22:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 326F210E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18DCF40A61
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DRGN_jSz8ppL for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 875A440AC8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788538927;
 b=tYBpFLnZ3GG6995B/AGfavzU9qqeowB7dPGFJv+QNC/kmYj9Kf+ajM8+PBzCWYeOPTIe
 jbh4UN/maooQMDjOEvka1X7dOqjJ8iLBOXWn05VxW4NNgH8hyRAoKC4afcDg6tVmisAND
 I5AtQYvZ3wRD7kvc4pxg8NlEhTVRrPBvxSBJmdePMie6Cv2PsvSFmxb8inmjZN90jCt9U
 aEjGVG4vfby7tL91SOTV++qvfQoUE0eNjl8QbMEloTsO6IBnxPR2zO/xNIFzF5sP9zwdz
 ix8eSxtE8E2dayLv4uREiILyAG/mE5Bb7gb76Xyo/tgeqUwK1aKUjM8rhqxHkR27b/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788538927;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=k8/kiu2FK0HxXA9NRSmAIGsqXcyrKu7acjja2Ohx8VM=;
 b=ccfJ0T7vmoEfENRJ6rG/X2sTHrEnT6yB0yOVTf9jF+gDG5GW/ymJuKnZ/Eb+eBj5enqN
 29dPX+0dfiKJmekKIAzWEnomfRrE7IuZnZIugKxvLq5ubjlDAYgS+inGDNZstYwr/7jpV
 Dt0+SB7gvAogReLqQSZbGhHf6xvZ6DTg+WJ8THL75i0OyoFEmpWBDJ63E9rgUX0tuRLyQ
 6ameo8thjUZQ3BKdY9GyEMdqlYU2zMTChKuCNzJ9zcs6LycNFd3lSxl0fHDjW52QxiVXD
 C9xyjvU0cqM/vDukfF8/TSyGlaY/qBbY34pexwrK87sEYFl0y6Ac1ljzKZcK7KSP41A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 875A440AC8
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05F4594C87; Fri,  4 Sep 2026 16:21:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Aug 2026 23:54:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6851345aa8838e976cbbb1ce558bcfa0b158eaf5
X-Git-Newrev: 9c18b1668b068e48364fb41c1d62a7903b04d03c
X-Patchwork-Hint: ignore
Message-Id: <20260904162107.05F4594C87@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gensio: bump version to 3.0.4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5744359550363198792=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5744359550363198792==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9c18b1668b068e48364fb41c1d62a7903b04d03c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog: https://sourceforge.net/p/ser2net/news

Static builds are no longer supported starting with version 2.6.0 [1]
even when compiling all modules (gensios) in the library.

Updated licenses hashes due to upstream commit:
https://github.com/cminyard/gensio/commit/859e4465cf5788cb99da1002a4c38cd8841c1bb7

Removed patch 0001 which is now upstream.

[1] https://github.com/cminyard/gensio/commit/7b3786f5fb733cd593e631a7b75d4b47f5a4b95f

Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |   1 -
 ...-EVP_PKEY_ED25519-build-error-on-libressl.patch | 105 ---------------------
 package/gensio/Config.in                           |   6 ++
 package/gensio/gensio.hash                         |  10 +-
 package/gensio/gensio.mk                           |   3 +-
 package/ser2net/Config.in                          |   6 ++
 6 files changed, 19 insertions(+), 112 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index c3ec943075..2b61ff3bab 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -380,7 +380,6 @@ package/gdb/17.1/0007-fix-musl-build-on-riscv.patch lib_patch.Upstream
 package/gdb/17.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch lib_patch.Upstream
 package/gdb/17.1/0009-gdb-Fix-native-build-on-xtensa.patch lib_patch.Upstream
 package/genpart/0001-fix-return-code.patch lib_patch.Upstream
-package/gensio/0001-Fix-missing-EVP_PKEY_ED25519-build-error-on-libressl.patch lib_patch.Upstream
 package/gerbera/S99gerbera lib_sysv.Indent
 package/git-crypt/0001-fix-build-with-libressl-3.5.0.patch lib_patch.Upstream
 package/glorytun/0001-Add-support-for-Apple-silicon.patch lib_patch.Upstream
diff --git a/package/gensio/0001-Fix-missing-EVP_PKEY_ED25519-build-error-on-libressl.patch b/package/gensio/0001-Fix-missing-EVP_PKEY_ED25519-build-error-on-libressl.patch
deleted file mode 100644
index e9087aa3e5..0000000000
--- a/package/gensio/0001-Fix-missing-EVP_PKEY_ED25519-build-error-on-libressl.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From 1e7071684329f23ee3447310d203d193c283979e Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Wed, 5 Oct 2022 15:30:32 -0600
-Subject: [PATCH] Fix missing EVP_PKEY_ED25519 build error on libressl
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes:
-gensio_filter_certauth.c: In function ‘v3_certauth_add_challenge_rsp’:
-gensio_filter_certauth.c:838:44: error: ‘EVP_PKEY_ED25519’ undeclared (first use in this function); did you mean ‘EVP_PKEY_DSA1’?
-  838 |     if (EVP_PKEY_base_id(sfilter->pkey) == EVP_PKEY_ED25519) {
-      |                                            ^~~~~~~~~~~~~~~~
-      |                                            EVP_PKEY_DSA1
-gensio_filter_certauth.c:838:44: note: each undeclared identifier is reported only once for each function it appears in
-gensio_filter_certauth.c: In function ‘certauth_add_challenge_rsp’:
-gensio_filter_certauth.c:901:44: error: ‘EVP_PKEY_ED25519’ undeclared (first use in this function); did you mean ‘EVP_PKEY_DSA1’?
-  901 |     if (EVP_PKEY_base_id(sfilter->pkey) == EVP_PKEY_ED25519)
-      |                                            ^~~~~~~~~~~~~~~~
-      |                                            EVP_PKEY_DSA1
-gensio_filter_certauth.c: In function ‘certauth_check_challenge’:
-gensio_filter_certauth.c:1048:35: error: ‘EVP_PKEY_ED25519’ undeclared (first use in this function); did you mean ‘EVP_PKEY_DSA1’?
- 1048 |     if (EVP_PKEY_base_id(pkey) == EVP_PKEY_ED25519)
-      |                                   ^~~~~~~~~~~~~~~~
-      |                                   EVP_PKEY_DSA1
-
-Signed-off-by: Corey Minyard <cminyard@mvista.com>
-[Retrieved from:
-https://github.com/cminyard/gensio/commit/1e7071684329f23ee3447310d203d193c283979e]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- lib/gensio_filter_certauth.c |  6 ++++++
- tools/gtlssh-keygen.c        | 11 ++++++++++-
- 2 files changed, 16 insertions(+), 1 deletion(-)
-
-diff --git a/lib/gensio_filter_certauth.c b/lib/gensio_filter_certauth.c
-index 642379b6..c4552e79 100644
---- a/lib/gensio_filter_certauth.c
-+++ b/lib/gensio_filter_certauth.c
-@@ -835,11 +835,13 @@ v3_certauth_add_challenge_rsp(struct certauth_filter *sfilter)
-     unsigned int lenpos, len;
-     int rv = 0;
- 
-+#ifdef EVP_PKEY_ED25519
-     if (EVP_PKEY_base_id(sfilter->pkey) == EVP_PKEY_ED25519) {
- 	gca_log_err(sfilter,
- 		    "Remote end or SSL too old to support ed25519 key");
- 	return GE_KEYINVALID;
-     }
-+#endif
- 
-     certauth_write_byte(sfilter, CERTAUTH_CHALLENGE_RSP);
-     lenpos = sfilter->write_buf_len;
-@@ -898,8 +900,10 @@ certauth_add_challenge_rsp(struct certauth_filter *sfilter)
-     if (sfilter->version < 4 || sfilter->my_version < 4)
- 	return v3_certauth_add_challenge_rsp(sfilter);
- 
-+#ifdef EVP_PKEY_ED25519
-     if (EVP_PKEY_base_id(sfilter->pkey) == EVP_PKEY_ED25519)
- 	digest = NULL;
-+#endif
- 
-     certauth_write_byte(sfilter, CERTAUTH_CHALLENGE_RSP);
-     lenpos = sfilter->write_buf_len;
-@@ -1045,8 +1049,10 @@ certauth_check_challenge(struct certauth_filter *sfilter)
- 	goto out_nomem;
-     }
- 
-+#ifdef EVP_PKEY_ED25519
-     if (EVP_PKEY_base_id(pkey) == EVP_PKEY_ED25519)
- 	digest = NULL;
-+#endif
- 
-     if (!EVP_DigestVerifyInit(sign_ctx, NULL, digest, NULL, pkey)) {
- 	gca_logs_err(sfilter, "Digest verify init failed");
-diff --git a/tools/gtlssh-keygen.c b/tools/gtlssh-keygen.c
-index c8c28937..0779dd78 100644
---- a/tools/gtlssh-keygen.c
-+++ b/tools/gtlssh-keygen.c
-@@ -108,7 +108,12 @@ help(const char *progname)
-     P("        The default is your username for normal certificates and\n");
-     P("        the fully qualified domain name for server certificates.\n");
-     P("  --algorithm <algname> - Set the algorithm to use for the key,\n");
--    P("        either ed25519, rsa or ec.  The default is ed25519.\n");
-+    P("        either ed25519, rsa or ec.  ");
-+#ifdef EVP_PKEY_ED25519
-+    P("The default is ed25519.\n");
-+#else
-+    P("The default is ec.\n");
-+#endif
-     P("  --force, -f - Don't ask questions, just do the operation.  This\n");
-     P("        may overwrite data without asking.\n");
-     P("  --version - Print the version number and exit.\n");
-@@ -831,7 +836,11 @@ genpkey_ed25519(const char *key)
-     return rc != 0;
- }
- 
-+#ifdef EVP_PKEY_ED25519
- static int (*genpkey)(const char *key) = genpkey_ed25519;
-+#else
-+static int (*genpkey)(const char *key) = genpkey_ec;
-+#endif
- 
- /*
-  * Create a single key.  If name is NULL, it's a server key, otherwise
diff --git a/package/gensio/Config.in b/package/gensio/Config.in
index fd0e476970..6bb18820bf 100644
--- a/package/gensio/Config.in
+++ b/package/gensio/Config.in
@@ -1,9 +1,15 @@
 config BR2_PACKAGE_GENSIO
 	bool "gensio"
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	help
 	  A library to abstract stream I/O like serial port, TCP,
 	  telnet, UDP, SSL, IPMI SOL, etc.
 
 	  https://github.com/cminyard/gensio
+
+comment "gensio needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on BR2_STATIC_LIBS
diff --git a/package/gensio/gensio.hash b/package/gensio/gensio.hash
index 84af3fdab1..7cbc4fb9ac 100644
--- a/package/gensio/gensio.hash
+++ b/package/gensio/gensio.hash
@@ -1,7 +1,7 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5  c8d65e1809ed5cd1138fa309e3ab0e94  gensio-2.5.5.tar.gz
-sha1  076fc8324dedb658972a88c738131a409968e2ba  gensio-2.5.5.tar.gz
+md5  43a826835c044dada38a7fba6ae2afbe  gensio-3.0.4.tar.gz
+sha1  76cb782125140db9d9f3c0bfd810c7b94d084a50  gensio-3.0.4.tar.gz
+sha256  e28c24fc5d9f3cb90005bc008fec8bb8eedce503753024ab650bed0ac250cbe3  gensio-3.0.4.tar.gz
 # Locally computed:
-sha256  63c5fff536efd080fb7bc7fa084331c19fc64abd42b7f2bec86bd77b4fd10840  gensio-2.5.5.tar.gz
-sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
-sha256  dcac7d447dd81ab96d28dce00a07a6486e623f7ded94e2a2a8e83312405cdf89  COPYING.LIB
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index 2ba1b950d7..8fc21fab01 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENSIO_VERSION = 2.5.5
+GENSIO_VERSION = 3.0.4
 GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 GENSIO_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GENSIO_LICENSE_FILES = COPYING.LIB COPYING
@@ -12,6 +12,7 @@ GENSIO_INSTALL_STAGING = YES
 GENSIO_CONF_OPTS = \
 	--without-swig \
 	--without-python
+GENSIO_AUTORECONF = YES
 
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 GENSIO_CONF_OPTS += --with-cplusplus
diff --git a/package/ser2net/Config.in b/package/ser2net/Config.in
index 1859d42c8f..87ace59deb 100644
--- a/package/ser2net/Config.in
+++ b/package/ser2net/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SER2NET
 	bool "ser2net"
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS # gensio
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC # gensio
 	select BR2_PACKAGE_GENSIO
 	select BR2_PACKAGE_LIBYAML
@@ -9,3 +10,8 @@ config BR2_PACKAGE_SER2NET
 	  connection to a serial port.
 
 	  http://ser2net.sourceforge.net
+
+comment "ser2net needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on BR2_STATIC_LIBS

--===============5744359550363198792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5744359550363198792==--
