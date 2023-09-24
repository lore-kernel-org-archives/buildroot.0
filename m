Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2449ACE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 09:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7ACB9417DE;
	Sun, 24 Sep 2023 09:02:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7ACB9417DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ee_x5sk-rQf4; Sun, 24 Sep 2023 09:02:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1290F41802;
	Sun, 24 Sep 2023 09:02:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1290F41802
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D5B241BF299
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 09:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AED7C4063E
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 09:02:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AED7C4063E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LTQZ3WdGu8ft for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 09:02:33 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A89E440297
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 09:02:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A89E440297
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:bf8d:df06:37bc:41df])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 8C9C17804FD;
 Sun, 24 Sep 2023 11:02:26 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Sep 2023 11:02:26 +0200
Date: Sun, 24 Sep 2023 11:02:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20230924090226.GF1469982@scaer>
References: <20230923092414.4075194-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230923092414.4075194-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695546149;
 bh=m9pEJcuqz1+VXIRPUkVYWextuM5YoQ3T2MY9o0q7cXA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lASQ1GuqYREIDOR9yqtqeggr8+0b6cuLbPILFcW3XKeg6VyugfgQIvjWE5h0xCsuh
 Am3qwhMrdwXD5H8oQcvKKGOxlMasbJw5wKV8dn9pHXiJDAxJRECo+5n5km64IzR7VH
 4vHub2OnXmP2IBqRKAISPt+C8wwY+YELkhY3myyWsCLq8zUAQguCTsMQtmNFEdyUh/
 gw06LdEXe/UdSo+AA4C5avQSfZyZQo05xG1wkUtHjzFlCiqSTwEBXEiLL4vxiFYG3n
 RKLXBdoJzGBVY/zkDxpm8bvK8YSrcOHEQqvthPJj1YR0cGL8JsuenkgCAzbPagMO/x
 KtQh0BPhKKvJA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lASQ1Guq
Subject: Re: [Buildroot] [PATCH] package/libpjsip: security bump to version
 2.13.1
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2023-09-23 11:24 +0200, Peter Korsgaard spake thusly:
> Fixes the following security vulnerability:
> 
> - CVE-2023-27585: Heap buffer overflow when parsing DNS packet
>   https://github.com/pjsip/pjproject/security/advisories/GHSA-q9cp-8wcq-7pfr
> 
> Drop now upstreamed security fixes for CVE-2022-23537 and CVE-2022-23547.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...ull-request-from-GHSA-9pfh-r8x4-w26w.patch | 99 -------------------
>  ...ull-request-from-GHSA-cxwq-5g9x-x7fr.patch | 54 ----------

    $ make check-package
    .checkpackageignore:743: ignored file package/libpjsip/0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch is missing
    .checkpackageignore:744: ignored file package/libpjsip/0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch is missing

Applied to master with the above fixed, thanks.

Regards,
Yann E. MORIN.

