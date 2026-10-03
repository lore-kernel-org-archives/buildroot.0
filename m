Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A7CCA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 09:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD9BE60657;
	Sat,  3 Oct 2026 09:38:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gjo20hJADIp8; Sat,  3 Oct 2026 09:38:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 90DC76067B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791020314;
	b=o5K6wotlPFWUuLDd0+K+FYGIZBDwzXHDUf63LJiCYM0h3adUz4bAuU7BSksmtdRj6OVk
	 I4M2bQqSXaTbSHkxvGcTeyAveHTIUsnjgGANoiQ3YKEWqHqw0QwlzMckoYo9m4p84/4BP
	 VSUbkkACzXVVRhO3OwU1+DiTKgY8OHEFbBBN72+qBCmdZ/PKfO7zbV/Wdd4j7ArqE9Vub
	 q8Ch1wqC4Xjlmv4MXIhu7/TTXlKfKTBGfp3wfjstxEGlXxkM4fUghYp1lbbVF5CitHM18
	 jRKArSI3NOxwjo0JWD2TrTbVs4as9+WcwkVvgZrZm/N2dLGaTIFQRuZ4d2G4eFvhWPA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791020314;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=iptvhTboAalqpRuPceSs1vvZZwXeVxBUSu46CtiMFDM=;
	b=XL2PyktqXilv2fYDAX5onoqiQidQont9vl5Yw2/nnP7OF7Rfa1yHiw+OciMk7Yb2D5P0
	 nWFv9hL9jChw2aAtlHXjX8QSCM95nl4HkYLYBhSSKPUjsfyb+dgeoJGLjzTR3M/gdjRFu
	 znBzkbGKEF0OJg0VMS4VOIyZWIaDjtZ2G8eewPlbN8WpvJ1XpKGT357SvgYLOWNeuY4R7
	 es3q5cv7XCjXcpj6fInkcc5jNPlxmQenEmosWmjjW6Oj53GyBLrQIrA3sj40rM3kErbIp
	 akw9o7D7ZmXUj3DLCFgGRx8pUD0OBBL9C5U92V5wPmWwC6oMn5I5C0U+fczk1c448fQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791020314;
	bh=iptvhTboAalqpRuPceSs1vvZZwXeVxBUSu46CtiMFDM=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=mSaeiamLnxxnl+5/vQ0q+lZroavJVmbLdluoih3ecmzGlUvJNtmk+6x3LNMgRLqjd
	 yTQ4mQWnCNkkTX0XdBhZl2NB0InYSf9xRGc+3jQ9gus/4hlBzan84lu18g+xxLeY54
	 Oa1JIWkKaCqbdPN8mn33F9wCq0Scx/9FBysTThQ0uu4CR44A/NKyDFeCeJ0doe0j7A
	 B4+4yHRgT4WUOHh/ar1WFZMpSAqbEb5pBhpPt1SF1Xuyx7o4GtMLYheBNrGKP7rFh7
	 OOqLASJoWekB3sgOSdLoWmz866yDr6wJUpgt4BxOvucB8PSnN1pPY3SFZN5inQfWjy
	 4/iZyLpG2rlFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90DC76067B;
	Sat,  3 Oct 2026 09:38:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9EF23335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 09:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8555E810F2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 09:38:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rKg9WTB_Cuny for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 09:38:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 30D518112F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791020311;
 b=UQaWkv/d63Bmc8qNTayJAsbnnYvwpa71ygmn5AWFAYc2inKne6/CEMdvZ9wWHW943pf6
 tiCZ8C5BH3s41jFYU4iKs7SJdOA4tn3SVuxsUk+lBA43sGvqJZFdlSiZsD3syo+IGk75b
 p1mS8aCC1nNLmekvrN0daPK1xrwHT7OmvoOBlnlKJgcUrp1+22+epQDp5bPMocKM9rKDU
 ZYhGPIGoR6IUkFZBWKvHL6XBhIJ0NpDDbmZq95VqQpZrdGtO24tbsGpiD4NaHv2d2uUBr
 YcOzDh8hdMlZk9kpoKP4DA6C4sMnPLkvAe9ZfkNaM9D91JxLCciE9tgDAzKhCZoITuA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791020311;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=SbEC7xmSoCWVxQdYumX2orOhElcwUaAlsqQUH5344IY=;
 b=s4O8jrgHXAUtFuFaQLUHupog+d0KXvlyExesj0zZT0XpaPmVKPa++Zq72SIEblI77mEF
 9y0igbpbeKo/GMpBpCJ+6Yk5f2THFTmm9Wwf/y06e7tSgN5gQo7rKrzieloJWTwvwrLxu
 yBSIXD4cBRpvBzyl4rXGF9ph3jPWjmiXP1xprUJ07uYqoQhyFnb0m2BZBI7fT/6FuFOIf
 nqrdTqYQ6QiloupkKdu6sIw0JV/4SGWF/Tha/jzX/gmRCpeKfjveujIrYI4/oKYWHQaoF
 Y1ODOfnd2CVv0kiNYbPzX86kiKwgLm/P3G5A7GHmvNWBQ1oo1EoAc0uNCwMP63x3xvw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=hGk2Ipce; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 30D518112F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 09:38:29 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MKsj7-1wypaw1R7t-00RhSC; Sat, 03
 Oct 2026 11:38:27 +0200
