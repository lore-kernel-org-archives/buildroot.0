Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76141C87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 10:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4100541378;
	Wed,  6 Aug 2025 10:39:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kJEB43ivIylI; Wed,  6 Aug 2025 10:39:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7470E415CD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7470E415CD;
	Wed,  6 Aug 2025 10:39:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 269ED233
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 10:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CA39610A7
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 10:39:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fDMnLMOkkU10 for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 10:39:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 97A8B60E8E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97A8B60E8E
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97A8B60E8E
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 10:39:06 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.163.130]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MlNtP-1uMLco1h09-00j0Sd; Wed, 06
 Aug 2025 12:39:03 +0200
Message-ID: <e0be5ac7-595b-47ca-a778-fdd1d5754b2a@gmx.de>
Date: Wed, 6 Aug 2025 12:39:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Cc: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>
References: <20250803144208.195144-1-ps.report@gmx.net>
 <20250803144208.195144-2-ps.report@gmx.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20250803144208.195144-2-ps.report@gmx.net>
X-Provags-ID: V03:K1:2Cj086siwOUDhqd9AA/z4GgqFCf5QY8bA7wbw95iNnsuo68Wumy
 pSM+qeMaNgwvXbRUz1ZCsZM1speygcgpMhEncUQBjzmtCFhUHLTweBGDWKkp7m6Fj3N19k6
 psRGktIUwci7v2Nv4D0s6t/pqYn1fP9xizg8lWDWXyUXmM45/JdC5mRgKjU8arNsG904ZO6
 pB0rEWoAmOiA09FLDsVAw==
UI-OutboundReport: notjunk:1;M01:P0:9uw976nmOxs=;jxIRCuqwUAihl/sOCjsDmnYT1Ci
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1754476743; x=1755081543; i=fiona.klute@gmx.de;
 bh=6xuTbVRoe4o22OayoBkD+c59Nr5sZdLVqfq819CQRJE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=OsbtTMZwYTAH8EdictDFQyJGvIajq1IDiGArGFp5aKW2VTGpKnkUd6HBChOq0yZa
 7Mb9JlyW0okVG+b53+8Uuhc/9onQf6JoWtPTDPFwSNPsoz01qQSUMC2krOOA1Dt1Z
 9wEvQw5K+4BbAD1b5knkXMoSnjAFQQModrQ+0JynZJ1FaIY0m4JtmnaVkVqng/pB9
 gLd4D0W1yfIzFI+P30fudsIhkS+WuuW/SDeeWz3wjgeReB0a67qD5c6O9/bYKELhK
 0KHJSHGMfWDxlSBvZWDKNbmn2lKUrUqq1BjjPpO1oMu1j4tEhDPennEOzbzD9Z9lV
 0vREUzD7MJjjozngEA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=OsbtTMZw
Subject: Re: [Buildroot] [PATCH 2/3] package/rpi-firmware: bump version to
 95be71b
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
> Version 95be71b matches with kernel 6.12.41.
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Tested-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Tested on CM4 and Zero 2W, with the RPi bootloader booting into U-Boot.

Thanks,
Fiona

> ---
>   package/rpi-firmware/rpi-firmware.hash | 2 +-
>   package/rpi-firmware/rpi-firmware.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
> index c2ca9343f1..0645d6ad77 100644
> --- a/package/rpi-firmware/rpi-firmware.hash
> +++ b/package/rpi-firmware/rpi-firmware.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  b120625c1e0d2dec819638a6fda97c74d1c86e184c6a4263cdf04faa2d5bbe2e  rpi-firmware-1.20250326.tar.gz
> +sha256  6c1b017867c3a51e606859f1cd50df61b94af311577583b6b2a113d11131ee93  rpi-firmware-95be71b8c0f63f03dc06dd0e4c2e5535e6fb4a93.tar.gz
>   sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> index 2577d16a01..d0b6abcc6f 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   # Please keep in sync with configs/raspberrypi*_deconfig
> -RPI_FIRMWARE_VERSION = 1.20250326
> +RPI_FIRMWARE_VERSION = 95be71b8c0f63f03dc06dd0e4c2e5535e6fb4a93
>   RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
>   RPI_FIRMWARE_LICENSE = BSD-3-Clause
>   RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
