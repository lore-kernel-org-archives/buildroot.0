Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4004C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 09:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FCF8435F5;
	Wed, 10 Jan 2024 09:50:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FCF8435F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uRm4YA-HkXkD; Wed, 10 Jan 2024 09:50:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93AD5435DB;
	Wed, 10 Jan 2024 09:50:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93AD5435DB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2548F1BF34C
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 09:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D78BA4160B
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 09:49:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D78BA4160B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TsE-poOjvIY4 for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 09:49:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5911641607
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 09:49:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5911641607
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 459B0847F4; Wed, 10 Jan 2024 09:49:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 10:39:45 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 66c04c8838c90be1b7f06d4e45249ad9fea4c988
X-Git-Newrev: 5173d24fc98aea900e0dec40cece6cd51e628260
X-Patchwork-Hint: ignore
Message-Id: <20240110094924.459B0847F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/opensc: bump
 version to 0.23.0
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
Content-Type: multipart/mixed; boundary="===============2755651029090148767=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2755651029090148767==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5173d24fc98aea900e0dec40cece6cd51e628260
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Release notes:
    https://github.com/OpenSC/OpenSC/blob/master/NEWS

Also carry two patches from upstream to fix build against newer
LibreSSL. Those patches can't be backported to pre-0.23.0 versions,
though.

Fixes:
    http://autobuild.buildroot.net/results/913/91318abb98146dd967115ed6233949daa60d8bba/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[yann.morin.1998@free.fr: squash LibreSSL fixes together with bump]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c02707a34226c15426b9cac35aefda7d7e9b0125)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Fix-maybe-uninitialized-errors.patch      |  82 ----------
 ...1-fixed-compatibility-with-LibreSSL-3.5.0.patch |  54 +++++++
 ...1-fixed-compatibility-with-LibreSSL-3.7.0.patch |  28 ++++
 .../0002-added-compatibility-with-LibreSSL.patch   | 173 ---------------------
 .../0003-Fix-build-with-libressl-3.5.0.patch       |  47 ------
 package/opensc/opensc.hash                         |   2 +-
 package/opensc/opensc.mk                           |   2 +-
 7 files changed, 84 insertions(+), 304 deletions(-)

