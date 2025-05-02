Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79EF5C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3852283D1E;
	Fri,  2 May 2025 10:41:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bKKmVIh6hpzI; Fri,  2 May 2025 10:41:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49652813BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49652813BA;
	Fri,  2 May 2025 10:41:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 134E0EE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1064660B9F
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:41:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f-wPPLPqiR0e for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:41:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 20F3960B04
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20F3960B04
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 20F3960B04
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:41:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 67A1A1C1113; Fri,  2 May 2025 12:41:11 +0200 (CEST)
Message-ID: <2f21b850-d71c-41f5-b66c-5026e5effd30@rnout.be>
Date: Fri, 2 May 2025 12:41:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1744229017.git.yann.morin.1998@free.fr>
 <e0712f9df2ed9473620cd421585d9b942b604b6e.1744229017.git.yann.morin.1998@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <e0712f9df2ed9473620cd421585d9b942b604b6e.1744229017.git.yann.morin.1998@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746182471; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=vSNURzI6a7dvCgxaW9umqwQeOn92RHS1nWHZnc6VDM8=;
 b=KNmXWBXwGuHMOaNi1k1Uc/mSBsnNwHaYRyESqMMmkvsY3/eXdYflajCzQf6+MdU0FuEYjs
 fnwZkI3nt/8tYSPL/FXjGxDJhknguoP2Y63eBPoxBpD0ofoA/k2pMXpBpo5DO4nDbTLCUP
 vFJb3N6v2brDAJH1SJY40xugcsVImlRWMZXJjrJEPG592phFMT/HilgwJK3yIzeikbSXQi
 ei4Y6vLGIUEudm3tmfBGKCfet+zAEBCV1gGBMhRn0dB/MUktpW5dsxHrguEE5l2D/a89kI
 teRl1GAxzFBrJzG8VmpnsdTVpl4TGb/GG2aKJ40Ot17TKDz+H5S4ho7yWC8WbA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=KNmXWBXw
Subject: Re: [Buildroot] [PATCH 06/29 v2] package/pulseview: fix, update,
 and reorganise dependencies
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/04/2025 22:03, Yann E. MORIN wrote:
> The dependencies for pulseview are not entirely clean:
>    - arch deps are not first;
>    - second-level inherited deps are listed;
>    - deps are not alphabetically ordered (for deps on packages);
>    - the comment is hidden even when the arch deps are met, because of an
>      incorrect dependency on Qt5;
>    - qt5 is a depends-on when it could be a select.
> 
> Update the dependencies to fix all the points above.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/pulseview/Config.in | 42 ++++++++++++++++++-------------------
>   1 file changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
> index f122551b9f..b1f9dc25d7 100644
> --- a/package/pulseview/Config.in
> +++ b/package/pulseview/Config.in
> @@ -1,40 +1,40 @@
>   config BR2_PACKAGE_PULSEVIEW
>   	bool "pulseview"
> -	depends on BR2_PACKAGE_QT5
> -	# libsigrok->libglib2:
> -	depends on BR2_USE_WCHAR
> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU
>   	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
> -	depends on BR2_USE_MMU
> +	depends on BR2_USE_WCHAR  # libsigrok, qt5
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL  # qt5
>   	depends on BR2_INSTALL_LIBSTDCPP
> -	# libsigrok->libzip
> -	depends on !BR2_STATIC_LIBS
> -	# libsigrok
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
> -	depends on BR2_HOST_GCC_AT_LEAST_4_9
>   	depends on BR2_ENABLE_LOCALE
> +	depends on !BR2_STATIC_LIBS # libsigrok, qt5
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libsigrok
> +	depends on BR2_HOST_GCC_AT_LEAST_5  # qt5
> +	select BR2_PACKAGE_BOOST
> +	select BR2_PACKAGE_BOOST_FILESYSTEM
> +	select BR2_PACKAGE_BOOST_SERIALIZATION
> +	select BR2_PACKAGE_BOOST_SYSTEM
>   	select BR2_PACKAGE_LIBSIGROK
>   	select BR2_PACKAGE_LIBSIGROKCXX
> -	select BR2_PACKAGE_QT5BASE_WIDGETS
> +	select BR2_PACKAGE_QT5
> +	select BR2_PACKAGE_QT5BASE
>   	select BR2_PACKAGE_QT5BASE_PNG
> +	select BR2_PACKAGE_QT5BASE_WIDGETS
>   	select BR2_PACKAGE_QT5SVG
>   	select BR2_PACKAGE_QT5TOOLS
>   	select BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS
> -	select BR2_PACKAGE_BOOST
> -	select BR2_PACKAGE_BOOST_FILESYSTEM
> -	select BR2_PACKAGE_BOOST_SYSTEM
> -	select BR2_PACKAGE_BOOST_SERIALIZATION
>   	help
>   	  PulseView is a Qt based logic analyzer, oscilloscope
>   	  and MSO GUI for sigrok.
>   
>   	  http://sigrok.org/wiki/PulseView
>   
> -comment "pulseview needs a toolchain w/ locale, wchar, threads, dynamic library, C++, gcc >= 7, host gcc >= 4.9"
> +comment "pulseview needs a toolchain w/ locale, wchar, threads, dynamic library, C++, gcc >= 7, host gcc >= 5"
>   	depends on BR2_USE_MMU
> -	depends on BR2_PACKAGE_QT5
>   	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
> -	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR \
> -		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
> -		|| BR2_STATIC_LIBS || !BR2_ENABLE_LOCALE || \
> -		!BR2_HOST_GCC_AT_LEAST_4_9
> +	depends on !BR2_USE_WCHAR \
> +		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
> +		|| !BR2_INSTALL_LIBSTDCPP \
> +		|| !BR2_ENABLE_LOCALE \
> +		|| BR2_STATIC_LIBS \
> +		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_7 \
> +		|| !BR2_HOST_GCC_AT_LEAST_5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
