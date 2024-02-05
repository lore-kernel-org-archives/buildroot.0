Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F10C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 15:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75AA740162;
	Mon,  5 Feb 2024 15:14:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75AA740162
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j7WYZzRYRSoc; Mon,  5 Feb 2024 15:14:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4AA2415CA;
	Mon,  5 Feb 2024 15:13:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4AA2415CA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C3CE61BF215
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9E9481EBB
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:13:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9E9481EBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZMI7W5ISza12 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 15:13:52 +0000 (UTC)
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D2F381EB0
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 15:13:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D2F381EB0
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id X0fMr0AGcl81fX0fMrUhLp; Mon, 05 Feb 2024 16:13:49 +0100
Message-ID: <63d87792-b361-4915-b3bb-4bbb192a880d@benettiengineering.com>
Date: Mon, 5 Feb 2024 16:13:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20231123134052.239690-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20231123134052.239690-1-dario.binacchi@amarulasolutions.com>
X-CMAE-Envelope: MS4xfFuURbNT3BZJ9SKk+KlY4uE3Ra2CLIYAo1IneMbsIEwxbl9+EIpBEU69cz24hPQETuDCIOcxPu4sz7PCx5vPXiCPAtV9sRfeA4R0TyTZ+XI7bUS568Ts
 kDIOdEmwpvi0o/bhL0YPpsHmn6oAQCcQ2EgAPzj2vmvxzbMTB9q3cOpNeoUD/slx2lYFWOiURxCGTKVVM7c9Jf+0ErHz1X9IrYM+CSZ1kJV8B1TRnYatLhPa
 rRPmwyYD0C1xLXw61HShgxiGRYXA8NwaBcE0ceH4mmesD8oLdvORqFcLq1LN5jNaNFomXGdIirXeApBof0GHhTlSeq1Su4Knd/ecc5dPd3k=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1707146029; bh=FSgLzk6tlrYVs0wyZPUjgFczUZDxv59oL7htyB1igoc=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=XDI52rWqSGZmi9pSItOB5u1uenc0vUW+YqOnplbnI3fwnwY7rKH5xXyTRIobdNvzV
 k92sjM2E7oJ9fkqJ4ASFNbyd2cBHHmpB3FGRkgu9XWd/djnawnRRfhUpGK3MFldWwd
 nPnLQAymSq1zAml4lW+3G9NL+HrMVzXomtiF+HZoU27XJLCMb5vt1frQ/wyiVhvowY
 u9aznOGU3IIwQvECjKhMOjsVWViQvQgyZjXrUBkuU3A1d9FtMmdtJ0fJEyCMIOhGQk
 G5J+JzdQ9BuJOHPpNrUZqjgaC9HZxXDT/xUCjIH9pWrTMXKNMrID8/QBjvi53ucLUZ
 17+ghUT404uAQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=XDI52rWq
Subject: Re: [Buildroot] [PATCH 1/2] configs/ti_am62x_sk_defconfig:
 explicitly set the kernel version
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario,

On 23/11/23 14:40, Dario Binacchi wrote:
> Commit 4b8fddb060fb ("configs/ti_am62x_sk: new defconfig) forgot to
> specify the Linux kernel version, so do that now.
> 
> When the defconfig was added, the default version was 6.4.x, so use
> version 6.4.16.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com> > ---
>   configs/ti_am62x_sk_defconfig | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
> index b98a68ff153f..6610e6fcf890 100644
> --- a/configs/ti_am62x_sk_defconfig
> +++ b/configs/ti_am62x_sk_defconfig
> @@ -1,7 +1,10 @@
>   BR2_aarch64=y
> +BR2_KERNEL_HEADERS_6_4=y

here ^^^ you need to specify BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4
and not the line above,

>   BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
>   BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.4.16"
>   BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"

Can you please correct and send V2?

Thank you!

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