diff --git a/package/opensc/0001-Fix-maybe-uninitialized-errors.patch b/package/opensc/0001-Fix-maybe-uninitialized-errors.patch
deleted file mode 100644
index 671d92c150..0000000000
--- a/package/opensc/0001-Fix-maybe-uninitialized-errors.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From bcb39d6f4d2dee6beb035cb2f3618174ec1cb2b0 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
-Date: Fri, 10 Dec 2021 13:54:26 +0200
-Subject: [PATCH] Fix maybe uninitialized errors
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: José Pekkarinen <jose.pekkarinen@unikie.com>
-Upstream: https://github.com/OpenSC/OpenSC/commit/05ec8c7fe785a2b9aeaac1164adb349df42b7f80
----
- src/libopensc/pkcs15-coolkey.c  | 12 ++++++------
- src/pkcs15init/pkcs15-asepcos.c |  2 +-
- src/tools/opensc-explorer.c     |  2 +-
- 3 files changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/src/libopensc/pkcs15-coolkey.c b/src/libopensc/pkcs15-coolkey.c
-index 586475dd..15684cef 100644
---- a/src/libopensc/pkcs15-coolkey.c
-+++ b/src/libopensc/pkcs15-coolkey.c
-@@ -147,9 +147,9 @@ coolkey_find_matching_cert(sc_card_t *card, sc_cardctl_coolkey_object_t *in_obj,
- static int
- coolkey_get_attribute_ulong(sc_card_t *card, sc_cardctl_coolkey_object_t *obj, CK_ATTRIBUTE_TYPE type, CK_ULONG *value)
- {
--	const u8 *val;
--	size_t val_len;
--	u8 data_type;
-+	const u8 *val = NULL;
-+	size_t val_len = 0;
-+	u8 data_type = 0;
- 	int r;
- 
- 	r  = coolkey_get_attribute(card, obj, type, &val, &val_len, &data_type);
-@@ -168,8 +168,8 @@ static int
- coolkey_get_attribute_boolean(sc_card_t *card, sc_cardctl_coolkey_object_t *obj, CK_ATTRIBUTE_TYPE attr_type)
- {
- 	int r;
--	const u8 *val;
--	size_t val_len;
-+	const u8 *val = NULL;
-+	size_t val_len = 0;
- 
- 	r = coolkey_get_attribute(card, obj, attr_type, &val, &val_len, NULL);
- 	if (r < 0) {
-@@ -186,7 +186,7 @@ static int
- coolkey_get_attribute_bytes(sc_card_t *card, sc_cardctl_coolkey_object_t *obj, CK_ATTRIBUTE_TYPE type, u8 *data, size_t *data_len, size_t max_data_len)
- {
- 	const u8 *val;
--	size_t val_len;
-+	size_t val_len = 0;
- 	int r;
- 
- 	r = coolkey_get_attribute(card, obj, type, &val, &val_len, NULL);
-diff --git a/src/pkcs15init/pkcs15-asepcos.c b/src/pkcs15init/pkcs15-asepcos.c
-index d7122012..bc0efb5c 100644
---- a/src/pkcs15init/pkcs15-asepcos.c
-+++ b/src/pkcs15init/pkcs15-asepcos.c
-@@ -221,7 +221,7 @@ static int asepcos_do_store_pin(sc_profile_t *profile, sc_card_t *card,
- {
- 	sc_file_t *nfile = NULL;
- 	u8  buf[64], sbuf[64], *p = buf, *q = sbuf;
--	int r, akn;
-+	int r, akn = 0;
- 
- 	if (auth_info->auth_type != SC_PKCS15_PIN_AUTH_TYPE_PIN)
- 		return SC_ERROR_OBJECT_NOT_VALID;
-diff --git a/src/tools/opensc-explorer.c b/src/tools/opensc-explorer.c
-index 9ec4daa1..04efdf8f 100644
---- a/src/tools/opensc-explorer.c
-+++ b/src/tools/opensc-explorer.c
-@@ -2472,7 +2472,7 @@ int main(int argc, char *argv[])
- 		char *line;
- 		int cargc;
- 		char *cargv[260];
--		int multiple;
-+		int multiple = 0;
- 		struct command *cmd;
- 		char prompt[3*SC_MAX_PATH_STRING_SIZE];
- 
--- 
-2.25.1
-
diff --git a/package/opensc/0001-fixed-compatibility-with-LibreSSL-3.5.0.patch b/package/opensc/0001-fixed-compatibility-with-LibreSSL-3.5.0.patch
new file mode 100644
index 0000000000..0daf75d5ba
--- /dev/null
+++ b/package/opensc/0001-fixed-compatibility-with-LibreSSL-3.5.0.patch
@@ -0,0 +1,54 @@
+From da01e5fab9be9865db1aac203e574e0edbfd6584 Mon Sep 17 00:00:00 2001
+From: Frank Morgner <frankmorgner@gmail.com>
+Date: Wed, 14 Dec 2022 09:31:29 +0100
+Subject: [PATCH] fixed compatibility with LibreSSL >= 3.5.0
+
+fixes https://github.com/OpenSC/OpenSC/issues/2664
+
+Upstream: https://github.com/OpenSC/OpenSC/commit/da01e5fab9be9865db1aac203e574e0edbfd6584
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/libopensc/card-iasecc.c    | 12 +-----------
+ src/libopensc/sc-ossl-compat.h |  1 +
+ 2 files changed, 2 insertions(+), 11 deletions(-)
+
+diff --git a/src/libopensc/card-iasecc.c b/src/libopensc/card-iasecc.c
+index 480c1cf87b..1347ed2393 100644
+--- a/src/libopensc/card-iasecc.c
++++ b/src/libopensc/card-iasecc.c
+@@ -38,21 +38,11 @@
+ #include <openssl/pkcs12.h>
+ #include <openssl/x509v3.h>
+ 
+-/*
+- * OpenSSL-3.0.0 does not allow access to the SHA data
+- * so this driver can not produces signatures
+- * OpenSSL 1.1.1 uses EVP_MD_CTX_md_data
+- * LibreSSL
+- */
+-
+-#if defined(LIBRESSL_VERSION_NUMBER)
+-# define  EVP_MD_CTX_md_data(x)  (x->md_data)
+-#endif
+-
+ #include "internal.h"
+ #include "asn1.h"
+ #include "cardctl.h"
+ #include "opensc.h"
++#include "sc-ossl-compat.h"
+ /* #include "sm.h" */
+ #include "pkcs15.h"
+ /* #include "hash-strings.h" */
+diff --git a/src/libopensc/sc-ossl-compat.h b/src/libopensc/sc-ossl-compat.h
+index da53ca8cee..8c0f96701c 100644
+--- a/src/libopensc/sc-ossl-compat.h
++++ b/src/libopensc/sc-ossl-compat.h
+@@ -42,6 +42,7 @@ extern "C" {
+ #define X509_get_extension_flags(x)	(x->ex_flags)
+ #define X509_get_key_usage(x)		(x->ex_kusage)
+ #define X509_get_extended_key_usage(x)	(x->ex_xkusage)
++#define EVP_MD_CTX_md_data(x)          (x->md_data)
+ #endif
+ 
+ #if defined(LIBRESSL_VERSION_NUMBER)
diff --git a/package/opensc/0001-fixed-compatibility-with-LibreSSL-3.7.0.patch b/package/opensc/0001-fixed-compatibility-with-LibreSSL-3.7.0.patch
new file mode 100644
index 0000000000..6bbbea6ce6
--- /dev/null
+++ b/package/opensc/0001-fixed-compatibility-with-LibreSSL-3.7.0.patch
@@ -0,0 +1,28 @@
+From 98ad0f93b0a7673cdce82e1b3faa7dc314c64dd6 Mon Sep 17 00:00:00 2001
+From: Frank Morgner <frankmorgner@gmail.com>
+Date: Fri, 16 Dec 2022 11:56:28 +0100
+Subject: [PATCH] fixed compatibility with LibreSSL 3.7.0
+
+Upstream: https://github.com/OpenSC/OpenSC/commit/98ad0f93b0a7673cdce82e1b3faa7dc314c64dd6
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/libopensc/sc-ossl-compat.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/libopensc/sc-ossl-compat.h b/src/libopensc/sc-ossl-compat.h
+index 8c0f96701c..4425da93f3 100644
+--- a/src/libopensc/sc-ossl-compat.h
++++ b/src/libopensc/sc-ossl-compat.h
+@@ -54,9 +54,11 @@ extern "C" {
+ #define EVP_sha3_256()                          (NULL)
+ #define EVP_sha3_384()                          (NULL)
+ #define EVP_sha3_512()                          (NULL)
++#if LIBRESSL_VERSION_NUMBER < 0x3070000fL
+ #define EVP_PKEY_new_raw_public_key(t, e, p, l) (NULL)
+ #define EVP_PKEY_get_raw_public_key(p, pu, l)   (0)
+ #endif
++#endif
+ 
+ /* OpenSSL 1.1.1 has FIPS_mode function */
+ #if OPENSSL_VERSION_NUMBER >= 0x30000000L
diff --git a/package/opensc/0002-added-compatibility-with-LibreSSL.patch b/package/opensc/0002-added-compatibility-with-LibreSSL.patch
deleted file mode 100644
index 86a17448f8..0000000000
--- a/package/opensc/0002-added-compatibility-with-LibreSSL.patch
+++ /dev/null
@@ -1,173 +0,0 @@
-From 302ad70471efa279b033d4d5511d979ec5d965fe Mon Sep 17 00:00:00 2001
-From: Frank Morgner <frankmorgner@gmail.com>
-Date: Thu, 20 Jan 2022 17:01:46 +0100
-Subject: [PATCH] added compatibility with LibreSSL
-
-[Retrieved (and backported) from:
-https://github.com/OpenSC/OpenSC/commit/302ad70471efa279b033d4d5511d979ec5d965fe]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/libopensc/sc-ossl-compat.h             |  7 +++++++
- src/tests/p11test/p11test_case_common.c    | 14 ++++++++++++++
- src/tests/p11test/p11test_case_ec_derive.c |  4 ++++
- src/tests/p11test/p11test_case_readonly.c  |  9 +++++++--
- 4 files changed, 32 insertions(+), 2 deletions(-)
-
-diff --git a/src/libopensc/sc-ossl-compat.h b/src/libopensc/sc-ossl-compat.h
-index f885f85bb9..ec694ad48d 100644
---- a/src/libopensc/sc-ossl-compat.h
-+++ b/src/libopensc/sc-ossl-compat.h
-@@ -105,6 +105,13 @@ extern "C" {
- /* workaround unused value warning for a macro that does nothing */
- #if defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER >= 0x20700000L
- #define OPENSSL_malloc_init()
-+#define FIPS_mode()                             (0)
-+#define EVP_sha3_224()                          (NULL)
-+#define EVP_sha3_256()                          (NULL)
-+#define EVP_sha3_384()                          (NULL)
-+#define EVP_sha3_512()                          (NULL)
-+#define EVP_PKEY_new_raw_public_key(t, e, p, l) (NULL)
-+#define EVP_PKEY_get_raw_public_key(p, pu, l)   (0)
- #endif
- 
- #if OPENSSL_VERSION_NUMBER >= 0x30000000L
-diff --git a/src/tests/p11test/p11test_case_common.c b/src/tests/p11test/p11test_case_common.c
-index e432f8f4ed..f091dbcc10 100644
---- a/src/tests/p11test/p11test_case_common.c
-+++ b/src/tests/p11test/p11test_case_common.c
-@@ -164,6 +164,7 @@ add_supported_mechs(test_cert_t *o)
- 			o->mechs[0].result_flags = 0;
- 			o->mechs[0].usage_flags = CKF_SIGN | CKF_VERIFY;
- 		}
-+#ifdef EVP_PKEY_ED25519
- 	} else if (o->type == EVP_PKEY_ED25519) {
- 		if (token.num_ed_mechs > 0 ) {
- 			o->num_mechs = token.num_ed_mechs;
-@@ -184,6 +185,8 @@ add_supported_mechs(test_cert_t *o)
- 			o->mechs[0].result_flags = 0;
- 			o->mechs[0].usage_flags = CKF_SIGN | CKF_VERIFY;
- 		}
-+#endif
-+#ifdef EVP_PKEY_X25519
- 	} else if (o->type == EVP_PKEY_X25519) {
- 		if (token.num_montgomery_mechs > 0 ) {
- 			o->num_mechs = token.num_montgomery_mechs;
-@@ -204,6 +207,7 @@ add_supported_mechs(test_cert_t *o)
- 			o->mechs[0].result_flags = 0;
- 			o->mechs[0].usage_flags = CKF_DERIVE;
- 		}
-+#endif
- 	}
- }
- 
-@@ -601,6 +605,7 @@ int callback_public_keys(test_certs_t *objects,
- 		a = template[6].pValue;
- 		if (d2i_ASN1_PRINTABLESTRING(&curve, &a, (long)template[6].ulValueLen) != NULL) {
- 			switch (o->key_type) {
-+#ifdef EVP_PKEY_ED25519
- 			case CKK_EC_EDWARDS:
- 				if (strcmp((char *)curve->data, "edwards25519")) {
- 					debug_print(" [WARN %s ] Unknown curve name. "
-@@ -608,6 +613,8 @@ int callback_public_keys(test_certs_t *objects,
- 				}
- 				evp_type = EVP_PKEY_ED25519;
- 				break;
-+#endif
-+#ifdef EVP_PKEY_X25519
- 			case CKK_EC_MONTGOMERY:
- 				if (strcmp((char *)curve->data, "curve25519")) {
- 					debug_print(" [WARN %s ] Unknown curve name. "
-@@ -615,16 +622,20 @@ int callback_public_keys(test_certs_t *objects,
- 				}
- 				evp_type = EVP_PKEY_X25519;
- 				break;
-+#endif
- 			default:
- 				debug_print(" [WARN %s ] Unknown key type %lu", o->id_str, o->key_type);
- 				return -1;
- 			}
- 			ASN1_PRINTABLESTRING_free(curve);
- 		} else if (d2i_ASN1_OBJECT(&obj, &a, (long)template[6].ulValueLen) != NULL) {
-+#if defined(EVP_PKEY_ED25519) || defined (EVP_PKEY_X25519)
- 			int nid = OBJ_obj2nid(obj);
-+#endif
- 			ASN1_OBJECT_free(obj);
- 
- 			switch (o->key_type) {
-+#ifdef EVP_PKEY_ED25519
- 			case CKK_EC_EDWARDS:
- 				if (nid != NID_ED25519) {
- 					debug_print(" [WARN %s ] Unknown OID. "
-@@ -632,6 +643,8 @@ int callback_public_keys(test_certs_t *objects,
- 				}
- 				evp_type = EVP_PKEY_ED25519;
- 				break;
-+#endif
-+#ifdef EVP_PKEY_X25519
- 			case CKK_EC_MONTGOMERY:
- 				if (nid != NID_X25519) {
- 					debug_print(" [WARN %s ] Unknown OID. "
-@@ -639,6 +652,7 @@ int callback_public_keys(test_certs_t *objects,
- 				}
- 				evp_type = EVP_PKEY_X25519;
- 				break;
-+#endif
- 			default:
- 				debug_print(" [WARN %s ] Unknown key type %lu", o->id_str, o->key_type);
- 				return -1;
-diff --git a/src/tests/p11test/p11test_case_ec_derive.c b/src/tests/p11test/p11test_case_ec_derive.c
-index 9f13b3e9d6..f7a5f92f9e 100644
---- a/src/tests/p11test/p11test_case_ec_derive.c
-+++ b/src/tests/p11test/p11test_case_ec_derive.c
-@@ -89,6 +89,7 @@ pkcs11_derive(test_cert_t *o, token_info_t * info,
- 
- int test_derive_x25519(test_cert_t *o, token_info_t *info, test_mech_t *mech)
- {
-+#ifdef EVP_PKEY_X25519
- 	unsigned char *secret = NULL, *pkcs11_secret = NULL;
- 	EVP_PKEY_CTX *pctx = NULL;
- 	EVP_PKEY *pkey = NULL; /* This is peer key */
-@@ -210,6 +211,9 @@ int test_derive_x25519(test_cert_t *o, token_info_t *info, test_mech_t *mech)
- 	free(secret);
- 	free(pkcs11_secret);
- 	return 1;
-+#else
-+	return 0;
-+#endif
- }
- 
- int test_derive(test_cert_t *o, token_info_t *info, test_mech_t *mech)
-diff --git a/src/tests/p11test/p11test_case_readonly.c b/src/tests/p11test/p11test_case_readonly.c
-index 624bd6a54d..2aefdc7a70 100644
---- a/src/tests/p11test/p11test_case_readonly.c
-+++ b/src/tests/p11test/p11test_case_readonly.c
-@@ -522,6 +522,7 @@ int verify_message_openssl(test_cert_t *o, token_info_t *info, CK_BYTE *message,
- 				rv, ERR_error_string(ERR_peek_last_error(), NULL));
- 			return -1;
- 		}
-+#ifdef EVP_PKEY_ED25519
- 	} else if (o->type == EVP_PKEY_ED25519) {
- 		/* need to be created even though we do not do any MD */
- 		EVP_MD_CTX *ctx = EVP_MD_CTX_create();
-@@ -547,7 +548,7 @@ int verify_message_openssl(test_cert_t *o, token_info_t *info, CK_BYTE *message,
- 			EVP_MD_CTX_free(ctx);
- 			return -1;
- 		}
--
-+#endif
- 	} else {
- 		fprintf(stderr, " [ KEY %s ] Unknown type. Not verifying\n", o->id_str);
- 	}
-@@ -641,7 +642,11 @@ int sign_verify_test(test_cert_t *o, token_info_t *info, test_mech_t *mech,
- 		return 0;
- 	}
- 
--	if (o->type != EVP_PK_EC && o->type != EVP_PK_RSA && o->type != EVP_PKEY_ED25519) {
-+	if (o->type != EVP_PK_EC && o->type != EVP_PK_RSA
-+#ifdef EVP_PKEY_ED25519
-+			&& o->type != EVP_PKEY_ED25519
-+#endif
-+			) {
- 		debug_print(" [SKIP %s ] Skip non-RSA and non-EC key", o->id_str);
- 		return 0;
- 	}
diff --git a/package/opensc/0003-Fix-build-with-libressl-3.5.0.patch b/package/opensc/0003-Fix-build-with-libressl-3.5.0.patch
deleted file mode 100644
index 1d262362d6..0000000000
--- a/package/opensc/0003-Fix-build-with-libressl-3.5.0.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From d13059d1ec2bbb8fe7068db0d66d521daa4b71ce Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 13 Aug 2022 14:27:22 +0200
-Subject: [PATCH] Fix build with libressl >= 3.5.0
-
-libressl added back FIPS_mode since version 3.5.0 and
-https://github.com/libressl-portable/openbsd/commit/a97eabc90d7647e374c1c6da686aeec63c49ff14
-
-libressl provides X509_get_extension_flags since version 3.5.0 and
-https://github.com/libressl-portable/openbsd/commit/3180723224c1b2c7856a110b8213e4966995d7e0
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/OpenSC/OpenSC/pull/2593 &
- https://github.com/OpenSC/OpenSC/pull/2595 (merged)]
----
- src/libopensc/sc-ossl-compat.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/libopensc/sc-ossl-compat.h b/src/libopensc/sc-ossl-compat.h
-index f0d55279..2c42794c 100644
---- a/src/libopensc/sc-ossl-compat.h
-+++ b/src/libopensc/sc-ossl-compat.h
-@@ -86,9 +86,11 @@ extern "C" {
- #if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
- #define RSA_PKCS1_OpenSSL		RSA_PKCS1_SSLeay
- 
-+#if defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L
- #define X509_get_extension_flags(x)	(x->ex_flags)
- #define X509_get_key_usage(x)		(x->ex_kusage)
- #define X509_get_extended_key_usage(x)	(x->ex_xkusage)
-+#endif
- #if !defined(LIBRESSL_VERSION_NUMBER) || LIBRESSL_VERSION_NUMBER < 0x2050300fL
- #define X509_up_ref(cert)		CRYPTO_add(&cert->references, 1, CRYPTO_LOCK_X509)
- #endif
-@@ -104,7 +106,9 @@ extern "C" {
- /* workaround unused value warning for a macro that does nothing */
- #if defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER >= 0x20700000L
- #define OPENSSL_malloc_init()
-+#if LIBRESSL_VERSION_NUMBER < 0x30500000L
- #define FIPS_mode()                             (0)
-+#endif
- #define EVP_sha3_224()                          (NULL)
- #define EVP_sha3_256()                          (NULL)
- #define EVP_sha3_384()                          (NULL)
--- 
-2.35.1
-
diff --git a/package/opensc/opensc.hash b/package/opensc/opensc.hash
index 517cfe503a..e8e675667e 100644
--- a/package/opensc/opensc.hash
+++ b/package/opensc/opensc.hash
@@ -1,5 +1,5 @@
 # Computed locally from https://https://github.com/OpenSC/OpenSC/releases/
-sha256  8d4e5347195ebea332be585df61dcc470331c26969e4b0447c851fb0844c7186  opensc-0.22.0.tar.gz
+sha256  a4844a6ea03a522ecf35e49659716dacb6be03f7c010a1a583aaf3eb915ed2e0  opensc-0.23.0.tar.gz
 
 # Computed locally
 sha256  376b54d4c5f4aa99421823fa4da93e3ab73096fce2400e89858632aa7da24a14  COPYING
diff --git a/package/opensc/opensc.mk b/package/opensc/opensc.mk
index 70472b8fef..e4e69a5da8 100644
--- a/package/opensc/opensc.mk
+++ b/package/opensc/opensc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSC_VERSION = 0.22.0
+OPENSC_VERSION = 0.23.0
 OPENSC_SITE = https://github.com/OpenSC/OpenSC/releases/download/$(OPENSC_VERSION)
 OPENSC_LICENSE = LGPL-2.1+
 OPENSC_LICENSE_FILES = COPYING

--===============2755651029090148767==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2755651029090148767==--
