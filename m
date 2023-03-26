Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DAEEC6FD1C
	for <buildroot@archiver.kernel.org>; Sun, 26 Mar 2023 07:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8154B607FE;
	Sun, 26 Mar 2023 07:37:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8154B607FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XL05o1rZZ8mS; Sun, 26 Mar 2023 07:37:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A38B060804;
	Sun, 26 Mar 2023 07:37:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A38B060804
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B89291BF2B6
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 07:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 981A981EA9
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 07:37:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 981A981EA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fGuoj30i7eqn for <buildroot@lists.busybox.net>;
 Sun, 26 Mar 2023 07:37:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC93681E48
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC93681E48
 for <buildroot@buildroot.org>; Sun, 26 Mar 2023 07:37:49 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id 3D77BBDE0CBD;
 Sun, 26 Mar 2023 09:37:46 +0200 (CEST)
MIME-Version: 1.0
Date: Sun, 26 Mar 2023 07:37:46 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Kenneth Roland <kjroland75@hotmail.com>
In-Reply-To: <PH0PR20MB6321997EBA9F27BBB815B4EBD6859@PH0PR20MB6321.namprd20.prod.outlook.com>
References: <PH0PR20MB63214D64AC645BD019DB6E39D6B99@PH0PR20MB6321.namprd20.prod.outlook.com>
 <1104727d6e209c0c87da6c76b6111bb6@umbiko.net>
 <PH0PR20MB6321997EBA9F27BBB815B4EBD6859@PH0PR20MB6321.namprd20.prod.outlook.com>
Message-ID: <76ae809780d09f7503922e5cbc3c607e@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.8 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1679816266; bh=YgFldKwEzKWVDSaH8lIU+Y5/rahKWmh6axEkv6HP2ds=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=V8LVRySSeIQrAqjtZkEcCP3jgxPHlr+JJXjTvYsk3EQtNaWKLIa05FpGT3HOj2ZLD
 NiOpCFQhwClMwBjL1e+2XbToRzxv3pm7PCTo0enxowqpvAU28idEyphoYPgEIXEmAt
 IwwVibgn1yvFEMpmegifjf0vDrThjBaJ/Uh4Kd7w=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=umbiko.net header.i=@umbiko.net
 header.a=rsa-sha256 header.s=mail header.b=V8LVRySS
Subject: Re: [Buildroot] U-boot stable asks for SYS_LOAD_ADDR when compiling
 for Le Potato
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kenneth,

On 2023-03-25 20:26, Kenneth Roland wrote:
> You are right, I use the master version of U-Boot so that make 
> downloads the latest version. Is this incorrect practice? I didn't know 
> if I am supposed to use the latest version so that more optimizations 
> are included or if I should stick with what just works. I'm guessing I 
> should keep the original, 2020.01 release candidate 5?

If the boot loader works, I would keep it, at least for now. The 
assembler (binutils-2.27) seems to have a problem with this construct:

https://github.com/u-boot/u-boot/blob/8be7b4629e87ff8db08dd087c81d58129d029bad/include/system-constants.h#L17-L19

Not sure if this is a toolchain issue or something missing in the 
configuration. Try updating your uboot defconfig with:

$ make uboot-nconfig
enter SYS_LOAD_ADDR, then
$ make uboot-savedefconfig
then copy defconfig to 
board/amlogic/s905x-libretech-cc/uboot/libretech-cc_defconfig

and rebuild u-boot (rm build/uboot-custom/.stamp* && make uboot). At 
least, uboot-2022.04 builds successfully with the Linaro toolchain 
(needs openssl).

Actually, I would upgrade Buildroot first, configure a buildroot 
toolchain (the Linaro toolchain misses sys/random.h), switch to 2022.04 
uboot (current buildroot default) and then check if the kernel can be 
upgraded (the head of libretech-linux is currently at 5.19.0).

<cut>

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