>  package/libpjsip/libpjsip.hash                |  2 +-
>  package/libpjsip/libpjsip.mk                  |  8 +-
>  4 files changed, 2 insertions(+), 161 deletions(-)
>  delete mode 100644 package/libpjsip/0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch
>  delete mode 100644 package/libpjsip/0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch
> 
> diff --git a/package/libpjsip/0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch b/package/libpjsip/0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch
> deleted file mode 100644
> index 01e1878189..0000000000
> --- a/package/libpjsip/0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch
> +++ /dev/null
> @@ -1,99 +0,0 @@
> -From d8440f4d711a654b511f50f79c0445b26f9dd1e1 Mon Sep 17 00:00:00 2001
> -From: Nanang Izzuddin <nanang@teluu.com>
> -Date: Tue, 20 Dec 2022 11:39:12 +0700
> -Subject: [PATCH] Merge pull request from GHSA-9pfh-r8x4-w26w
> -
> -* Fix buffer overread in STUN message decoder
> -
> -* Updates based on comments
> -
> -[Retrieved from:
> -https://github.com/pjsip/pjproject/commit/d8440f4d711a654b511f50f79c0445b26f9dd1e1]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - pjnath/include/pjnath/stun_msg.h |  4 ++++
> - pjnath/src/pjnath/stun_msg.c     | 14 +++++++++++---
> - 2 files changed, 15 insertions(+), 3 deletions(-)
> -
> -diff --git a/pjnath/include/pjnath/stun_msg.h b/pjnath/include/pjnath/stun_msg.h
> -index b52f95c586..e49f096f3a 100644
> ---- a/pjnath/include/pjnath/stun_msg.h
> -+++ b/pjnath/include/pjnath/stun_msg.h
> -@@ -442,6 +442,7 @@ typedef enum pj_stun_status
> - 
> -    \endverbatim
> -  */
> -+#pragma pack(1)
> - typedef struct pj_stun_msg_hdr
> - {
> -     /**
> -@@ -473,6 +474,7 @@ typedef struct pj_stun_msg_hdr
> -     pj_uint8_t          tsx_id[12];
> - 
> - } pj_stun_msg_hdr;
> -+#pragma pack()
> - 
> - 
> - /**
> -@@ -490,6 +492,7 @@ typedef struct pj_stun_msg_hdr
> - 
> -    \endverbatim
> -  */
> -+#pragma pack(1)
> - typedef struct pj_stun_attr_hdr
> - {
> -     /**
> -@@ -506,6 +509,7 @@ typedef struct pj_stun_attr_hdr
> -     pj_uint16_t         length;
> - 
> - } pj_stun_attr_hdr;
> -+#pragma pack()
> - 
> - 
> - /**
> -diff --git a/pjnath/src/pjnath/stun_msg.c b/pjnath/src/pjnath/stun_msg.c
> -index 3def6b3eac..e904a0ba47 100644
> ---- a/pjnath/src/pjnath/stun_msg.c
> -+++ b/pjnath/src/pjnath/stun_msg.c
> -@@ -746,7 +746,7 @@ PJ_DEF(int) pj_stun_set_padding_char(int chr)
> - 
> - #define INIT_ATTR(a,t,l)    (a)->hdr.type=(pj_uint16_t)(t), \
> -                             (a)->hdr.length=(pj_uint16_t)(l)
> --#define ATTR_HDR_LEN        4
> -+#define ATTR_HDR_LEN        sizeof(pj_stun_attr_hdr)
> - 
> - static pj_uint16_t GETVAL16H(const pj_uint8_t *buf, unsigned pos)
> - {
> -@@ -2327,6 +2327,14 @@ PJ_DEF(pj_status_t) pj_stun_msg_decode(pj_pool_t *pool,
> -         status = pj_stun_msg_check(pdu, pdu_len, options);
> -         if (status != PJ_SUCCESS)
> -             return status;
> -+    } else {
> -+        /* For safety, verify packet length at least */
> -+        pj_uint32_t msg_len = GETVAL16H(pdu, 2) + 20;
> -+        if (msg_len > pdu_len ||
> -+            ((options & PJ_STUN_IS_DATAGRAM) && msg_len != pdu_len))
> -+        {
> -+            return PJNATH_EINSTUNMSGLEN;
> -+        }
> -     }
> - 
> -     /* Create the message, copy the header, and convert to host byte order */
> -@@ -2345,7 +2353,7 @@ PJ_DEF(pj_status_t) pj_stun_msg_decode(pj_pool_t *pool,
> -         p_response = NULL;
> - 
> -     /* Parse attributes */
> --    while (pdu_len >= 4) {
> -+    while (pdu_len >= ATTR_HDR_LEN) {
> -         unsigned attr_type, attr_val_len;
> -         const struct attr_desc *adesc;
> - 
> -@@ -2357,7 +2365,7 @@ PJ_DEF(pj_status_t) pj_stun_msg_decode(pj_pool_t *pool,
> -         attr_val_len = (attr_val_len + 3) & (~3);
> - 
> -         /* Check length */
> --        if (pdu_len < attr_val_len) {
> -+        if (pdu_len < attr_val_len + ATTR_HDR_LEN) {
> -             pj_str_t err_msg;
> -             char err_msg_buf[80];
> - 
> diff --git a/package/libpjsip/0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch b/package/libpjsip/0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch
> deleted file mode 100644
> index 82249a2076..0000000000
> --- a/package/libpjsip/0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -From bc4812d31a67d5e2f973fbfaf950d6118226cf36 Mon Sep 17 00:00:00 2001
> -From: sauwming <ming@teluu.com>
> -Date: Fri, 23 Dec 2022 15:05:28 +0800
> -Subject: [PATCH] Merge pull request from GHSA-cxwq-5g9x-x7fr
> -
> -* Fixed heap buffer overflow when parsing STUN errcode attribute
> -
> -* Also fixed uint parsing
> -
> -[Retrieved from:
> -https://github.com/pjsip/pjproject/commit/bc4812d31a67d5e2f973fbfaf950d6118226cf36]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - pjnath/src/pjnath/stun_msg.c | 11 ++++++-----
> - 1 file changed, 6 insertions(+), 5 deletions(-)
> -
> -diff --git a/pjnath/src/pjnath/stun_msg.c b/pjnath/src/pjnath/stun_msg.c
> -index c6b0bdd284..b55d29849a 100644
> ---- a/pjnath/src/pjnath/stun_msg.c
> -+++ b/pjnath/src/pjnath/stun_msg.c
> -@@ -1438,12 +1438,12 @@ static pj_status_t decode_uint_attr(pj_pool_t *pool,
> -     attr = PJ_POOL_ZALLOC_T(pool, pj_stun_uint_attr);
> -     GETATTRHDR(buf, &attr->hdr);
> - 
> --    attr->value = GETVAL32H(buf, 4);
> --
> -     /* Check that the attribute length is valid */
> -     if (attr->hdr.length != 4)
> -         return PJNATH_ESTUNINATTRLEN;
> - 
> -+    attr->value = GETVAL32H(buf, 4);
> -+
> -     /* Done */
> -     *p_attr = attr;
> - 
> -@@ -1757,14 +1757,15 @@ static pj_status_t decode_errcode_attr(pj_pool_t *pool,
> -     attr = PJ_POOL_ZALLOC_T(pool, pj_stun_errcode_attr);
> -     GETATTRHDR(buf, &attr->hdr);
> - 
> -+    /* Check that the attribute length is valid */
> -+    if (attr->hdr.length < 4)
> -+        return PJNATH_ESTUNINATTRLEN;
> -+
> -     attr->err_code = buf[6] * 100 + buf[7];
> - 
> -     /* Get pointer to the string in the message */
> -     value.ptr = ((char*)buf + ATTR_HDR_LEN + 4);
> -     value.slen = attr->hdr.length - 4;
> --    /* Make sure the length is never negative */
> --    if (value.slen < 0)
> --        value.slen = 0;
> - 
> -     /* Copy the string to the attribute */
> -     pj_strdup(pool, &attr->reason, &value);
> diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
> index 9935575567..2edd97bed4 100644
> --- a/package/libpjsip/libpjsip.hash
> +++ b/package/libpjsip/libpjsip.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  4178bb9f586299111463fc16ea04e461adca4a73e646f8ddef61ea53dafa92d9  pjproject-2.13.tar.gz
> +sha256  32a5ab5bfbb9752cb6a46627e4c410e61939c8dbbd833ac858473cfbd9fb9d7d  pjproject-2.13.1.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
> index 24db641446..f97d547fd7 100644
> --- a/package/libpjsip/libpjsip.mk
> +++ b/package/libpjsip/libpjsip.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBPJSIP_VERSION = 2.13
> +LIBPJSIP_VERSION = 2.13.1
>  LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.gz
>  LIBPJSIP_SITE = $(call github,pjsip,pjproject,$(LIBPJSIP_VERSION))
>  
> @@ -15,12 +15,6 @@ LIBPJSIP_CPE_ID_PRODUCT = pjsip
>  LIBPJSIP_INSTALL_STAGING = YES
>  LIBPJSIP_MAKE = $(MAKE1)
>  
> -# 0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch
> -LIBPJSIP_IGNORE_CVES += CVE-2022-23537
> -
> -# 0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch
> -LIBPJSIP_IGNORE_CVES += CVE-2022-23547
> -
>  LIBPJSIP_CFLAGS = $(TARGET_CFLAGS) -DPJ_HAS_IPV6=1
>  
>  # relocation truncated to fit: R_68K_GOT16O
> -- 
> 2.30.2
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
