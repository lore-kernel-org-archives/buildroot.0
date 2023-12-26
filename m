Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B434CC46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 20:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72FEF812F9;
	Tue, 26 Dec 2023 20:28:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72FEF812F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1f5l_0OYxzml; Tue, 26 Dec 2023 20:28:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13467812ED;
	Tue, 26 Dec 2023 20:28:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13467812ED
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0D16E1BF591
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 20:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E76C760692
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 20:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E76C760692
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XtW6ocSaUTwK for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 20:28:27 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0028E60675
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 20:28:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0028E60675
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id DF618B00565;
 Tue, 26 Dec 2023 21:28:22 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 26 Dec 2023 21:28:22 +0100
Date: Tue, 26 Dec 2023 21:28:22 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZYs3Zt0CAoNipTXU@landeda>
References: <20231226161129.686616-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231226161129.686616-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703622505;
 bh=9Ho6S0pSr41ZObL4kliKYLEe3vs6lRpWZgbBH9wfSHs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TSqVsXjUgwQOCdB+8od60yvJbd5Hdphbm5HIMUUhXbKel7us2JEZHVVnS/X2tRpiR
 gpKu5opveRS8X9rltw3UWF1jgfb7MtXSrfq/83zemKvTlVaTV39B+oRDyOViYnspKW
 7NPzRMV9SwVIyxG+fPcGHaXAduVzQfT+01TvPP4XPz/EKjRmtf12n8fgC9bNPOzCuo
 YhL1voAj10r/kDuR1gf+FLVd1x7II2geXE72j1ZBtP9CCGd/g7MLwLfD8xdMrtDwki
 KV3ReXcZUdzr0c7TqZAeAEAN6PZdV8aS8IwhNdvm8ruV2KvWuHXfGrRwhb3JLGInsB
 gziIFa6mC5n8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TSqVsXjU
Subject: Re: [Buildroot] [PATCH 1/1] package/opensc: security bump to
 version 0.24.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-12-26 17:11 +0100, Fabrice Fontaine spake thusly:
