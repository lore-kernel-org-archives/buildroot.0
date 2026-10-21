Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F7F606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 19:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=q7kCzAyG
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 974CA40F5C;
	Wed, 21 Oct 2026 19:38:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id axqWxTsadM11; Wed, 21 Oct 2026 19:38:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8025540EE8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792611488;
	b=hcytMy3mZMTpEx59Bpl+P+Iu4QWzwhlZ1zEysMp+qeGRqAyNNh/z68RkDzFtZ+SrRyTG
	 Rn6oQLygYIx0X8LrS1ddz1CwjEloEApRoHIgy0s2Igwur986/amGxToUzvX+K2TUrPtaF
	 I8dGtpvpqCP32pIC5H7jJdkDqXOwBwP36xfGOakTMNbnSlP14BMJBbHBrpnDkDApSRIgz
	 CxswC4UmVQgqRbjPNPV6y6rK2oEq8OEzxY7+y5l6VUvK/Cq7YV7ejH5mZU9lPowcL0Sqh
	 uliys34mN/8hgS04f4oXgGAymsp0vc4CoaxxwmdIRyc6XRUh0WxSUjx9hATe6+wti4w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792611488;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=+oVzZJrE8gIk1iCBO+cI2ci/CYy8xOUYQtII3FYmvdo=;
	b=F2AnaUrkR0tEJiwMOKfvKt/8kDXDrTagVu5+H/tB0jWlwUmPJ4gToj3y+w16POqRoVre
	 o6wvFruWgTxZPErqx1k46yDOzmm3MWlHEdaN03g2PfJnjFwzUn/NUcZFj+snLzBydMgKB
	 d/h51Bq+yhiwYxqBNFUGgdfS/4ZCEIOcVMpY4xvGTX9xTL4Q4kI/vmeGDpqE5f32xMNAT
	 qoprUXS9i4aA0YIFNSoG68Adi6UZ2sG/k6r7K8PJiE9K6Lv/en16eoyHLfgUWHmHGE04c
	 0hP1HloK+qTv6jAXVZv4Xxoek3qW2kRGeCzHj2JPMxZ2xt+DRG3AxFSFb8EAsavwx6Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792611488;
	bh=+oVzZJrE8gIk1iCBO+cI2ci/CYy8xOUYQtII3FYmvdo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=q7kCzAyGDvAz9FvJ4SCB9uS5q/XeMIafA22M4Jzu4UVHqnGtnokb191gozuAJXr0S
	 EZLW0iZW6XIP+ZsimSYZCS2kfgnXiA1MaRfA08bZOMIZ4+OrGRCAU/PI9Bl7/l77mG
	 jSZDjFuDdATyUIJWWxpf/X6AFwjqlSNgKkqsMdh3CYsAiTau1Y61Aq4GWWK3Ctm9Rv
	 wXIj3ONP6eBdd5M4gIM4cCx/R/ZrIUmQHJA1MsZZKs2/82Rz2yes+7nCaGYg3fAODj
	 +m1+dpLNQILe1zaMUD5uAfkSfyn1hfFtiiDNGaLJBSvAuTFEvFcX1Da9bXhzJtOZ0R
	 HmO9KUH4linXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8025540EE8;
	Wed, 21 Oct 2026 19:38:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E819235
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F36E860B0D
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:38:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aUtDkn5aS3R8 for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 19:38:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7F055605ED
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792611486;
 b=sN2PBtp459c7wzGg/z3j6bzGlsELkog7P5SCELOr0XAU6skMTE7Mcr7YMjTnJKpcqw/+
 72l+J5Tt1fJkpaQ4zJ+mque0q89w809Hn+7H5A8jHVyhYYb4Pt4G36f5Xqsm4Cuh3LWOz
 NlkayHq+eWAR7ycUd2/eRDz+E4ar6PZ0u8adtpio7Th4Zq1+iNg5Y599F7tf9rGv+fBZR
 nRi+VbxkP5m3LqDq6vVUI1ywwUVa/F7tlJzZS6jX5QFA2MYz5NqUvYc45Mu+U0rGhSL4Y
 cmXUd4xnFh+2GgBO/ZMecb0ys9X62ccieE6y9MPRcCSMMQOpU1PEKPGr7Dq/SSKt2dA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792611486;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=shA/lZ3KPmQxLv02h6pGThSB7280EeICNt4vygHLUnY=;
 b=qj4gS7ii+LBNHeOEzaQCiqnCbmIwAmgK3RryG0rUdhpUypy21zKnDiHOORP/thkh5TWA
 H4NrBzTUcmdy03oCLdL6es01fW5wObdbwfnpzgSCIsU3IFD0smihhfDrqd+MdXHhMFVyO
 a/qgPPWJ/RGJD//x0a7lmMt45n1uNSLHa19ZWq/tW5NegKaCq74S1YrtV8dhB1/7HGULR
 YzqsIdP+WAb6UN2/91P/dYCL1x0alwuimxwDgcVNA6oOpKLPyWGym+ZcwMeQaT/wHoSDw
 C0HEbxIqY+5vvIKESYvbXsUOE08+UNf+BVUzX9sRANHtPioxlRRvWi/Du7ZbQcZYdtg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=V69pCOuy; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F055605ED
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:38:03 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N8GQy-1wXRMg10Sm-016gT8; Wed, 21
 Oct 2026 21:37:54 +0200
