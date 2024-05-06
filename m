Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465E2C25B4F
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 16:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E07D608B1;
	Mon,  6 May 2024 16:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zRFZ3mnbZQnR; Mon,  6 May 2024 16:20:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA4AC608CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA4AC608CE;
	Mon,  6 May 2024 16:20:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B7C031BF3B8
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 16:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3CBD608CE
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 16:20:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bQiq8BTpknO2 for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 16:20:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B3086608B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3086608B1
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B3086608B1
 for <buildroot@buildroot.org>; Mon,  6 May 2024 16:20:47 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.122.140]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPGRz-1sFwDg3Z7t-00Pdx5 for
 <buildroot@buildroot.org>; Mon, 06 May 2024 18:20:45 +0200
Message-ID: <f8166eb2-5967-4905-a7dc-468f2dc428be@gmx.de>
Date: Mon, 6 May 2024 18:20:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20240426213551.1106068-1-fiona.klute@gmx.de>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20240426213551.1106068-1-fiona.klute@gmx.de>
X-Provags-ID: V03:K1:0Qf4K279me3I9xFpzjZ6Yg2jSTQSaUiDWWTak3K0zdqbko5/wQx
 ozd9sKnArwEMlEjSD4dnADwbjzhSSmPJFJGFt5vT8vxhy93ZGFZFOCwgYcK/WRqE9AoefMc
 HFtp9RbeUtVQBkg6eyHszqy5+CMb1pEJa8S4LjzYKtsOCLt4CsLooRavXlj1DkH7F8v8iyB
 4yl2uX6nF+JX82mD+s7yQ==
UI-OutboundReport: notjunk:1;M01:P0:abtfvZxDi0Y=;cKzVBZRpw+1ddf8tQgAavl/F1tF
 xbUdepzG5ccE6m+al5VyyJDtqT+adHoZS7jwLAoKgKVwki48DwexvmTQ77tz63wnetA5WNm13
 6tnvy2qA2UpbVgTs3x3UAky/kVxkuTFiObI2BnbW7oDm1Xqh/FTifgcemHuG9jLdiIlGsKQn2
 9BUhAL8F+AgPmjO8h5xhE+25cwTdqVJsgspZUBboMno6FUo9ntSI7ew43ow1vk+Pikih9jyGV
 M67pa5QZzfhrVZqhFBg0LJe5uKIX48HXR/hAVbDUTDoLmJrhu7ZVKI6MBEbQabQfLntt48upo
 jXc9PLX6dpmsNL1PvkDFpxiZRQ5cmUNZhpXDf7Zts1XsBkq+hl9VHaPdASyhGeisvYRU9Vevv
 rz3y92GZ26fBphpHE3t+8pcOwyrDTxHkZsV6p0jL6DPl7YS6+a/5UO06vFdzvZkZR7nH2kZqB
 eFHK/UN5BEVhkRFKF4Q7liT56eMLVAAps51s81sZfckzKH3LcwT81puHNo1t+qfXfWChoZrYW
 Jv5057kWauUp6pdvO4jTzwaiRmDsmRIcbKeFRpUD2cPhYjq4TB4AHjfzxUYeYLx1rWdMNYVfQ
 97pBzggDl1TQ8xslXC/e/c0udFme3AEpNIRgNB3Xc8TzOc8md4l5C1gHIXvHv18cSJUF0KadS
 pebF/faw8zKipVWgkkIQMpPU5x7YmCybAIHNcf3A6d8tHjjfk7HaR2ZXO6sGaeNOy4dznzcxS
 1x9DsdUIeBFX0LTExmSwim9Nlmt0FUAAB2Nsu5+WwcHxWOIcz23zxf1FQ77vAqEkiZgXnkAL5
 tTMI60UEwohe0EBWQk9cjLQNS80aa24F39Ap2iEWBN07I=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1715012446; x=1715617246; i=fiona.klute@gmx.de;
 bh=NviOdiZVYtkmGZIIkf2ky8IHazyBBP6fUqTq7I5g3Bc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=q00TV0QYgaBoBkeD4vGsjoQO4cF2hxQDePRvD9KV/VpNpaoC6TjcTBq8zD+SSNJW
 XOBRz5/SVSohctQyxaOFmWFOx2Om7x0RMP5e3/kFmKnqcTO7e9QLO6ZH3QZOQqUHm
 nI34yfQYDKedeq5zYoJIoSJunD6R4nIF0lUR0Cp0jGJDwYV/NxxNBtbSETBejwaQb
 mIE3oyUS2XbaP6xNh/T8kWDQAZrWxugO3saiWdS4S0U+K/0zoUn2Tsz/zALUnqv7k
 sBVtphpkul/ZsaIfozb1PFUphq3asBz7sePIW74AXJrmWeGJ/SRAqliw7h4gLO8x6
 eszQrT4ijtsE4UTT/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=q00TV0QY
