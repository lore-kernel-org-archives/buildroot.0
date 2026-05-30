Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E398CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 17:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79582853E9;
	Sat, 30 May 2026 17:38:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rGCj60y3rBX4; Sat, 30 May 2026 17:38:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4193853DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780162734;
	bh=2Uw24wF3PS22ZL5Qgc/iC6QXa4GLir0fAPnU4tD9h8I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=C3IvPqwX21u8reB/y9l8H74nScFBev5KABsvNK5fGp8EwncWllrkIw3wGe/EGKXlz
	 6+Uk2kTn4NkT7dEp8Pyxr5ME0ohhsDPcc656t8Tpyo93ijpM3tN62WSHROSqrLYJ3H
	 OhxCavqjDe2Ei0F+lxEmWVatQ2F1TkBLip4JHNNKdVhyuJGjBQn032U2IKYxYxXSlo
	 Rx0w8DlkEh2b3GxJBUvclK4T/kfw3nT6fL7KKzapYWW4e/9iYEgKZNbXkIqneydJpc
	 k+s4nCjm7Rol3Kib8yEQQ7bOT5u1PB1Q5l2teiHXjkl7IYJeWRq9P5nKsp7dGlfHIC
	 fBrgQNijcOfNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4193853DC;
	Sat, 30 May 2026 17:38:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CF785D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0CBA42698
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p_P7SkbhFjmT for <buildroot@buildroot.org>;
 Sat, 30 May 2026 17:38:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3C3B40064
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3C3B40064
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:38:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B234487532; Sat, 30 May 2026 17:38:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 19:34:41 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2d7cf86aaafed925bd2a24f0d58a4dcd0bfd518a
X-Git-Newrev: 5394df6400912efa7da4f97c7ea68a81a9f77c1d
X-Patchwork-Hint: ignore
Message-Id: <20260530173838.B234487532@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/tpm2-tss: add Mbed-TLS
 crypto backend support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5394df6400912efa7da4f97c7ea68a81a9f77c1d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Add mbedtls crypto backend support for lightweight build

BR2_PACKAGE_TPM2_TSS_FAPI depends on openssl explicitly

Rewrite fapi -> FAPI

Signed-off-by: Andreas Mohr <and@gmx.li>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tpm2-tss/Config.in   | 10 +++++++---
 package/tpm2-tss/tpm2-tss.mk | 11 +++++++++--
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/package/tpm2-tss/Config.in b/package/tpm2-tss/Config.in
index 9ce3c22763..91337ce48d 100644
--- a/package/tpm2-tss/Config.in
+++ b/package/tpm2-tss/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_TPM2_TSS
 	bool "tpm2-tss"
 	depends on !BR2_STATIC_LIBS # dlfcn.h
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL if !BR2_PACKAGE_MBEDTLS
 	help
 	  OSS implementation of the Trusted Computing Group's (TCG) TPM2
 	  Software Stack (TSS). This stack consists of the following
@@ -35,8 +35,9 @@ config BR2_PACKAGE_TPM2_TSS
 if BR2_PACKAGE_TPM2_TSS
 
 config BR2_PACKAGE_TPM2_TSS_FAPI
-	bool "fapi support"
+	bool "FAPI support"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+	depends on !BR2_PACKAGE_MBEDTLS # configure: FAPI has to be compiled with OpenSSL
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_UTIL_LINUX
@@ -54,6 +55,9 @@ config BR2_PACKAGE_TPM2_TSS_FAPI
 	  https://trustedcomputinggroup.org/wp-content/uploads/TSS_FAPI_v0.94_r04_pubrev.pdf
 	  https://trustedcomputinggroup.org/wp-content/uploads/TSS_JSON_Policy_v0.7_r04_pubrev.pdf
 
+comment "FAPI not supported with Mbed TLS backend"
+	depends on BR2_PACKAGE_MBEDTLS
+
 endif
 
 comment "tpm2-tss needs a toolchain w/ dynamic library"
diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index 11da37a5b4..b9653ad33f 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -11,7 +11,7 @@ TPM2_TSS_LICENSE_FILES = LICENSE
 TPM2_TSS_CPE_ID_VENDOR = tpm2_software_stack_project
 TPM2_TSS_CPE_ID_PRODUCT = tpm2_software_stack
 TPM2_TSS_INSTALL_STAGING = YES
-TPM2_TSS_DEPENDENCIES = openssl host-pkgconf
+TPM2_TSS_DEPENDENCIES = host-pkgconf
 
 # systemd-sysusers and systemd-tmpfiles are only used at install time
 # to trigger the creation of users and tmpfiles, which we do not care
@@ -25,10 +25,17 @@ TPM2_TSS_CONF_OPTS = \
 	ac_cv_prog_systemd_tmpfiles=no \
 	ac_cv_prog_useradd=yes \
 	ac_cv_prog_groupadd=yes \
-	--with-crypto=ossl \
 	--disable-doxygen-doc \
 	--disable-defaultflags
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+TPM2_TSS_DEPENDENCIES += openssl
+TPM2_TSS_CONF_OPTS += --with-crypto=ossl
+else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+TPM2_TSS_DEPENDENCIES += mbedtls
+TPM2_TSS_CONF_OPTS += --with-crypto=mbed
+endif
+
 # uses C99 code but forgets to pass -std=c99 when --disable-defaultflags is used
 TPM2_TSS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