Message-ID: <40656429-114a-4e9a-8b6b-b259d1fa1add@gmx.de>
Date: Wed, 21 Oct 2026 21:37:53 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Mark Corbin <mark@dibsco.co.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20261020202639.1094960-1-ju.o@free.fr>
 <20261020202639.1094960-4-ju.o@free.fr>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 xsFNBFrLsicBEADA7Px5KipL9zM7AVkZ6/U4QaWQyxhqim6MX88TxZ6KnqFiTSmevecEWbls
 ppqPES8FiSl+M00Xe5icsLsi4mkBujgbuSDiugjNyqeOH5iqtg69xTd/r5DRMqt0K93GzmIj
 7ipWA+fomAMyX9FK3cHLBgoSLeb+Qj28W1cH94NGmpKtBxCkKfT+mjWvYUEwVdviMymdCAJj
 Iabr/QJ3KVZ7UPWr29IJ9Dv+SwW7VRjhXVQ5IwSBMDaTnzDOUILTxnHptB9ojn7t6bFhub9w
 xWXJQCsNkp+nUDESRwBeNLm4G5D3NFYVTg4qOQYLI/k/H1N3NEgaDuZ81NfhQJTIFVx+h0eT
 pjuQ4vATShJWea6N7ilLlyw7K81uuQoFB6VcG5hlAQWMejuHI4UBb+35r7fIFsy95ZwjxKqE
 QVS8P7lBKoihXpjcxRZiynx/Gm2nXm9ZmY3fG0fuLp9PQK9SpM9gQr/nbqguBoRoiBzONM9H
 pnxibwqgskVKzunZOXZeqyPNTC63wYcQXhidWxB9s+pBHP9FR+qht//8ivI29aTukrj3WWSU
 Q2S9ejpSyELLhPT9/gbeDzP0dYdSBiQjfd5AYHcMYQ0fSG9Tb1GyMsvh4OhTY7QwDz+1zT3x
 EzB0I1wpKu6m20C7nriWnJTCwXE6XMX7xViv6h8ev+uUHLoMEwARAQABzSBGaW9uYSBLbHV0
 ZSA8ZmlvbmEua2x1dGVAZ214LmRlPsLBlAQTAQgAPgIbIwULCQgHAwUVCgkICwUWAgMBAAIe
 AQIXgBYhBOTTE4/i2fL6gVL9ke6nJs4hI1pYBQJn9S5IBQkQ6+MhAAoJEO6nJs4hI1pYvz0P
 /34nPCo/g0WbeJB6N75/1EkM9gDD1+lT4GdFEYYnCzslSxrIsL3kWuzG2kpqrErU8i7Ao/B2
 iE3J9NinRe613xlVUy2CU1VKaekm3YTkcfR7u8G/STNEQ42S46+3JRBMlLg1YldRsfVXq8tc
 jdwo193h4zrEeEmUDm8n43BPBhhwNRf+igtI8cNVyn9nBt6BrDnSswg497lrRjGjoP2zTkLT
 Q/Sb/6rCHoyFAxVcicA7n2xvaW0Pg0rTOrtA9mVku5J3zqyS4ABtoUwPmyoTLa7vpZdC33hy
 g7+srYNdo9a1i9OKF+CK9q/4auf3bMMeJB472Q5N8yuthM+Qx8ICySElyVDYSbbQIle/h/L7
 XYgm4oE1CxwiVCi8/Y/GOqhHt+RHLRGG1Ic+btNTiW+R+4W4yGUxL7qLwepIMY9L/0UcdnUa
 OBJk4waEX2mgOTmyjKR0FAGtaSH1ebz2UbY6pz5H9tZ4BIX7ZcQN0fLZLoi/SbbF+WJgT4cd
 8BooqbaNRoglaNCtTsJ7oyDesL9l0pzQb/ni1HGAXKW3WBq49r7uPOsDBP8ygyoAOYw4b/TX
 qUjJYpp9HcoQHv0sybSbXCFUMnL1E5WUhy8bBjA9fNtU43Fv3OR2n5/5xSn6o33XVMYMtkrN
 0AvEfAOGGOMJWktEYA7rxy0TQiy0ttUq0eQszsFNBGQ1Nr0BEADTlcWyLC5GoRfQoYsgyPgO
 Z4ANz31xoQf4IU4i24b9oC7BBFDE+WzfsK5hNUqLADeSJo5cdTCXw5Vw3eSSBSoDP0Q9OUdi
 PNEbbblZ/tSaLadCm4pyh1e+/lHI4j2TjKmIO4vw0K59Kmyv44mW38KJkLmGuZDg5fHQrA9G
 4oZLnBUBhBQkPQvcbwImzWWuyGA+jDEoE2ncmpWnMHoc4Lzpn1zxGNQlDVRUNnRCwkeclm55
 Dz4juffDWqWcC2NrY5KkjZ1+UtPjWMzRKlmItYlHF1vMqdWAskA6QOJNE//8TGsBGAPrwD7G
 cv4RIesk3Vl2IClyZWgJ67pOKbLhu/jz5x6wshFhB0yleOp94I/MY8OmbgdyVpnO7F5vqzb1
 LRmfSPHu0D8zwDQyg3WhUHVaKQ54TOmZ0Sjl0cTJRZMyOmwRZUEawel6ITgO+QQS147IE7uh
 Wa6IdWKNQ+LGLocAlTAi5VpMv+ne15JUsMQrHTd03OySOqtEstZz2FQV5jSS1JHivAmfH0xG
 fwxY6aWLK2PIFgyQkdwWJHIaacj0Vg6Kc1/IWIrM0m3yKQLJEaL5WsCv7BRfEtd5SEkl9wDI
 pExHHdTplCI9qoCmiQPYaZM5uPuirA5taUCJEmW9moVszl6nCdBesG2rgH5mvgPCMAwsPOz9
 7n+uBiMk0ZSyTQARAQABwsF8BBgBCAAmAhsMFiEE5NMTj+LZ8vqBUv2R7qcmziEjWlgFAmf1
 LrEFCQeCXvQACgkQ7qcmziEjWljtgBAAnsoRDd6TlyntiKS8aJEPnFjcFX/LqujnCT4/eIn1
 bpbIjNbGH9Toz63H5JkqqXWcX1TKmlZGHZT2xU/fKzjcyTJzji9JP+z1gQl4jNESQeqO1qEO
 kqYe6/hZ5v/yCjpv2Y1sqBnPXKcm21fkyzUwYKPuX9O1Sy1VmP1rMzIRQHXnNapJJWn0wJAW
 079YqdX1NzESJyj4stoLxIcDMkIEvOy3uhco8Bm8wS88MquJoR0KlyBR30QZy9KoxmTiWKws
 Mn6sy4aX9nac3W0pD+EyR+j/J9SWSvOENAmn4Km+ONxz93+oVLWb+KHtQQloxOsadO0wwiaZ
 xUT7vJcxSgjrHugSs+mOLznX/D8PfG/+tYLFlddphcOGldzH0rxKfs53BplAUe+LEZY1AU8p
 0WDK2h097ZQ0eZiVZlvAKSjwsjow2tpqwamtfNKrFg/GFRbNZcoQuYsf3vBW1CiZ5JQ6Vh2A
 bCn+vBDsJwD9Hcht1eVRxnIq745SQ0naL48Q3HGpKdXZpJoBQZ8bSAFhRSb3m+P4PE272rLY
 6FCkqS+UeX7RBpPkkIDoL7WS9HdvDHuQ751D56WkTnIpoF+sgW6tOEcfgFrYf3rVvh6G3B8S
 FPSOJuHYnwzMFrDNxQQKb0uS/j1s2dnlS55MouCvd5pShM5iRFzE7k3CMeS4NkhFim0=
