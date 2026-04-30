Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4370DFF885A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 177B5844AE;
	Mon,  4 May 2026 14:46:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xxCNUAmF9PUQ; Mon,  4 May 2026 14:46:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30530844D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906011;
	bh=S57dxGScGJQuGihS/3RXE2m/17Q5PUrqLfPrdfHnRD4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iz7qMyVJ8E4S+/PnSRO1He0lvWBMyz6ZyFZNPpJvVpHCiYgFDxWzWYrQ7kPWqounD
	 F11oTLpWWRuW5efNIQKIRwkYfQWZ41a2c3e1ZudJcKXrdpPPRslZ3naoKZuUQYaflL
	 KG11dkQup0fqRodufmgnE4M+rpudQlP5YbXPYYkE8N+PPJz0yqc8Cqoe0bYehBH1Qc
	 FZMOlkkZE8bSZlvLVUAsF0bpTP1g7k+nEFBIf/yI/yceuTU/2s067ZeA9jes4bOKht
	 ifBbUtL/0eewuhDPT2JrPEtQ0UovRDvF5SFOJuuvZmrUX9gzNzlVmEZKrtMVfJIuB5
	 4d3BZjUnJTyvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30530844D6;
	Mon,  4 May 2026 14:46:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 92B9225D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63F78614F3
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q3ASujTjHkbm for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:46:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E27366136F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E27366136F
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B187484257; Mon,  4 May 2026 14:46:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 13:44:25 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: eeb65cf0f6753da6bc53197b971aec12ba647026
X-Git-Newrev: 8593b6d091104cd60b0b8140ec716ed20feb4cd7
X-Patchwork-Hint: ignore
Message-Id: <20260504144642.B187484257@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/p11-kit: bump to
 version 0.25.5
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6737754732370043267=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6737754732370043267==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8593b6d091104cd60b0b8140ec716ed20feb4cd7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit c05bf8c6c7801f2e5e50ee5b94512cec2fe31901)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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

--===============6737754732370043267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6737754732370043267==--
