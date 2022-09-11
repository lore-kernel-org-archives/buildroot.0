Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCFFECAAD3
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 19:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F1FB61035;
	Sun, 11 Sep 2022 19:31:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F1FB61035
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xuvkJaFISa2T; Sun, 11 Sep 2022 19:31:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8024160B9E;
	Sun, 11 Sep 2022 19:31:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8024160B9E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF87D1BF591
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 19:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B809660B9E
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 19:30:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B809660B9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2_SGrpB4ZYeo for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 19:30:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 933E860B72
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 933E860B72
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 19:30:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:41d6:744a:8631:c709])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CB60E13F895;
 Sun, 11 Sep 2022 21:30:46 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Sep 2022 21:30:46 +0200
Date: Sun, 11 Sep 2022 21:30:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220911193046.GH898622@scaer>
References: <20220910135256.1689860-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220910135256.1689860-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662924655;
 bh=7c24JyhmLvU4rIyd8k0XRYKThNqExrcukP5xCq8XJYs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eVRSfPyVUr711vlB+sWjaIT/5sn12cX5ZD5TQ38RintZky+DIB+Tp5kt7wk9BrtHe
 j5tA08ieU8Rpk0pyuwttLg/VEHV1R/H4ZUnFXoaY0qrTHTN7crTxm3PfUf49K9RTk7
 gpZlEyDuWMTJ3cEYhzAYx6PxM4zQ7ETxi31/oyRJErHeHGUd31k3ZJRfXdIEBhZCUO
 szcWQegYs3xo5CfqWzDcIWorrtGbbO43tYjvZvv3G9Lzl2HKYEIh3bduYLe0xyWqWM
 DOhBl/4I/iRO/xsq4MSy17TkFo8+GhNKJlZ4YKfX2UasJ//HrkFkoLeMj0G+68Y1IH
 pwH5/f/xJNQWA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eVRSfPyV
Subject: Re: [Buildroot] [PATCH 1/2] toolchain/Config.in: update gcc bug
 90620
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2022-09-10 15:52 +0200, Giulio Benetti spake thusly:
> Gcc bug 90620 reappeared with gcc 11.x so let's update
> BR2_TOOLCHAIN_HAS_GCC_BUG_90620 conditions.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  toolchain/Config.in | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index fbc2f28553..16e358344d 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -168,11 +168,12 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_85862
>  
>  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90620
>  # ICE: in do_output_reload, at reload1.c:7978 on microblaze.
> -# This bug no longer exists in gcc 10.x
> +# This bug no longer exists in gcc 10.x but reappeared in gcc 11.x
>  config BR2_TOOLCHAIN_HAS_GCC_BUG_90620
>  	bool
> -	default y if BR2_microblaze
> -	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_11
> +	depends on BR2_microblaze

I am not sure why the switch of default to depends is needed, because the
same condition can still be written without changing the default:

    default y if BR2_microblaze
    depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
            || BR2_TOOLCHAIN_GCC_AT_LEAST_11

Yeah, I see that other symbols that have a dependency on two gcc version
have the default/depends inverted, but symbols that have a dependency on
a single gcc version do not, e.g.:

    config BR2_TOOLCHAIN_HAS_GCC_BUG_85862
        bool
        default y if BR2_microblaze
        depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7

So, I think it is better to keep the same semantics between the two
situations.

So, I fixed that, and applied to master, thanks.

Note, there is also a third way to write it, and obviouslty we are also
using that:

    config BR2_TOOLCHAIN_HAS_GCC_BUG_93847
        bool
        default y if BR2_nios2 && !BR2_TOOLCHAIN_GCC_AT_LEAST_9

Meh... :-(

Note: this is *not* a plea for patches to fix that, at all. I just like
ranting a bit. ;-)

Regards,
Yann E. MORIN.

>  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93847
>  # ICE: compiler error: Segmentation fault on Nios II. This bug
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
