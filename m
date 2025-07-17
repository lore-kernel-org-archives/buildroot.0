Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99C4C83F1A
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEA1841162;
	Thu, 17 Jul 2025 20:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xZEa8NZX6CI6; Thu, 17 Jul 2025 20:43:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5EFF417ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5EFF417ED;
	Thu, 17 Jul 2025 20:43:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 113741A6
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5E8C6085B
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:43:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ro7Itr_lsC82 for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:43:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D449260610
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D449260610
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:43:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CCEF486747; Thu, 17 Jul 2025 20:43:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 17 Jul 2025 22:29:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e4451602ebee8ef6f6b354e8f9b6dcc80206f079
X-Git-Newrev: c05bf8c6c7801f2e5e50ee5b94512cec2fe31901
X-Patchwork-Hint: ignore
Message-Id: <20250717204324.CCEF486747@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/p11-kit: bump to version 0.25.5
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6468412387789069897=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6468412387789069897==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c05bf8c6c7801f2e5e50ee5b94512cec2fe31901
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 ...id-integer-truncation-on-32-bit-platforms.patch | 109 ---------------------
 package/p11-kit/p11-kit.hash                       |   2 +-
 package/p11-kit/p11-kit.mk                         |   2 +-
 3 files changed, 2 insertions(+), 111 deletions(-)

