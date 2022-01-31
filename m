Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1468C433EF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 20:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DD8640120;
	Mon, 31 Jan 2022 20:15:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z1bBokZOkV1g; Mon, 31 Jan 2022 20:15:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0E8D40125;
	Mon, 31 Jan 2022 20:14:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 856361BF36A
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 20:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 733BE60806
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 20:14:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WABLM8W3F0Pk for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 20:14:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E74BD607B4
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 20:14:55 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id ka4so46454714ejc.11
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 12:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cC3ABP0CWwuc+y5ZLl3Ekns1qNTPEECfJ8NG7PlMPdg=;
 b=MA2hLCENy8uvysvuE99BZ4qLLPxwafK818kHy3RWEX+e4LpcHq1KzSxE3hhKLkDCSl
 PA5unKP420qAFiY6m4TDBzRqgADoKprcUNF0DT2U6q6Hvrm3oqWcfOXTi5qMuCPk8qRI
 rgBUurcZ/vPd4ZZ28EJXXIvXTJtyGydOOhXuNIRelABR6MJZdYrhF7zy2WRjWWEbFfYz
 IFSZhAr2HQiZZFfTGlJk/Y9bJJqD/va0FISAB+KW3qUQBqa3pxhplUi6Y75Y7BGE30Hb
 +mOHtYxpOZAb3jY8VTW8NNKMPyVwT+Q3k/n6ZhXNLALHn8JtXuRszOUZoP2ZIwKLLhaT
 Y3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cC3ABP0CWwuc+y5ZLl3Ekns1qNTPEECfJ8NG7PlMPdg=;
 b=qdVW+r5ELHLRrXR7wYk5DV6cCmdWyElTxMSyNsDjREm5dR5bEKGCw81EgWt645tkRf
 coYlbahn4BVHtwfDf4nSu8Oq5JfP5piDW1h+R66SMf++rhSamHSlSkFp2Eh6pZJmE2qB
 4iYtYuv2HOl0x++hFFVRjhndQuO5dHmmLh3enxOMBUlAm1vACZMu7dE8vgMWf1fxG1+5
 iLusuprJ2iDiQuLb9BdbADJY3/Vf0JPc3onJt4TmmsDjVbF1cYVGMe+hds/kJJ+ejQQF
 wmVWAE0tiWZCiV1/UYQwPchkUphV01S5UuaBRP1k7XZElTjfLc5ob6rtx9cBWtjIhQyP
 e8FQ==
X-Gm-Message-State: AOAM530uNdaPgDjTeqtplQgxX8VcEpIenoS9LqGlV3mhqphZtfuPHqSW
 kvTL0xBo+t7SQgod4Ywvvt4+pm4ZpkVKSicbAlwRFc3c+i8=
X-Google-Smtp-Source: ABdhPJw1eicvO0LmE7mpqTijjiiqzZYDU1oIUZxHrmBX8dSx0Fh2dyRF0u/P5JxnMqFSW8hEPLhzpk86v9TMNAQh06k=
X-Received: by 2002:a17:906:7316:: with SMTP id
 di22mr18848926ejc.505.1643660093832; 
 Mon, 31 Jan 2022 12:14:53 -0800 (PST)
MIME-Version: 1.0
References: <20220131194818.2084092-1-geomatsi@gmail.com>
In-Reply-To: <20220131194818.2084092-1-geomatsi@gmail.com>
Date: Mon, 31 Jan 2022 21:14:42 +0100
Message-ID: <CAGm1_ktBCO3mnWL2LBF-zEqG0pf4wBr7KKF_Gsjs5HPg+kx3tA@mail.gmail.com>
To: Sergey Matyukevich <geomatsi@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/wpa_supplicant: bump version to
 2.10
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

Hi Sergey,

