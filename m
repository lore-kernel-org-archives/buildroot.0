Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA57606A319
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 22:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OfZrpUf0
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01D9580F21;
	Mon, 19 Oct 2026 22:20:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GDh9rAJw-76T; Mon, 19 Oct 2026 22:20:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0A49880E9C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792448453;
	b=pnMKHPj+VYTC8wHixURLsBqF2uaWrSl7eNp1XAv9po1ZnJzfz1LvnJIGFwkiEIeviyvS
	 NCJ5z66nO3wcsfdFOGZwCXObkXpKDzT45179xetF7XkJId2Q2k7jNmxi85sU81CbfxJv3
	 ofPLyTHfvMAZSq83zDqphSYutXlanrpsr0nu5lyhJ/hGNlUGi+EL95f4lw9/0vsl0uU8e
	 ocqNIUJxyTAOVggUA+RqxlYMosRS1XYE+g5RuaobgATub23C3uiOb/z8t4vplz/Uw0PtC
	 iJMsaOdu9GPfp5UA2YX+hYxFiRbhIbUz+tFllKsfRe/Vv1UYOKG1rq3lVV8gNzcbq3g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792448453;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Transfer-Encoding:
	 Content-Type:Errors-To:Sender;
	bh=ctivE2P0cd6LiCdOIFGGDSp3fybJPorNuIG7OWsSWvU=;
	b=B1aKcQZVHLXvKHuM5gD25n2ILVxoPRJZsA5ArhnsVEDjfR0NqWFejBOwgpstSiD9DuZS
	 C2SLjBLhFomFUfmgDiTzM08SlAI4D0awANK3OIkVcKz1dw6sIguaJcbclejavVxzNbDyC
	 QpRKXKpBLZFhMwMDDPQJNLwBTBVsbxyTba4BtQ8NM66PaIlP0R0E4mLRb0V5+id3hHK4Y
	 4MxznZ4Ve0kzXvckqTRCONTcCgsrFyNlIcnEjdzUMRiO37pupuaAAyBTIuiOVTJM1I4Kv
	 clOMx7hxBVaF67lHWJR28I5YGPxK9etNdQSi7E/TPbbSxFY1e1lImOKOsBq0g5s7Bzw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792448453;
	bh=ctivE2P0cd6LiCdOIFGGDSp3fybJPorNuIG7OWsSWvU=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=OfZrpUf0OUwyEdW5wtdfg10u0qFYWNfVUQ19Jz2FfNgPLtighF3GfIz4IiWvPQYQM
	 3K2qVRmMYV9JPTg3oMBkUC4oNW3/tviViIYIM0g4gqVYEhA7yU3mO4g0GVNWESihAF
	 tvfBwlDz6W99yTa/bh3U/KiYnuSZVcbEZD1R5un8+1Z0NOT8cVGyTzprqgyqzhCI6g
	 +45assoOUebeMNG/4gl1aBsG/dNBM1vfcZ9e1F/LfFGfFVHpWpXgZEfJ+sVnjZe0b4
	 mygLv/2zl/HAQOnyVtaWesKyCebXBlyQUR79cZMEzxVTyEq4g/fJOfgjhOQCyOazTc
	 /zfYyAO9mDjww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A49880E9C;
	Mon, 19 Oct 2026 22:20:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 650C612F
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 22:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AC27402B7
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 22:20:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YCrC13yLcyzJ for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 22:20:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A64CA402B4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792448450;
 b=DRYNOvkEXGFgqSViEhk4hv6Pz7mxsknd4/S3atpNb9KkGrVjloz5OXhS5/xhWS3pjbVV
 XZlX45AMtu3OIO81Wpw/bLN9gqzyf3wc2i8B8t6toaMco/qYIMk6FJaHIr/V8T9HXE10A
 BZMlBPAvIPjXs3I8Wg3e44ahNH08fexCXh+Yr0+zmoNUWrVrqWuiyqTceRszzIQib9820
 103xScV4aReRBQn05f+TxWlAU7zUbTJ1AIHM+BTdSXG1YVcWS4X60oV0RxSXm+sWHHy3V
 2nM/8rDgIj4kYsRaAXHtvjOJPSnara1XXCxHiOMhoeRSzccxhdFAjJD20uoAIhIGT4A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792448450;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=QgmIeI1nhPZhOqzeQ8R2wKXulxb20/8zMque72kLjU4=;
 b=QY9NqUHmc0ByRuBDXfITSVf8ztk/NTfAjFL3yU4wAZ9lNaavtsvV3KaUB3AMOhgnubld
 hhRGsF8O3tjpycyfhwofQQ6n0ivtisvOGdk8iBMK3Ntq5vTq8r6KWw/9GYWzEHYDJmKmz
 e2PBFkvBsUJpk3vlI+IaEJ+5g0Y7H+tRB/1yipXE/NlH9pE85LakVRVjyYBMUFedOA9Wv
 qZ6sUj8UuTvcOzYfgQofSP05ZDHz5p9Qk4o2cA6Iy4khvZg2AsVxRK9L2CPOq7lfXYZ4w
 B6D+tvUnt24PHXEl2XE3ZZtwQY7k7iVF7+nqHWkmK6VHchfH8X84pqKT4MITygn5Eig==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=d08WTctG; 
 arc=none smtp.remote-ip=212.227.15.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A64CA402B4
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 22:20:48 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5QF5-1xI6F12mov-009526; Tue, 20
 Oct 2026 00:20:46 +0200
