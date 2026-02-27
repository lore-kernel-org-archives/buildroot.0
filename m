Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1CEFD530A
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 19:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15C9840CC2;
	Fri, 27 Feb 2026 19:38:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UIz91A_OVmzA; Fri, 27 Feb 2026 19:38:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28C7140D4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772221094;
	bh=F0EDxEuM0xQi4zolc5zc4p56PxB+ojLgOS1BzpDP6ck=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HRfpYGv95d22bPuwbmxyfhMQXbfp/HU2ZTi2LFJPQOiqcjP86EoC2ft9Y7EnLBCsb
	 XeAIBPcN8Gf/Kfc4h0Q/DRcVNSJuEN/l52TKecDYVPym/pWgJUAYs4oQI41x3Sj7K4
	 lNOpEkWmx2gcPoDFOuGZdgWbOhJoFky/i0dJI9QxacNcjWn86NYK/ZYxd7s4dQUF83
	 zlkPyUkjrBe/3rWFZ9Y9a2S/3dDe9ZDHbO5vBYSvxh3C3aiLM+CcTbXDMTeB3tpmzB
	 Mu+WB4IaP8a6NSa7fNQmQWTYqZOcIBlP6prloEBkrZGXa916U/3NukC043OoWVHMnU
	 RxWnJlox77MdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28C7140D4B;
	Fri, 27 Feb 2026 19:38:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 37B4C204
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29BBF83231
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M5vJoNHiY-EL for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 19:38:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 07337828B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07337828B5
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07337828B5
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:38:11 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MORAU-1wLpbe2TWw-00THda; Fri, 27
 Feb 2026 20:38:04 +0100
Message-ID: <03350111-239f-482b-899b-a7a140fb8984@gmx.de>
Date: Fri, 27 Feb 2026 20:38:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com
Cc: buildroot@buildroot.org, Titouan Christophe <titouan.christophe@mind.be>
References: <cover.1771588390.git.yann.morin@orange.com>
 <ab05c9e4712a533a581a956f978c383aa18ef7ab.1771588390.git.yann.morin@orange.com>
 <03570aeb-5b6d-4a89-8280-9767c7df1f60@gmx.de> <aZvyDIf5TwafuKj+@yd-6wlzhs3>
 <aZxiWjuS+5JFqKP/@yd-6wlzhs3>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <aZxiWjuS+5JFqKP/@yd-6wlzhs3>
X-Provags-ID: V03:K1:jbsIU0HWpIBKZSHFWHyrxoSKuRF3DwmD2xSrKZ/xqAa+5raEUdZ
 YGXuqQK3yJIwZ6JpEpKZaxIIQf43odvBPaDb5bkFjLMYZlXlNRmHOZehEwH0dus2C1703iT
 Pi9/+SxusUlJJWYRrXS0INK7sDIddxavohbwXx6jL6kiPJQZWvd/gGnuQt+0U19pWvXL4AI
 z0nXDZ8Ba7pyddKlDe5Sw==
UI-OutboundReport: notjunk:1;M01:P0:1C/cYjxkcYc=;x6WCFlaUVy1KC1aDQ0bE0uAGqir
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1772221088; x=1772825888; i=fiona.klute@gmx.de;
 bh=HMdlBThqXU6b44xHrciwWI+sAXOBcIpC4jf/2Ex4pPQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=VhP7wbCi6K1/Y4k34PKBtSMwnG3IJ8j5P85qFiCyu0GIKdADmolPmRJ7SiYZdflj
 ubOk7mgFu4FQ61qkf1ldcvEq2Me/QQIA6fKQ7ilwjXv9RuHrC8eWORRu/HzD/Vcvc
 Itb0QjQRdQ8pcOTWlsRMRBu/kefAjHONGQoGUnsXIneOLvrIFOVxDIprLnXo3TDOC
 Mjrc9G1TQl7TqX33uGP8T5xoSWmgw0q5U/DP2IEXtbPYK88FzBFA2XO86InaG11wL
 jpyZF0wMxwiEd1vfwp5JwR7VcVl2rL2oiPD1HiBOUT9r3Gk2xGybrU2clYBtbNpK+
 g5QCQasAKdcLzGjyFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=VhP7wbCi
Subject: Re: [Buildroot] [PATCH 4/8] package/mosquitto: add option to build
 broker-related apps
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

Am 23.02.26 um 15:21 schrieb yann.morin@orange.com:
> Finoa, All,
> 
> On 2026-02-23 07:22 +0100, MORIN Yann INNOV/IT-S spake thusly:
>> On 2026-02-20 18:15 +0100, Fiona Klute spake thusly:
>>> Am 20.02.26 um 12:53 schrieb yann.morin@orange.com:
>>>> From: "Yann E. MORIN" <yann.morin@orange.com>
>> [--SNIP--]
>>>> +	  Additionally, when TLS is enabled, the following apps are
>>>> +	  also installed:
>>>> +	    mosquitto_ctrl
>>>> +	    mosquitto_passwd
>>> It might be helpful to include a note like
>>> "enable BR2_PACKAGE_OPENSSL to build TLS support" in the main
>>> BR2_PACKAGE_MOSQUITTO help, too.
> 
> In the end, I did not address that part: we don't mention it for any
> other server that has optional TLS support. For example, there is not
> such mention in apache. It is indeed somewhat obvious that, if one needs
> TLS support in the server, the implementation of choice is openssl.
> 
> Of course, it is somewhat different for the tools, where it indeed makes
> sense to have a note about that, so I changed from "if TLS is enabled"
> to "if openssl is enabled".
That seems reasonable to me, thank you!

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
