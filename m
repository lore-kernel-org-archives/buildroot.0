Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A19C43458
	for <buildroot@archiver.kernel.org>; Thu,  9 Jul 2026 08:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65FBE81E13;
	Thu,  9 Jul 2026 08:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5_yH75Rlb3A2; Thu,  9 Jul 2026 08:43:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AD6581E19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783586621;
	bh=aLssvHr7ulJjqKsDAi7rGd7v4vdNKWH4Ykvv1zt8Km8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kIYQooSsF7zEarheVSNkg9JlBjpAd/9VSNM5/3Ccj7/6/ocTNzFW86OgosBhwd6ME
	 akO4LgUk07KZTxECSOiW0Ut6nmtA5epztgcngMnaBNBSTzj1HagUpEgr274vlU3C3C
	 AurbIio9I4WxMsNlpviTH4mfTJ3Pb9eiBz4ZxSSXe+gYVuAXG/x/IuNRfJXLHO5Dok
	 75USYNPeoeoemtAMh4syVt6VMGHBYdTChgPhruP55nqvKdBPvc8smmSheSqx+YfqKp
	 jkXNuFGERnirPkWzUJdfonXCldS8e3/WzhZIo5qa/O6SYOca+sKegtYyN7/nOeKyxl
	 t864FpYukcKfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AD6581E19;
	Thu,  9 Jul 2026 08:43:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 41DF62E5
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 08:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 275F660E13
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 08:43:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oG8vFvmb4tCn for <buildroot@buildroot.org>;
 Thu,  9 Jul 2026 08:43:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 401B260DED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 401B260DED
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 401B260DED
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 08:43:32 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Msq6M-1wxCsF03Vw-0166pp; Thu, 09
 Jul 2026 10:43:31 +0200
Message-ID: <75405e29-81ac-41e8-8f3b-5c6de3807a8e@gmx.de>
Date: Thu, 9 Jul 2026 10:43:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260707100837.3332387-1-dario.binacchi@amarulasolutions.com>
 <20260707100837.3332387-2-dario.binacchi@amarulasolutions.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260707100837.3332387-2-dario.binacchi@amarulasolutions.com>
X-Provags-ID: V03:K1:v3ZuCFp/O/ajm4ZNnxX8m/2/DJ5MH0ka86myVjYdwt30fZNuKBN
 SV57ymEYn+g17QN/hGT/npyrCqUFtOW4YfshgPRCn9RmqcoJfWDAe6aXAMQxHLKxmchHjY2
 GhX1dtVfoOhtwDa9Ojld5qqnbZ370G1cTyGf/x6S4IhiQXTi2sXYq0F+eD5LPK+/NKtWwIv
 ulmt381QjF3AVpG7UwjJA==
UI-OutboundReport: notjunk:1;M01:P0:zUmsg7atbno=;Yhe/ulMFZ8qoN7wq4iJSthPlHaR
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1783586611; x=1784191411; i=fiona.klute@gmx.de;
 bh=9kelYGnmpxxBBo94+Xi12eScaYxoU6tLDyeA2G+Irfw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=dlfW6F7Q7tsYVpRtkzXkGUq97UrUa70Z0ZBD2Va17rO1NJov0cfpUTjKMMCK++cC
 ABVYnjjRSoyUYVP0YfUMvKXmyl8Gg3PHTKRp+lbSMUFHpEXecRxCiexUMmqf3Bi7f
 bB537wMwVIK61MhxQJVx4ct8HWgAfHPLWaIefpjedM4J6KObU8OFQ6cnl0Azqlx94
 BzNaJWjEN8HrSbXcGpBlCv/Uc9FrAq7U01iTHSVFpgHALD2i/YJ4XglrkMBHnG7PA
 LcK7JIeQB93fiVAw4xDfBU+tKjK9t8+KZ2lUN21XtAeLM94HuoMKznUGzXBVo+/xe
 ERuo4yolr9wtgEDWWQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=dlfW6F7Q
Subject: Re: [Buildroot] [PATCH 2/3] package/gnutls: allow enabling
 host-p11-kit support
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario!

Am 07.07.26 um 12:08 schrieb Dario Binacchi:
> Add a new BR2_PACKAGE_HOST_GNUTLS_P11_KIT option to enable the
> host-p11-kit dependency while preserving backward compatibility by
> keeping p11-kit support disabled by default.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>   package/gnutls/Config.in | 3 +++
>   package/gnutls/gnutls.mk | 7 ++++++-
>   2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
> index 59af32bf1efb..93f2287bf80d 100644
> --- a/package/gnutls/Config.in
> +++ b/package/gnutls/Config.in
> @@ -39,3 +39,6 @@ endif
>   
>   comment "gnutls needs a toolchain w/ wchar, dynamic library"
>   	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
> +
> +config BR2_PACKAGE_HOST_GNUTLS_P11_KIT
> +	bool
> diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
> index 6411a7d62115..71d602825cf2 100644
> --- a/package/gnutls/gnutls.mk
> +++ b/package/gnutls/gnutls.mk
> @@ -64,10 +64,15 @@ HOST_GNUTLS_CONF_OPTS = \
>   	--disable-openssl-compatibility \
>   	--without-brotli \
>   	--without-idn \
> -	--without-p11-kit \
>   	--without-zlib \
>   	--without-zstd
>   
> +ifeq ($(BR2_PACKAGE_HOST_GNUTLS_P11_KIT),y)
> +HOST_GNUTLS_DEPENDENCIES += host-p11-kit

You should explicitly enable p11-kit support in this branch, so any 
(configure/build time) problem with that shows up immediately.

Series looks good to me otherwise, but I didn't get to test it yet.

Best regards,
Fiona

> +else
> +HOST_GNUTLS_CONF_OPTS += --without-p11-kit
> +endif
> +
>   ifeq ($(BR2_PACKAGE_GNUTLS_OPENSSL),y)
>   GNUTLS_LICENSE += , GPL-3.0+ (gnutls-openssl library)
>   GNUTLS_LICENSE_FILES += COPYING

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
