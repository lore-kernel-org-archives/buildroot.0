Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830ECC636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 16:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14FA66100F;
	Tue,  7 Feb 2023 16:38:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14FA66100F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KwaKznzJafjQ; Tue,  7 Feb 2023 16:38:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31C366101D;
	Tue,  7 Feb 2023 16:38:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31C366101D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 603EF1BF5F8
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 16:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 319FB81EB0
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 16:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 319FB81EB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IuPaRRZcf0If for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 16:38:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0565D81E19
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0565D81E19
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 16:38:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E675013F895;
 Tue,  7 Feb 2023 17:38:03 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 07 Feb 2023 17:38:03 +0100
Date: Tue, 7 Feb 2023 17:38:03 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Graeme Smecher <gsmecher@threespeedlogic.com>
Message-ID: <20230207163803.GI4124@scaer>
References: <20220509190650.1348657-2-gsmecher@threespeedlogic.com>
 <20220519160214.214701-1-gsmecher@threespeedlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220519160214.214701-1-gsmecher@threespeedlogic.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675787886;
 bh=UFg3ygx+DeIM8xk1UKIaa4pZOWSEjMi8LCCldjD6/xg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hmxy/xLGclRMUZmoE7+T6yaGZUe/qZUTXule7l9r/cDSBM3dbgVDSUwePeAqFoNI0
 nbR/FSUJsaopjDO9cu+WzumYQCf3iIsrZlnjePOtUdhfw8/t9G0oO3eFS+3NYtFVyr
 f55C6DkCkKd6XoQITZ2smg2FWpr4yTvkXKngBCi1hNG9wYtkTuEadZJeb3kjZVQDN1
 ys+cMt3KOUE6ikPmh5nw+uXb/YdQXI3N6gCvRu655rEqyzGbReXtAkw8aXFoFJGmde
 hIrwgQanrNrGjh9GCKjwpXIFFUo24hWhITyL7Udz3m5J0zOhij7p842B5UehDG24yv
 a3K2bTr0uz4gA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Hmxy/xLG
Subject: Re: [Buildroot] [PATCH v2] package/python-orjson: disallow build
 when using musl.
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

Graeme, All,

On 2022-05-19 09:02 -0700, Graeme Smecher spake thusly:
> The python-orjson build bails as follows when using musl libc:
> 
> 	error: cannot produce cdylib for `orjson v3.6.7 (...)` as the
> 	target `i586-unknown-linux-musl` does not support these crate types

I could not reproduce such an error wit the following defconfig:

    BR2_TOOLCHAIN_BUILDROOT_MUSL=y
    BR2_TOOLCHAIN_BUILDROOT_CXX=y
    BR2_PER_PACKAGE_DIRECTORIES=y
    BR2_PACKAGE_PYTHON3=y
    BR2_PACKAGE_PYTHON_ORJSON=y

Since you submitted this patch, pythn-orjson was bumped multiple times,
and we've also bumped rust to 1.66.1, so maybe that was fixed now.

Could you have a further look into this, please?

Regards,
Yann E. MORIN.

> It's not machine-specific (it occurs on i586, s389x, and arm platforms),
> and is tied to what appears to be relatively arcane details for
> rust/musl:
> 
> 	https://github.com/rust-lang/rust/issues/59302
> 
> At some point, it will be possible to remove this restriction - but not
> yet.
> 
> Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>
> ---
>  package/python-orjson/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/python-orjson/Config.in b/package/python-orjson/Config.in
> index 420e023b0a..b2ad9062cc 100644
> --- a/package/python-orjson/Config.in
> +++ b/package/python-orjson/Config.in
> @@ -1,6 +1,8 @@
>  config BR2_PACKAGE_PYTHON_ORJSON
>  	bool "python-orjson"
>  	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> +	# doesn't build with musl until rust's cdylib targets work with it
> +	depends on !BR2_TOOLCHAIN_USES_MUSL
>  	select BR2_PACKAGE_PYTHON_CFFI # runtime
>  	help
>  	  orjson is a fast, correct JSON library for Python. It
> @@ -10,3 +12,6 @@ config BR2_PACKAGE_PYTHON_ORJSON
>  	  instances natively.
>  
>  	  https://github.com/ijl/orjson
> +
> +comment "python-orjson requires rust cdylib support, which musl doesn't have yet"
> +	depends on BR2_TOOLCHAIN_USES_MUSL
> -- 
> 2.35.1
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