Subject: Re: [Buildroot] [PATCH 1/1] package/raspberrypi-usbboot: bump
 version to 20221215-105525
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Hi,

I still didn't get any response (merge/comment/rejection) on this and
the "package/kmod: fix build with musl" patch I sent the same day. Is
there anything else I can do to get them to the right person? They're
necessary to get the board I'm working on working, and for musl-based
builds with compressed kernel modules in general.

Best regards,
Fiona

Am 26.04.24 um 23:35 schrieb Fiona Klute via buildroot:
> From: Fiona Klute <fiona.klute+wiwa@gmx.de>
>
> The "msd" (mass storage device) firmware files in 2021.07.01 don't
> work with some newer CM4 based devices, the one I had issues with is a
> RevPi Connect 4. Updating fixes the issue. Mass storage device mode is
> required to flash the eMMC of CM4 devices.
>
> Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
> ---
>   ...001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch | 14 +++++++++-----
>   .../raspberrypi-usbboot/raspberrypi-usbboot.hash   |  2 +-
>   package/raspberrypi-usbboot/raspberrypi-usbboot.mk |  4 ++--
>   3 files changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch b/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
> index d482b0b9d4..776f6d3476 100644
> --- a/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
> +++ b/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
> @@ -10,21 +10,25 @@ Submitted-upstream: https://github.com/raspberrypi/usbboot/pull/2
>   Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>   [Rebased on 9324fd7]
>   Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +[Rebased on 20221215-105525-0-g1afa26c5]
> +Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
>   ---
>    Makefile | 2 +-
>    1 file changed, 1 insertion(+), 1 deletion(-)
>
>   diff --git a/Makefile b/Makefile
> -index 822e714..875e717 100755
> +index dc78cfe..5ada5be 100755
>   --- a/Makefile
>   +++ b/Makefile
> -@@ -1,5 +1,5 @@
> +@@ -1,7 +1,7 @@
> + PKG_VER=$(shell grep rpiboot debian/changelog | head -n1 | sed 's/.*(\(.*\)).*/\1/g')
> + GIT_VER=$(shell git rev-parse HEAD 2>/dev/null | cut -c1-8 || echo "")
>    rpiboot: main.c msd/bootcode.h msd/start.h msd/bootcode4.h msd/start4.h
> --	$(CC) -Wall -Wextra -g -o $@ $< -lusb-1.0
> -+	$(CC) -Wall -Wextra -g $(CFLAGS) -o $@ $< -lusb-1.0 $(LDFLAGS)
> +-	$(CC) -Wall -Wextra -g -o $@ $< `pkg-config --cflags --libs libusb-1.0` -DGIT_VER="\"$(GIT_VER)\"" -DPKG_VER="\"$(PKG_VER)\""
> ++	$(CC) -Wall -Wextra -g $(CFLAGS) -o $@ $< `pkg-config --cflags --libs libusb-1.0`  -DGIT_VER="\"$(GIT_VER)\"" -DPKG_VER="\"$(PKG_VER)\"" $(LDFLAGS)
>
>    %.h: %.bin ./bin2c
>    	./bin2c $< $@
>   --
> -2.31.1
> +2.43.0
>
> diff --git a/package/raspberrypi-usbboot/raspberrypi-usbboot.hash b/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
> index cedc5fb7e1..830ead8243 100644
> --- a/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
> +++ b/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  4565314b38e7c7505b7d32a3b51b49f79c7dd5767d45b86d38e5255ae7489a43  raspberrypi-usbboot-2021.07.01.tar.gz
> +sha256  2f02dbe9a88e9dfad5f05e513e1f30afd47b1575820f7c3b09665dfefc45bbaa  raspberrypi-usbboot-20221215-105525.tar.gz
>
>   # License files
>   sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
> diff --git a/package/raspberrypi-usbboot/raspberrypi-usbboot.mk b/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
> index 2e4194da0b..24a1f6d906 100644
> --- a/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
> +++ b/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>
> -RASPBERRYPI_USBBOOT_VERSION = 2021.07.01
> +RASPBERRYPI_USBBOOT_VERSION = 20221215-105525
>   RASPBERRYPI_USBBOOT_SITE = \
> -	$(call github,raspberrypi,usbboot,v$(RASPBERRYPI_USBBOOT_VERSION))
> +	$(call github,raspberrypi,usbboot,$(RASPBERRYPI_USBBOOT_VERSION))
>   RASPBERRYPI_USBBOOT_LICENSE = Apache-2.0
>   RASPBERRYPI_USBBOOT_LICENSE_FILES = LICENSE
>
> --
> 2.43.0
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
