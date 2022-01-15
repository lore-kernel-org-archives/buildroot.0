Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D903C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 16:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F102F60ADC;
	Sat, 15 Jan 2022 16:03:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mWSNHOdjm6kD; Sat, 15 Jan 2022 16:03:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 434BE60A8F;
	Sat, 15 Jan 2022 16:03:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BC88C1BF4E7
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 16:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB5CD60A8F
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 16:03:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CnTBUSMUbCjF for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 16:03:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A63D4607F9
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 16:03:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a19f:b904:d24b:da3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 57F6813F80A;
 Sat, 15 Jan 2022 17:03:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642262613;
 bh=kQ8AhOb2FDzkvNKNdjW4QnnV1+kwqdzYytH2i7OnSQI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lCkSkk5BrZTUUyrQM5JIH68QWMfuN92wq0OszMLynAWhNMC9aQKBE/25dBybB9AJj
 TE1uUjyaO0EZ5tlUKRzhEkyOjeiwFm2cl6hHcaqXXCKC5/t78xtOaQbc6s6miZ9NbB
 gHYWt8MNEc7UyD2zvW02cDYV0JJuKO/NQnqc3wm9WdjRJMbhvu6fvSazrRkMtsTa5U
 DsYlo220p6DR+uljXOYp0IEPJeLQqwQC5MXLHwGFsZlCS7LmGXNG7B7aHAegv8A71f
 pHanK4z+xToxgSpGovjsqBxPQAwYveB2dd8+7PEMeDRw5+V8TGQjqiPruY+fpVgrxw
 2iwInvW+0cpmQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Jan 2022 17:03:28 +0100
Date: Sat, 15 Jan 2022 17:03:28 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220115160328.GP1945846@scaer>
References: <20220115143344.12319-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220115143344.12319-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] board/qemu/arm-vexpress-tz: use
 enable=on
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, All,

On 2022-01-15 15:33 +0100, Romain Naour spake thusly:
> Since Qemu 6.0.0 [1], a warning appear in the log if a short-form
> boolean option is used.
> 
> [1] https://git.qemu.org/?p=qemu.git;a=commitdiff;h=ccd3b3b8112b670fdccf8a392b8419b173ffccb4
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Etienne Carriere <etienne.carriere@linaro.org>
> Cc: Dick Olsson <hi@senzilla.io>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  board/qemu/arm-vexpress-tz/readme.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/qemu/arm-vexpress-tz/readme.txt b/board/qemu/arm-vexpress-tz/readme.txt
> index 7e62e943a6..3036dd54ca 100644
> --- a/board/qemu/arm-vexpress-tz/readme.txt
> +++ b/board/qemu/arm-vexpress-tz/readme.txt
> @@ -16,7 +16,7 @@ from the image directory:
>  	-smp 1 -s -m 1024 -d unimp \
>  	-serial stdio \
>  	-netdev user,id=vmnic -device virtio-net-device,netdev=vmnic \
> -	-semihosting-config enable,target=native \
> +	-semihosting-config enable=on,target=native \
>  	-bios flash.bin # qemu_arm_vexpress_tz_defconfig
>  
>  The boot stage traces (if any) followed by the login prompt will appear
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
