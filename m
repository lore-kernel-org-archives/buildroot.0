Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2403ECA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 09:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E542440509;
	Sat,  3 Oct 2026 09:17:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id viab-YHPsdgq; Sat,  3 Oct 2026 09:17:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BAABD410CB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791019040;
	b=BaP1EQgNWyPT595W4X4AVDvc6WfPWWvDySujg1KRGFNsEt6EdHkSw3WybmgTBT3PhFv3
	 QnDGZtVOAXpW+1sICXrj64tsk4DszsbWi/o4ybMpQ9CBO8XBWRrCp84wYg8/ih9CHo9nc
	 KU/gY7qHrWrt8HFZIobvN1LkED6UoKmuZ6gg19sfzkmpbXKc9B4Ap3UZZqSDiImpG5AY1
	 +6fCDirZrLSiwnP4O/26+HbS0Et8wpL1Ms8rnQvcZDYgHBFX/1pPzkkuWFXnaV8mbUWRW
	 EJOY+J6WrQFA6zgXPQWOaNeoOnw4lL4kkJU9kvLIVtWTZUkbpCREq+hUBiEcAXtxmGQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791019040;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=hFXzV77uW9A7mfdWR5EQ9Q3HS5XX3O+2lc+i4SlFFs4=;
	b=nOys5zoy3KXDXO7pkjm+m/11q9BB1V0utz+GntlubYPf40eir4QGjqXUtZp1r+oEgvE/
	 /o22PCW7ezKUCzHPvxHAaXNvzSLZYeFZ/4BmUNDWTRXMH28ZhMkn1hwmckZE2GviKERuw
	 fm6wwRaCqeEc841hyWI1t7PYLdYuqOegq/gB0JovNM8FRywwf9/H1BKxRsJJ0mi/iGJ2s
	 dPZNDe0Yb1yUoEQLei5Oki/2kCJvBtRit8f8a7EWd5WKzFxs23YQZYMJsDhnl+wA/u64T
	 oh8f4QAsZ9lZ8NNnW235/OR+eIjmwbl/LwS/21wfaBbNwiJQ5BmmyRVhwLVBFShomIg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791019040;
	bh=hFXzV77uW9A7mfdWR5EQ9Q3HS5XX3O+2lc+i4SlFFs4=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=oNqsuC2iDuU6cxEryadHi2tXOTKN5vL6bH3NR6w7eKnMlsKkufLJBwh8vMp34hpYm
	 5U3LDUIN3Ee6DiMaGNHsBeAQRvQpPxB9MTUJtZqGHOytfoI5XJawj6P8iA7WwNtbTV
	 +hXeh1vSe5njNRNQ2DhjaKsZOhZSUt8yFPYgLNz1xirXmqKyITYT3XRa8UCEMNHgGP
	 5NuoQdDzdURrrpDCcK1GVC5Duk7EUxoRncws/LrlaCCe0hgS8+d3enMHW+4R/4NKxB
	 HNO3GEW7gspMszTU8KFDHVptU2enWDIuYRoBUkEmUtx6eAjKG2KbMStHK/sNob+6+W
	 U6md34EH1rcSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAABD410CB;
	Sat,  3 Oct 2026 09:17:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7810E32F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 09:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2582D400F6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 09:17:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sfTSDTLb3c94 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 09:17:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org ADB4C40059
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791019037;
 b=smTRwwnN1nFe6KHY9NrenFknMS/zDYKZNvkFsjXwscHs4EsHgQfcTdk/OAUK2RXyDjPo
 VmDJUnMYJyNVsT8uhbINWvBjQ5iL7G5FrJirxuF1dnw6Y5Dnixwv3gKf9EyZQ3VtXSx3D
 Qz2iOE74BNkicVwyoIefcpz5KUulC7upHnIgjXRDT0tcP9q2d44bhkaoVt7QGnvM21dhK
 oMuOTaeexYFXVMEZ5dAoNMAJzw+CEAD+tb0M4U9VN14i9fpiCwZRtVMEq5YcMFzTvEX7w
 QEzd/taw8964Cs7inAfDJCLIZXBpO1SmxGS0aIwOVlWTlADBWnzFTjSXqystaTbaoRg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791019037;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=yWCa0C3mE2Bj4k49h1BQqyNi5NllPvoRhNpAdG4N56M=;
 b=lmmHTIMCWH2B88KemhzP0BId6zTmSo5fsa69moaJkTym0GgccRHOsBg6pqg7C8Hrznlj
 b3QGXoCMzW5kfO/O6ag/Yjl5uQzOdBvI5IeCwTf/yrbZTnBgCLMJ8bUA8soq69Rf/jhTE
 WLXl4pPu85m85D+vuDRwnmJIHazXr5IG9hFHJB0mTC/QCwAZFLb6+6DlZzlVK6qorUTD6
 HByEtcvEDnwjOcgAVJ35Jh/IZp3YrnEzdauiUYKZiFSG/RXiePPEyViEICwITRg8xKsMH
 2/FQUAaJT4rgNu90OMq1hzAjelBOClLPhx7QpEYY4LqoVs/GVC4SgFWkTEOt89PtEAw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=GjmmTNVx; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ADB4C40059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 09:17:15 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtwYu-1wPE3i0OYm-0112Nj; Sat, 03
 Oct 2026 11:17:14 +0200
Message-ID: <779269cb-3a42-4537-8e35-2af61bd36b10@gmx.de>
Date: Sat, 3 Oct 2026 11:17:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20261002214711.1164231-1-bernd@kuhls.net>
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
In-Reply-To: <20261002214711.1164231-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:1WkKWOMztXUcGxlqHQKgTJAza6IVRIYKsGSyxebVGxbxpaFLmo4
 L/RsDU5m5hBzEiBIkcAy443CPamdpeoyZNm5e3txZG9trJmHk1YdnKmzqF6qX9kVxZivHgD
 MFFfLoKadUxNKSukYqoa4Y7zbxYojIjHSDyt5+QEFFGMZD+XxX7WIeccfGcNQwBX8q7pJYv
 DztdN3hqwlP3GMgv6JSEA==
UI-OutboundReport: notjunk:1;M01:P0:/gzMjpe/CM0=;T2EWGk6TTwHrbPe3v+lCfLpZgsT
 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
Subject: Re: [Buildroot] [PATCH 1/2] package/libpng: remove autoreconf
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

Am 02.10.26 um 23:47 schrieb Bernd Kuhls:
> Buildroot commit 08ad91052b69090b74220d89b13cfc29fb86ed72 removed
> 0001-riscv-Support-only-RVV-1.0.patch but forgot to remove its
> associated autoreconf.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thank you.

> ---
>   package/libpng/libpng.mk | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
> index 96afc684db..1915941b82 100644
> --- a/package/libpng/libpng.mk
> +++ b/package/libpng/libpng.mk
> @@ -11,8 +11,6 @@ LIBPNG_SITE = https://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SE
>   LIBPNG_LICENSE = Libpng-2.0
>   LIBPNG_LICENSE_FILES = LICENSE
>   LIBPNG_CPE_ID_VENDOR = libpng
> -# 0001-riscv-Support-only-RVV-1.0.patch
> -LIBPNG_AUTORECONF = YES
>   LIBPNG_INSTALL_STAGING = YES
>   LIBPNG_DEPENDENCIES = host-pkgconf zlib
>   HOST_LIBPNG_DEPENDENCIES = host-pkgconf host-zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
