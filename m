Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08ADDC2BB3F
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 15:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A42B7404A1;
	Sat, 18 Nov 2023 15:16:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A42B7404A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NK4k0FRY5Qdz; Sat, 18 Nov 2023 15:16:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79CAF40519;
	Sat, 18 Nov 2023 15:16:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79CAF40519
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A3C01BF47E
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 15:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52AC582198
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 15:16:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52AC582198
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GF8SQ6AH6w4v for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 15:16:40 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F1A082197
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 15:16:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F1A082197
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4173:7e62:c00c:757b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 9076478050A;
 Sat, 18 Nov 2023 16:16:35 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Nov 2023 16:16:35 +0100
Date: Sat, 18 Nov 2023 16:16:35 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Antoine Coutant <antoine.coutant@smile.fr>
Message-ID: <20231118151635.GG996011@scaer>
References: <20231117155033.69419-1-antoine.coutant@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231117155033.69419-1-antoine.coutant@smile.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700320598;
 bh=qtUZWJOy/zjGNHUf/rfg73VbYCMf9/tTWbeZLHR9sos=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZmR2Yjq+JfE+PaV3yXn9mfpnsrZ4lAIWONuz8Cq+sCWE6f7oTWBPa+M61UvENGRBW
 3XW0upHP3wHwXwrDtjWF/aOvvAmYUhtKO0G7gZJHQLsQmZgipGGDeewepWf23zKFJy
 SNVIMZtoDiGOSufQatUe0bTIMGb2vDHkkOW6nagYZk+yVl1aA99gLDrOq6f0X80nFl
 +s/P6SJLl90NLezdhBElBFkcDJeao7PoJRrVc45RWzoRz0iTvFWFw9k3FQBmmlkbB9
 y88EC37s2VsO+PPTx5zFCEdd0a8+XO/5JyZfJK2Cl1GPiNT+YDdokPlAh58ubgUPds
 aRCIitYuI3G4Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZmR2Yjq+
Subject: Re: [Buildroot] [PATCH] board/khadas/vim3: add the path of the
 devicetree in extlinux.conf
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
Cc: romain.naour@smile.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Antoine, All,

On 2023-11-17 16:50 +0100, Antoine Coutant spake thusly:
> Without this patch, the devicetree used by linux at runtime is
> the u_boot devicetree.
> 
> While using rusticl on the khadas vim3 board with the default
> extlinux.conf, mesa's panfrost driver return "gpu shed timeout"
> errors. Adding "devicetree /meson-g12b-khadas-vim3.dtb" to the
> extlinux.conf file solve the problem. Linux successfully boot
> with and without the change but without this patch the devicetree
> used by linux at runtime is the u-boot devicetree.
> 
> The differences between the u-boot devicetree and the linux
> devicetree are:
> -The u-boot devicetree contains two more nodes than the linux devicetree. Those nodes are:
>     - smbios : compatible option is set to "u-boot,sysinfo-smbios".
>     - __symbols__ : present if -@ or --symbols is used during the devicetree compilation.
> -Most of u-boot devicetree nodes have a "phandle" property.
> -SoC and vpu have a "u-boot,dm-pre-reloc;" property.
> -Some aliases are different.
> -The u-boot operating points tables contains more nodes.
> The size difference between the u-boot devicetree and the linux
> devicetree is approximately 3.5kB.
> 
> During runtime, the linux devicetree have the "phandle" and
> "u-boot,dm-pre-reloc;" properties and the smbios node. So,
> The runtime devicetree is the one from u-boot.
> 
> Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>

Thanks for the extensive description!

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> 
> Without this patch, there is 18 lines modified in the runtime
> devicetree compared to the u-boot devicetree. These 18 same lines
> are also modified in the runtime devicetree with this patch
> compared to the linux devicetree. Those lines may be modified by
> u-boot during the boot process.
> The 18 lines added/modified by u-boot during the boot process are:
> -The comments about the device tree characteristics are modified.
> -The memreserve is added.
> -A serial number is added.
> -The u-boot version is added.
> -The bootargs are added.
> -The CVBS framebuffer is enabled.
> -The local-mac-address is set.
> -The memory size is modified.
> ---
>  board/khadas/vim3/extlinux.conf | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/board/khadas/vim3/extlinux.conf b/board/khadas/vim3/extlinux.conf
> index fede99b502..2b1544a5cc 100644
> --- a/board/khadas/vim3/extlinux.conf
> +++ b/board/khadas/vim3/extlinux.conf
> @@ -1,4 +1,5 @@
>  default buildroot
>  label buildroot
>     kernel /Image
> +   devicetree /meson-g12b-a311d-khadas-vim3.dtb
>  append root=/dev/mmcblk0p2 rootwait console=ttyAML0,115200
> -- 
> 2.25.1
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
