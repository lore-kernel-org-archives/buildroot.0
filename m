Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D697CC433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 17:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61A7E60EE9;
	Tue,  1 Feb 2022 17:22:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aaVbf4av7b8n; Tue,  1 Feb 2022 17:22:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2FDC60F35;
	Tue,  1 Feb 2022 17:22:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A44461BF396
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 17:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0B4460F35
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 17:22:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DfY2TEl64G9y for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 17:22:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A0B060EE9
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 17:22:49 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id b13so36022264edn.0
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 09:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jJzEMzWugV5gseE/yyDFT9Q8/pGqvZESFcuppX2jwK4=;
 b=Ciy2DI59pffbAbq6m0pqHCge1eqyZEhRaZ/EhHm8ZCHZ/FfYYnKmPsIrt3KBuFNrRT
 a39tPJsYcWWy3OC4aIQ6Hus/gtUrQWFEMa0b4F4/nNytXwrh6m1l6ur66SECyNNIDc1m
 g60gDZD2ndnzd5qtWWua6JLDz+7QVYdO0lE3cZbiKYtopL4bEYAOo7u4irJ4aBTaIN7a
 q7yf0qSM5OV1YfRzGTBtmx/EIHL10W51RyCkAAmaafrmrU6qdljizu06L2dfIcM8jL4/
 ICJ5nDzMK4bCKjm1kvBL/ozFnKSsH+xjNgoQi0QFTh8aGoqkbERcxRNMSNmFtoCYhGqV
 JQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jJzEMzWugV5gseE/yyDFT9Q8/pGqvZESFcuppX2jwK4=;
 b=urcsEixax8m7QD6SdgMQnVI/LknbNQbRsr+Kawi1tGyPB0EiICa2iPCUWc6qHvX9Xj
 0SPqpqk5KMEFxyRt+yVV9pr4T8oZslIfMtWvEZrv3ZP4bL5chDGTDTTEoaQRC+ya+Fq6
 9vPQu1Pmr2f3QseNYOB2BYOFD1HBoaVmluSJRY4xWSZDLj0rCbKE9QoVKgQpnTa/VOeb
 qFsLzsKr5gDXChb4jUGwOpeqHt+inDNVZQCtQDFPiVpK8mkNPSJ4/hohsdu3sSGYEURL
 sfEfH6bwYUOMTtGd70BYlN1iJ3ma13vPCISrnq2FIB9uAMGN5ImJHC3h2opnJvhWTiQP
 brfQ==
X-Gm-Message-State: AOAM533pMBgNvs6qsL6S114ALIY7cLDFNJaOP38BpBIG1UsRC1OAzJB7
 qsbKri9DBItpqijGTv+YLSQlX1hXfaUmwkkKZiXISuThGfU=
X-Google-Smtp-Source: ABdhPJyJjeGdR/RzVxpEPCaDdnTMmHl8IcVLb0vhjpILZfHJOe9HJUDfThD188YWt9Ep6+s8WQumwvEP++m8NmKT7bo=
X-Received: by 2002:a05:6402:51c9:: with SMTP id
 r9mr26198659edd.120.1643736167249; 
 Tue, 01 Feb 2022 09:22:47 -0800 (PST)
MIME-Version: 1.0
References: <20220131194818.2084092-1-geomatsi@gmail.com>
 <20220131194818.2084092-2-geomatsi@gmail.com>