Message-ID: <c74296d5-fe50-4f75-b7e1-b8039003395b@gmx.de>
Date: Sat, 3 Oct 2026 11:38:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bartosz Bilas <b.bilas@grinn-global.com>, buildroot@buildroot.org
References: <20250728130118.18606-1-b.bilas@grinn-global.com>
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
In-Reply-To: <20250728130118.18606-1-b.bilas@grinn-global.com>
X-Provags-ID: V03:K1:66GWplzJeD+EZvFHH+EsYZwCN38kbuR4Vzmm/V9/qkKoFM7iwS2
 c5HGpz38IlQJWJWTs9KPY9EPyr8wdj67/BLp9LB/oCL468Qb8HQ2M6Y9y9DrLi760JpVXXa
 2/tDPtfnGF3Vk5UlbaANbpGYT66PIIdgPMBdiDKvZiSFbY0vTAO1KiBE616qNEw3kueweSf
 C/XXUWEUBjaFafTVSOdWg==
UI-OutboundReport: notjunk:1;M01:P0:Uzlhvf0hf3I=;EHWe0NII4o4IeZQlhqjO6vI2pOZ
 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
Subject: Re: [Buildroot] [PATCH 1/6] package/python-mdurl: new package
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

Hi Bartosz,

sorry this series has been pending so long, most packages are in 
Buildroot by now, some in newer versions. Exceptions are 
python-importlib-metadata and python-rich-click.

Except those two I've marked the patches as "not applicable".

Best regards,
Fiona

Am 28.07.25 um 15:01 schrieb Bartosz Bilas:
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
>   package/Config.in                      |  1 +
>   package/python-mdurl/Config.in         |  6 ++++++
>   package/python-mdurl/python-mdurl.hash |  5 +++++
>   package/python-mdurl/python-mdurl.mk   | 14 ++++++++++++++
>   4 files changed, 26 insertions(+)
>   create mode 100644 package/python-mdurl/Config.in
>   create mode 100644 package/python-mdurl/python-mdurl.hash
>   create mode 100644 package/python-mdurl/python-mdurl.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 137f74ed82..e9ce49e2df 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1235,6 +1235,7 @@ menu "External python modules"
>   	source "package/python-matplotlib/Config.in"
>   	source "package/python-matplotlib-inline/Config.in"
>   	source "package/python-mbstrdecoder/Config.in"
> +	source "package/python-mdurl/Config.in"
>   	source "package/python-memory-profiler/Config.in"
>   	source "package/python-midiutil/Config.in"
>   	source "package/python-mimeparse/Config.in"
> diff --git a/package/python-mdurl/Config.in b/package/python-mdurl/Config.in
> new file mode 100644
> index 0000000000..32aaa09d67
> --- /dev/null
> +++ b/package/python-mdurl/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_MDURL
> +	bool "python-mdurl"
> +	help
> +	  Markdown URL utilities.
> +
> +	  https://github.com/executablebooks/mdurl
> diff --git a/package/python-mdurl/python-mdurl.hash b/package/python-mdurl/python-mdurl.hash
> new file mode 100644
> index 0000000000..932813e9f6
> --- /dev/null
> +++ b/package/python-mdurl/python-mdurl.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/mdurl/json
> +md5  f18eca6522b438354be2378f216a5a94  mdurl-0.1.2.tar.gz
> +sha256  bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba  mdurl-0.1.2.tar.gz
> +# Locally computed sha256 checksums
> +sha256  7c605df6e28667a9603118e98274f64a49ce3eed0d26fccce9534a345e0ef955  LICENSE
> diff --git a/package/python-mdurl/python-mdurl.mk b/package/python-mdurl/python-mdurl.mk
> new file mode 100644
> index 0000000000..c6ed397438
> --- /dev/null
> +++ b/package/python-mdurl/python-mdurl.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-mdurl
> +#
> +################################################################################
> +
> +PYTHON_MDURL_VERSION = 0.1.2
> +PYTHON_MDURL_SOURCE = mdurl-$(PYTHON_MDURL_VERSION).tar.gz
> +PYTHON_MDURL_SITE = https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90
> +PYTHON_MDURL_SETUP_TYPE = flit
> +PYTHON_MDURL_LICENSE = MIT
> +PYTHON_MDURL_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
