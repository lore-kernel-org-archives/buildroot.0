Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0803CC77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 13:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A63C34058E;
	Sun,  7 May 2023 13:18:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A63C34058E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YQinijhs_iXN; Sun,  7 May 2023 13:18:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C736D40192;
	Sun,  7 May 2023 13:18:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C736D40192
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C0E0D1BF2F9
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 13:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A23A64188E
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 13:18:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A23A64188E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gtSxHF8mPk54 for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 13:18:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 592784188D
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 592784188D
 for <buildroot@buildroot.org>; Sun,  7 May 2023 13:18:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id A8B6819F744;
 Sun,  7 May 2023 15:17:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 15:17:59 +0200
Date: Sun, 7 May 2023 15:17:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <20230507131759.GU252090@scaer>
References: <20230429204511.750377-1-geomatsi@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230429204511.750377-1-geomatsi@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683465481;
 bh=FE4PwnWeJmt0Cz8uhD0EkFyiIXbiVqD0OkZyOH52ric=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sI3akd1uQrYFGvEUtpUETQ2CtfEyre+6QAco0vuMrkBBNJn/wMnuqLCiZRn8vZVzV
 UPLyZlPn9APQ+6sTqCk493WWQelUOL1iNvXlrVWyahLt4t9O395BEQwYGTFNzbfyM/
 D801WAbumY9o3iLs1nZSGIG/hCJ1WdAt2hdpEdamZWWOYbr6m2gBPGR/CVO4m/chsX
 /bxvAlIP5LJGPE7s5+YzD2aatJJdbzSke2lAyL+37JsooSKWZGF0NuCJQJfYRTtcqt
 rvTU0fUKick5Cl0TE0JT4qdwv1sCn82GLuMNloluPuBAUgwqWogdZGO69JFdxQvVJ7
 1Lecy8mo1qeBQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sI3akd1u
Subject: Re: [Buildroot] [PATCH 0/3] orangepi: U-Boot needs OpenSSL
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

Sergey, All,

On 2023-04-29 23:45 +0300, Sergey Matyukevich spake thusly:
> Fix build issue reported by Buildroot CI for OrangePi One after recent
> BSP updates. And while at it, also introduce the same fix for OrangePi
> Zero and PC-Plus boards. Possible build issues are masked only because
> Linux kernel is built before U-Boot for those specific images where
> where extra kernel modules are enabled.

Whole series applied to master, thanks.

Regards,
Yann E. MORIN.

> Sergey Matyukevich (3):
>   configs: orangepi_one_defconfig: U-Boot requires OpenSSL
>   configs: orangepi_zero_defconfig: U-Boot requires OpenSSL
>   configs: orangepi_pc_plus_defconfig: U-Boot requires OpenSSL
> 
>  configs/orangepi_one_defconfig     | 1 +
>  configs/orangepi_pc_plus_defconfig | 1 +
>  configs/orangepi_zero_defconfig    | 1 +
>  3 files changed, 3 insertions(+)
> 
> -- 
> 2.40.0
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