diff --git a/package/p11-kit/0001-import-object-Avoid-integer-truncation-on-32-bit-platforms.patch b/package/p11-kit/0001-import-object-Avoid-integer-truncation-on-32-bit-platforms.patch
deleted file mode 100644
index 03f54b4408..0000000000
--- a/package/p11-kit/0001-import-object-Avoid-integer-truncation-on-32-bit-platforms.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From d49c92c8420db6ee4c88515bdb014f68f4d471d9 Mon Sep 17 00:00:00 2001
-From: Daiki Ueno <ueno@gnu.org>
-Date: Sat, 2 Dec 2023 09:24:01 +0900
-Subject: [PATCH] import-object: Avoid integer truncation on 32-bit platforms
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The build fails when compiling for 32-bit platforms with
--Werror=incompatible-pointer-types:
-
-  CFLAGS="-m32 -march=i686 -Werror=incompatible-pointer-types -Werror=implicit -Werror=int-conversion" setarch i686 -- meson setup _build
-  setarch i686 -- meson compile -C _build -v
-  ...
-
-  ../p11-kit/import-object.c: In function ‘add_attrs_pubkey_rsa’:
-  ../p11-kit/import-object.c:223:62: error: passing argument 3 of ‘p11_asn1_read’ from incompatible pointer type [-Werror=incompatible-pointer-types]
-    223 |         attr_modulus.pValue = p11_asn1_read (asn, "modulus", &attr_modulus.ulValueLen);
-        |                                                              ^~~~~~~~~~~~~~~~~~~~~~~~
-        |                                                              |
-        |                                                              long unsigned int *
-
-Reported by Sam James in:
-https://github.com/p11-glue/p11-kit/issues/608
-
-Signed-off-by: Daiki Ueno <ueno@gnu.org>
-
-Upstream: https://github.com/p11-glue/p11-kit/commit/d49c92c8420db6ee4c88515bdb014f68f4d471d9
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- p11-kit/import-object.c | 30 +++++++++++++++++++++++++++---
- 1 file changed, 27 insertions(+), 3 deletions(-)
-
-diff --git a/p11-kit/import-object.c b/p11-kit/import-object.c
-index feee0765..fb47b964 100644
---- a/p11-kit/import-object.c
-+++ b/p11-kit/import-object.c
-@@ -55,6 +55,7 @@
- #endif
- 
- #include <assert.h>
-+#include <limits.h>
- #include <stdbool.h>
- #include <stdlib.h>
- #include <string.h>
-@@ -201,6 +202,7 @@ add_attrs_pubkey_rsa (CK_ATTRIBUTE *attrs,
- 	CK_ATTRIBUTE attr_encrypt = { CKA_ENCRYPT, &tval, sizeof (tval) };
- 	CK_ATTRIBUTE attr_modulus = { CKA_MODULUS, };
- 	CK_ATTRIBUTE attr_exponent = { CKA_PUBLIC_EXPONENT, };
-+	size_t len = 0;
- 
- 	pubkey = p11_asn1_read (info, "subjectPublicKey", &pubkey_len);
- 	if (pubkey == NULL) {
-@@ -220,17 +222,31 @@ add_attrs_pubkey_rsa (CK_ATTRIBUTE *attrs,
- 		goto cleanup;
- 	}
- 
--	attr_modulus.pValue = p11_asn1_read (asn, "modulus", &attr_modulus.ulValueLen);
-+	attr_modulus.pValue = p11_asn1_read (asn, "modulus", &len);
- 	if (attr_modulus.pValue == NULL) {
- 		p11_message (_("failed to obtain modulus"));
- 		goto cleanup;
- 	}
-+#if ULONG_MAX < SIZE_MAX
-+	if (len > ULONG_MAX) {
-+		p11_message (_("failed to obtain modulus"));
-+		goto cleanup;
-+	}
-+#endif
-+	attr_modulus.ulValueLen = len;
- 
--	attr_exponent.pValue = p11_asn1_read (asn, "publicExponent", &attr_exponent.ulValueLen);
-+	attr_exponent.pValue = p11_asn1_read (asn, "publicExponent", &len);
- 	if (attr_exponent.pValue == NULL) {
- 		p11_message (_("failed to obtain exponent"));
- 		goto cleanup;
- 	}
-+#if ULONG_MAX < SIZE_MAX
-+	if (len > ULONG_MAX) {
-+		p11_message (_("failed to obtain exponent"));
-+		goto cleanup;
-+	}
-+#endif
-+	attr_exponent.ulValueLen = len;
- 
- 	result = p11_attrs_build (attrs, &attr_key_type, &attr_encrypt, &attr_modulus, &attr_exponent, NULL);
- 	if (result == NULL) {
-@@ -260,12 +276,20 @@ add_attrs_pubkey_ec (CK_ATTRIBUTE *attrs,
- 	CK_ATTRIBUTE attr_key_type = { CKA_KEY_TYPE, &key_type, sizeof (key_type) };
- 	CK_ATTRIBUTE attr_ec_params = { CKA_EC_PARAMS, };
- 	CK_ATTRIBUTE attr_ec_point = { CKA_EC_POINT, };
-+	size_t len = 0;
- 
--	attr_ec_params.pValue = p11_asn1_read (info, "algorithm.parameters", &attr_ec_params.ulValueLen);
-+	attr_ec_params.pValue = p11_asn1_read (info, "algorithm.parameters", &len);
- 	if (attr_ec_params.pValue == NULL) {
- 		p11_message (_("failed to obtain EC parameters"));
- 		goto cleanup;
- 	}
-+#if ULONG_MAX < SIZE_MAX
-+	if (len > ULONG_MAX) {
-+		p11_message (_("failed to obtain EC parameters"));
-+		goto cleanup;
-+	}
-+#endif
-+	attr_ec_params.ulValueLen = len;
- 
- 	/* subjectPublicKey is read as BIT STRING value which contains
- 	 * EC point data. We need to DER encode this data as OCTET STRING.
diff --git a/package/p11-kit/p11-kit.hash b/package/p11-kit/p11-kit.hash
index 81d209b2c2..43a566a82c 100644
--- a/package/p11-kit/p11-kit.hash
+++ b/package/p11-kit/p11-kit.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  d8ddce1bb7e898986f9d250ccae7c09ce14d82f1009046d202a0eb1b428b2adc  p11-kit-0.25.3.tar.xz
+sha256  04d0a86450cdb1be018f26af6699857171a188ac6d5b8c90786a60854e1198e5  p11-kit-0.25.5.tar.xz
 # Locally computed
 sha256  2e1ba993904df807a10c3eda1e5c272338edc35674b679773a8b3ad460731054  COPYING
diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index 53e953e070..154a34e634 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-P11_KIT_VERSION = 0.25.3
+P11_KIT_VERSION = 0.25.5
 P11_KIT_SOURCE = p11-kit-$(P11_KIT_VERSION).tar.xz
 P11_KIT_SITE = https://github.com/p11-glue/p11-kit/releases/download/$(P11_KIT_VERSION)
 P11_KIT_INSTALL_STAGING = YES

--===============6468412387789069897==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6468412387789069897==--
