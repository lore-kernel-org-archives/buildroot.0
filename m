Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FDEC4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 20:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1504404B5;
	Sat,  5 Nov 2022 20:03:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1504404B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yORs-fMniu08; Sat,  5 Nov 2022 20:03:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B49F74041C;
	Sat,  5 Nov 2022 20:03:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B49F74041C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 08F0C1BF371
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 20:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D52FE81E16
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 20:03:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D52FE81E16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aj-wBqWVCGtu for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 20:03:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE94581E25
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 20:03:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE94581E25
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D65487DEB; Sat,  5 Nov 2022 20:03:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 21:03:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b4a9930124f7fb4c7bfae281db900905006a2da
X-Git-Newrev: b79d735139282ecf052dc89d4c221bbd16447112
X-Patchwork-Hint: ignore
Message-Id: <20221105200326.9D65487DEB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strongswan: security bump to
 version 5.9.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=b79d735139282ecf052dc89d4c221bbd16447112
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixed a vulnerability related to online certificate revocation checking
that was caused because the revocation plugin used potentially untrusted
OCSP URIs and CRL distribution points in certificates. This allowed a
remote attacker to initiate IKE_SAs and send crafted certificates that
contain URIs pointing to servers under their control, which could have
lead to a denial-of-service attack. This vulnerability has been
registered as CVE-2022-40617.

Drop patch (already in version)

https://www.strongswan.org/blog/2022/10/03/strongswan-vulnerability-(cve-2022-40617).html
https://github.com/strongswan/strongswan/releases/tag/5.9.6
https://github.com/strongswan/strongswan/releases/tag/5.9.7
https://github.com/strongswan/strongswan/releases/tag/5.9.8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...strongswan-plugins-wolfssl-rename-encrypt.patch | 150 ---------------------
 package/strongswan/strongswan.hash                 |   6 +-
 package/strongswan/strongswan.mk                   |   2 +-
 3 files changed, 4 insertions(+), 154 deletions(-)

