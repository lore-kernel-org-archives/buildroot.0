Return-Path: <SRS0=Itk9=PT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17FD1C433F5
	for <buildroot@archiver.kernel.org>; Sun, 31 Oct 2021 21:33:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7874961038
	for <buildroot@archiver.kernel.org>; Sun, 31 Oct 2021 21:33:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7874961038
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09DFF40151;
	Sun, 31 Oct 2021 21:33:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SZBVpjAUnUmb; Sun, 31 Oct 2021 21:33:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54C29400DD;
	Sun, 31 Oct 2021 21:33:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 136151BF2C2
 for <buildroot@lists.busybox.net>; Sun, 31 Oct 2021 21:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02423400DD
 for <buildroot@lists.busybox.net>; Sun, 31 Oct 2021 21:33:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gJ00R9yutgza for <buildroot@lists.busybox.net>;
 Sun, 31 Oct 2021 21:33:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9CABB400D1
 for <buildroot@buildroot.org>; Sun, 31 Oct 2021 21:33:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6de6:4790:fdb7:6436])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 62D62B00535;
 Sun, 31 Oct 2021 22:33:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1635715993;
 bh=wITirpTHj9jYaew/uW3Jkh+4SP13VVPKrH7szK00/4Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q7QdpMktTQ8JLnwRdTWYW+QVuXi4KHlUpMhPqkUW/M9LRutTGsebqzepxaP6ude08
 puzm4HBRioLXgaepSJHJQHgok4p9JUrX4n8azARrcJLJ9EiGB65bTlUDMn7nKypdej
 39LwCgw2vxfPl/NkHU/JMvP52JQ9YUT+3nIIfcoMEtYQHaLNQtsrxNhOeLKzjESr0P
 sr0rxJF7v0s9XksP0Bxs+vSH1dcoNNFBrWT3QX2g1Rw8MofbuaVQAntreiTAJ6fRqF
 g+vIwdMf0mFEC9foHmuWrlDQIDyeinCiLQTWYEiResXisQovAL/JXQkRdiaM13odhh
 Nbmk2KAEthrTQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 31 Oct 2021 22:33:04 +0100
Date: Sun, 31 Oct 2021 22:33:04 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211031213304.GY2400@scaer>
References: <20211027192153.415049-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211027192153.415049-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
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

Fabrice, All,

On 2021-10-27 21:21 +0200, Fabrice Fontaine spake thusly:
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

Applied to master, thanks.

Regards,
Yann E. MORIN.

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
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