In-Reply-To: <20261020202639.1094960-4-ju.o@free.fr>
X-Provags-ID: V03:K1:PvHsaJQS9hylGK/K8OegMcNAyANcuU2SaM0v9WPyOiM41h6X8or
 TfC5JfUaKV8Di19a3QxfdRbpaO9L018l25TRhvwgAXZs8X1O8xquyUr9hOUyXJXPZB9rSv7
 znCAaPtmyHsJMg5Z5ve2coKgW3Hb7Q5Jbh49qc2519DE7GkooCqSG0jMn1mePHLkUb1rr+/
 865rKDUBTKqcOfHr4Jvfw==
UI-OutboundReport: notjunk:1;M01:P0:k9HPUSGpWY0=;DUrUv76dWZCS6mH6n6IaOr0pvZp
 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
 9Ys=
Subject: Re: [Buildroot] [PATCH 4/4] arch/Config.in: change default target
 architecture to AArch64
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am 20.10.26 um 22:26 schrieb Julien Olivain via buildroot:
> This commit switches the default target architecture in arch/Config.in
> from i686 to AArch64. AArch64 is now one of the most common
> architecture on embedded Linux systems. The default CPU for this
> architecture remains the Cortex-A53 (Armv8.0).

Seems reasonable to me. And in any case AArch64 is way more common than 
i386. ;-)

