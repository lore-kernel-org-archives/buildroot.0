Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519CDC77B73
	for <buildroot@archiver.kernel.org>; Sun, 21 May 2023 17:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C93BC60FD7;
	Sun, 21 May 2023 17:01:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C93BC60FD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t3GE3VDdz1Yg; Sun, 21 May 2023 17:01:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED96460FC8;
	Sun, 21 May 2023 17:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED96460FC8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B90A61BF3EA
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 17:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9249881EC5
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 17:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9249881EC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WbNg1eXeI00N for <buildroot@lists.busybox.net>;
 Sun, 21 May 2023 17:01:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B36A827D9
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B36A827D9
 for <buildroot@buildroot.org>; Sun, 21 May 2023 17:01:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:cc91:114a:eab6:96e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 20B79B0051E;
 Sun, 21 May 2023 19:01:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 May 2023 19:00:59 +0200
Date: Sun, 21 May 2023 19:00:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230521170059.GI171618@scaer>
References: <20230428230618.261911-1-romain.naour@gmail.com>
 <20230428230618.261911-2-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230428230618.261911-2-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684688463;
 bh=NkDJo0YzXYZElBvCLagf6+kQ71i1L+zqw9qZ9AQZjX0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OQ4wH5Vwy02eD2hVMCSICfPLrUbbijLY5mRkZSIGjRYYo7+mQwK3DWUjEXi9ux6/0
 acFQJZN0nwJSaT2RhqkUjLd/kkClCSwyboT5gA4KtKSBtPwJnyhSLnRBokFynrX3A+
 LWI2zGWx/YrqdRxIt5sCbPlywhH7prnwUD6x8d9H3/grNakoEum0YK0EkM3oYO7e0f
 j/72KvezyQ64Gxmaw7GP//Di8AcV4JazIZrjM8u4/nv73WyFfeErH8aJRvZW7Cv38D
 YrHl4eZ2iwtvcy3QYkBUxCN5twadDMVnNGW2M56dOiGjVK4UcdW7071dGtMsKP9OkY
 bRJXCmXPRuhGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OQ4wH5Vw
Subject: Re: [Buildroot] [PATCH]
 support/config-fragments/autobuild/br-arm-internal-glibc: update to
 bleeding edge components
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, All,

On 2023-04-29 01:06 +0200, Romain Naour spake thusly:
> The br-arm-internal-glibc.config used to be generally used as a configuration
> to test the bleeding edge versions of components. However, it has been
> lagging behind somewhat and produce invalid configuration since binutils 2.36
> removal... so let's bring it up-to-date:
> 
> - Binutils 2.39.x
> - GCC 12.x
> 
> Since Buildroot 2022.02, the autobuilders doesn't use the csv file anymore
> but the test-pkg script still use it.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../config-fragments/autobuild/br-arm-internal-glibc.config   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/support/config-fragments/autobuild/br-arm-internal-glibc.config b/support/config-fragments/autobuild/br-arm-internal-glibc.config
> index fb930cbef7..cd148f32e6 100644
> --- a/support/config-fragments/autobuild/br-arm-internal-glibc.config
> +++ b/support/config-fragments/autobuild/br-arm-internal-glibc.config
> @@ -1,6 +1,6 @@
>  BR2_arm=y
>  BR2_cortex_a8=y
>  BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> -BR2_BINUTILS_VERSION_2_36_X=y
> -BR2_GCC_VERSION_11_X=y
> +BR2_BINUTILS_VERSION_2_39_X=y
> +BR2_GCC_VERSION_12_X=y
>  BR2_TOOLCHAIN_BUILDROOT_CXX=y
> -- 
> 2.34.3
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
