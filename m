Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67502C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Dec 2021 09:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1952400F2;
	Sun, 19 Dec 2021 09:04:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GFR9dO2UrXvK; Sun, 19 Dec 2021 09:04:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B93674016C;
	Sun, 19 Dec 2021 09:04:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F3EC1BF48D
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 09:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E56241ECF
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 09:04:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SInc8uQmf4ez for <buildroot@lists.busybox.net>;
 Sun, 19 Dec 2021 09:04:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4CE4641E64
 for <buildroot@buildroot.org>; Sun, 19 Dec 2021 09:04:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cb3:149f:d03e:db5a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 4B4F95FF27;
 Sun, 19 Dec 2021 10:04:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639904666;
 bh=cW6YLSWl43ABMvdOyH3ULRSZDW1WinMQJGowFOYNwP0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KqqZKPzSNF4otsZWYIZ325VCZ/vBxMjbDmcT2RRyOUfOvM+Mxygw5MfAEODFEE7uC
 UquuxjYHQupmmCFoTXLV7h6ypTKXiLvsXCoktfEjwQV0RZkdV/lXfojpmdAMTxbfdu
 qBDp3CLQinBw3nhdogAYqQeO24749mznbtzNCsW+0ejCiqWn6JPAVVAYViIAdhLukh
 tiGNz3q5sKQUCZ+BIEBFtLzQ5Qo9aSVANjL5hKmvFLMoHpGTPsPnKwdKQNzLasorDO
 Bd1tWSXfDhWodgnCXtFru9YrG2QNUmsB9eMZqBgcVSqEsHjjvmXMshqakHuAmbnF5i
 yevslyhsj/9Kw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 19 Dec 2021 10:04:20 +0100
Date: Sun, 19 Dec 2021 10:04:19 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211219090419.GD2603@scaer>
References: <20211218231047.665943-1-fontaine.fabrice@gmail.com>
 <20211218231047.665943-2-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211218231047.665943-2-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 178/178] package/imagemagick: host SVG
 support needs host gcc >= 4.9
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-12-19 00:10 +0100, Fabrice Fontaine spake thusly:
> host gcc >= 4.9 is needed since bump of harfbuzz to version 3.1.2 in
> commit 6861933d22006fbe8c961a41506beac826881f33 to avoid the following
> build failure:
> 
> In file included from ../src/hb-serialize.hh:36:0,
>                  from ../src/hb-machinery.hh:37,
>                  from ../src/hb-common.cc:30:
> ../src/hb-map.hh:67:18: error: 'is_trivially_copyable' is not a member of 'std'
>    static_assert (std::is_trivially_copyable<K>::value, "");
>                   ^

Where did you see that gcc 4.9 had it? I looked at the gcc-4_9_0-release
tag in the gcc tree, and it states:

    $ git grep is_trivially_copyable
    [...]
    libstdc++-v3/include/std/type_traits:  // is_trivially_copyable (still unimplemented)

Whereas gcc 5 has a proper implementation:

    $ git grep -A1 'is_trivially_copyable' libstdc++-v3/include/std/type_traits
    libstdc++-v3/include/std/type_traits:  // is_trivially_copyable
    libstdc++-v3/include/std/type_traits-  template<typename _Tp>
    libstdc++-v3/include/std/type_traits:    struct is_trivially_copyable
    libstdc++-v3/include/std/type_traits:    : public integral_constant<bool, __is_trivially_copyable(_Tp)>
    libstdc++-v3/include/std/type_traits-    { };

I see that 6861933d2200 (package/harfbuzz: bump to version 3.1.2) stated
that the requirement on the gcc version was bumped to 4.9 from 4.8, but
I am not sure how that can be...

Giulio, where did you get the info that gcc 4.9 was required (and not a
higher version)?

Regards,
Yann E. MORIN.

> Fixes:
>  - http://autobuild.buildroot.org/results/89e1194c1659d7e1af9db8ffe5feee770c448f76
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/imagemagick/Config.in.host | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/imagemagick/Config.in.host b/package/imagemagick/Config.in.host
> index 671b0995dc..fe0ad9a748 100644
> --- a/package/imagemagick/Config.in.host
> +++ b/package/imagemagick/Config.in.host
> @@ -17,6 +17,7 @@ if BR2_PACKAGE_HOST_IMAGEMAGICK
>  config BR2_PACKAGE_HOST_IMAGEMAGICK_SVG
>  	bool "SVG support"
>  	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # host-librsvg
> +	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-pango -> host-harfbuzz
>  	help
>  	  Say 'y' here is you need ImageMagick tools (like convert)
>  	  to support SVG.
> @@ -24,4 +25,7 @@ config BR2_PACKAGE_HOST_IMAGEMAGICK_SVG
>  	  This is not enabled by default, as it brings quite a few
>  	  extra dependencies, and thus extra build time.
>  
> +comment "SVG support needs a toolchain w/ host gcc >= 4.9"
> +	depends on !BR2_HOST_GCC_AT_LEAST_4_9
> +
>  endif
> -- 
> 2.33.0
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
