Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9227CC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 17:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B19660F9F;
	Sat, 23 Jul 2022 17:08:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B19660F9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ofnfdIgrUJ3; Sat, 23 Jul 2022 17:08:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CEDB60A46;
	Sat, 23 Jul 2022 17:08:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CEDB60A46
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 83CF81BF5DE
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F49E81ABB
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F49E81ABB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id og9XdTq1cxBk for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 17:08:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18B7D81A95
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18B7D81A95
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 17:08:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8acf:5600:a82c:98de:96c7:ec71])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 455A119F742;
 Sat, 23 Jul 2022 19:08:28 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 23 Jul 2022 19:08:28 +0200
Date: Sat, 23 Jul 2022 19:08:28 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220723170827.GI2641@scaer>
References: <20220719074042.2214649-1-thomas.petazzoni@bootlin.com>
 <20220719074042.2214649-4-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220719074042.2214649-4-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658596110;
 bh=sW5khjBHlz1sDnA+F+oTsO3FNwxPAqAlhYXqen2XyjY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dgdwebt2BKtto6VN+bFq8hjdM5K4BOU/XGRchw52/fUaFGsh0ZaSjc8Pe4TY0a1V0
 vScr0MHgB8xWmUYTBxz+cXiPktO6/AYP0vggt2prTqXGrdBFsbALlKAB+uyjF4xrxk
 gY7ZVm4eTa042WO8KbvlsH69F4JluVVcIdqtvQBF2HHejwXvSS9MhO8G2C394XNf0u
 PEz//XTwgKXpG2QFJaoHvdk9BvLAZEeb5EVtuuORRAs2Y0CVxBm6YTS4PwQm1Dfns3
 ttWB1+/07j9uW/EA1wDQoKW32qE5oqixUteI+yYc+hDU2W2m3li9eecG5UjegxHNT+
 Zpk5n29PWhyVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dgdwebt2
Subject: Re: [Buildroot] [PATCH 3/4] boot/grub2: update readme.txt details
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-07-19 09:40 +0200, Thomas Petazzoni via buildroot spake thusly:
> For the Qemu-compatible UEFI firmware, the kraxel.org pointed to by
> the readme.txt file is outdated. Instead, point to the recently added
> ovmf-bin package in Buildroot.

Since we do not have ovmf-bin in the end, I've tweaked the text to
explain how to get the OVMF blurbs; please review my chhanges if they
still make sense.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> While at it, drop the pci=nocrs information, as it is no longer
> needed.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  boot/grub2/readme.txt | 21 ++++++++-------------
>  1 file changed, 8 insertions(+), 13 deletions(-)
> 
> diff --git a/boot/grub2/readme.txt b/boot/grub2/readme.txt
> index 0282fbdd13..c8d475ec73 100644
> --- a/boot/grub2/readme.txt
> +++ b/boot/grub2/readme.txt
> @@ -86,17 +86,10 @@ Notes on using Grub2 for x86/x86_64 EFI-based platforms
>  To test your i386/x86-64 EFI image in Qemu
>  ------------------------------------------
>  
> -1. Download the EFI BIOS for Qemu
> -   Version IA32 or X64 depending on the chosen Grub2
> -   platform (i386-efi vs. x86-64-efi)
> -   https://www.kraxel.org/repos/jenkins/edk2/
> -   (or use one provided by your distribution as OVMF)
> -2. Extract, and rename OVMF.fd to bios.bin and
> -   CirrusLogic5446.rom to vgabios-cirrus.bin.
> -3. qemu-system-{i386,x86-64} -L ovmf-dir/ -hda disk.img
> -4. Make sure to pass pci=nocrs to the kernel command line,
> -   to workaround a bug in the EFI BIOS regarding the
> -   EFI framebuffer.
> +1. Download/install the EFI BIOS for Qemu
> +   You can get it using the ovmf-bin package in Buildroot (installed
> +   in BINARIES_DIR), or use one provided by your distribution as OVMF.
> +2. qemu-system-{i386,x86-64} -bios <path-to-OVMF.fd> -hda disk.img
>  
>  Notes on using Grub2 for ARM u-boot-based platforms
>  ===================================================
> @@ -177,8 +170,10 @@ using qemu and EFI firmware built for qemu.
>   2. make
>  
>   3. Download the EFI firmware for qemu aarch64
> -    https://www.kraxel.org/repos/jenkins/edk2/
> -    (or use one provided by your distribution as OVMF-aarch64 or AAVMF)
> +
> +    You can get it using the ovmf-bin package in Buildroot (installed
> +    in BINARIES_DIR), or use one provided by your distribution as
> +    OVMF-aarch64 or AAVMF.
>  
>   4. Run qemu with:
>  
> -- 
> 2.36.1
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
