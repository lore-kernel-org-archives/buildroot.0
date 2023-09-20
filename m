Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8989BC04AB8
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 17:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31C2161342;
	Wed, 20 Sep 2023 17:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31C2161342
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pD410idYAkeR; Wed, 20 Sep 2023 17:42:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B8BD60774;
	Wed, 20 Sep 2023 17:42:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B8BD60774
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 472E41BF95F
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 17:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28A9141FAC
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 17:42:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28A9141FAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jV4NXDAscXJy for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 17:42:16 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB1CD41FAA
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 17:42:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB1CD41FAA
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:a117:66c:8b6b:25fb])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id F024660167;
 Wed, 20 Sep 2023 19:42:11 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 20 Sep 2023 19:42:11 +0200
Date: Wed, 20 Sep 2023 19:42:11 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230920174211.GJ512384@scaer>
References: <20230919204910.444965-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230919204910.444965-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695231734;
 bh=Srtp3qIuKLqJcrH69j4azlhvq/IbRoXU2mSk0tn5ARw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mqj2fxZ71I+hiQwIzCxWoJSoy+P7XDCeVOEEe6KWe8k+f4JIh2IbgV9DLzco5L+Pf
 hsxSYO97f4k7hxAGxzl/+EL0PJP3UFQFknb6bVl7qP8pffRiiBX8UeA1egVTG5jSxS
 a4ug6GyZ91raGJfYPWuUFpzjtrByG89XDftIZyz3YcstLROhybMJXu/T5Wln7ZJa+Y
 imnMZKqnV1hgrdIRYiY3oX4dRkHK6Yn8bjzVlMmhKuE71VC7ECqhw2A6Y0lKya02CC
 3mSK23tcoILKUSz0TjFxW4ftdefYASlI3PZDMmp1bBcqMjbZe0VmkX52Omk9TatqbF
 2/hQaA+kFsz2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Mqj2fxZ7
Subject: Re: [Buildroot] [PATCH 1/1] package/opensc: fix CVE-2023-2977
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

On 2023-09-19 22:49 +0200, Fabrice Fontaine spake thusly:
> A vulnerability was found in OpenSC. This security flaw cause a buffer
> overrun vulnerability in pkcs15 cardos_have_verifyrc_package. The
> attacker can supply a smart card package with malformed ASN1 context.
> The cardos_have_verifyrc_package function scans the ASN1 buffer for 2
> tags, where remaining length is wrongly caculated due to moved starting
> pointer. This leads to possible heap-based buffer oob read. In cases
> where ASAN is enabled while compiling this causes a crash. Further info
> leak or more damage is possible.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...alculation-to-fix-buffer-overrun-bug.patch | 51 +++++++++++++++++++
>  package/opensc/opensc.mk                      |  3 ++
>  2 files changed, 54 insertions(+)
>  create mode 100644 package/opensc/0004-pkcs15init-correct-left-length-calculation-to-fix-buffer-overrun-bug.patch
> 
> diff --git a/package/opensc/0004-pkcs15init-correct-left-length-calculation-to-fix-buffer-overrun-bug.patch b/package/opensc/0004-pkcs15init-correct-left-length-calculation-to-fix-buffer-overrun-bug.patch
> new file mode 100644
> index 0000000000..079f960b59
> --- /dev/null
> +++ b/package/opensc/0004-pkcs15init-correct-left-length-calculation-to-fix-buffer-overrun-bug.patch
> @@ -0,0 +1,51 @@
> +From 81944d1529202bd28359bede57c0a15deb65ba8a Mon Sep 17 00:00:00 2001
> +From: fullwaywang <fullwaywang@tencent.com>
> +Date: Mon, 29 May 2023 10:38:48 +0800
> +Subject: [PATCH] pkcs15init: correct left length calculation to fix buffer
> + overrun bug. Fixes #2785
> +
> +Upstream: https://github.com/OpenSC/OpenSC/commit/81944d1529202bd28359bede57c0a15deb65ba8a
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/pkcs15init/pkcs15-cardos.c | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/pkcs15init/pkcs15-cardos.c b/src/pkcs15init/pkcs15-cardos.c
> +index 9715cf390f..f41f73c349 100644
> +--- a/src/pkcs15init/pkcs15-cardos.c
> ++++ b/src/pkcs15init/pkcs15-cardos.c
> +@@ -872,7 +872,7 @@ static int cardos_have_verifyrc_package(sc_card_t *card)
> + 	sc_apdu_t apdu;
> +         u8        rbuf[SC_MAX_APDU_BUFFER_SIZE];
> +         int       r;
> +-	const u8  *p = rbuf, *q;
> ++	const u8  *p = rbuf, *q, *pp;
> + 	size_t    len, tlen = 0, ilen = 0;
> + 
> + 	sc_format_apdu(card, &apdu, SC_APDU_CASE_2_SHORT, 0xca, 0x01, 0x88);
> +@@ -888,13 +888,13 @@ static int cardos_have_verifyrc_package(sc_card_t *card)
> + 		return 0;
> + 
> + 	while (len != 0) {
> +-		p = sc_asn1_find_tag(card->ctx, p, len, 0xe1, &tlen);
> +-		if (p == NULL)
> ++		pp = sc_asn1_find_tag(card->ctx, p, len, 0xe1, &tlen);
> ++		if (pp == NULL)
> + 			return 0;
> + 		if (card->type == SC_CARD_TYPE_CARDOS_M4_3)	{
> + 			/* the verifyRC package on CardOS 4.3B use Manufacturer ID 0x01	*/
> + 			/* and Package Number 0x07					*/
> +-			q = sc_asn1_find_tag(card->ctx, p, tlen, 0x01, &ilen);
> ++			q = sc_asn1_find_tag(card->ctx, pp, tlen, 0x01, &ilen);
> + 			if (q == NULL || ilen != 4)
> + 				return 0;
> + 			if (q[0] == 0x07)
> +@@ -902,7 +902,7 @@ static int cardos_have_verifyrc_package(sc_card_t *card)
> + 		} else if (card->type == SC_CARD_TYPE_CARDOS_M4_4)	{
> + 			/* the verifyRC package on CardOS 4.4 use Manufacturer ID 0x03	*/
> + 			/* and Package Number 0x02					*/
> +-			q = sc_asn1_find_tag(card->ctx, p, tlen, 0x03, &ilen);
> ++			q = sc_asn1_find_tag(card->ctx, pp, tlen, 0x03, &ilen);
> + 			if (q == NULL || ilen != 4)
> + 				return 0;
> + 			if (q[0] == 0x02)
> diff --git a/package/opensc/opensc.mk b/package/opensc/opensc.mk
> index 32f0fdaa8b..823bc50102 100644
> --- a/package/opensc/opensc.mk
> +++ b/package/opensc/opensc.mk
> @@ -15,4 +15,7 @@ OPENSC_DEPENDENCIES = openssl pcsc-lite
>  OPENSC_INSTALL_STAGING = YES
>  OPENSC_CONF_OPTS = --disable-cmocka --disable-strict --disable-tests
>  
> +# 0004-pkcs15init-correct-left-length-calculation-to-fix-buffer-overrun-bug.patch
> +OPENSC_IGNORE_CVES += CVE-2023-2977
> +
>  $(eval $(autotools-package))
> -- 
> 2.40.1
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
