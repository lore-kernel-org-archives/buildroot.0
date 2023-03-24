Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883D7C6FD1C
	for <buildroot@archiver.kernel.org>; Fri, 24 Mar 2023 08:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 079CD60FAA;
	Fri, 24 Mar 2023 08:07:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 079CD60FAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qPtoHKf8Bi7D; Fri, 24 Mar 2023 08:07:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 400B660F75;
	Fri, 24 Mar 2023 08:07:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 400B660F75
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 673C11BF28E
 for <buildroot@lists.busybox.net>; Fri, 24 Mar 2023 08:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 402F240604
 for <buildroot@lists.busybox.net>; Fri, 24 Mar 2023 08:07:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 402F240604
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jSrwsfw66jut for <buildroot@lists.busybox.net>;
 Fri, 24 Mar 2023 08:07:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30795400C7
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 30795400C7
 for <buildroot@buildroot.org>; Fri, 24 Mar 2023 08:07:15 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id CCF31BDE5BAC;
 Fri, 24 Mar 2023 09:07:12 +0100 (CET)
MIME-Version: 1.0
Date: Fri, 24 Mar 2023 08:07:12 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Kenneth Roland <kjroland75@hotmail.com>
In-Reply-To: <PH0PR20MB63214D64AC645BD019DB6E39D6B99@PH0PR20MB6321.namprd20.prod.outlook.com>
References: <PH0PR20MB63214D64AC645BD019DB6E39D6B99@PH0PR20MB6321.namprd20.prod.outlook.com>
Message-ID: <1104727d6e209c0c87da6c76b6111bb6@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.8 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1679645232; bh=A+iiHtOhKB1k3oQfXpGyxcFX5zJQijsIsPY8mS1BGqg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=UxZTB9ERKSYfDkI93RWhRy3YKkiE7FVMzO3wQibazs6ywQmfjrU3BIgomQC86KFot
 RIST4eXWh4+SD8wr1QoGQEfwkkOXozNS7P04Mon1rr4k+pnWUndlJR9uYfRSSEhPTI
 7TLh+4rwO8U+gaFt76hzOU8JJEdUh41NCzcghgNM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=umbiko.net header.i=@umbiko.net
 header.a=rsa-sha256 header.s=mail header.b=UxZTB9ER
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
Cc: Kenneth Roland <kjroland75@hotmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


On 2023-03-23 13:09, Kenneth Roland wrote:
> Hello,
> Make-cleaned my directory before this, but I did it one more time and 
> got the same error.
> Only thing that I was different was that the value increased from 432 
> to 448 for CONFIG_SYS_INIT_RAM_SIZE.

For a quick test, I cloned the board/amlogic package into an existing 
buildroot-git instance (2023.02-100-g9833247d49). In the build directory 
I ran:

wget 
https://raw.githubusercontent.com/mathieu-lm/libretech-cc-buildroot/master/configs/meson-gxl-s905x-libretech-cc_defconfig
mv meson-gxl-s905x-libretech-cc_defconfig .config
make nconfig
make uboot

It builds successfully:

>>> uboot v2020.01-rc5 Installing to target
>>> uboot v2020.01-rc5 Installing to images directory
cp -dpf /home/data/test/autobuild/build/uboot-v2020.01-rc5/u-boot.bin 
/home/data/test/autobuild/images/

> ```
>   CC      board/amlogic/p212/p212.o
>   CC      arch/arm/lib/reset.o
>   CC      arch/arm/lib/cache.o
>   CC      arch/arm/lib/psci-dt.o
>   AR      arch/arm/lib/lib.a
>   CC      boot/bootm.o
>   CC      boot/bootm_os.o
>   AR      cmd/arm/built-in.o
>   CC      cmd/boot.o
> arch/arm/lib/crt0_64.S: Assembler messages:
> arch/arm/lib/crt0_64.S:85: Error: constant expression expected at 
> operand 2 -- `ldr 
> x0,=((CONFIG_SYS_INIT_RAM_ADDR+CONFIG_SYS_INIT_RAM_SIZE-448))'

You seem to use a different u-boot version than specified in the 
original configuration. You might need to update the u-boot defconfig in 
board/amlogic/s905x-libretech-cc/uboot and probably also the toolchain 
(currently gcc 6 based, from 2017).

Kind regards,
Andreas

> make[2]: *** [scripts/Makefile.build:293: arch/arm/lib/crt0_64.o] Error 
> 1
> make[2]: *** Waiting for unfinished jobs....
>   CC      boot/pxe_utils.o
>   CC      boot/image.o
>   CC      cmd/bootm.o
>   CC      boot/image-board.o
>   CC      boot/bootdev-uclass.o
>   CC      boot/bootflow.o
>   CC      boot/bootmeth-uclass.o
>   CC      boot/bootstd-uclass.o
>   CC      boot/bootmeth_distro.o
> ```
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
