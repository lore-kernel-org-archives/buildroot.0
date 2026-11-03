Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A17606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ntU7ykzi
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA0EB811D2;
	Fri,  6 Nov 2026 15:58:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m8X8fxqnBeI8; Fri,  6 Nov 2026 15:58:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5C44781203
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980722;
	b=bO5SzuobkB6OtVbHiXsINZBWIqS3aVt4nf7Ulfj5PQ1sF8P/e9yCeniygcHtiskOSDid
	 MeUNPIqp2jzIy6viAh5Id7E46u6eF32RcIk7Ves7+mEivmk1Dd7Z94VNgz6VRDu3yEcsl
	 /3dleHVK27rX7FWABUamQ2cPcFhMddiIErSr/A2pSKliuW3vhXzWXVcsaAkyAoepL+4Q6
	 PC9zJKqnwwf9e/PJ5hP3FnkPYLRqrpiO2NBnNMu/2xqMOeuG5Lrl+skfkAUKyyUV0Th5p
	 ZOJWly9esKtOTHbfavC5/YMzrXUEIFZHInioAIFlPEWg46+EAS74h+vleLIXNo9pcaA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980722;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=wjjzr0tSnwi3HS4vDQ9KyRt1gN5mGHdV9iGd8rvMJo0=;
	b=fMhvuOv0bUFr7Se4wS/3fgEmp4blmij4tGXqMD7FiNHh9mwMEXXivjPGWY4flDsa0mkH
	 ktpS5zD//7zxm/n1ZWc2dG9+EKOCZEIjyrvN562DZdkq7OuMoDXQ+VhncTd9/fbxQNZuy
	 xNz+WblZGvxH6TyEeu6xAqIhWoE1occMjHuI4rOPSS2ZaNLasaHXF5Y10Gs2pTHK1eLJL
	 XncZ1LWNjuKvZh1JtJtCDrWDdyM9azm3LB2cvmyBk+d5kZ2Evbi36ezGd+x4IrCFKe69t
	 4pXdEyfXBhPjpjsygzbw6Rg2DMr+Srx+PRXp7P412oCLWLj6R8nOlf2igmlXSoIMJgg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980722;
	bh=wjjzr0tSnwi3HS4vDQ9KyRt1gN5mGHdV9iGd8rvMJo0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ntU7ykziey6Uk/gG/KzkmJlE3MNcZKOKyiY1CluAc5YKtA6TE2MR38kDAf1cneg8P
	 Efw9sz927rc9GhDLIIt8AUg+JFoKQMaduT3cpWGw1yIpwO08xn3EMe1OK8ZTjs5orb
	 LcAI1ZOGHzto8LGM/ybgM0g4XRZJurBoirbg7oc6VCtl2vsm0sBOCZwUGmUgpWO/Ye
	 eUxXsS/GDZZGlhjmlL2Xs4Dasz6d+sqC47wp1h74nwXd6metcWH6iIzdvc8vbmTMo5
	 ux82LyCH+Sk5d93mMJJAos8y4D4W0TBA2WRCKGCRRXz2Xtn4qoalEKdA0PpusXP320
	 lUm5wxotdj7AQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C44781203;
	Fri,  6 Nov 2026 15:58:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AD97A34D
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CC5980FAF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VtLgX5CJfylH for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B60FB80F5D
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B60FB80F5D
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DBF9C9E09B; Fri,  6 Nov 2026 15:56:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Nov 2026 11:15:38 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4081f0aac9f1c8e21c33703f06c9f46b60b01660
X-Git-Newrev: 1c562e762752f274d97cc868bd1a5404f1b0ebaa
X-Patchwork-Hint: ignore
Message-Id: <20261106155654.DBF9C9E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/iperf3: bump to
 version 3.19
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3623205905652662019=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.9 required=3.0 tests=BAYES_00,DATE_IN_PAST_48_96,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3623205905652662019==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1c562e762752f274d97cc868bd1a5404f1b0ebaa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Release notes:
https://github.com/esnet/iperf/releases/tag/3.19

