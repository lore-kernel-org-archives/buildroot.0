Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062C6C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 16:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A042B40004;
	Sat, 15 Jan 2022 16:05:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tB0TSFORFgIg; Sat, 15 Jan 2022 16:05:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 815A54013A;
	Sat, 15 Jan 2022 16:05:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 78F741BF424
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 16:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7101D8187F
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 16:05:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CMd1LYWJpzQb for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 16:05:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6630C8186E
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 16:05:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a19f:b904:d24b:da3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A555813F85A;
 Sat, 15 Jan 2022 17:05:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642262719;
 bh=f9BRENjxZeogGJFLt7CGFGZ0vY+kc+Zm5eIsGfB0Qlw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B9ZMRP6ZVykS1iX83JTNO0DuWCMoGOegTt+SbOk3ClohK4i5HeNeAV9OZF0F6XuRi
 n6knUmMXis7S4Wmtx1M1YQB2vKyEX6geNl39RwHRXySlzcGF/jiwutAtnf+v6m/wh9
 p+uwxzUytmjUyG9fjLYjCJ6NetHhnbl+6JceQ82oVc1OsxCyZZElenD26skMz8E6eV
 iIx40djR8ohE/29OU42ZIgLlk6rmsVWU1ZEcPgXAI4Vn+kNgHLg9DFUT0EidbTaUWU
 lPjE5QHs0iltZZg0rIhbMAAoqZCh86D1NcAsl7RUN2d/8OQasi41Ish/UJZUgAO2Di
 n7HqtQJwUOIuQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Jan 2022 17:05:17 +0100
Date: Sat, 15 Jan 2022 17:05:17 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220115160517.GQ1945846@scaer>
References: <20220115143344.12319-1-romain.naour@gmail.com>
 <20220115143344.12319-2-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220115143344.12319-2-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 2/2] support/scripts/boot-qemu-image.py:
 increase the timeout by 10
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

On 2022-01-15 15:33 +0100, Romain Naour spake thusly:
> As for the Buildroot testsuite, multiply every emulator timeout by 10
> to avoid sporadic failures in elastic runners.
> 
> qemu_arm_vexpress_tz_defconfig tested locally with sucess.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084046

Are you sure increasing the timeout will fix this failure? The
build-run.log contains another error:

    loaded file zImage from 40400000 to 408CAABF, 004CAAC0 bytes
    loaded file rootfs.cpio.uboot from 44000000 to 4438FA4E, 0038FA4F bytes
    Kernel image @ 0x40400000 [ 0x000000 - 0x4caac0 ]
    ## Loading init Ramdisk from Legacy Image at 44000000 ...
       Image Name:   
       Created:      2022-01-13  16:06:53 UTC
       Image Type:   ARM Linux RAMDisk Image (uncompressed)
       Data Size:    3734031 Bytes = 3.6 MiB
       Load Address: 00000000
       Entry Point:  00000000
       Verifying Checksum ... OK
    ## Flattened Device Tree blob at 40000000
       Booting using the fdt blob at 0x40000000
    ERROR: reserving fdt memory region failed (addr=7fe00000 size=200000)
       Using Device Tree in place at 40000000, end 400051f7

So, to me, this is not a timeout issue, but an actual boot issue.

Regards,
Yann E. MORIN.

> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  support/scripts/boot-qemu-image.py | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/support/scripts/boot-qemu-image.py b/support/scripts/boot-qemu-image.py
> index fba1533bb7..ba50ea69ee 100755
> --- a/support/scripts/boot-qemu-image.py
> +++ b/support/scripts/boot-qemu-image.py
> @@ -25,7 +25,7 @@ def main():
>      qemu_start = os.path.join(os.getcwd(), 'output/images/start-qemu.sh')
>  
>      child = pexpect.spawn(qemu_start, ['serial-only'],
> -                          timeout=5, encoding='utf-8',
> +                          timeout=50, encoding='utf-8',
>                            env={"QEMU_AUDIO_DRV": "none"})
>  
>      # We want only stdout into the log to avoid double echo
> @@ -36,7 +36,7 @@ def main():
>      time.sleep(1)
>  
>      try:
> -        child.expect(["buildroot login:"], timeout=60)
> +        child.expect(["buildroot login:"], timeout=600)
>      except pexpect.EOF as e:
>          # Some emulations require a fork of qemu-system, which may be
>          # missing on the system, and is not provided by Buildroot.
> @@ -58,7 +58,7 @@ def main():
>      child.sendline("root\r")
>  
>      try:
> -        child.expect(["# "], timeout=60)
> +        child.expect(["# "], timeout=600)
>      except pexpect.EOF:
>          print("Cannot connect to shell")
>          sys.exit(1)
> @@ -69,7 +69,7 @@ def main():
>      child.sendline("poweroff\r")
>  
>      try:
> -        child.expect(["System halted"], timeout=60)
> +        child.expect(["System halted"], timeout=600)
>          child.expect(pexpect.EOF)
>      except pexpect.EOF:
>          pass
> -- 
> 2.31.1
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
