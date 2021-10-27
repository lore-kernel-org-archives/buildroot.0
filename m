Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3087DC433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:14:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B96896103C
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B96896103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EBA0400F5;
	Wed, 27 Oct 2021 20:14:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EoZ9FCiSfoIb; Wed, 27 Oct 2021 20:14:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 965F340423;
	Wed, 27 Oct 2021 20:14:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 648B71BF3D4
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBB4640586
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:14:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nn4Ej1eXl98r for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 20:14:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9AC5C4054A
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 20:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1635365663;
 bh=/mYnfFTJuHPQHJg9azqg6unZS2iAtUnsv7gWx3Z/tV0=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=b4Qb1rW5O7ADDcmrq0A3AG9JodFyA6wVzO/Ph5+VlndUDy3/4YkyyDFl5TvnOsH5+
 2nnL8oCrJXuVmrzouita+KLwLSODN18FKx9f0OhSGaZR2NE06j+P0PUYA4oS4rdC5b
 IeIFNqEp2w8uBCztcoRvrDOCUK3/5rL9wU33yefk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.250]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHG8g-1mSZm30LvE-00DION; Wed, 27
 Oct 2021 22:14:23 +0200
Date: Wed, 27 Oct 2021 22:14:22 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211027221422.708bac33@gmx.net>
In-Reply-To: <20211027192153.415049-1-fontaine.fabrice@gmail.com>
References: <20211027192153.415049-1-fontaine.fabrice@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:OfjPdaQNDt0K/Hb1s9Cpsphl61aA75Hwv4idm2mV7bjaTLqFloq
 FwDb74Yy9NL2iGXzpbQLfZZBN3lK3KOKc9yA6nZLUZH9VRt0XIuXaaoL31y6SSR8r52CXfY
 4/4pUoJWXBAZU35dVV49UD1hJjK5gSMZ5plAR64jgamflsDuflNFw8CjE6d9T09DBpfBGdH
 C+sjaGS0KrVl6NosCDiUg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Dg7IHYhxtmw=:YDVhKhnpf2A2u0UKgiltab
 /sHDoJ5IzHHg9soHysKhY7K/fPZxKzBQEpRQUpyZW9DQyhzR+lj1TsVNG3gJf3SGfC4o41MrG
 fnH0Ml33wPBwTPT/gvr+bxDqBaLilMUxlg2AZEZ64nK18B5lOx0mXUYir3m/glLm5zaV4N7OU
 k4J1nJAzx53fcbu5Wi9ackIUCW4voNfJsFr51/WiE82ejMFVQcgZ+0S6qXhCEgjZpL+QKEMUg
 Kulweur5QcBja8FC8SpjRvsR65h6IwJp7LCKC5hEUNHeUrRYasToZSxncq+Z7CQgPWiIV03Kr
 2j3cWIsNyteVOGL9+JYJALZEWEaqWAB+02P/mbQJyP2+2YxHUGs1BgwurpumD3sv7tZiFdCoa
 BgM7xTdb+bfFOEOyh41OXG+ToV7z72wnL7xqz+MxW0742/7yyHB5iTzqqnFSi0NOMaql7z1EV
 mLVrSiPcquKtotTSSBndsJXo7ABVZiR/aoqxVqUoS+Dx+JD3SFPev0pKValQc0dqz0kTwzc2x
 2DQHnkXtgYXwOOieO3xwlDr004IRhi9e6CpyFTi6DwYpbfZ2GBL3LQU4kHaoHAKdkcKAJMxKc
 /HfGMid32Y+gcIEoCLwtfYfRcHEPUldv4XGbjEuCtvTitkwE2Rz8LrGmcoeCeBwLzMGYJTrgh
 fKVH9XgpgxQiq904VRmHtSQZz4pdmYjTjK6EaFuZjBcdBYz4dbAAMbftL1NcGLUiR1ZclV+m7
 MpBQcp1doY31yy6PNvS7JS1WduCxdwsZ1prc+9C+pp8XMWanzqQUibaJDNl97FWiDVhJn9A5j
 xzC2amEsNU3P4iSXMP7MO/2x12x/xC5s5EnHChezQMdoNCaka8BWfLZZM7GIvH8mP0w0HuzMP
 c8Q2RScYERKZ2ea097ASrFuQY4OZys6KdyXDFLh2yXuKR5G9YY2Pp/g7+L29v6GEdVfPWxqSe
 zVO3WwNH94ABFiAJnpCZiC8xG6fNfqjgse8CtJJ6AMYOPd34Ew2L/iJp3jJrp3HAR8l3MOTn/
 0mlWfekHVuy56xmQWDU955LjVtHhCHvu2Z8dkXoXMHsqzwIWe+4ltQGm2XJp4bp4IhpFfYGxR
 Ea0KEv4Z8R2AsA=
Subject: Re: [Buildroot] [PATCH 1/1] package/rpi-firmware: fix
 BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_X
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
Cc: Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Wed, 27 Oct 2021 21:21:53 +0200, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since the rework of boot/config
> file handling in commit 689b9ac439ab7b507c8982b6102bddf59d03efbf (fix
> made in b8c8fcee7a38558a7247ef772ac9d93ff87bd943 was incomplete):
>
> /usr/bin/install: cannot stat '/home/buildroot/autobuild/instance-0/output-1/build/rpi-firmware-2ef3800b1b71c0e30c2a61ecad6e007ae96ea342/boot/fixupx.dat': No such file or directory
>
> Fixes:
>  - http://autobuild.buildroot.org/results/c91224af44327a301f87f239a73721173b81ce16
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/rpi-firmware/rpi-firmware.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> index 9d73d5300c..3a4741a0ff 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -13,7 +13,7 @@ RPI_FIRMWARE_INSTALL_IMAGES = YES
>  RPI_FIRMWARE_FILES = \
>  	$(if $(BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN), bootcode.bin) \
>  	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI), start.elf fixup.dat) \
> -	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_X), start_x.elf fixupx.dat) \
> +	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_X), start_x.elf fixup_x.dat) \
>  	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_CD), start_cd.elf fixup_cd.dat) \
>  	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_DB), start_db.elf fixup_db.dat) \
>  	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4), start4.elf fixup4.dat) \

Thanks for fixing it (again)...

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