On Mon, Jan 31, 2022 at 8:48 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
>
> Update wpa_supplicant to the latest release v2.10. Drop all the patches
> as they have already been upstreamed. Remove from .mk file all the
> WPA_SUPPLICANT_IGNORE_CVES records since those CVEs will not be
> reported against the new version.
>
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>  ...re-management-frame-from-unexpected-.patch |  77 ------------
>  ...DigestAlgorithmIdentifier-parameters.patch | 116 ------------------
>  ...dbool.h-to-allow-C99-bool-to-be-used.patch |  32 -----
>  ...-functions-for-recognizing-tag-value.patch |  37 ------
>  package/wpa_supplicant/wpa_supplicant.hash    |   4 +-
>  package/wpa_supplicant/wpa_supplicant.mk      |  14 +--
>  6 files changed, 2 insertions(+), 278 deletions(-)
>  delete mode 100644 package/wpa_supplicant/0001-AP-Silently-ignore-management-frame-from-unexpected-.patch
>  delete mode 100644 package/wpa_supplicant/0002-ASN.1-Validate-DigestAlgorithmIdentifier-parameters.patch
>  delete mode 100644 package/wpa_supplicant/0003-Include-stdbool.h-to-allow-C99-bool-to-be-used.patch
>  delete mode 100644 package/wpa_supplicant/0004-ASN.1-Add-helper-functions-for-recognizing-tag-value.patch
>
> diff --git a/package/wpa_supplicant/0001-AP-Silently-ignore-management-frame-from-unexpected-.patch b/package/wpa_supplicant/0001-AP-Silently-ignore-management-frame-from-unexpected-.patch
> deleted file mode 100644
> index 959788c2e9..0000000000
> --- a/package/wpa_supplicant/0001-AP-Silently-ignore-management-frame-from-unexpected-.patch
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
> diff --git a/package/wpa_supplicant/0002-ASN.1-Validate-DigestAlgorithmIdentifier-parameters.patch b/package/wpa_supplicant/0002-ASN.1-Validate-DigestAlgorithmIdentifier-parameters.patch
> deleted file mode 100644
> index 5dcfed9406..0000000000
> --- a/package/wpa_supplicant/0002-ASN.1-Validate-DigestAlgorithmIdentifier-parameters.patch
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
> diff --git a/package/wpa_supplicant/0003-Include-stdbool.h-to-allow-C99-bool-to-be-used.patch b/package/wpa_supplicant/0003-Include-stdbool.h-to-allow-C99-bool-to-be-used.patch
> deleted file mode 100644
> index e52dbdb694..0000000000
> --- a/package/wpa_supplicant/0003-Include-stdbool.h-to-allow-C99-bool-to-be-used.patch
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
> diff --git a/package/wpa_supplicant/0004-ASN.1-Add-helper-functions-for-recognizing-tag-value.patch b/package/wpa_supplicant/0004-ASN.1-Add-helper-functions-for-recognizing-tag-value.patch
> deleted file mode 100644
> index a5415e7daf..0000000000
> --- a/package/wpa_supplicant/0004-ASN.1-Add-helper-functions-for-recognizing-tag-value.patch
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
> diff --git a/package/wpa_supplicant/wpa_supplicant.hash b/package/wpa_supplicant/wpa_supplicant.hash
> index 2387391a3c..b442be6ed5 100644
> --- a/package/wpa_supplicant/wpa_supplicant.hash
> +++ b/package/wpa_supplicant/wpa_supplicant.hash
> @@ -1,5 +1,3 @@
>  # Locally calculated
> -sha256  fcbdee7b4a64bea8177973299c8c824419c413ec2e3a95db63dd6a5dc3541f17  wpa_supplicant-2.9.tar.gz
> +sha256  20df7ae5154b3830355f8ab4269123a87affdea59fe74fe9292a91d0d7e17b2f  wpa_supplicant-2.10.tar.gz
>  sha256  9da5dd0776da266b180b915e460ff75c6ff729aca1196ab396529510f24f3761  README
> -sha256  c4d65cc13863e0237d0644198558e2c47b4ed91e2b2be4516ff590724187c4a5  0001-P2P-Fix-copying-of-secondary-device-types-for-P2P-gr.patch
> -sha256  7f40cfec5faf5e927ea9028ab9392cd118685bde7229ad24210caf0a8f6e9611  0001-P2P-Fix-a-corner-case-in-peer-addition-based-on-PD-R.patch
> diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
> index 3c0b0c1dfc..b414144774 100644
> --- a/package/wpa_supplicant/wpa_supplicant.mk
> +++ b/package/wpa_supplicant/wpa_supplicant.mk
> @@ -4,11 +4,8 @@
>  #
>  ################################################################################
>
> -WPA_SUPPLICANT_VERSION = 2.9
> +WPA_SUPPLICANT_VERSION = 2.10
>  WPA_SUPPLICANT_SITE = http://w1.fi/releases
> -WPA_SUPPLICANT_PATCH = \
> -       https://w1.fi/security/2020-2/0001-P2P-Fix-copying-of-secondary-device-types-for-P2P-gr.patch \
> -       https://w1.fi/security/2021-1/0001-P2P-Fix-a-corner-case-in-peer-addition-based-on-PD-R.patch
>  WPA_SUPPLICANT_LICENSE = BSD-3-Clause
>  WPA_SUPPLICANT_LICENSE_FILES = README
>  WPA_SUPPLICANT_CPE_ID_VENDOR = w1.fi
> @@ -19,15 +16,6 @@ WPA_SUPPLICANT_CFLAGS = $(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3/
>  WPA_SUPPLICANT_LDFLAGS = $(TARGET_LDFLAGS)
>  WPA_SUPPLICANT_SELINUX_MODULES = networkmanager
>
> -# 0001-AP-Silently-ignore-management-frame-from-unexpected-.patch
> -WPA_SUPPLICANT_IGNORE_CVES += CVE-2019-16275
> -
> -# 0001-P2P-Fix-a-corner-case-in-peer-addition-based-on-PD-R.patch
> -WPA_SUPPLICANT_IGNORE_CVES += CVE-2021-27803
> -
> -# 0002-ASN.1-Validate-DigestAlgorithmIdentifier-parameters.patch
> -WPA_SUPPLICANT_IGNORE_CVES += CVE-2021-30004
> -
>  # install the wpa_client library
>  WPA_SUPPLICANT_INSTALL_STAGING = YES

Have you tried to build wpa_supplicant without
BR2_PACKAGE_WPA_SUPPLICANT_WPA3 and enabled
BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING? I've got a linking error.
I have also sent a quick and dirty patch to the hostap mailing list
[1] but still got no answer.

[1] http://lists.infradead.org/pipermail/hostap/2022-January/040181.html

Regards,
Yegor
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