Updated license hash due to copyright year bump:
https://github.com/esnet/iperf/commit/9f6dc2164dea62221298818c54992c3f24a7e214

Added a patch to fix the build error with uClibc.

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0575a3ab10932a030c0726a8d8bedc2d06b6499c)
[thomas: remove the previously applied backport]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...lation-issue-with-uClibc-due-to-a-missing.patch | 51 ++++++++++++
 ...0001-Fix-off-by-one-head-overflow-in-auth.patch | 93 ----------------------
 ...lures-on-malformed-authentication-attempt.patch | 35 --------
 package/iperf3/iperf3.hash                         |  6 +-
 package/iperf3/iperf3.mk                           |  8 +-
 5 files changed, 55 insertions(+), 138 deletions(-)

diff --git a/package/iperf3/0001-Fix-a-compilation-issue-with-uClibc-due-to-a-missing.patch b/package/iperf3/0001-Fix-a-compilation-issue-with-uClibc-due-to-a-missing.patch
new file mode 100644
index 0000000000..cc2f4bd595
--- /dev/null
+++ b/package/iperf3/0001-Fix-a-compilation-issue-with-uClibc-due-to-a-missing.patch
@@ -0,0 +1,51 @@
+From e5c4263c6b2c5b84a6edeb1cf3c95bddd73d4d7c Mon Sep 17 00:00:00 2001
+From: Kadambini Nema <kadambini.nema@gmail.com>
+Date: Sat, 17 May 2025 16:20:07 -0700
+Subject: [PATCH] Fix a compilation issue with uClibc due to a missing include
+ file.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+------
+In file included from t_auth.c:35:
+iperf_api.h:395:77: error: unknown type name ‘va_list’
+  395 | void iperf_exit(struct iperf_test *test, int exit_code, const char *format, va_list argp) __attribute__ ((noreturn));
+	  |                                                                             ^~~~~~~
+iperf_api.h:33:1: note: ‘va_list’ is defined in header ‘<stdarg.h>’; did you forget to ‘#include <stdarg.h>’?
+   32 | #include <setjmp.h>
+  +++ |+#include <stdarg.h>
+   33 | #include <stdio.h>
+-----
+
+Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
+Upstream: https://github.com/esnet/iperf/pull/1888
+---
+ src/iperf_api.c | 1 -
+ src/iperf_api.h | 1 +
+ 2 files changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/iperf_api.c b/src/iperf_api.c
+index aeec91dd3..d4a06bec9 100644
+--- a/src/iperf_api.c
++++ b/src/iperf_api.c
+@@ -53,7 +53,6 @@
+ #include <sys/stat.h>
+ #include <sched.h>
+ #include <setjmp.h>
+-#include <stdarg.h>
+ #include <math.h>
+ 
+ #if defined(HAVE_CPUSET_SETAFFINITY)
+diff --git a/src/iperf_api.h b/src/iperf_api.h
+index 03d273e8c..cd82e6f9b 100644
+--- a/src/iperf_api.h
++++ b/src/iperf_api.h
+@@ -30,6 +30,7 @@
+ #include <sys/socket.h>
+ #include <sys/time.h>
+ #include <setjmp.h>
++#include <stdarg.h>
+ #include <stdio.h>
+ #include <stdint.h>
+ #ifdef __cplusplus
diff --git a/package/iperf3/0001-Fix-off-by-one-head-overflow-in-auth.patch b/package/iperf3/0001-Fix-off-by-one-head-overflow-in-auth.patch
deleted file mode 100644
index 38fe1327ce..0000000000
--- a/package/iperf3/0001-Fix-off-by-one-head-overflow-in-auth.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From 4e5313bab0b9b3fe03513ab54f722c8a3e4b7bdf Mon Sep 17 00:00:00 2001
-From: Sarah Larsen <swlarsen@es.net>
-Date: Wed, 25 Jun 2025 15:11:03 +0000
-Subject: [PATCH] Fix off-by-one heap overflow in auth.
-
-Reported by Han Lee (Apple Information Security)
-
-CVE: CVE-2025-54349
-Upstream: https://github.com/esnet/iperf/commit/4e5313bab0b9b3fe03513ab54f722c8a3e4b7bdf
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- src/iperf_auth.c | 18 +++++++++++++-----
- 1 file changed, 13 insertions(+), 5 deletions(-)
-
-diff --git a/src/iperf_auth.c b/src/iperf_auth.c
-index b9f2bc0f2..632f03d24 100644
---- a/src/iperf_auth.c
-+++ b/src/iperf_auth.c
-@@ -288,6 +288,7 @@ int encrypt_rsa_message(const char *plaintext, EVP_PKEY *public_key, unsigned ch
- }
- 
- int decrypt_rsa_message(const unsigned char *encryptedtext, const int encryptedtext_len, EVP_PKEY *private_key, unsigned char **plaintext, int use_pkcs1_padding) {
-+    int ret =0;
- #if OPENSSL_VERSION_MAJOR >= 3
-     EVP_PKEY_CTX *ctx;
- #else
-@@ -310,7 +311,8 @@ int decrypt_rsa_message(const unsigned char *encryptedtext, const int encryptedt
-     keysize = RSA_size(rsa);
- #endif
-     rsa_buffer  = OPENSSL_malloc(keysize * 2);
--    *plaintext = (unsigned char*)OPENSSL_malloc(keysize);
-+    // Note: +1 for NULL
-+    *plaintext = (unsigned char*)OPENSSL_malloc(keysize + 1);
- 
-     BIO *bioBuff   = BIO_new_mem_buf((void*)encryptedtext, encryptedtext_len);
-     rsa_buffer_len = BIO_read(bioBuff, rsa_buffer, keysize * 2);
-@@ -320,13 +322,15 @@ int decrypt_rsa_message(const unsigned char *encryptedtext, const int encryptedt
-         padding = RSA_PKCS1_PADDING;
-     }
- #if OPENSSL_VERSION_MAJOR >= 3
-+
-     plaintext_len = keysize;
-     EVP_PKEY_decrypt_init(ctx);
--    int ret = EVP_PKEY_CTX_set_rsa_padding(ctx, padding);
-+
-+    ret = EVP_PKEY_CTX_set_rsa_padding(ctx, padding);
-     if (ret < 0){
-         goto errreturn;
-     }
--    EVP_PKEY_decrypt(ctx, *plaintext, &plaintext_len, rsa_buffer, rsa_buffer_len);
-+    ret = EVP_PKEY_decrypt(ctx, *plaintext, &plaintext_len, rsa_buffer, rsa_buffer_len);
-     EVP_PKEY_CTX_free(ctx);
- #else
-     plaintext_len = RSA_private_decrypt(rsa_buffer_len, rsa_buffer, *plaintext, rsa, padding);
-@@ -337,7 +341,7 @@ int decrypt_rsa_message(const unsigned char *encryptedtext, const int encryptedt
-     BIO_free(bioBuff);
- 
-     /* Treat a decryption error as an empty string. */
--    if (plaintext_len < 0) {
-+    if (plaintext_len <= 0) {
-         plaintext_len = 0;
-     }
- 
-@@ -386,24 +390,28 @@ int decode_auth_setting(int enable_debug, const char *authtoken, EVP_PKEY *priva
-     int plaintext_len;
-     plaintext_len = decrypt_rsa_message(encrypted_b64, encrypted_len_b64, private_key, &plaintext, use_pkcs1_padding);
-     free(encrypted_b64);
--    if (plaintext_len < 0) {
-+    if (plaintext_len <= 0) {
-         return -1;
-     }
-+
-     plaintext[plaintext_len] = '\0';
- 
-     char *s_username, *s_password;
-     s_username = (char *) calloc(plaintext_len, sizeof(char));
-     if (s_username == NULL) {
-+        OPENSSL_free(plaintext);
- 	return -1;
-     }
-     s_password = (char *) calloc(plaintext_len, sizeof(char));
-     if (s_password == NULL) {
-+        OPENSSL_free(plaintext);
- 	free(s_username);
- 	return -1;
-     }
- 
-     int rc = sscanf((char *) plaintext, auth_text_format, s_username, s_password, &utc_seconds);
-     if (rc != 3) {
-+        OPENSSL_free(plaintext);
- 	free(s_password);
- 	free(s_username);
- 	return -1;
diff --git a/package/iperf3/0002-Prevent-crash-due-to-assertion-failures-on-malformed-authentication-attempt.patch b/package/iperf3/0002-Prevent-crash-due-to-assertion-failures-on-malformed-authentication-attempt.patch
deleted file mode 100644
index bcba77be21..0000000000
--- a/package/iperf3/0002-Prevent-crash-due-to-assertion-failures-on-malformed-authentication-attempt.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From de932ea16bc959f839d28d370f0602de52c5def1 Mon Sep 17 00:00:00 2001
-From: "Bruce A. Mah" <bmah@es.net>
-Date: Tue, 24 Jun 2025 15:58:21 -0700
-Subject: [PATCH] Prevent crash due to assertion failures on malformed
- authentication attempt.
-
-Reported by Han Lee (Apple Information Security)
-
-CVE: CVE-2025-54350
-Upstream: https://github.com/esnet/iperf/commit/de932ea16bc959f839d28d370f0602de52c5def1
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- src/iperf_auth.c | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/src/iperf_auth.c b/src/iperf_auth.c
-index 72e85fc9a..b9f2bc0f2 100644
---- a/src/iperf_auth.c
-+++ b/src/iperf_auth.c
-@@ -28,7 +28,6 @@
- #include "iperf_config.h"
- 
- #include <string.h>
--#include <assert.h>
- #include <time.h>
- #include <sys/types.h>
- /* FreeBSD needs _WITH_GETLINE to enable the getline() declaration */
-@@ -152,7 +151,6 @@ int Base64Decode(const char* b64message, unsigned char** buffer, size_t* length)
- 
-     BIO_set_flags(bio, BIO_FLAGS_BASE64_NO_NL); //Do not use newlines to flush buffer
-     *length = BIO_read(bio, *buffer, strlen(b64message));
--    assert(*length == decodeLen); //length should equal decodeLen, else something went horribly wrong
-     BIO_free_all(bio);
- 
-     return (0); //success
diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
index 2aef76578a..1ffb2c6c02 100644
--- a/package/iperf3/iperf3.hash
+++ b/package/iperf3/iperf3.hash
@@ -1,4 +1,4 @@
-# From https://downloads.es.net/pub/iperf/iperf-3.18.tar.gz.sha256
-sha256  c0618175514331e766522500e20c94bfb293b4424eb27d7207fb427b88d20bab  iperf-3.18.tar.gz
+# From https://downloads.es.net/pub/iperf/iperf-3.19.tar.gz.sha256
+sha256  040161da1555ec7411a9d81191049830ef37717d429a94ee6cf0842618e0e29c  iperf-3.19.tar.gz
 # Locally computed
-sha256  3dc3e2076dd9cdea2b66d8fe213997ff25fb6171594f055b59fe25321b438f6f  LICENSE
+sha256  7c9ba0385fcf35c4c9e08ad0c0cba72d4315f36f0f742fef4de826a28cc33a97  LICENSE
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index 43f791b082..69c4792f98 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,19 +4,13 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.18
+IPERF3_VERSION = 3.19
 IPERF3_SITE = https://downloads.es.net/pub/iperf
 IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
 IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT
 IPERF3_LICENSE_FILES = LICENSE
 IPERF3_CPE_ID_VENDOR = es
 
-# 0001-Fix-off-by-one-head-overflow-in-auth.patch
-IPERF3_IGNORE_CVES += CVE-2025-54349
-
-# 0002-Prevent-crash-due-to-assertion-failures-on-malformed-authentication-attempt.patch
-IPERF3_IGNORE_CVES += CVE-2025-54350
-
 IPERF3_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)

--===============3623205905652662019==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3623205905652662019==--
