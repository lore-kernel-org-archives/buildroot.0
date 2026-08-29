Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658F5C61DDE
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 22:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 338B180E7C;
	Sat, 29 Aug 2026 22:20:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qj2cNigBRHm0; Sat, 29 Aug 2026 22:20:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788042038;
	bh=VmTkls97/wuEzmbcnqtXOpqXaJrphV9r9rByhsWHANE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hZFybR+O/gbJd5agRWlx9U56R3C7mqJe6DXu8peHwcxU+IvG075aYSMrKn37jYkOs
	 wazjcEtqCdOP38E/NvU8QQTeWDAVCk765e1AwWjyPAqmUkxQZ669LdbSobtEqq8aQS
	 cC66IIkp5WR1ZRbkVUPJBucZbyJaBI4JH2u/dtR6/egDhkGR54hY0740A/O6eP7iXo
	 7ZCB3tYjSA1OcLJaFS8zA3ctoty6WdG+o9FsV/wOLAoxo9dQg4S470y0D70y1oH6Rg
	 guRfLEkal/SZB2qqmDa1ZJU9jSdthh3G9Jx2xG8zVlOxyAHSeioGznB+bdq9zmzQ0n
	 s7KWWQmkNtTLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5CE280E86;
	Sat, 29 Aug 2026 22:20:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EA1ECD5B
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 22:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA1F340696
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 22:20:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tBnTqXJnKZIw for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 22:20:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2FD1405EE
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 22:20:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3BEBA92228; Sat, 29 Aug 2026 22:19:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Aug 2026 23:54:47 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6851345aa8838e976cbbb1ce558bcfa0b158eaf5
X-Git-Newrev: 9c18b1668b068e48364fb41c1d62a7903b04d03c
X-Patchwork-Hint: ignore
Message-Id: <20260829221934.3BEBA92228@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gensio: bump version
 to 3.0.4
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
Content-Type: multipart/mixed; boundary="===============2644580416993411338=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2644580416993411338==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9c18b1668b068e48364fb41c1d62a7903b04d03c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

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

--===============2644580416993411338==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2644580416993411338==--
