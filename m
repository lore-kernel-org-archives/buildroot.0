Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17827E7D0A4
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 18:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAAA383C91;
	Thu, 21 Sep 2023 18:58:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAAA383C91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1R9O9s36g1nZ; Thu, 21 Sep 2023 18:58:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECFCC83C92;
	Thu, 21 Sep 2023 18:58:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECFCC83C92
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E51EE1BF360
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 18:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB1EC40235
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 18:58:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB1EC40235
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kADyK_W0-We2 for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 18:58:26 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3BA23401A1
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 18:58:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BA23401A1
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:e186:59f:97d4:33d1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id C372F19FDD6;
 Thu, 21 Sep 2023 20:58:20 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 21 Sep 2023 20:58:20 +0200
Date: Thu, 21 Sep 2023 20:58:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230921185820.GL512384@scaer>
References: <20230921111016.1041614-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230921111016.1041614-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695322703;
 bh=VYDGbgfb0xH5kDtNOOTrotw2LAJvA7uBmUlelE/gxfI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=myzWSgPbpn+mUKLPB+O4tOJK2fWR67UoKkcIQRegm4UkZexb7DngSaivri6rk49SF
 49V6wa6wJaUx8DsQ2wXiCkQ/AEY32DWEwYelgLRMdiOw5J09dfWwOSZKZN0kkudUSk
 mEOGKmMEe6GtS7HQgqBPCaKAMPsa6VaZruMVkU9hyEPXPB+G+sFqiq7GVZ2WgPIYXj
 1RDgvyDx2FAg0/478i90TtkELqH/z07NGLsjjYdUdO1KQN9/WKknnmIzTqJ29TKjM6
 qMYzFfGm0OurxLOEUaagDI+O84wS/NrdBJxZ8wmaz6l+JkNmEEAoI17mgh+USPgoXY
 xMHOg0m0REm6Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=myzWSgPb
Subject: Re: [Buildroot] [PATCH] package/esp-hosted: fix build failure on
 s390x
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

guilio, All,

On 2023-09-21 13:10 +0200, Giulio Benetti spake thusly:
> s390x doesn't support Wi-Fi on Linux so let's disable the package for such
> architecture.

So, your tile is wrong: it is not *fixing* a build failure of the package;
it excludes it for s390x.

But too late, it's already applied..


Regards,
Yann E. MORIN.

> Fixes:
> http://autobuild.buildroot.net/results/f52e8a14330ff281a7096baa47f387f8c1859345
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/esp-hosted/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/esp-hosted/Config.in b/package/esp-hosted/Config.in
> index 43c802fa44..42e1afa8c5 100644
> --- a/package/esp-hosted/Config.in
> +++ b/package/esp-hosted/Config.in
> @@ -1,8 +1,10 @@
>  comment "esp-hosted needs a Linux kernel to be built"
> +	depends on !BR2_s390x
>  	depends on !BR2_LINUX_KERNEL
>  
>  config BR2_PACKAGE_ESP_HOSTED
>  	bool "esp-hosted"
> +	depends on !BR2_s390x
>  	depends on BR2_LINUX_KERNEL
>  	help
>  	  This package builds and installs the Linux kernel driver for
> -- 
> 2.34.1
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
