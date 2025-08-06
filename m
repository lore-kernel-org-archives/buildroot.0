Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA43C87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 10:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F446610C7;
	Wed,  6 Aug 2025 10:42:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wIsQFreJ1fhs; Wed,  6 Aug 2025 10:42:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49FAC60EF4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49FAC60EF4;
	Wed,  6 Aug 2025 10:42:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A6F3231
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 10:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DCCD60EF4
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 10:42:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LTzBW3dPGJ8V for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 10:42:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 85C2760E8E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85C2760E8E
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85C2760E8E
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 10:42:03 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.163.130]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mplc7-1uHvjY2LQj-00nQBZ; Wed, 06
 Aug 2025 12:42:01 +0200
Message-ID: <27e012c7-ee1e-445f-8d61-93addb163ae4@gmx.de>
Date: Wed, 6 Aug 2025 12:42:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Cc: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>
References: <20250803144208.195144-1-ps.report@gmx.net>
 <20250803144208.195144-3-ps.report@gmx.net>
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
In-Reply-To: <20250803144208.195144-3-ps.report@gmx.net>
X-Provags-ID: V03:K1:lXyFl6Sgsdh/N0MqmXwOQPYW3+ym/kjINHIRZGh/Eal+NB3u0F3
 cJEJcyoqfKxz4SzSgEazGa1Q5auqymImcNlNgs2BeeWszTDMYMTVCmGKxrm1a7Gpfcbs6Mg
 q5V3XXpN7Ql9s5SzDnpQX8JIgR3iKjQFYhtBQTUz4nNyrGR4WzPEh4a1DXFfKl8tBOCwNDZ
 bOjQXCwGirMlh6hks7sdw==
UI-OutboundReport: notjunk:1;M01:P0:6XWx8ZjhdBs=;198+A1vq9agUf7pZe3BmtPC2KA/
 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
 T1M/FwIFVz0VgIBHYMNUmIeQbrWvLLYkY+d
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1754476921; x=1755081721; i=fiona.klute@gmx.de;
 bh=osZsrBoyauRUWET0PFDHXFaDHC93qsNivYIDsaC5pMk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ZokesbNW5NRHtTFC23Gv4IQlMZ7ugYN5neQ2Y2h1Odp9Z+A9YL5PnHTWXQE/E5Xp
 Bvw3uf+EGhC2qpek9aoMFKEiOi4KAdhCRj90t8y7LRk1B6JL5oThk0cd2G+wKWysB
 CclosF79M3DUZ4YQAQr5dreJFnMNRCRrPcwhqGI30ws4jNN2ZlUHeawBu2TskB5in
 dnzK4r/twRa2V25G09AI/dzBxc6r1JAuVYgz9Fjq9WckEfya/JnQ5f+fSg4Y+M/Yo
 +j+R8eTCzq5cMPpmKdd1Lf4kUepehKKrA2gXCyxOR38b7ySn6DujeVTlmSXOQyDwm
 EG4EcJaoAg5HOPhCRg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=ZokesbNW
Subject: Re: [Buildroot] [PATCH 3/3] package/brcmfmac_sdio-firmware-rpi:
 bump version to 6596d33
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

Am 03.08.25 um 16:42 schrieb Peter Seiderer via buildroot:
> Changelog:
> 
>    - 4eec7f2 Sync with RPiOS 1.2-9+rpt3 bluez/1:20230625-2+rpt3 brcm80211 versions
>    - 4c1789e Merge pull request #25 from HiassofT/fw-2024-08
>    - e59476f Sync with 1:20240709-2~bpo12+1+rpt3
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Tested-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Tested on CM4 (upstream kernel 6.16, as AP) and Zero 2W (upstream kernel 
6.16 as client, RPi kernel 6.12.41 as AP).

Thanks,
Fiona

> ---
>   .../brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash  | 2 +-
>   .../brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk    | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash
> index c20abfc26c..aba028ef6a 100644
> --- a/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash
> +++ b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  2f0917b104739455dd488dd8f5af2ee4430801a7ac8fe8d9866e74bfbb185356  brcmfmac_sdio-firmware-rpi-26ff205b45dc109b498a70aaf182804ad9dbfea5.tar.gz
> +sha256  d9835b33bea65cf15f41753e215a11e5eca818a6e3bfacaa750aeac12456c24f  brcmfmac_sdio-firmware-rpi-6596d332eaadd63e2413e3937715a084f61c39e2.tar.gz
>   sha256  ea8b7b7b6cfc6fd30587ed977100f6a542734ce53218b5b63de16180acddd599  LICENSE
> diff --git a/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk
> index 95707487a9..8c04b017e3 100644
> --- a/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk
> +++ b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -BRCMFMAC_SDIO_FIRMWARE_RPI_VERSION = 26ff205b45dc109b498a70aaf182804ad9dbfea5
> +BRCMFMAC_SDIO_FIRMWARE_RPI_VERSION = 6596d332eaadd63e2413e3937715a084f61c39e2
>   BRCMFMAC_SDIO_FIRMWARE_RPI_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(BRCMFMAC_SDIO_FIRMWARE_RPI_VERSION))
>   BRCMFMAC_SDIO_FIRMWARE_RPI_LICENSE = PROPRIETARY
>   BRCMFMAC_SDIO_FIRMWARE_RPI_LICENSE_FILES = LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