In-Reply-To: <20220131194818.2084092-2-geomatsi@gmail.com>
Date: Tue, 1 Feb 2022 18:22:35 +0100
Message-ID: <CAGm1_kvOoZ2LfrTERg9cm4LQd_QtSz1ELiT8WnBYbAv9Pua1ug@mail.gmail.com>
To: Sergey Matyukevich <geomatsi@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/2] package/hostapd: bump version to 2.10
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Matt Weber <matthew.weber@collins.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Jan 31, 2022 at 8:48 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
>
> Update hostapd to the latest release v2.10. Drop all the patches
> as they have already been upstreamed. Remove from .mk file all
> the HOSTAPD_IGNORE_CVES records since those CVEs will not be
> reported against the new version.
>
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  ...re-management-frame-from-unexpected-.patch |  77 ------------
>  ...DigestAlgorithmIdentifier-parameters.patch | 116 ------------------
>  ...dbool.h-to-allow-C99-bool-to-be-used.patch |  32 -----
>  ...-functions-for-recognizing-tag-value.patch |  37 ------
>  package/hostapd/hostapd.hash                  |   6 +-
>  package/hostapd/hostapd.mk                    |  19 +--
>  6 files changed, 2 insertions(+), 285 deletions(-)
>  delete mode 100644 package/hostapd/0001-AP-Silently-ignore-management-frame-from-unexpected-.patch
>  delete mode 100644 package/hostapd/0002-ASN.1-Validate-DigestAlgorithmIdentifier-parameters.patch
>  delete mode 100644 package/hostapd/0003-Include-stdbool.h-to-allow-C99-bool-to-be-used.patch
>  delete mode 100644 package/hostapd/0004-ASN.1-Add-helper-functions-for-recognizing-tag-value.patch
>
> diff --git a/package/hostapd/0001-AP-Silently-ignore-management-frame-from-unexpected-.patch b/package/hostapd/0001-AP-Silently-ignore-management-frame-from-unexpected-.patch
> deleted file mode 100644
> index 959788c2e9..0000000000
> --- a/package/hostapd/0001-AP-Silently-ignore-management-frame-from-unexpected-.patch
> +++ /dev/null
> @@ -1,77 +0,0 @@
> -From 8c07fa9eda13e835f3f968b2e1c9a8be3a851ff9 Mon Sep 17 00:00:00 2001
> -From: Jouni Malinen <j@w1.fi>
> -Date: Thu, 29 Aug 2019 11:52:04 +0300
> -Subject: [PATCH] AP: Silently ignore management frame from unexpected source
> - address
> -
> -Do not process any received Management frames with unexpected/invalid SA
> -so that we do not add any state for unexpected STA addresses or end up
> -sending out frames to unexpected destination. This prevents unexpected
> -sequences where an unprotected frame might end up causing the AP to send
> -out a response to another device and that other device processing the
> -unexpected response.
> -
> -In particular, this prevents some potential denial of service cases
> -where the unexpected response frame from the AP might result in a
> -connected station dropping its association.
> -
> -Signed-off-by: Jouni Malinen <j@w1.fi>
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Retrieved from:
> -https://w1.fi/security/2019-7/0001-AP-Silently-ignore-management-frame-from-unexpected-.patch]
> ----
> - src/ap/drv_callbacks.c | 13 +++++++++++++
> - src/ap/ieee802_11.c    | 12 ++++++++++++
> - 2 files changed, 25 insertions(+)
> -
> -diff --git a/src/ap/drv_callbacks.c b/src/ap/drv_callbacks.c
> -index 31587685fe3b..34ca379edc3d 100644
> ---- a/src/ap/drv_callbacks.c
> -+++ b/src/ap/drv_callbacks.c
> -@@ -131,6 +131,19 @@ int hostapd_notif_assoc(struct hostapd_data *hapd, const u8 *addr,
> -                          "hostapd_notif_assoc: Skip event with no address");
> -               return -1;
> -       }
> -+
> -+      if (is_multicast_ether_addr(addr) ||
> -+          is_zero_ether_addr(addr) ||
> -+          os_memcmp(addr, hapd->own_addr, ETH_ALEN) == 0) {
> -+              /* Do not process any frames with unexpected/invalid SA so that
> -+               * we do not add any state for unexpected STA addresses or end
> -+               * up sending out frames to unexpected destination. */
> -+              wpa_printf(MSG_DEBUG, "%s: Invalid SA=" MACSTR
> -+                         " in received indication - ignore this indication silently",
> -+                         __func__, MAC2STR(addr));
> -+              return 0;
> -+      }
> -+
> -       random_add_randomness(addr, ETH_ALEN);
> -
> -       hostapd_logger(hapd, addr, HOSTAPD_MODULE_IEEE80211,
> -diff --git a/src/ap/ieee802_11.c b/src/ap/ieee802_11.c
> -index c85a28db44b7..e7065372e158 100644
> ---- a/src/ap/ieee802_11.c
> -+++ b/src/ap/ieee802_11.c
> -@@ -4626,6 +4626,18 @@ int ieee802_11_mgmt(struct hostapd_data *hapd, const u8 *buf, size_t len,
> -       fc = le_to_host16(mgmt->frame_control);
> -       stype = WLAN_FC_GET_STYPE(fc);
> -
> -+      if (is_multicast_ether_addr(mgmt->sa) ||
> -+          is_zero_ether_addr(mgmt->sa) ||
> -+          os_memcmp(mgmt->sa, hapd->own_addr, ETH_ALEN) == 0) {
> -+              /* Do not process any frames with unexpected/invalid SA so that
> -+               * we do not add any state for unexpected STA addresses or end
> -+               * up sending out frames to unexpected destination. */
> -+              wpa_printf(MSG_DEBUG, "MGMT: Invalid SA=" MACSTR
> -+                         " in received frame - ignore this frame silently",
> -+                         MAC2STR(mgmt->sa));
> -+              return 0;
> -+      }
> -+
> -       if (stype == WLAN_FC_STYPE_BEACON) {
> -               handle_beacon(hapd, mgmt, len, fi);
> -               return 1;
> ---
> -2.20.1
> -
> diff --git a/package/hostapd/0002-ASN.1-Validate-DigestAlgorithmIdentifier-parameters.patch b/package/hostapd/0002-ASN.1-Validate-DigestAlgorithmIdentifier-parameters.patch
> deleted file mode 100644
> index 5dcfed9406..0000000000
> --- a/package/hostapd/0002-ASN.1-Validate-DigestAlgorithmIdentifier-parameters.patch
> +++ /dev/null
> @@ -1,116 +0,0 @@
> -From a0541334a6394f8237a4393b7372693cd7e96f15 Mon Sep 17 00:00:00 2001
> -From: Jouni Malinen <j@w1.fi>
> -Date: Sat, 13 Mar 2021 18:19:31 +0200
> -Subject: [PATCH] ASN.1: Validate DigestAlgorithmIdentifier parameters
> -
> -The supported hash algorithms do not use AlgorithmIdentifier parameters.
> -However, there are implementations that include NULL parameters in
> -addition to ones that omit the parameters. Previous implementation did
> -not check the parameters value at all which supported both these cases,
> -but did not reject any other unexpected information.
> -
> -Use strict validation of digest algorithm parameters and reject any
> -unexpected value when validating a signature. This is needed to prevent
> -potential forging attacks.
> -
> -Signed-off-by: Jouni Malinen <j@w1.fi>
> -Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ----
> - src/tls/pkcs1.c  | 21 +++++++++++++++++++++
> - src/tls/x509v3.c | 20 ++++++++++++++++++++
> - 2 files changed, 41 insertions(+)
> -
> -diff --git a/src/tls/pkcs1.c b/src/tls/pkcs1.c
> -index bbdb0d72d..5761dfed0 100644
> ---- a/src/tls/pkcs1.c
> -+++ b/src/tls/pkcs1.c
> -@@ -244,6 +244,8 @@ int pkcs1_v15_sig_ver(struct crypto_public_key *pk,
> -               os_free(decrypted);
> -               return -1;
> -       }
> -+      wpa_hexdump(MSG_MSGDUMP, "PKCS #1: DigestInfo",
> -+                  hdr.payload, hdr.length);
> -
> -       pos = hdr.payload;
> -       end = pos + hdr.length;
> -@@ -265,6 +267,8 @@ int pkcs1_v15_sig_ver(struct crypto_public_key *pk,
> -               os_free(decrypted);
> -               return -1;
> -       }
> -+      wpa_hexdump(MSG_MSGDUMP, "PKCS #1: DigestAlgorithmIdentifier",
> -+                  hdr.payload, hdr.length);
> -       da_end = hdr.payload + hdr.length;
> -
> -       if (asn1_get_oid(hdr.payload, hdr.length, &oid, &next)) {
> -@@ -273,6 +277,23 @@ int pkcs1_v15_sig_ver(struct crypto_public_key *pk,
> -               os_free(decrypted);
> -               return -1;
> -       }
> -+      wpa_hexdump(MSG_MSGDUMP, "PKCS #1: Digest algorithm parameters",
> -+                  next, da_end - next);
> -+
> -+      /*
> -+       * RFC 5754: The correct encoding for the SHA2 algorithms would be to
> -+       * omit the parameters, but there are implementation that encode these
> -+       * as a NULL element. Allow these two cases and reject anything else.
> -+       */
> -+      if (da_end > next &&
> -+          (asn1_get_next(next, da_end - next, &hdr) < 0 ||
> -+           !asn1_is_null(&hdr) ||
> -+           hdr.payload + hdr.length != da_end)) {
> -+              wpa_printf(MSG_DEBUG,
> -+                         "PKCS #1: Unexpected digest algorithm parameters");
> -+              os_free(decrypted);
> -+              return -1;
> -+      }
> -
> -       if (!asn1_oid_equal(&oid, hash_alg)) {
> -               char txt[100], txt2[100];
> -diff --git a/src/tls/x509v3.c b/src/tls/x509v3.c
> -index a8944dd2f..df337ec4d 100644
> ---- a/src/tls/x509v3.c
> -+++ b/src/tls/x509v3.c
> -@@ -1964,6 +1964,7 @@ int x509_check_signature(struct x509_certificate *issuer,
> -               os_free(data);
> -               return -1;
> -       }
> -+      wpa_hexdump(MSG_MSGDUMP, "X509: DigestInfo", hdr.payload, hdr.length);
> -
> -       pos = hdr.payload;
> -       end = pos + hdr.length;
> -@@ -1985,6 +1986,8 @@ int x509_check_signature(struct x509_certificate *issuer,
> -               os_free(data);
> -               return -1;
> -       }
> -+      wpa_hexdump(MSG_MSGDUMP, "X509: DigestAlgorithmIdentifier",
> -+                  hdr.payload, hdr.length);
> -       da_end = hdr.payload + hdr.length;
> -
> -       if (asn1_get_oid(hdr.payload, hdr.length, &oid, &next)) {
> -@@ -1992,6 +1995,23 @@ int x509_check_signature(struct x509_certificate *issuer,
> -               os_free(data);
> -               return -1;
> -       }
> -+      wpa_hexdump(MSG_MSGDUMP, "X509: Digest algorithm parameters",
> -+                  next, da_end - next);
> -+
> -+      /*
> -+       * RFC 5754: The correct encoding for the SHA2 algorithms would be to
> -+       * omit the parameters, but there are implementation that encode these
> -+       * as a NULL element. Allow these two cases and reject anything else.
> -+       */
> -+      if (da_end > next &&
> -+          (asn1_get_next(next, da_end - next, &hdr) < 0 ||
> -+           !asn1_is_null(&hdr) ||
> -+           hdr.payload + hdr.length != da_end)) {
> -+              wpa_printf(MSG_DEBUG,
> -+                         "X509: Unexpected digest algorithm parameters");
> -+              os_free(data);
> -+              return -1;
> -+      }
> -
> -       if (x509_sha1_oid(&oid)) {
> -               if (signature->oid.oid[6] != 5 /* sha-1WithRSAEncryption */) {
> ---
> -2.20.1
> -
> diff --git a/package/hostapd/0003-Include-stdbool.h-to-allow-C99-bool-to-be-used.patch b/package/hostapd/0003-Include-stdbool.h-to-allow-C99-bool-to-be-used.patch
> deleted file mode 100644
> index e52dbdb694..0000000000
> --- a/package/hostapd/0003-Include-stdbool.h-to-allow-C99-bool-to-be-used.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 99cf89555313056d3a8fa54b21d02dc880b363e1 Mon Sep 17 00:00:00 2001
> -From: Jouni Malinen <jouni@codeaurora.org>
> -Date: Mon, 20 Apr 2020 20:29:31 +0300
> -Subject: [PATCH] Include stdbool.h to allow C99 bool to be used
> -
> -We have practically started requiring some C99 features, so might as
> -well finally go ahead and bring in the C99 bool as well.
> -
> -Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> -[geomatsi@gmail.com: backport from upstream]
> -Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> -[yann.morin.1998@free.fr: keep upstream sha1 in header, drop numbering]
> -Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ----
> - src/utils/includes.h | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/src/utils/includes.h b/src/utils/includes.h
> -index 75513fc8c..741fc9c14 100644
> ---- a/src/utils/includes.h
> -+++ b/src/utils/includes.h
> -@@ -18,6 +18,7 @@
> -
> - #include <stdlib.h>
> - #include <stddef.h>
> -+#include <stdbool.h>
> - #include <stdio.h>
> - #include <stdarg.h>
> - #include <string.h>
> ---
> -2.25.1
> -
> diff --git a/package/hostapd/0004-ASN.1-Add-helper-functions-for-recognizing-tag-value.patch b/package/hostapd/0004-ASN.1-Add-helper-functions-for-recognizing-tag-value.patch
> deleted file mode 100644
> index a5415e7daf..0000000000
> --- a/package/hostapd/0004-ASN.1-Add-helper-functions-for-recognizing-tag-value.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From 9a990e8c4eb92dd64e0ec483599820e45c35ac23 Mon Sep 17 00:00:00 2001
> -From: Jouni Malinen <j@w1.fi>
> -Date: Sat, 13 Mar 2021 23:14:23 +0200
> -Subject: [PATCH] ASN.1: Add helper functions for recognizing tag values
> -
> -Signed-off-by: Jouni Malinen <j@w1.fi>
> -[geomatsi@gmail.com: backport asn1_is_null() from upstream 9a990e8c4eb9]
> -Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> -[yann.morin.1998@free.fr:
> -  - reformat, keep the upstream sha1 and title,
> -  - drop numbering
> -]
> -Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ----
> - src/tls/asn1.h | 102 +++++++++++++++++++++++++++++++++++++++++++++++++
> - 1 file changed, 102 insertions(+)
> -
> -diff --git a/src/tls/asn1.h b/src/tls/asn1.h
> -index de3430adb..a4d1be473 100644
> ---- a/src/tls/asn1.h
> -+++ b/src/tls/asn1.h
> -@@ -66,6 +66,12 @@ struct wpabuf * asn1_build_alg_id(const struct asn1_oid *oid,
> - unsigned long asn1_bit_string_to_long(const u8 *buf, size_t len);
> - int asn1_oid_equal(const struct asn1_oid *a, const struct asn1_oid *b);
> -
> -+static inline bool asn1_is_null(const struct asn1_hdr *hdr)
> -+{
> -+      return hdr->class == ASN1_CLASS_UNIVERSAL &&
> -+              hdr->tag == ASN1_TAG_NULL;
> -+}
> -+
> - extern struct asn1_oid asn1_sha1_oid;
> - extern struct asn1_oid asn1_sha256_oid;
> -
> ---
> -2.25.1
> -
> diff --git a/package/hostapd/hostapd.hash b/package/hostapd/hostapd.hash
> index 9ac5f4b392..f8183d1620 100644
> --- a/package/hostapd/hostapd.hash
> +++ b/package/hostapd/hostapd.hash
> @@ -1,7 +1,3 @@
>  # Locally calculated
> -sha256  881d7d6a90b2428479288d64233151448f8990ab4958e0ecaca7eeb3c9db2bd7  hostapd-2.9.tar.gz
> -sha256  2d9a5b9d616f1b4aa4a22b967cee866e2f69b798b0b46803a7928c8559842bd7  0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch
> -sha256  49feb35a5276279b465f6836d6fa2c6b34d94dc979e8b840d1918865c04260de  0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch
> -sha256  a8212a2d89a5bab2824d22b6047e7740553df163114fcec94832bfa9c5c5d78a  0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch
> -sha256  7f40cfec5faf5e927ea9028ab9392cd118685bde7229ad24210caf0a8f6e9611  0001-P2P-Fix-a-corner-case-in-peer-addition-based-on-PD-R.patch
> +sha256  206e7c799b678572c2e3d12030238784bc4a9f82323b0156b4c9466f1498915d  hostapd-2.10.tar.gz
>  sha256  9da5dd0776da266b180b915e460ff75c6ff729aca1196ab396529510f24f3761  README
> diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
> index e988999d3e..075cb2a8d0 100644
> --- a/package/hostapd/hostapd.mk
> +++ b/package/hostapd/hostapd.mk
> @@ -4,32 +4,15 @@
>  #
>  ################################################################################
>
> -HOSTAPD_VERSION = 2.9
> +HOSTAPD_VERSION = 2.10
>  HOSTAPD_SITE = http://w1.fi/releases
>  HOSTAPD_SUBDIR = hostapd
>  HOSTAPD_CONFIG = $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/.config
> -HOSTAPD_PATCH = \
> -       https://w1.fi/security/2020-1/0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch \
> -       https://w1.fi/security/2020-1/0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch \
> -       https://w1.fi/security/2020-1/0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch \
> -       https://w1.fi/security/2021-1/0001-P2P-Fix-a-corner-case-in-peer-addition-based-on-PD-R.patch
>  HOSTAPD_DEPENDENCIES = host-pkgconf
>  HOSTAPD_CFLAGS = $(TARGET_CFLAGS)
>  HOSTAPD_LICENSE = BSD-3-Clause
>  HOSTAPD_LICENSE_FILES = README
>
> -# 0001-AP-Silently-ignore-management-frame-from-unexpected-.patch
> -HOSTAPD_IGNORE_CVES += CVE-2019-16275
> -
> -# 0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch
> -HOSTAPD_IGNORE_CVES += CVE-2020-12695
> -
> -# 0002-ASN.1-Validate-DigestAlgorithmIdentifier-parameters.patch
> -HOSTAPD_IGNORE_CVES += CVE-2021-30004
> -
> -# 0001-P2P-Fix-a-corner-case-in-peer-addition-based-on-PD-R.patch
> -HOSTAPD_IGNORE_CVES += CVE-2021-27803
> -
>  HOSTAPD_CPE_ID_VENDOR = w1.fi
>  HOSTAPD_SELINUX_MODULES = hostapd
>  HOSTAPD_CONFIG_SET =
> --
> 2.35.0
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
