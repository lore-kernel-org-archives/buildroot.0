Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B77A5C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 08:43:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47F9B61154
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 08:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 47F9B61154
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F313F40017;
	Sat,  7 Aug 2021 08:43:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cSCQ5m2ysgsz; Sat,  7 Aug 2021 08:43:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E734F40018;
	Sat,  7 Aug 2021 08:43:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B08901BF2FA
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 08:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC77040018
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 08:43:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A5LFs_44qvNZ for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 08:43:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A2F540017
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 08:43:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f16c:16be:6f47:5c9a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BA98C13F88D;
 Sat,  7 Aug 2021 10:43:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1628325830;
 bh=jtHDmpvDM17Yi5YYKfUOcmmH8ynZmlcTQdla0qqb5mU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UtwdedU04a6W/NDQMjOvxUXQR3dM9GGjjzFWhAhpNn9f9oACgIh74zsfRWCuvXQnh
 ZDFwqMhJrDpavnlz3tFFoxf1BDIPAdImUP1TW+X73T+RXUoY9MaaJ7m1z5ZOa0c42b
 1UDjTHRg5ewLN2fwMNyTd7SV98gNlFfKqw8YHDFniVyRqTrKv+YSNyHoI65VKTWq5T
 twTXLCyDPCGZXfw5QSt17u5n7ceLRo1HJcKTRBaZ9nhJhOC7tgxMLWgJYTS5CBC2ps
 OPlNvRCtwCPom/4wJ0U7oD0CS1IXz9y/lw6JELlGP9eXWTGFOKJ/2PlVs3F5RtLZlJ
 8L2pun5Hr/PUw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 07 Aug 2021 10:43:46 +0200
Date: Sat, 7 Aug 2021 10:43:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210807084346.GS27036@scaer>
References: <20210806202746.4064407-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210806202746.4064407-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/mpd: needs gcc >= 8
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-06 22:27 +0200, Fabrice Fontaine spake thusly:
> Since bump to version 0.22.3 in commit
> b6576a458ca0d2e01b97799f64fef4a34a0dc6ea, mpd needs gcc >= 8 (following
> upstream answer to https://github.com/MusicPlayerDaemon/MPD/issues/1112)
> to avoid the following build failure with gcc 7.3.1:
> 
> /tmp/instance-7/output-1/host/opt/ext-toolchain/aarch64-linux-gnu/include/c++/7.3.1/bits/stl_tree.h:2091:28: error: no matching function for call to 'std::_Rb_tree<std::__cxx11::basic_string<char>, std::pair<const std::__cxx11::basic_string<char>, std::__cxx11::basic_string<char> >, std::_Select1st<std::pair<const std::__cxx11::basic_string<char>, std::__cxx11::basic_string<char> > >, std::less<std::__cxx11::basic_string<char> >, std::allocator<std::pair<const std::__cxx11::basic_string<char>, std::__cxx11::basic_string<char> > > >::_M_get_insert_unique_pos(std::pair<std::basic_string_view<char>, std::basic_string_view<char> >::first_type&)'
>   = _M_get_insert_unique_pos(_KeyOfValue()(__v));
>     ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4888d99404cc4273349ab036035c5ff7e086b83e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mpd/Config.in | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/mpd/Config.in b/package/mpd/Config.in
> index e8d10f8481..5ff4b432ec 100644
> --- a/package/mpd/Config.in
> +++ b/package/mpd/Config.in
> @@ -4,8 +4,8 @@ menuconfig BR2_PACKAGE_MPD
>  	depends on BR2_USE_WCHAR # boost
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_TOOLCHAIN_HAS_ATOMIC
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
> -	depends on BR2_HOST_GCC_AT_LEAST_7 # C++17
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17
> +	depends on BR2_HOST_GCC_AT_LEAST_8 # C++17
>  	select BR2_PACKAGE_BOOST
>  	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
>  	help
> @@ -412,9 +412,9 @@ config BR2_PACKAGE_MPD_ID3TAG
>  
>  endif
>  
> -comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 7, host gcc >= 7"
> +comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 8, host gcc >= 8"
>  	depends on BR2_TOOLCHAIN_HAS_ATOMIC
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
>  		!BR2_TOOLCHAIN_HAS_THREADS || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
> -		!BR2_HOST_GCC_AT_LEAST_7
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
> +		!BR2_HOST_GCC_AT_LEAST_8
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