> - Drop patches (already in version) and so drop autoreconf
> - Fix the following security issues:
>   - CVE-2023-40660: Fix Potential PIN bypass
>   - CVE-2023-40661: Important dynamic analyzers reports
>   - CVE-2023-4535: Out-of-bounds read in MyEID driver handling
>     encryption using symmetric keys
> 
> https://github.com/OpenSC/OpenSC/releases/tag/0.24.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...ed-compatibility-with-LibreSSL-3.5.0.patch | 54 ---------------
>  ...ed-compatibility-with-LibreSSL-3.7.0.patch | 28 --------
>  ...onfigure-add-option-to-disable-tests.patch | 67 -------------------
>  ...alculation-to-fix-buffer-overrun-bug.patch | 51 --------------
>  ...L-does-provide-EVP_sha3_-after-3-7-3.patch | 32 ---------
>  ...ixed-detection-of-SHA3-compatibility.patch | 27 --------
>  package/opensc/opensc.hash                    |  2 +-
>  package/opensc/opensc.mk                      |  7 +-
>  8 files changed, 2 insertions(+), 266 deletions(-)
>  delete mode 100644 package/opensc/0001-fixed-compatibility-with-LibreSSL-3.5.0.patch
>  delete mode 100644 package/opensc/0002-fixed-compatibility-with-LibreSSL-3.7.0.patch
>  delete mode 100644 package/opensc/0003-configure-add-option-to-disable-tests.patch
>  delete mode 100644 package/opensc/0004-pkcs15init-correct-left-length-calculation-to-fix-buffer-overrun-bug.patch
>  delete mode 100644 package/opensc/0005-LibreSSL-does-provide-EVP_sha3_-after-3-7-3.patch
>  delete mode 100644 package/opensc/0006-fixed-detection-of-SHA3-compatibility.patch
> 
> diff --git a/package/opensc/0001-fixed-compatibility-with-LibreSSL-3.5.0.patch b/package/opensc/0001-fixed-compatibility-with-LibreSSL-3.5.0.patch
> deleted file mode 100644
> index 0daf75d5ba..0000000000
> --- a/package/opensc/0001-fixed-compatibility-with-LibreSSL-3.5.0.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -From da01e5fab9be9865db1aac203e574e0edbfd6584 Mon Sep 17 00:00:00 2001
> -From: Frank Morgner <frankmorgner@gmail.com>
> -Date: Wed, 14 Dec 2022 09:31:29 +0100
> -Subject: [PATCH] fixed compatibility with LibreSSL >= 3.5.0
> -
> -fixes https://github.com/OpenSC/OpenSC/issues/2664
> -
> -Upstream: https://github.com/OpenSC/OpenSC/commit/da01e5fab9be9865db1aac203e574e0edbfd6584
> -
> -Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ----
> - src/libopensc/card-iasecc.c    | 12 +-----------
> - src/libopensc/sc-ossl-compat.h |  1 +
> - 2 files changed, 2 insertions(+), 11 deletions(-)
> -
> -diff --git a/src/libopensc/card-iasecc.c b/src/libopensc/card-iasecc.c
> -index 480c1cf87b..1347ed2393 100644
> ---- a/src/libopensc/card-iasecc.c
> -+++ b/src/libopensc/card-iasecc.c
> -@@ -38,21 +38,11 @@
> - #include <openssl/pkcs12.h>
> - #include <openssl/x509v3.h>
> - 
> --/*
> -- * OpenSSL-3.0.0 does not allow access to the SHA data
> -- * so this driver can not produces signatures
> -- * OpenSSL 1.1.1 uses EVP_MD_CTX_md_data
> -- * LibreSSL
> -- */
> --
> --#if defined(LIBRESSL_VERSION_NUMBER)
> --# define  EVP_MD_CTX_md_data(x)  (x->md_data)
> --#endif
> --
> - #include "internal.h"
> - #include "asn1.h"
> - #include "cardctl.h"
> - #include "opensc.h"
> -+#include "sc-ossl-compat.h"
> - /* #include "sm.h" */
> - #include "pkcs15.h"
> - /* #include "hash-strings.h" */
> -diff --git a/src/libopensc/sc-ossl-compat.h b/src/libopensc/sc-ossl-compat.h
> -index da53ca8cee..8c0f96701c 100644
> ---- a/src/libopensc/sc-ossl-compat.h
> -+++ b/src/libopensc/sc-ossl-compat.h
> -@@ -42,6 +42,7 @@ extern "C" {
> - #define X509_get_extension_flags(x)	(x->ex_flags)
> - #define X509_get_key_usage(x)		(x->ex_kusage)
> - #define X509_get_extended_key_usage(x)	(x->ex_xkusage)
> -+#define EVP_MD_CTX_md_data(x)          (x->md_data)
> - #endif
> - 
> - #if defined(LIBRESSL_VERSION_NUMBER)
> diff --git a/package/opensc/0002-fixed-compatibility-with-LibreSSL-3.7.0.patch b/package/opensc/0002-fixed-compatibility-with-LibreSSL-3.7.0.patch
> deleted file mode 100644
> index 6bbbea6ce6..0000000000
> --- a/package/opensc/0002-fixed-compatibility-with-LibreSSL-3.7.0.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 98ad0f93b0a7673cdce82e1b3faa7dc314c64dd6 Mon Sep 17 00:00:00 2001
> -From: Frank Morgner <frankmorgner@gmail.com>
> -Date: Fri, 16 Dec 2022 11:56:28 +0100
> -Subject: [PATCH] fixed compatibility with LibreSSL 3.7.0
> -
> -Upstream: https://github.com/OpenSC/OpenSC/commit/98ad0f93b0a7673cdce82e1b3faa7dc314c64dd6
> -
> -Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ----
> - src/libopensc/sc-ossl-compat.h | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/src/libopensc/sc-ossl-compat.h b/src/libopensc/sc-ossl-compat.h
> -index 8c0f96701c..4425da93f3 100644
> ---- a/src/libopensc/sc-ossl-compat.h
> -+++ b/src/libopensc/sc-ossl-compat.h
> -@@ -54,9 +54,11 @@ extern "C" {
> - #define EVP_sha3_256()                          (NULL)
> - #define EVP_sha3_384()                          (NULL)
> - #define EVP_sha3_512()                          (NULL)
> -+#if LIBRESSL_VERSION_NUMBER < 0x3070000fL
> - #define EVP_PKEY_new_raw_public_key(t, e, p, l) (NULL)
> - #define EVP_PKEY_get_raw_public_key(p, pu, l)   (0)
> - #endif
> -+#endif
> - 
> - /* OpenSSL 1.1.1 has FIPS_mode function */
> - #if OPENSSL_VERSION_NUMBER >= 0x30000000L
> diff --git a/package/opensc/0003-configure-add-option-to-disable-tests.patch b/package/opensc/0003-configure-add-option-to-disable-tests.patch
> deleted file mode 100644
> index 29342026c1..0000000000
> --- a/package/opensc/0003-configure-add-option-to-disable-tests.patch
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -From 3c3ed2ecbf31d41b6e5406da55971b9d9eaa3388 Mon Sep 17 00:00:00 2001
> -From: Bernd Kuhls <bernd@kuhls.net>
> -Date: Mon, 24 Jul 2023 22:28:11 +0200
> -Subject: [PATCH] configure: add option to disable tests
> -
> -Upstream: https://github.com/OpenSC/OpenSC/pull/2822
> -
> -Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ----
> - configure.ac    | 9 +++++++++
> - src/Makefile.am | 6 +++++-
> - 2 files changed, 14 insertions(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 0a90445b..9b7543da 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -272,6 +272,13 @@ AC_ARG_ENABLE(
> - 	[enable_doc="no"]
> - )
> - 
> -+AC_ARG_ENABLE(
> -+	[tests],
> -+	[AS_HELP_STRING([--enable-tests],[enable tests @<:@enabled@:>@])],
> -+	,
> -+	[enable_tests="yes"]
> -+)
> -+
> - AC_ARG_ENABLE(
> - 	[dnie-ui],
> - 	[AS_HELP_STRING([--enable-dnie-ui],[enable use of external user interface program to request DNIe pin@<:@disabled@:>@])],
> -@@ -1119,6 +1126,7 @@ AM_CONDITIONAL([ENABLE_NOTIFY], [test "${enable_notify}" = "yes"])
> - AM_CONDITIONAL([ENABLE_CRYPTOTOKENKIT], [test "${enable_cryptotokenkit}" = "yes"])
> - AM_CONDITIONAL([ENABLE_OPENCT], [test "${enable_openct}" = "yes"])
> - AM_CONDITIONAL([ENABLE_DOC], [test "${enable_doc}" = "yes"])
> -+AM_CONDITIONAL([ENABLE_TESTS], [test "${enable_tests}" = "yes"])
> - AM_CONDITIONAL([WIN32], [test "${WIN32}" = "yes"])
> - AM_CONDITIONAL([CYGWIN], [test "${CYGWIN}" = "yes"])
> - AM_CONDITIONAL([ENABLE_MINIDRIVER], [test "${enable_minidriver}" = "yes"])
> -@@ -1213,6 +1221,7 @@ XSL stylesheets:         ${xslstylesheetsdir}
> - 
> - man support:             ${enable_man}
> - doc support:             ${enable_doc}
> -+tests:                   ${enable_tests}
> - thread locking support:  ${enable_thread_locking}
> - zlib support:            ${enable_zlib}
> - readline support:        ${enable_readline}
> -diff --git a/src/Makefile.am b/src/Makefile.am
> -index 3ce465bf..bf71b61f 100644
> ---- a/src/Makefile.am
> -+++ b/src/Makefile.am
> -@@ -3,7 +3,11 @@ EXTRA_DIST = Makefile.mak
> - 
> - # Order IS important
> - SUBDIRS = common scconf ui pkcs15init sm \
> --		  libopensc pkcs11 tools minidriver tests
> -+		  libopensc pkcs11 tools minidriver
> -+
> -+if ENABLE_TESTS
> -+SUBDIRS += tests
> -+endif
> - 
> - if ENABLE_SM
> - SUBDIRS += smm
> --- 
> -2.39.2
> -
> diff --git a/package/opensc/0004-pkcs15init-correct-left-length-calculation-to-fix-buffer-overrun-bug.patch b/package/opensc/0004-pkcs15init-correct-left-length-calculation-to-fix-buffer-overrun-bug.patch
> deleted file mode 100644
> index 079f960b59..0000000000
> --- a/package/opensc/0004-pkcs15init-correct-left-length-calculation-to-fix-buffer-overrun-bug.patch
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -From 81944d1529202bd28359bede57c0a15deb65ba8a Mon Sep 17 00:00:00 2001
> -From: fullwaywang <fullwaywang@tencent.com>
> -Date: Mon, 29 May 2023 10:38:48 +0800
> -Subject: [PATCH] pkcs15init: correct left length calculation to fix buffer
> - overrun bug. Fixes #2785
> -
> -Upstream: https://github.com/OpenSC/OpenSC/commit/81944d1529202bd28359bede57c0a15deb65ba8a
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - src/pkcs15init/pkcs15-cardos.c | 10 +++++-----
> - 1 file changed, 5 insertions(+), 5 deletions(-)
> -
> -diff --git a/src/pkcs15init/pkcs15-cardos.c b/src/pkcs15init/pkcs15-cardos.c
> -index 9715cf390f..f41f73c349 100644
> ---- a/src/pkcs15init/pkcs15-cardos.c
> -+++ b/src/pkcs15init/pkcs15-cardos.c
> -@@ -872,7 +872,7 @@ static int cardos_have_verifyrc_package(sc_card_t *card)
> - 	sc_apdu_t apdu;
> -         u8        rbuf[SC_MAX_APDU_BUFFER_SIZE];
> -         int       r;
> --	const u8  *p = rbuf, *q;
> -+	const u8  *p = rbuf, *q, *pp;
> - 	size_t    len, tlen = 0, ilen = 0;
> - 
> - 	sc_format_apdu(card, &apdu, SC_APDU_CASE_2_SHORT, 0xca, 0x01, 0x88);
> -@@ -888,13 +888,13 @@ static int cardos_have_verifyrc_package(sc_card_t *card)
> - 		return 0;
> - 
> - 	while (len != 0) {
> --		p = sc_asn1_find_tag(card->ctx, p, len, 0xe1, &tlen);
> --		if (p == NULL)
> -+		pp = sc_asn1_find_tag(card->ctx, p, len, 0xe1, &tlen);
> -+		if (pp == NULL)
> - 			return 0;
> - 		if (card->type == SC_CARD_TYPE_CARDOS_M4_3)	{
> - 			/* the verifyRC package on CardOS 4.3B use Manufacturer ID 0x01	*/
> - 			/* and Package Number 0x07					*/
> --			q = sc_asn1_find_tag(card->ctx, p, tlen, 0x01, &ilen);
> -+			q = sc_asn1_find_tag(card->ctx, pp, tlen, 0x01, &ilen);
> - 			if (q == NULL || ilen != 4)
> - 				return 0;
> - 			if (q[0] == 0x07)
> -@@ -902,7 +902,7 @@ static int cardos_have_verifyrc_package(sc_card_t *card)
> - 		} else if (card->type == SC_CARD_TYPE_CARDOS_M4_4)	{
> - 			/* the verifyRC package on CardOS 4.4 use Manufacturer ID 0x03	*/
> - 			/* and Package Number 0x02					*/
> --			q = sc_asn1_find_tag(card->ctx, p, tlen, 0x03, &ilen);
> -+			q = sc_asn1_find_tag(card->ctx, pp, tlen, 0x03, &ilen);
> - 			if (q == NULL || ilen != 4)
> - 				return 0;
> - 			if (q[0] == 0x02)
> diff --git a/package/opensc/0005-LibreSSL-does-provide-EVP_sha3_-after-3-7-3.patch b/package/opensc/0005-LibreSSL-does-provide-EVP_sha3_-after-3-7-3.patch
> deleted file mode 100644
> index 80c19a3f5f..0000000000
> --- a/package/opensc/0005-LibreSSL-does-provide-EVP_sha3_-after-3-7-3.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From e015242590ad9131e124232cc5a2fd02d525ef2c Mon Sep 17 00:00:00 2001
> -From: Klemens Nanni <kn@openbsd.org>
> -Date: Thu, 29 Jun 2023 02:41:43 +0300
> -Subject: [PATCH] LibreSSL does provide EVP_sha3_*() after 3.7.3
> -
> -Support was added in 16.04.2023.
> -
> -Compile- and run-tested on OpenBSD/amd64 7.3-current.
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Upstream: https://github.com/OpenSC/OpenSC/commit/e015242590ad9131e124232cc5a2fd02d525ef2c
> ----
> - src/libopensc/sc-ossl-compat.h | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/src/libopensc/sc-ossl-compat.h b/src/libopensc/sc-ossl-compat.h
> -index df0cebbce2..8012cd4c0f 100644
> ---- a/src/libopensc/sc-ossl-compat.h
> -+++ b/src/libopensc/sc-ossl-compat.h
> -@@ -50,10 +50,12 @@ extern "C" {
> - #if LIBRESSL_VERSION_NUMBER < 0x30500000L
> - #define FIPS_mode()                             (0)
> - #endif
> -+#ifndef EVP_sha3_224
> - #define EVP_sha3_224()                          (NULL)
> - #define EVP_sha3_256()                          (NULL)
> - #define EVP_sha3_384()                          (NULL)
> - #define EVP_sha3_512()                          (NULL)
> -+#endif
> - #if LIBRESSL_VERSION_NUMBER < 0x3070000fL
> - #define EVP_PKEY_new_raw_public_key(t, e, p, l) (NULL)
> - #define EVP_PKEY_get_raw_public_key(p, pu, l)   (0)
> diff --git a/package/opensc/0006-fixed-detection-of-SHA3-compatibility.patch b/package/opensc/0006-fixed-detection-of-SHA3-compatibility.patch
> deleted file mode 100644
> index 3d8aa7e4ef..0000000000
> --- a/package/opensc/0006-fixed-detection-of-SHA3-compatibility.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From 33351d91aa22fa8077847ba3f19abb5a00b04600 Mon Sep 17 00:00:00 2001
> -From: Frank Morgner <frankmorgner@gmail.com>
> -Date: Tue, 15 Aug 2023 17:58:21 +0200
> -Subject: [PATCH] fixed detection of SHA3 compatibility
> -
> -fixes https://github.com/OpenSC/OpenSC/issues/2836
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Upstream: https://github.com/OpenSC/OpenSC/commit/33351d91aa22fa8077847ba3f19abb5a00b04600
> ----
> - src/libopensc/sc-ossl-compat.h | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/src/libopensc/sc-ossl-compat.h b/src/libopensc/sc-ossl-compat.h
> -index 8012cd4c0f..96ec4bd736 100644
> ---- a/src/libopensc/sc-ossl-compat.h
> -+++ b/src/libopensc/sc-ossl-compat.h
> -@@ -50,7 +50,8 @@ extern "C" {
> - #if LIBRESSL_VERSION_NUMBER < 0x30500000L
> - #define FIPS_mode()                             (0)
> - #endif
> --#ifndef EVP_sha3_224
> -+/* OpenSSL 1.1.1 has EVP_sha3_* */
> -+#if defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30800000L
> - #define EVP_sha3_224()                          (NULL)
> - #define EVP_sha3_256()                          (NULL)
> - #define EVP_sha3_384()                          (NULL)
> diff --git a/package/opensc/opensc.hash b/package/opensc/opensc.hash
> index e8e675667e..232222062c 100644
> --- a/package/opensc/opensc.hash
> +++ b/package/opensc/opensc.hash
> @@ -1,5 +1,5 @@
>  # Computed locally from https://https://github.com/OpenSC/OpenSC/releases/
> -sha256  a4844a6ea03a522ecf35e49659716dacb6be03f7c010a1a583aaf3eb915ed2e0  opensc-0.23.0.tar.gz
> +sha256  24d03c69287291da32a30c4c38a304ad827f56cb85d83619e1f5403ab6480ef8  opensc-0.24.0.tar.gz
>  
>  # Computed locally
>  sha256  376b54d4c5f4aa99421823fa4da93e3ab73096fce2400e89858632aa7da24a14  COPYING
> diff --git a/package/opensc/opensc.mk b/package/opensc/opensc.mk
> index 823bc50102..49bdcae37a 100644
> --- a/package/opensc/opensc.mk
> +++ b/package/opensc/opensc.mk
> @@ -4,18 +4,13 @@
>  #
>  ################################################################################
>  
> -OPENSC_VERSION = 0.23.0
> +OPENSC_VERSION = 0.24.0
>  OPENSC_SITE = https://github.com/OpenSC/OpenSC/releases/download/$(OPENSC_VERSION)
>  OPENSC_LICENSE = LGPL-2.1+
>  OPENSC_LICENSE_FILES = COPYING
>  OPENSC_CPE_ID_VENDOR = opensc_project
> -# 0003-configure-add-option-to-disable-tests.patch
> -OPENSC_AUTORECONF = YES
>  OPENSC_DEPENDENCIES = openssl pcsc-lite
>  OPENSC_INSTALL_STAGING = YES
>  OPENSC_CONF_OPTS = --disable-cmocka --disable-strict --disable-tests
>  
> -# 0004-pkcs15init-correct-left-length-calculation-to-fix-buffer-overrun-bug.patch
> -OPENSC_IGNORE_CVES += CVE-2023-2977
> -
>  $(eval $(autotools-package))
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
