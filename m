Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F31C04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 10:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A7184173E;
	Sun, 25 Sep 2022 10:10:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A7184173E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UXBsyzHtIyOe; Sun, 25 Sep 2022 10:10:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3601B41728;
	Sun, 25 Sep 2022 10:10:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3601B41728
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C7E601BF2AF
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 10:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DF4941728
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 10:10:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DF4941728
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yiC-usa29FdM for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 10:10:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E00041722
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E00041722
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 10:10:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:139f:51c2:7bd0:4f35])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id EAC4913F85A;
 Sun, 25 Sep 2022 12:10:41 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 25 Sep 2022 12:10:41 +0200
Date: Sun, 25 Sep 2022 12:10:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220925101041.GH1127102@scaer>
References: <20220925090920.1585682-1-thomas.petazzoni@bootlin.com>
 <20220925090920.1585682-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220925090920.1585682-2-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664100648;
 bh=/Z8a3l93w9PYp7h/GJedloJDaTlRoA+UW4oo0OR+gME=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CTeK83BU9rDiwxzs3ZF6otk5XMuk6ghz/9TCvzYffCHsNUISPwOwacGP7fdWav7ic
 H4EcM7nOzh8c9GCHhh1QWZgISbXqgjMyH55YX/ezCVk0A+NGHS4sNJVRTBrlDh6XNp
 hdPOBIbfB0fgrgopVkGIZM5U+yClxCuwKV0ZTCQ46D3DSyrAqSj4SK8+gfwuowFfrH
 gadXlUAIGEilGbzqYn3HZTuKyo/zJ9LTB1/QLzpaTHwPw0JQzTEtvYbVcJOpSb/KHM
 O2yLfOtHTzlRLoijBKzkF4sw4eKFj6ntj8dqWxB4yZz7iGqPZsMllWk+keYkX2OL7P
 qh/wGHCfKCOSA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CTeK83BU
Subject: Re: [Buildroot] [PATCH v2 1/5] arch/Config.in.xtensa: adjust
 endianness logic to avoid bogus configurations
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
Cc: Jonathan Ben Avraham <yba@tkos.co.il>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-09-25 11:09 +0200, Thomas Petazzoni spake thusly:
> The Xtensa architecture supports both LE and BE configurations. When
> BR2_XTENSA_CUSTOM is chosen, a choice in menuconfig to choose between
> LE and BE.
> 
> However, if using the internal toolchain backend, when the
> BR2_XTENSA_OVERLAY_FILE is empty, in practice, the configuration will
> always be big endian. But the choice being present, random
> configuration testing ends up testing configurations where
> BR2_XTENSA_OVERLAY_FILE is empty, but the endianness selected is LE,
> which is incorrect.
> 
> This commit fixes this by preventing the selection of
> BR2_XTENSA_BIG_ENDIAN when an internal toolchain is used with an empty
> overlay file.
> 
> This commit will allow reverting
> 4cbf7336914f25478aea943456ba7dc3c892c21a ("arch/xtensa: custom
> configuration requires an overlay") which broke the build for external
> toolchains that use a custom Xtensa core.
> 
> Fixes (even though currently hidden by commit
> 4cbf7336914f25478aea943456ba7dc3c892c21a):
> 
>   http://autobuild.buildroot.net/results/702e2886156f291466375dfcf412c20f1aa5857d/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  arch/Config.in.xtensa | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/Config.in.xtensa b/arch/Config.in.xtensa
> index f9d5adb4c9..4bb58e1964 100644
> --- a/arch/Config.in.xtensa
> +++ b/arch/Config.in.xtensa
> @@ -37,6 +37,10 @@ config BR2_XTENSA_LITTLE_ENDIAN
>  
>  config BR2_XTENSA_BIG_ENDIAN
>  	bool "Big endian"
> +	# Internal toolchains without an overlay file are always
> +	# little-endian, so we prevent from selecting big endian in
> +	# this case.
> +	depends on BR2_XTENSA_OVERLAY_FILE != "" || BR2_TOOLCHAIN_EXTERNAL

I think that dependency should go to the whole choice instead:

    choice
        prompt "Target Architecture Endianness"
        default BR2_XTENSA_LITTLE_ENDIAN
        depends on BR2_XTENSA_CUSTOM || BR2_TOOLCHAIN_EXTERNAL

This should cover the external toolchain case, and the internal
toolchain for a custom core (assuming we keep the no-empty overlay for
custom cores).

I.e. semantically, choosing between big or little is not about having or
not having an overlay, but about being a custom core or not (or using a
custom toolchain).

That way, even for gdb and the kernel, with an external toolchain, we
still allow building the; with an empty overlay.

Regards,
Yann E. MORIN.

>  endchoice
>  
> -- 
> 2.37.3
> 

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
