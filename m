Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EB1C3DA64
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 09:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E93F4004A;
	Sun, 21 Jul 2024 09:39:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SyMa3iNV_Xne; Sun, 21 Jul 2024 09:39:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06332404A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06332404A0;
	Sun, 21 Jul 2024 09:39:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8CF371BF31B
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 09:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 791DC400FB
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 09:39:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kmuhy-MBojBU for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 09:39:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4AC5B400F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AC5B400F9
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4AC5B400F9
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 09:39:51 +0000 (UTC)
Received: from localhost (unknown [10.0.8.3])
 by mail.tkos.co.il (Postfix) with ESMTP id BEAA744046D;
 Sun, 21 Jul 2024 12:38:41 +0300 (IDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20240721090024.371743-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 21 Jul 2024 11:00:24 +0200")
References: <20240721090024.371743-1-fontaine.fabrice@gmail.com>
Date: Sun, 21 Jul 2024 12:39:46 +0300
Message-ID: <8734o3ozh9.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1721554721;
 bh=PZSnPmqdlu1wAKjaPvIsUunFQkH2P0LT34B3HMppHHg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=momg7JBe9yocidZ2q1EikPvnWTIreCcoZCkD/Gu5Fd62ARmn0BDh3Ov1AM8yAHrPH
 btylO0Gc+Uk0iRnS03o8OwOUUC2d2cSzdjvuBhWz9ULydKVioY91HCk71IkWO/ADeN
 c8kGgXlisuTVANfhK/WpmNfbKra6k3u301q6nl1/cCe+hd45HmGZAV22w/NH8GLNmL
 bSCDemCLraj+M7i50zyI0WUmVJSQ4tsgrj7dc3wDGKMBCDpqmXne3bxmUCTFhdU8My
 DJ8Qt9kS3ndMllWttoGarNFF6n0qH4KEk9roiYfuMF8QrHiUThuuogV9/ALs4iw6Oe
 0IF4ulbHXaKNQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=momg7JBe
Subject: Re: [Buildroot] [PATCH 1/1] Revert "package/gnutls: add tpm2-tss
 optional dependency"
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

On Sun, Jul 21 2024, Fabrice Fontaine wrote:
> This reverts commit caff4179a4481233257f5f475ca57ce9061af900 as the
> following circular dependency is created if BR2_PACKAGE_TPM2_TSS_FAPI
> is selected: tpm2-tss -> libcurl -> gnutls -> tmp2-tss
> resulting in the following build failure of libcurl or rtmpdump:
>
> configure: error: TLS not detected, you will not be able to use HTTPS, FTPS, NTLM and more.
> Use --with-openssl, --with-gnutls, --with-wolfssl, --with-mbedtls, --with-schannel, --with-secure-transport, --with-amissl, --with-bearssl or --with-rustls to address this.
>
> [...]
>
> In file included from rtmp.c:32:
> rtmp_sys.h:110:10: fatal error: gnutls/gnutls.h: No such file or directory
>   110 | #include <gnutls/gnutls.h>
>       |          ^~~~~~~~~~~~~~~~~
>
> Fixes: caff4179a4481233257f5f475ca57ce9061af900
>  - http://autobuild.buildroot.org/results/72e1843de650c9ed4795f1141e9fd485b71a14c3
>  - http://autobuild.buildroot.org/results/918f0f7efa810b17f6d2266a890bf0150cbed146

Thanks for investigating this issue. One comment below.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gnutls/gnutls.mk | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
> index 8302194812..8a4f3345aa 100644
> --- a/package/gnutls/gnutls.mk
> +++ b/package/gnutls/gnutls.mk
> @@ -57,7 +57,6 @@ HOST_GNUTLS_CONF_OPTS = \
>  	--without-librt-prefix \
>  	--without-libz-prefix \
>  	--without-tpm \
> -	--without-tpm2 \

I guess we should leave this here to make it explicit we do not support
tpm2 for host. More importantly, I think we also need unconditional
--without-tpm2 in GNUTLS_CONF_OPTS.

baruch

>  	--disable-openssl-compatibility \
>  	--without-libbrotli \
>  	--without-idn \
> @@ -99,13 +98,6 @@ else
>  GNUTLS_CONF_OPTS += --without-p11-kit
>  endif
>  
> -ifeq ($(BR2_PACKAGE_TPM2_TSS),y)
> -GNUTLS_CONF_OPTS += --with-tpm2
> -GNUTLS_DEPENDENCIES += tpm2-tss
> -else
> -GNUTLS_CONF_OPTS += --without-tpm2
> -endif
> -
>  ifeq ($(BR2_PACKAGE_ZLIB),y)
>  GNUTLS_CONF_OPTS += --with-zlib
>  GNUTLS_DEPENDENCIES += zlib

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
