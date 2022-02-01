Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C89C433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 23:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B990415AC;
	Tue,  1 Feb 2022 23:02:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 86iwqQsEsnUT; Tue,  1 Feb 2022 23:02:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC142415A3;
	Tue,  1 Feb 2022 23:02:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A5701BF3BE
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 23:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 604CE415A3
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 23:02:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YxjZ0zR9DwvI for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 23:02:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp4.osuosl.org (Postfix) with ESMTP id 042A241592
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 23:02:19 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id F2AEnn79Lks1JF2AEnXbzM; Wed, 02 Feb 2022 00:02:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643756538; bh=ju5A4pcKvFDwy+Z0SLfGwa04Zc0eCOv527wUtvquJn0=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=STC0gwBjp2UlDux05q7D/HF4wh5eiReoLEUixe8dIc1WmYmWvPrxbVZp/wQv7A5cr
 zEcMvdu63WTtlnq5UhHuo3j7Y25oJ4bYcqUzJ139q2a3/TKEvyrTcdohYxlzfANlvh
 HUVcxmbir7ljTRWY3tTIDrUBNM1Rmn/FDmc2wqPptvIVlEBcsF+vRRkLRBkV/I10xk
 ykmUj3RwOSJ8uaqLnoU10AaD6nAjPurjptX6EODSlNvcjWWUYgy88yxj+MzWOX6PAd
 fXUG5ILftROTpvtFrNW+X27pLDUDksTZ06i1bhdDhxhHalQ7fwt+qsLZpef5Ehb71R
 8AJXG5SpIWSNA==
Message-ID: <b5cc3bba-ccf4-2fe3-4fba-47d6b4756b73@benettiengineering.com>
Date: Wed, 2 Feb 2022 00:02:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20220201183331.4009320-1-giulio.benetti@benettiengineering.com>
 <20220201183331.4009320-6-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220201183331.4009320-6-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4wfCUnl9lISaSAK8nv+nGPB6GWidtDRwPx+NamzgiQfq8rJ5rTgIWT69qgSn1lk2UzGCFSCdEYt+C+Vs1bSVIck3p0D6rr//Pg7ey6mqItF+GvEj1mnu9b
 RZZ6GGSjZjhfJ0lZb2gTSJaZMNwogZ5ckttMg7p2q2p352a4GO3QzjEDADMOGVMkseXg2uCQKGqDn/NfhtIl+C2tVt5eVO1hZb6GS4+Zjq8XkqkZRPVZe3Ei
 eo21Oy1MxnBWd5fNDXjqEbovltnGdEZ/Gb0OA3EpDH0p6D1S+YRSGxuLyIK40jYsuHkYCa6ODY7rCtjP40qAajwxIMjl5Dxx93CLoUvt1iRGse0vpDLminhF
 kLtTqPqUhnihIpujUqsb9K36fVQ0UQ==
Subject: Re: [Buildroot] [PATCH 5/6]
 configs/microchip_sama7g5ek_mmc_defconfig: add missing
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15
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
Cc: Eugen Hristev <eugen.hristev@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Lothar Felten <lothar.felten@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This and next patch miss host openssl linux dependency.

I re-send V2. Sorry for the noise.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

On 01/02/22 19:33, Giulio Benetti wrote:
> Fixes:
> https://gitlab.com/ymorin/buildroot/-/jobs/2035821098
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   configs/microchip_sama7g5ek_mmc_defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/configs/microchip_sama7g5ek_mmc_defconfig b/configs/microchip_sama7g5ek_mmc_defconfig
> index b1cd193829..2d4b720342 100644
> --- a/configs/microchip_sama7g5ek_mmc_defconfig
> +++ b/configs/microchip_sama7g5ek_mmc_defconfig
> @@ -1,6 +1,7 @@
>   BR2_arm=y
>   BR2_cortex_a7=y
>   BR2_ARM_FPU_NEON_VFPV4=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/microchip/sama7g5ek/genimage.cfg"
>   BR2_LINUX_KERNEL=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
