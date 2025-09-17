Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78E9CA0EE8
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 11:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FD118418E;
	Wed, 17 Sep 2025 11:27:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tTsn3Otjntj6; Wed, 17 Sep 2025 11:27:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C4C184189
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C4C184189;
	Wed, 17 Sep 2025 11:27:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C67AAF1
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 11:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7346240D60
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 11:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7zkYBSM2xzqi for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 11:26:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1902440D49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1902440D49
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1902440D49
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 11:26:58 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.105.45]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M3DJl-1uy0pp0DvB-008hPk; Wed, 17
 Sep 2025 13:26:56 +0200
Message-ID: <26306271-f7ed-4c74-b0f3-36a7a2bf4be5@gmx.de>
Date: Wed, 17 Sep 2025 13:26:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
References: <20250915222613.1653854-1-james.hilliard1@gmail.com>
 <422c83338d48a2b64501662c2191dd2d@free.fr>
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
In-Reply-To: <422c83338d48a2b64501662c2191dd2d@free.fr>
X-Provags-ID: V03:K1:aiBkUpZHb3RepiRlKlz3MkEy923I7qNa1NcOj2ZeY6L8GS8HEKz
 58UTRRQ4GGZTU7wQi2x8PsCYshynd5CpFqtNM0x4Hwe/zArPUe8zw7L4qFCQHp7ES6W15yl
 FOgQzZp3/EL+hwWfrS3z7YJ7EsNAoIawPSKj8QJxn9T9FCKkWO6Ukbe7lgM7JCwMqiEYYqh
 +oKLY+cfGGjJtLmcyUyQQ==
UI-OutboundReport: notjunk:1;M01:P0:7wDZabXFwnY=;7YLuozildF+HtfvhJbGbiGbE0Ip
 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
 0eLAPp0n2N8VVUD9yh7wfSDoorf8buQA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1758108416; x=1758713216; i=fiona.klute@gmx.de;
 bh=UZ1t9NuPAVZNYMYhz1aW2lafaWQwymwKGV3JTLUwA5I=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=DYK3Fx7gXCeISMHWrcyhT94/QMb7vy/C/Ao8q3o4CiMly2OX2jkI2etJWp51Qhoy
 w31VBd8Aop2hhlEKu+zTT4qtHqePSz0ggNB2bZVResMLknYe50EdGJ8RckQbDyQ7q
 RvqU37UsUIqDmiYSoGdwJqck+jKa55Wo0qfkbHc4BeRMYiY9OaC3JuDoe3pMPFpvM
 KES9W2idEsQ15yubU3DYyfKQnS0Ew0VHd5WYyVOVCCEviH7UlFd6tju8D9lUQ+x0H
 ZZ5aDvZ1KA1FLpSggI/LrmOZ1misaoTVLHTiF3yEY3mvHi12kJfxeM9VMBDd9Lp/x
 DQi8xrAPoWPQzfWqDA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=DYK3Fx7g
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cffi: bump to version
 2.0.0
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

Hi James, Julien,

this update failed to build for me due to Setuptools complaining about 
the trove classifier "Programming Language :: Python :: Free Threading 
:: 2 - Beta" being unknown. I've just sent a patch to bump 
package/python-trove-classifiers to a version that includes that classifier.

Best regards,
Fiona

Am 16.09.25 um 23:17 schrieb Julien Olivain via buildroot:
> On 16/09/2025 00:26, James Hilliard wrote:
>> License has changed due to license change from regular MIT to
>> MIT-no-attribution:
>> https://github.com/python-cffi/cffi/ 
>> commit/67a170dc7972dc9361743690b38da3d963b200ef
>>
>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> 
> Applied to master, thanks.
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
