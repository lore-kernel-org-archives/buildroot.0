Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD602CDE00B
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 23:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A47BC40EB9;
	Thu, 25 Jun 2026 23:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JjtPLFDGno8s; Thu, 25 Jun 2026 23:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCF8E40EB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782428546;
	bh=0qAqygC0vVBUWpgDSLr+fY9XXFTeVTitayYyGsWiKT4=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=a127uIBsGYbuTfEs8V1h6gLJj72iBOE52yX1ePpVe0irCOJWo6olVHmEf8jpsATcS
	 ra8WbUVBSos4BA+UHkux16ry+w9u5AjazG8OPvuxPrgyC0urUWjpc4XenraCgdIXAK
	 X6ggFHxPNwb18SQvoDTEuFpr0CN0JOoFL2+kOTqDhPKgXRvomS9OnPoH3a4W4Pjwnw
	 seOHthmRXHAWXi4B0aY9d9Ta5hz5Ur4dE8VYlcKm/OmjozBibPn66Dxu5NcnM6D1Nc
	 EjQrto7JselhiL8JvqMPe8TJHmiAR92ekYObzHpZsiSIh712neXdkQMoQNcnERgv7p
	 k63SpAFRLebyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCF8E40EB0;
	Thu, 25 Jun 2026 23:02:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 54122369
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 23:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44ED3403EC
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 23:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q9XwnXNpIdJy for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 23:02:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B322A4006F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B322A4006F
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B322A4006F
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 23:02:24 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M9Wuq-1wXNJ10zjw-004Q3c; Fri, 26
 Jun 2026 01:02:19 +0200
Message-ID: <8756a1d1-be0c-4f54-8ea7-a88d1d4c063b@gmx.de>
Date: Fri, 26 Jun 2026 01:02:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20260622071111.3533445-1-peter@korsgaard.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260622071111.3533445-1-peter@korsgaard.com>
X-Provags-ID: V03:K1:03n0X6XcQjT7sWeILDcqk6ynhZo5S82cVdfeOagxyIho6b0XjxD
 d+M7iEiHfKtiiNmcts/mMqMYy7mDkU5USkR9cclOEy4Ko2Gl9T9LwHPpRKbwgR66jM/yFcN
 SjeVhbviq0PUWr1I4QOXX87CJux5by7VhSMsVDNjFY7/uJmvYuNNoftglzbAlYvr8ZaeR4n
 Sc3QJNdyaXpO2AtLJ2Ymw==
UI-OutboundReport: notjunk:1;M01:P0:obrD1xC99tI=;oATo3siuCc7SkJbHJHwmVIHQLFE
 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
 1+t6lJVP8EVJgHcyTEml77Hf3z+UyNQXbfW8bBr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1782428539; x=1783033339; i=fiona.klute@gmx.de;
 bh=LnVQOXDRcOMx+zSKN+SW6PstnKZW5fZRrs+u1X1cHI4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=s6xtQUiUDqY21R4wZyDvm8tcXZsEJosAWrLlSHn92h57vwo+FVeXRmGoIRkHWoRU
 OU23kKudcj7yzJdvWzrwamy6GdRk3cm1P+8veygvORnZlOE1rCprVHL5PKoF8enqB
 2tASpbJQwHTvvunI6FVACUrcB4nV8NHPNfyRgsjc/p8ZkUVcypkOR19zIyVIMwczm
 MyENLGq5+DpZwxD1UjhR7D1tm1WFuMG/uTA+nW1Hx3cagUMe6kGrZ1XBXT/O4Vy4O
 LQGke1r29+Lj+vTpTKaHL1LxQvMGSdVkq2ob1ImwZKJGslQZAbryzAdCs86lJwcTp
 cX2tdZNDe1CTeLMEhQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=s6xtQUiU
Subject: Re: [Buildroot] [PATCH] package/jose: version bump to 15
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

Am 22.06.26 um 09:11 schrieb Peter Korsgaard:
> Release notes:
> https://github.com/latchset/jose/releases/tag/v15
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thank you!

> ---
>   package/jose/jose.hash | 2 +-
>   package/jose/jose.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/jose/jose.hash b/package/jose/jose.hash
> index 0bee7f46e8..016807c328 100644
> --- a/package/jose/jose.hash
> +++ b/package/jose/jose.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  cee329ef9fce97c4c025604a8d237092f619aaa9f6d35fdf9d8c9052bc1ff95b  jose-14.tar.xz
> +sha256  1d055c445392aa48d709ecd6e56220384ae2b480496e270818bddf1f219c8659  jose-15.tar.xz
>   sha256  09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  COPYING
> diff --git a/package/jose/jose.mk b/package/jose/jose.mk
> index 88050be5ed..486765aa9a 100644
> --- a/package/jose/jose.mk
> +++ b/package/jose/jose.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -JOSE_VERSION = 14
> +JOSE_VERSION = 15
>   JOSE_SOURCE = jose-$(JOSE_VERSION).tar.xz
>   JOSE_SITE = https://github.com/latchset/jose/releases/download/v$(JOSE_VERSION)
>   JOSE_LICENSE = Apache-2.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