Message-ID: <b6a61602-59ca-441d-8d52-7ae45d27b235@gmx.de>
Date: Tue, 20 Oct 2026 00:20:45 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20261015193243.3299884-1-james.hilliard1@gmail.com>
 <atEsbxorNgbUC57M@windsurf>
 <CADvTj4rd4ovmg07R6ux2b1LyDmkRhq79yJVVmHm74_THX6OPtQ@mail.gmail.com>
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
In-Reply-To: <CADvTj4rd4ovmg07R6ux2b1LyDmkRhq79yJVVmHm74_THX6OPtQ@mail.gmail.com>
X-Provags-ID: V03:K1:NL751MpxLby8pKjNsTvUdcQrsFi9F16ERMwcFqVr8gMLeXisCKY
 8dsAxvlJwxyuQSpKpIKbgFqEFz/yH+G+v5UR1CgaSVA+ez04KvCetGe3I2g/eU2mrXXBFW+
 GgmBFrd+ccuyB+76jCmpHAmOcEesSLC5HoDkkzw+wS6QogJ9B+YGQ8l4P9QsSgG4/MMMPXJ
 6fgqArAjwwtfbAjrpnnnw==
UI-OutboundReport: notjunk:1;M01:P0:6yrkxGhc6mw=;DwHaGBhMfWohkF6f2gS56ol6jFh
 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
 2/hI1GEGnOcpGSZPLGc0=