Reviewed-by: Fiona Klute <fiona.klute@gmx.de>

> While at it, this commit also refreshes the .defconfig to:
> - align to this new default,
> - remove stale options (BR2_alpha, BR2_cris, BR2_ia64)
> - add the missing options
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>   .defconfig     | 60 ++++++++++++++++++++------------------------------
>   arch/Config.in |  2 +-
>   2 files changed, 25 insertions(+), 37 deletions(-)
> 
> diff --git a/.defconfig b/.defconfig
> index d25c62e104..56785b2bc3 100644
> --- a/.defconfig
> +++ b/.defconfig
> @@ -1,50 +1,38 @@
>   #
> -# Automatically generated make config: don't edit
> -# Mon Feb 18 09:11:56 2008
> +# Automatically generated file; DO NOT EDIT.
> +# Buildroot 2026.08 Configuration
>   #
>   BR2_HAVE_DOT_CONFIG=y
> -# BR2_alpha is not set
> +
> +#
> +# Target options
> +#
> +# BR2_arcle is not set
>   # BR2_arm is not set
>   # BR2_armeb is not set
> -# BR2_cris is not set
> -# BR2_ia64 is not set
> -BR2_i386=y
> +BR2_aarch64=y
> +# BR2_aarch64_be is not set
> +# BR2_hppa is not set
> +# BR2_i386 is not set
> +# BR2_loongarch64 is not set
>   # BR2_m68k is not set
> +# BR2_microblazeel is not set
> +# BR2_microblazebe is not set
>   # BR2_mips is not set
>   # BR2_mipsel is not set
> +# BR2_mips64 is not set
> +# BR2_mips64el is not set
> +# BR2_or1k is not set
>   # BR2_powerpc is not set
> +# BR2_powerpc64 is not set
> +# BR2_powerpc64le is not set
> +# BR2_riscv is not set
> +# BR2_s390x is not set
>   # BR2_sh is not set
>   # BR2_sparc is not set
>   # BR2_sparc64 is not set
>   # BR2_x86_64 is not set
> -# BR2_x86_i486 is not set
> -# BR2_x86_i586 is not set
> -BR2_x86_i686=y
> -# BR2_x86_pentiumpro is not set
> -# BR2_x86_pentium_mmx is not set
> -# BR2_x86_pentium_m is not set
> -# BR2_x86_pentium2 is not set
> -# BR2_x86_pentium3 is not set
> -# BR2_x86_pentium4 is not set
> -# BR2_x86_prescott is not set
> -# BR2_x86_nocona is not set
> -# BR2_x86_core2 is not set
> -# BR2_x86_k6 is not set
> -# BR2_x86_k6_2 is not set
> -# BR2_x86_athlon is not set
> -# BR2_x86_athlon_4 is not set
> -# BR2_x86_opteron is not set
> -# BR2_x86_opteron_sse3 is not set
> -# BR2_x86_barcelona is not set
> -# BR2_x86_geode is not set
> -# BR2_x86_c3 is not set
> -# BR2_x86_winchip_c6 is not set
> -# BR2_x86_winchip2 is not set
> -BR2_ARCH="i686"
> +# BR2_xtensa is not set
> +BR2_ARCH_HAS_TOOLCHAIN_BUILDROOT=y
> +BR2_ARCH="aarch64"
>   BR2_ENDIAN="LITTLE"
> -BR2_GCC_TARGET_TUNE="i686"
> -BR2_GCC_TARGET_ARCH="i686"
> -
> -#
> -# Target options
> -#
> diff --git a/arch/Config.in b/arch/Config.in
> index 7bfa174b5f..0f1697597e 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -17,7 +17,7 @@ config BR2_ARCH_HAS_FDPIC_SUPPORT
>   
>   choice
>   	prompt "Target Architecture"
> -	default BR2_i386
> +	default BR2_aarch64
>   	help
>   	  Select the target architecture family to build for.
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