diff --git a/package/strongswan/0001-src-libstrongswan-plugins-wolfssl-rename-encrypt.patch b/package/strongswan/0001-src-libstrongswan-plugins-wolfssl-rename-encrypt.patch
deleted file mode 100644
index 7b47b3278b..0000000000
--- a/package/strongswan/0001-src-libstrongswan-plugins-wolfssl-rename-encrypt.patch
+++ /dev/null
@@ -1,150 +0,0 @@
-From 5900426a710eaa65a27784687775e331bcb0489b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 8 Aug 2022 09:52:19 +0200
-Subject: [PATCH] wolfssl: Rename `encrypt` methods to avoid conflicts with
- system headers
-
-Rename `encrypt` methods to avoid the following build failure when wolfSSL
-is built with --enable-opensslextra:
-
-In file included from ../../../../src/libstrongswan/utils/utils.h:59,
-                 from ../../../../src/libstrongswan/library.h:101,
-                 from wolfssl_common.h:29,
-                 from wolfssl_aead.c:23:
-wolfssl_aead.c:90:16: error: conflicting types for 'encrypt'; have '_Bool(union <anonymous>,  chunk_t,  chunk_t,  chunk_t,  chunk_t *)'
-   90 | METHOD(aead_t, encrypt, bool,
-      |                ^~~~~~~
-../../../../src/libstrongswan/utils/utils/object.h:99:20: note: in definition of macro 'METHOD'
-   99 |         static ret name(union {iface *_public; this;} \
-      |                    ^~~~
-In file included from /home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/wolfssl/wolfcrypt/wc_port.h:573,
-                 from /home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/wolfssl/wolfcrypt/types.h:35,
-                 from /home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/wolfssl/wolfcrypt/logging.h:33,
-                 from /home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/wolfssl/ssl.h:35,
-                 from wolfssl_common.h:64,
-                 from wolfssl_aead.c:23:
-/home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/unistd.h:149:6: note: previous declaration of 'encrypt' with type 'void(char *, int)'
-  149 | void encrypt(char *, int);
-      |      ^~~~~~~
-
-Closes strongswan/strongswan#1201
-[Retrieved from:
-https://github.com/strongswan/strongswan/commit/5900426a710eaa65a27784687775e331bcb0489b]
----
- src/libstrongswan/plugins/wolfssl/wolfssl_aead.c           | 4 ++--
- src/libstrongswan/plugins/wolfssl/wolfssl_crypter.c        | 4 ++--
- src/libstrongswan/plugins/wolfssl/wolfssl_ec_public_key.c  | 4 ++--
- src/libstrongswan/plugins/wolfssl/wolfssl_ed_public_key.c  | 4 ++--
- src/libstrongswan/plugins/wolfssl/wolfssl_rsa_public_key.c | 4 ++--
- 5 files changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/src/libstrongswan/plugins/wolfssl/wolfssl_aead.c b/src/libstrongswan/plugins/wolfssl/wolfssl_aead.c
-index 2ea7c94cd65..44f054916cf 100644
---- a/src/libstrongswan/plugins/wolfssl/wolfssl_aead.c
-+++ b/src/libstrongswan/plugins/wolfssl/wolfssl_aead.c
-@@ -87,7 +87,7 @@ struct private_aead_t {
- 	encryption_algorithm_t alg;
- };
- 
--METHOD(aead_t, encrypt, bool,
-+METHOD(aead_t, encrypt_, bool,
- 	private_aead_t *this, chunk_t plain, chunk_t assoc, chunk_t iv,
- 	chunk_t *encrypted)
- {
-@@ -323,7 +323,7 @@ aead_t *wolfssl_aead_create(encryption_algorithm_t algo,
- 
- 	INIT(this,
- 		.public = {
--			.encrypt = _encrypt,
-+			.encrypt = _encrypt_,
- 			.decrypt = _decrypt,
- 			.get_block_size = _get_block_size,
- 			.get_icv_size = _get_icv_size,
-diff --git a/src/libstrongswan/plugins/wolfssl/wolfssl_crypter.c b/src/libstrongswan/plugins/wolfssl/wolfssl_crypter.c
-index cffe7ba2375..085a912404c 100644
---- a/src/libstrongswan/plugins/wolfssl/wolfssl_crypter.c
-+++ b/src/libstrongswan/plugins/wolfssl/wolfssl_crypter.c
-@@ -230,7 +230,7 @@ METHOD(crypter_t, decrypt, bool,
- 	return success;
- }
- 
--METHOD(crypter_t, encrypt, bool,
-+METHOD(crypter_t, encrypt_, bool,
- 	private_wolfssl_crypter_t *this, chunk_t data, chunk_t iv, chunk_t *dst)
- {
- 	u_char *out;
-@@ -578,7 +578,7 @@ wolfssl_crypter_t *wolfssl_crypter_create(encryption_algorithm_t algo,
- 	INIT(this,
- 		.public = {
- 			.crypter = {
--				.encrypt = _encrypt,
-+				.encrypt = _encrypt_,
- 				.decrypt = _decrypt,
- 				.get_block_size = _get_block_size,
- 				.get_iv_size = _get_iv_size,
-diff --git a/src/libstrongswan/plugins/wolfssl/wolfssl_ec_public_key.c b/src/libstrongswan/plugins/wolfssl/wolfssl_ec_public_key.c
-index d8a1ededb06..110543762f2 100644
---- a/src/libstrongswan/plugins/wolfssl/wolfssl_ec_public_key.c
-+++ b/src/libstrongswan/plugins/wolfssl/wolfssl_ec_public_key.c
-@@ -193,7 +193,7 @@ METHOD(public_key_t, verify, bool,
- 	}
- }
- 
--METHOD(public_key_t, encrypt, bool,
-+METHOD(public_key_t, encrypt_, bool,
- 	private_wolfssl_ec_public_key_t *this, encryption_scheme_t scheme,
- 	void *params, chunk_t crypto, chunk_t *plain)
- {
-@@ -324,7 +324,7 @@ static private_wolfssl_ec_public_key_t *create_empty()
- 			.key = {
- 				.get_type = _get_type,
- 				.verify = _verify,
--				.encrypt = _encrypt,
-+				.encrypt = _encrypt_,
- 				.get_keysize = _get_keysize,
- 				.equals = public_key_equals,
- 				.get_fingerprint = _get_fingerprint,
-diff --git a/src/libstrongswan/plugins/wolfssl/wolfssl_ed_public_key.c b/src/libstrongswan/plugins/wolfssl/wolfssl_ed_public_key.c
-index f423d8d5691..ea0fb3dfc77 100644
---- a/src/libstrongswan/plugins/wolfssl/wolfssl_ed_public_key.c
-+++ b/src/libstrongswan/plugins/wolfssl/wolfssl_ed_public_key.c
-@@ -111,7 +111,7 @@ METHOD(public_key_t, verify, bool,
- 	return ret == 0 && res == 1;
- }
- 
--METHOD(public_key_t, encrypt, bool,
-+METHOD(public_key_t, encrypt_, bool,
- 	private_public_key_t *this, encryption_scheme_t scheme,
- 	void *params, chunk_t crypto, chunk_t *plain)
- {
-@@ -368,7 +368,7 @@ static private_public_key_t *create_empty(key_type_t type)
- 		.public = {
- 			.get_type = _get_type,
- 			.verify = _verify,
--			.encrypt = _encrypt,
-+			.encrypt = _encrypt_,
- 			.get_keysize = _get_keysize,
- 			.equals = public_key_equals,
- 			.get_fingerprint = _get_fingerprint,
-diff --git a/src/libstrongswan/plugins/wolfssl/wolfssl_rsa_public_key.c b/src/libstrongswan/plugins/wolfssl/wolfssl_rsa_public_key.c
-index 72df115fe90..da8899c2d8c 100644
---- a/src/libstrongswan/plugins/wolfssl/wolfssl_rsa_public_key.c
-+++ b/src/libstrongswan/plugins/wolfssl/wolfssl_rsa_public_key.c
-@@ -216,7 +216,7 @@ METHOD(public_key_t, verify, bool,
- 	}
- }
- 
--METHOD(public_key_t, encrypt, bool,
-+METHOD(public_key_t, encrypt_, bool,
- 	private_wolfssl_rsa_public_key_t *this, encryption_scheme_t scheme,
- 	void *params, chunk_t plain, chunk_t *crypto)
- {
-@@ -440,7 +440,7 @@ static private_wolfssl_rsa_public_key_t *create_empty()
- 			.key = {
- 				.get_type = _get_type,
- 				.verify = _verify,
--				.encrypt = _encrypt,
-+				.encrypt = _encrypt_,
- 				.equals = public_key_equals,
- 				.get_keysize = _get_keysize,
- 				.get_fingerprint = _get_fingerprint,
diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
index aca7ddf5cd..4822f9152f 100644
--- a/package/strongswan/strongswan.hash
+++ b/package/strongswan/strongswan.hash
@@ -1,7 +1,7 @@
-# From http://download.strongswan.org/strongswan-5.9.5.tar.bz2.md5
-md5  53005324e3cba8592f1fb958b1c2d0e5  strongswan-5.9.5.tar.bz2
+# From http://download.strongswan.org/strongswan-5.9.8.tar.bz2.md5
+md5  f46b0d3e7aed88824650d0721c887443  strongswan-5.9.8.tar.bz2
 # Calculated based on the hash above
-sha256  983e4ef4a4c6c9d69f5fe6707c7fe0b2b9a9291943bbf4e008faab6bf91c0bdd  strongswan-5.9.5.tar.bz2
+sha256  d3303a43c0bd7b75a12b64855e8edcb53696f06190364f26d1533bde1f2e453c  strongswan-5.9.8.tar.bz2
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  2292e21797754548dccdef9eef6aee7584e552fbd890fa914e1de8d3577d23f0  LICENSE
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 44c20f8414..cae1433e39 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRONGSWAN_VERSION = 5.9.5
+STRONGSWAN_VERSION = 5.9.8
 STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