Subject: Re: [Buildroot] [PATCH v2 1/9] package/python-setuptools: bump to
 version 84.0.0
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QW0gMTUuMTAuMjYgdW0gMjE6NTggc2NocmllYiBKYW1lcyBIaWxsaWFyZDoKPiBPbiBUaHUsIE9j
dCAxNSwgMjAyNiBhdCAxOjU14oCvUE0gVGhvbWFzIFBldGF6em9uaQo+IDx0aG9tYXMucGV0YXp6
b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPj4KPj4gT24gVGh1LCBPY3QgMTUsIDIwMjYgYXQgMDE6
MzI6MzVQTSAtMDYwMCwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6Cj4+PiBTaWduZWQtb2ZmLWJ5OiBK
YW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPj4+IC0tLQo+Pj4gICBw
YWNrYWdlL3B5dGhvbi1zZXR1cHRvb2xzL3B5dGhvbi1zZXR1cHRvb2xzLmhhc2ggfCA0ICsrLS0K
Pj4+ICAgcGFja2FnZS9weXRob24tc2V0dXB0b29scy9weXRob24tc2V0dXB0b29scy5tayAgIHwg
NCArKy0tCj4+PiAgIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQo+Pgo+PiBUaGFua3MgZm9yIHlvdXIgd29yayBvbiB0aGlzIHRvcGljISBTaG91bGRuJ3Qg
dGhpcyBwYXRjaCBjb21lIGxhc3QgaW4KPj4gdGhlIHNlcmllcz8gSW5kZWVkLCBpZiB5b3UgYnVt
cCBzZXR1cHRvb2xzLCB5b3UgYnJlYWsgdGhlIFUtQm9vdAo+PiBidWlsZCwgYW5kIHRoZSB3aG9s
ZSByZWFzb24gb2YgdGhlIHNlcmllcyBpcyB0byBmaWd1cmUgb3V0IGEgc29sdXRpb24KPj4gdG8g
dGhpcyBwcm9ibGVtIGJlZm9yZSBidW1waW5nIHNldHVwdG9vbHMsIG5vPwo+IAo+IFNvIEkgZGlk
IGl0IHRoaXMgd2F5IGludGVudGlvbmFsbHkgYmVjYXVzZSBvbGRlciBzZXR1cHRvb2xzIGJ1bmRs
ZXMKPiBwa2dfcmVzb3VyY2VzIGFuZCBJIGRpZG4ndCB3YW50IHRvIGhhdmUgYSBwb3RlbnRpYWwg
c2l0dWF0aW9uIHdoZXJlCj4gd2UgZXNzZW50aWFsbHkgaGF2ZSB0d28gZGlmZmVyZW50IGJ1aWxk
cm9vdCBwYWNrYWdlIGluc3RhbGxpbmcgY29kZQo+IHRoYXQgaGFzIHRoZSBzYW1lIHBrZ19yZXNv
dXJjZXMgbmFtZXNwYWNlLgpUaGF0IHNlZW1zIHJlYXNvbmFibGUgdG8gbWUsIHRoZSBvbmx5IHRo
aW5nIHRoYXQgaXMgZXhwZWN0ZWQgdG8gYnJlYWsgCmFyZSBidWlsZHMgd2l0aCBvbGQgVS1Cb290
IChzb21lIGRlZmNvbmZpZ3MpLiBQcm9iYWJseSBsZXNzIG9mIGEgcmlzayAKZm9yIGJpc2VjdCB0
aGFuIHBvc3NpYmx5IGJyZWFraW5nIHNldHVwdG9vbHMgYmVjYXVzZSBmaWxlcyBnb3Qgb3Zlcndy
aXR0ZW4uCgpPZiBjb3Vyc2UsIGhvc3QtcHl0aG9uLXBrZy1yZXNvdXJjZXMgd29uJ3QgYWN0dWFs
bHkgYmUgYnVpbHQgdW50aWwgClUtQm9vdCBkZXBlbmRzIG9uIGl0ICh1bmxlc3Mgc29tZW9uZSBi
dWlsZHMgaXQgbWFudWFsbHkpLCBzbyAKdGhlb3JldGljYWxseSB3ZSBjb3VsZCBwdXQgdGhlIHNl
dHVwdG9vbHMgYnVtcCBiZXR3ZWVuIGFkZGluZyAKcGtnX3Jlc291cmNlcyBhbmQgYWRkaW5nIHRo
ZSBVLUJvb3QgZGVwZW5kZW5jeSwgYnV0IHdlIHdvdWxkbid0IHJlYWxseSAKZ2FpbiBhbnl0aGlu
ZyBmcm9tIHRoYXQuIFVubGVzcyB5b3UnZCByYXRoZXIgc3F1YXNoIHRoZSBzZXR1cHRvb2xzIGJ1
bXAgCmFuZCBVLUJvb3QgZGVwZW5kZW5jeSBvbiBob3N0LXB5dGhvbi1wa2ctcmVzb3VyY2VzPwoK
SXQgbWlnaHQgbWFrZSBzZW5zZSB0byBtb3ZlIHRoZSBzZXR1cHRvb2xzIHVwZGF0ZSByaWdodCBi
ZWZvcmUgdGhlIApwa2dfcmVzb3VyY2VzIGFkZGl0aW9uIHRob3VnaCAoYnV0IHRoYXQncyBlYXN5
IHRvIGRvIHdoaWxlIG1lcmdpbmcpLiBPciAKd2UgY291bGQganVzdCBtZXJnZSBhbGwgdGhlICJh
ZGQgaG9zdCB2YXJpYW50IiBwYXRjaGVzIGFscmVhZHkgdG8gZ2V0IAp0aGVtIG91dCBvZiB0aGUg
d2F5LiA7LSkKCkJlc3QgcmVnYXJkcywKRmlvbmEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
