Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773EBCCD193
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 11:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28C3761594;
	Wed, 15 Oct 2025 11:00:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DU-gRX3-HzQv; Wed, 15 Oct 2025 11:00:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B3956158D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B3956158D;
	Wed, 15 Oct 2025 11:00:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E12B31BA
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 11:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6CCB61538
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 11:00:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9lf8IX7dpi2J for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 11:00:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 82ED46158D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82ED46158D
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 82ED46158D
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 11:00:39 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.120.57]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVeMA-1uhNgX40dI-00WhuY; Wed, 15
 Oct 2025 13:00:38 +0200
Message-ID: <584f433e-3ace-4493-a073-7cb92eae6d08@gmx.de>
Date: Wed, 15 Oct 2025 13:00:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Esakkiammal M <esakkiammal.murugan@iwave-global.com>,
 buildroot@buildroot.org
References: <23d1f4ad-241a-4fe1-9db0-08bffa4775b6@iwave-global.com>
 <45b0422f-620c-4db5-9a35-423466de2db5@iwave-global.com>
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
In-Reply-To: <45b0422f-620c-4db5-9a35-423466de2db5@iwave-global.com>
X-Provags-ID: V03:K1:yb1DmiBBKHTmWaUoJyxf+eeVg1F3BuXfnytPyDEfEapJP8Y4Dtm
 mB0ZR9WCbnSOWGAAA1gpDQDt1+MfPpC3UPjrYrdoqKRHatJ8wrkh60Q7bJmuQIrlsTfl5Pk
 kb/iY0KI6NHCGM/BHShDOjHGpA/p1PcKv8+NH2HmjViO6Zi8YXm//ZtVwkv6h/iiUDH6Kyp
 2ZWfCbA/AHoxatyAiZnMQ==
UI-OutboundReport: notjunk:1;M01:P0:5KHNcsfT77s=;75deD6HuMc9vYncyr3dV0J1HvOU
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1760526038; x=1761130838; i=fiona.klute@gmx.de;
 bh=oNqIPspaS+rUwE3ICfbW3NjdP3ve1nyf+Ba3Gf9bTJo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=L9/INLhcUNRXjpdIGfqVDdp5i5p1aTVV47XjqE+GFTxmgKBJIEy15qffJJQ7qahD
 q1/U9iSQ2kE+9kxUJgTTreuYGsp8VVtAO2yxA9G2Cqkbix5f9VB0TNJwhqXD1Gtbt
 du/TyGVuqB85XqXP6C/3+pRDHG4VbQfYTI7miKGVxrMV0Tte4yv+rLTe2DT2NQbRC
 lvQ0cYDt0oJACdoGAs73BDEkIkmVpwy2e48jv8cybWC8Wfzy0uRWhP0J6M5pPY7qu
 97RfcQQgq1YIzo5IZsYCI9T7CqhWPXggmXooFL69vpDTJ9dLpMcr2/Fh/OeIL8QiR
 +v5Zqhw7BWAgKIYpxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=L9/INLhc
Subject: Re: [Buildroot] Implementation Procedure for i.MX93 Custom Board
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

Hi Esakkiammal!
Am 15.10.25 um 11:56 schrieb Esakkiammal M via buildroot:
> Hello,
> 
> I have implemented support for our i.MX93 custom board by referring to 
> the i.MX93 EVK configuration.
> 
> git clone https://github.com/buildroot/buildroot.git
> git switch 2025.02.x
> 
> make freescale_imx93evk_defconfig
> make
> 
> Can you tell how port WiFi and BT for imx93 custom board.

It's impossible to give a definitive answer without knowing the details 
of your board, but in general:

1. If you have a custom board, you may need a custom DTS that correctly 
describes your board (instead of the default one) for all hardware to be 
detected correctly.

2. Make sure the kernel drivers for any additional hardware are enabled 
in the kernel config you use.

3. The defconfigs are intentionally minimal. You'll need to add the 
target packages to support what you want to do with wifi and BT:

* any firmware needed for the devices on your board
* wpa_supplicant or iwd or hostapd, maybe NetworkManager too (depending 
on how you want to use wifi)
* bluez5-utils (probably) for BT

Some of those packages have optional components that you may or may not 
need.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
