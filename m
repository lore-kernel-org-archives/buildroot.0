Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD1AC48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 16:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D14A960F15;
	Mon,  5 Feb 2024 16:04:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D14A960F15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KvD-F9rgi8D4; Mon,  5 Feb 2024 16:04:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11D8760EEE;
	Mon,  5 Feb 2024 16:04:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11D8760EEE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8813F1BF2C6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 16:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F16D404A6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 16:04:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F16D404A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d8YGaKa9JKhk for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 16:04:47 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D939B40494
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 16:04:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D939B40494
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D67E413FA46;
 Mon,  5 Feb 2024 17:04:41 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 05 Feb 2024 17:04:40 +0100
Date: Mon, 5 Feb 2024 17:04:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <ZcEHGGPViIgpsLL7@landeda>
References: <20240205133530.1188319-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240205133530.1188319-1-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707149084;
 bh=KNeJVRww4i3vCuGy8WeSo2kp7T88DDXXn6dccq4HVw4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BNpTN6NpsS+zdkeY2bnkx+Hci8DNpELVKVQ3IjvUwHlx6UlbCGA3n4fw2n/5pRlpv
 F8ydKXPLTyQ3JhPWYn/7Dj/6xnRv4zaUVwuZDLhmUR6p3d07pPtVCP0D2HF+cCY4rs
 1bw0dSGCr+UIATOkut6h4GibmoNF/HsQpctV0yRQ+Ps2UHEDM94hXPNvIJFvnoz0aW
 puStjy0mB/1jZeP4u0OsDOJEhnkXrZoDHVJlHwNOrd04kEZf1tYb2Fw1KFRxVpoFJ2
 XjfQ2mJXNuW5IFrdITKABONek2HpxldJtruRlD3OFy2yNYpt3hx7jG3xhxSFhzEjx9
 OGfqmUpJbqVvQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BNpTN6Np
Subject: Re: [Buildroot] [PATCH] support/testing: TestGrubX8664EFI: use
 Nehalem cpu emulation
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

Romain, All,

On 2024-02-05 14:35 +0100, Romain Naour spake thusly:
> Following the Bootlin toolchain bump to 2023.11-1 [1], the
> TestGrubX8664EFI failed with this error:

As we discussed IRL, I've reworded the commit log with your input.

>   # efivar -l
>   traps: efivar[86] trap invalid opcode ip:7fc187f4c7f4 sp:7fff9bbaa930 error:0 in libefivar.so.1.38[7fc187f4c000+16000]
>   Illegal instruction
> 
> Actually this error can be reproduced by installing other packages like
> "file" because the qemu emulation doesn't provide all assembler
> instruction emulation required by x86-64-core-i7 target used by
> TestGrubX8664EFI.
> 
> A similar issue has been fixed in toolchain-builder by adding Nehalem
> cpu emulation on the qemu command line [2].
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/6093853712
> 
> [1] 7e0e6e3b8618ab942f25b11ee72fbc5a4deefdf1
> [2] https://gitlab.com/buildroot.org/toolchains-builder/-/commit/f2b253732b4d1fc5b87badba7c2d48f12a197f76
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/testing/tests/boot/test_grub.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/boot/test_grub.py b/support/testing/tests/boot/test_grub.py
> index 9f3a6a8495..5315fa23ba 100644
> --- a/support/testing/tests/boot/test_grub.py
> +++ b/support/testing/tests/boot/test_grub.py
> @@ -120,7 +120,7 @@ class TestGrubX8664EFI(infra.basetest.BRTest):
>          # https://github.com/tianocore/edk2/commit/bf5678b5802685e07583e3c7ec56d883cbdd5da3
>          # http://lists.busybox.net/pipermail/buildroot/2023-July/670825.html
>          qemu_fw_cfg = "name=opt/org.tianocore/X-Cpuhp-Bugcheck-Override,string=yes"
> -        self.emulator.boot(arch="x86_64", options=["-bios", bios, "-hda", hda, "-fw_cfg", qemu_fw_cfg])
> +        self.emulator.boot(arch="x86_64", options=["-bios", bios, "-cpu", "Nehalem", "-hda", hda, "-fw_cfg", qemu_fw_cfg])
>          self.emulator.login()
>  
>          cmd = "modprobe efivarfs"
> -- 
> 2.43.0
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
