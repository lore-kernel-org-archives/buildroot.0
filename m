Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62419C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 21:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1504860B41;
	Sun,  6 Feb 2022 21:37:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mSF5tdqnljmT; Sun,  6 Feb 2022 21:37:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B68060B3C;
	Sun,  6 Feb 2022 21:37:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F316C1BF44A
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 21:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1472818C9
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 21:37:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EC6I9S2KBR1P for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 21:37:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77B52818C4
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 21:37:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9d52:b578:c062:8b13])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 4CB6E7802C2;
 Sun,  6 Feb 2022 22:36:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1644183428;
 bh=BNfTOR/nzB/7so7Z5NYOwWv9/9kYuGWSoeW/W4uiIiU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bpPJan/fajlJrPw79UFZUZ/Uo+BjIUYOYoqnAlfW9Zkn7hS31sjNwNqciHrVccuzH
 Gpa/BSpO8vLO2/O8qHIrSDqM/l7Qdyj7odJVY23gG4avrPwq34tZgmdQMzNljRxXu7
 55JGPvKEb1t5EKk974uqUBI7BllNAFcFqp7mcaVL9TA+bRykErUR8AxW6jOuk90yK5
 tS5u30TKkZ0dpQSyjTgaZEj4N0XzKdAY4FW0IVE+XwBk6dTGn8DkQ1ZHifgFCqaeM2
 TV/Xm/TbF+OXRWFzoUPug+CVeSCWDFqQUQ95Way09GIW4kUFikDnAASJ1w9PwG5lGs
 7q23uYCkfdrBg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 06 Feb 2022 22:36:57 +0100
Date: Sun, 6 Feb 2022 22:36:57 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220206213657.GA457876@scaer>
References: <20220206200532.2758493-1-giulio.benetti@benettiengineering.com>
 <20220206200532.2758493-2-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220206200532.2758493-2-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 01/16] board/aarch64-efi/genimage-efi:
 convert partition-type-uuid to single letter notation
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Gerome Burlats <gerome.burlats@smile.fr>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

FTR, a little recap of what we discussed on IRC, see below

On 2022-02-06 21:05 +0100, Giulio Benetti spake thusly:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  board/aarch64-efi/genimage-efi.cfg | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/board/aarch64-efi/genimage-efi.cfg b/board/aarch64-efi/genimage-efi.cfg
> index 87e85816bc..7fbe13d390 100644
> --- a/board/aarch64-efi/genimage-efi.cfg
> +++ b/board/aarch64-efi/genimage-efi.cfg
> @@ -18,13 +18,13 @@ image disk.img {
>  
>  	partition boot {
>  		image = "efi-part.vfat"
> -		partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
> +		partition-type-uuid = U
>  		offset = 32K
>  		bootable = true
>  	}
>  
>  	partition root {
> -		partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
> +		partition-type-uuid = L

As we discussed on IRC, this is not the same thing. genimage will extend
the 'L' shorthand to the full UUID 0fc63daf-8483-4772-8e79-3d69d8477de4,
which is different.

So I don't think uaing the shorthands are correct.

The UUID assignments are available on Wikipedia:
    https://en.wikipedia.org/wiki/GUID_Partition_Table#Partition_type_GUIDs

But the systemd docuemntation has extra UUID definitions:
    https://man.archlinux.org/man/systemd-gpt-auto-generator.8

And finally, if neither resources has a UUID for a specific
architecture, we can still use the 'generic' "Linux filesystem data"
UUID 0FC63DAF-8483-4772-8E79-3D69D8477DE4.

Regards,
Yann E. MORIN.

>  		image = "rootfs.ext2"
>  	}
>  }
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
