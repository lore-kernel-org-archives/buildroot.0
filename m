Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B819AC433EF
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:19:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 725BF60F39
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 725BF60F39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C65B80D0F;
	Fri, 12 Nov 2021 22:19:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lDHpYiATdPtp; Fri, 12 Nov 2021 22:19:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 879C780CF9;
	Fri, 12 Nov 2021 22:19:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C291C1BF3A3
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF7B640602
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:18:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q084rRW4XUAZ for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 22:18:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1DDB4058F
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 22:18:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [90.1.143.61])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 5633619F522;
 Fri, 12 Nov 2021 23:18:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636755537;
 bh=bn/MkfW6U6/tc5fpJUlOfY4DgwNHkJ0cmaz2utL8AkI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ruHnLczUhYmzqEX9fdtfiRz+5z0Y9+lGYZ9YjzWoK+0EwcdUWU1wDY4nU5C46lKeI
 b5Z5BakBPoED3QOw3NY57EOaPeOCA59rZHO0X6CNuM9h830n3OLI/gFvmb239tvwSN
 jUYgl7TJVMmbzI5s6t2XsPLGNVGaJcjHozE+0o2EPxVceKM+mg6ZXlUhqS0PYhIgQ8
 qHItQziD6bKGN/rkwdUE+fB/Fu3u/a7OdpHJxMD/3ZsX7XpNgmXG2e2NAy+P34N2UM
 MKW8P38pxwTYeS5IPj0Tnhx2FI1QbhiQE1C6jz1lmxYKmJ5QBpZKJkBIpeauhya5Ek
 55v7muN3t+1ow==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 12 Nov 2021 23:18:47 +0100
Date: Fri, 12 Nov 2021 23:18:47 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20211112221847.GJ247986@scaer>
References: <20211111200439.15379-1-ps.report@gmx.net>
 <20211111200439.15379-6-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211111200439.15379-6-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH/next v1 6/7] board/raspberrypi/readme.txt:
 add missing dtb files
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
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2021-11-11 21:04 +0100, Peter Seiderer spake thusly:
> Add missing dtb files:
>  - bcm2708-rpi-cm.dtb from genimage-raspberrypi.cfg
>  - bcm2708-rpi-zero.dtb from genimage-raspberrypi0.cfg:
>  - bcm2708-rpi-zero-w.dtb from genimage-raspberrypi0w.cfg
>  - bcm2710-rpi-cm3.dtb from genimage-raspberrypi3.cfg
>  - bcm2837-rpi-3-b.dtb from genimage-raspberrypi3-64.cfg
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  board/raspberrypi/readme.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
> index 98c44d80a1..d20096b5e6 100644
> --- a/board/raspberrypi/readme.txt
> +++ b/board/raspberrypi/readme.txt
> @@ -76,11 +76,16 @@ After building, you should obtain this tree:
>      output/images/
>      +-- bcm2708-rpi-b.dtb           [1]
>      +-- bcm2708-rpi-b-plus.dtb      [1]
> +    +-- bcm2708-rpi-cm.dtb          [1]
> +    +-- bcm2708-rpi-zero.dtb        [1]
> +    +-- bcm2708-rpi-zero-w.dtb      [1]
>      +-- bcm2709-rpi-2-b.dtb         [1]
>      +-- bcm2710-rpi-3-b.dtb         [1]
>      +-- bcm2710-rpi-3-b-plus.dtb    [1]
> +    +-- bcm2710-rpi-cm3.dtb         [1]
>      +-- bcm2711-rpi-4-b.dtb         [1]
>      +-- bcm2711-rpi-cm4.dtb         [1]
> +    +-- bcm2837-rpi-3-b.dtb         [1]
>      +-- boot.vfat
>      +-- rootfs.ext4
>      +-- rpi-firmware/
> -- 
> 2.33.1
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
