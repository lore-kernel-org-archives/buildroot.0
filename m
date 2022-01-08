Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7626C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 18:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70DEA815CD;
	Sat,  8 Jan 2022 18:10:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9FSnITjAY-Tt; Sat,  8 Jan 2022 18:10:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDFBB8151E;
	Sat,  8 Jan 2022 18:10:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 64CB71BF593
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52EF98151E
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:10:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m2ifv7SbjBxs for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 18:10:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 56AA481516
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 18:10:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4919:b1be:c8bf:308d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 974DE13F87C;
 Sat,  8 Jan 2022 19:10:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641665439;
 bh=SXSCxn46oFNo9Ow6Hy7Q/A+67qI5WqZxYKsRKSJYtSM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kCklZB0r+KHxNnvv0vq/IUl9WOgxg34QWCbbYwUCgopcJJxy0vUGrL5pNDO9iuFVR
 WV2n7/Zs8VYcgMYJAioNUjT5J7rGsKoLRO5vhD6FApppURo8EIVQr/dgB4epecyfol
 99u6ExQZA4mR1QRP5Oa/E+3+YJmanfHG3kW7X+TMy01vS3EbMVnS5BpKzKJfRupGZR
 LKnGbcwfOwQgCDTfj3RhGS2CZB7DsivmeBDTRW0OYEh2bfCgnMqnoeVsktpyswOh3B
 h0cV8f4x8sgA7ry2iv6VkkoIkjbRQY3OL0hfarMiKmCVAdwU5Va99ogUpB9Y5cdHMc
 wM4Gey0iLOAhA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 08 Jan 2022 19:10:37 +0100
Date: Sat, 8 Jan 2022 19:10:37 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220108181037.GC1881783@scaer>
References: <20220108164646.2737567-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220108164646.2737567-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] drop .defconfig
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

Fabrice, All,

On 2022-01-08 17:46 +0100, Fabrice Fontaine spake thusly:
> .defconfig has not been updated since 2016 with commit
> 4338a319b72570e433fd7484f8a95e1e0e978941 so drop this file which doesn't
> seem to be used

This breaks out-of-tree builds:

    $ mkdir /tmp/foo
    $ cd /tmp/foo
    $ make -C /path/to/buildroot O=$(pwd) defconfig
    [...]
    ***
    *** Can't find default configuration ".defconfig"!
    ***
    make[1]: *** [Makefile:1024: defconfig] Error 1
    make: *** [Makefile:23: _all] Error 2

So, rejected (although  I do agree that this should work...)

Regards,
Yann E. MORIN.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .defconfig | 51 ---------------------------------------------------
>  1 file changed, 51 deletions(-)
>  delete mode 100644 .defconfig
> 
> diff --git a/.defconfig b/.defconfig
> deleted file mode 100644
> index 7ab0c3fbf0..0000000000
> --- a/.defconfig
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -#
> -# Automatically generated make config: don't edit
> -# Mon Feb 18 09:11:56 2008
> -#
> -BR2_HAVE_DOT_CONFIG=y
> -# BR2_alpha is not set
> -# BR2_arm is not set
> -# BR2_armeb is not set
> -# BR2_cris is not set
> -# BR2_ia64 is not set
> -BR2_i386=y
> -# BR2_m68k is not set
> -# BR2_mips is not set
> -# BR2_mipsel is not set
> -# BR2_nios2 is not set
> -# BR2_powerpc is not set
> -# BR2_sh is not set
> -# BR2_sparc is not set
> -# BR2_sparc64 is not set
> -# BR2_x86_64 is not set
> -# BR2_x86_i486 is not set
> -# BR2_x86_i586 is not set
> -BR2_x86_i686=y
> -# BR2_x86_pentiumpro is not set
> -# BR2_x86_pentium_mmx is not set
> -# BR2_x86_pentium_m is not set
> -# BR2_x86_pentium2 is not set
> -# BR2_x86_pentium3 is not set
> -# BR2_x86_pentium4 is not set
> -# BR2_x86_prescott is not set
> -# BR2_x86_nocona is not set
> -# BR2_x86_core2 is not set
> -# BR2_x86_k6 is not set
> -# BR2_x86_k6_2 is not set
> -# BR2_x86_athlon is not set
> -# BR2_x86_athlon_4 is not set
> -# BR2_x86_opteron is not set
> -# BR2_x86_opteron_sse3 is not set
> -# BR2_x86_barcelona is not set
> -# BR2_x86_geode is not set
> -# BR2_x86_c3 is not set
> -# BR2_x86_winchip_c6 is not set
> -# BR2_x86_winchip2 is not set
> -BR2_ARCH="i686"
> -BR2_ENDIAN="LITTLE"
> -BR2_GCC_TARGET_TUNE="i686"
> -BR2_GCC_TARGET_ARCH="i686"
> -
> -#
> -# Target options
> -#
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
