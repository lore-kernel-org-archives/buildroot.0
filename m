Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42762C4167B
	for <buildroot@archiver.kernel.org>; Fri,  1 Dec 2023 12:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C20D784821;
	Fri,  1 Dec 2023 12:24:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C20D784821
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XnSuS96q2FzJ; Fri,  1 Dec 2023 12:24:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E87268477A;
	Fri,  1 Dec 2023 12:24:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E87268477A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 598821BF2C8
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 12:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32CBC8477A
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 12:24:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32CBC8477A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5ANo7aWsBzZf for <buildroot@lists.busybox.net>;
 Fri,  1 Dec 2023 12:24:52 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B673B8473A
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 12:24:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B673B8473A
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4c68:322b:52a4:6805])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id B5445200586;
 Fri,  1 Dec 2023 13:24:46 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 01 Dec 2023 13:24:46 +0100
Date: Fri, 1 Dec 2023 13:24:46 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231201122446.GP3177259@scaer>
References: <20231130224904.630657-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231130224904.630657-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701433489;
 bh=0HsSkrnG0gPfVWoOAle+p0LsNBVkFFystr/znUJcsak=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pb1CejmbMRdu1Lhk14W33TdthkhiiG9WVRjxmntwBcL8p0/odPtekCdRxffmiYRdd
 ZO6XWb9Xdv/Vj/5/EytKy1MyKbcXNNirbT4k6TJv7/NLmmpHJl1S1aYQyJsVE8vFdS
 ofpL2z4WbvBl3d0tdAViFK9kdPfsbtfy1/fdk92foy6v7j5Z6W4gdyqKPHBLjGL0jL
 vJlvdVl/YJlF3rMcexP+U1jLS2Nlp07e781mnOEsrJ7TbTKcs6GGA9Olu3uBRP9+MG
 y9r47xOL5DELEudb1Mw98TuG8LT4JB3bN+2AkTMiHt7HTBwCVgbZxOckY+gLWGGI+v
 eFVK8Oi3uGNXQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pb1Cejmb
Subject: Re: [Buildroot] [PATCH 1/1] package/rtty: fix wolfssl build
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
Cc: Jianhui Zhao <zhaojh329@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-11-30 23:49 +0100, Fabrice Fontaine spake thusly:
> Fix the following wolfssl build failure raised at least since bump to
> version 7.4.0 in commit 6b5907bf65d27ed98532e9783f92f5575f38b3d2:
> 
> /home/autobuild/autobuild/instance-4/output-1/build/rtty-8.1.0/src/ssl/openssl.c: In function 'ssl_last_error_string':
> /home/autobuild/autobuild/instance-4/output-1/build/rtty-8.1.0/src/ssl/openssl.c:143:24: error: implicit declaration of function 'ERR_peek_error_line_data'; did you mean 'wolfSSL_ERR_get_error_line_data'? [-Werror=implicit-function-declaration]
>   143 |         ssl_err_code = ERR_peek_error_line_data(&file, &line, &data, &flags);
>       |                        ^~~~~~~~~~~~~~~~~~~~~~~~
>       |                        wolfSSL_ERR_get_error_line_data
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9db9f1dcc6760de4b78771bb79f109c4efd06c36
>  - http://autobuild.buildroot.org/results/16422af9469de114e552124542508c3b18ea8f19
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/rtty/Config.in | 2 ++
>  package/rtty/rtty.mk   | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/rtty/Config.in b/package/rtty/Config.in
> index 198d465713..434c5d6ae7 100644
> --- a/package/rtty/Config.in
> +++ b/package/rtty/Config.in
> @@ -2,6 +2,8 @@ config BR2_PACKAGE_RTTY
>  	bool "rtty"
>  	depends on BR2_USE_MMU # fork()
>  	select BR2_PACKAGE_LIBEV
> +	select BR2_PACKAGE_WOLFSSL_ALL if BR2_PACKAGE_WOLFSSL && \
> +		!BR2_STATIC_LIBS

That's not nice, as that forces wolfssl-all even in the case that it is
not used by rtty, i.e. when either mbedtls or openssl are enabled.

So, the full condition should be something like:

    select BR2_PACKAGE_WOLFSSL_ALL if BR2_PACKAGE_WOLFSSL && \
        !BR2_STATIC_LIBS && !BR2_PACKAGE_MBEDTLS && !BR2_PACKAGE_OPENSSL

But that becomes a bit too much.

I think the simplest solution is to just carry the .mk hunk of this
patch for now.

Eventually, I think it would be bettter to have a choice for the crypto
backend, like we have elsewhere, rather than rely on ordering of the
conditional blocks to defone what gets used, especially since that:

  - it does not match the ordering that upstream uses to find the
    backend (prefers openssl, then wolfssl, then mnedtls);

  - the ordering does not match the other places (e.g. libuhttpd [0] and
    libwebsockets have the same set of crypto backends, but each in yet
    a different order);

  - ordering is subject to being, well, reordered, and people would get
    confused when they update their buildroot to see their rtty change
    its crypto backend...

[0] libuhttpd suffers from the same issue in its Config.in, that this
patch would introduce: wolfssl-all os forced even if wolfssl will not be
used.

Applied to master, just the .mk hunk, thanks.

Regards,
Yann E. MORIN.

>  	help
>  	  Access your device's terminal from anywhere via the web.
>  
> diff --git a/package/rtty/rtty.mk b/package/rtty/rtty.mk
> index 964ec04ec4..8a40f584de 100644
> --- a/package/rtty/rtty.mk
> +++ b/package/rtty/rtty.mk
> @@ -24,7 +24,7 @@ RTTY_CONF_OPTS += \
>  	-DUSE_MBEDTLS=OFF \
>  	-DUSE_OPENSSL=ON \
>  	-DUSE_WOLFSSL=OFF
> -else ifeq ($(BR2_PACKAGE_WOLFSSL),y)
> +else ifeq ($(BR2_PACKAGE_WOLFSSL_ALL),y)
>  RTTY_DEPENDENCIES += wolfssl
>  RTTY_CONF_OPTS += \
>  	-DSSL_SUPPORT=ON \
> -- 
> 2.42.0
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
