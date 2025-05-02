Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE01C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E50C417A1;
	Fri,  2 May 2025 10:41:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZYkm6oXcR3Us; Fri,  2 May 2025 10:41:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75680415A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75680415A5;
	Fri,  2 May 2025 10:41:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 41CD0EE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2866140BFE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:41:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 57StlGmaoKRY for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:41:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3313040B0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3313040B0E
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3313040B0E
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:41:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8F3011C1113; Fri,  2 May 2025 12:40:59 +0200 (CEST)
Message-ID: <b904f514-57d1-40b0-b01e-ce81859b2325@rnout.be>
Date: Fri, 2 May 2025 12:40:58 +0200
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
 t=1746182459; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=hxjnoWb+zqaL/9GMOzJ/sMC/kZvWwOzZKHuqwrJYbyA=;
 b=XabD2G0jLvx91NG4aTceRgozyPHVC5nqa0hL9RFC2MrjHLTcr59PHm6sYvw1PJhRAptbT8
 Cnzmnk++A3SjpkwZmuu/V5NVnp9ea3ayYTwupUmxm3xefsU1kZjU7oMa6Y1q6hOD5n5eU+
 bXJPCHae19hVgNUcxttq66mf7eqd3S9opRTJZweZtfqmREw7dOrE1r5HLnccmWEQiy6tXZ
 ahVszAhHpIu1QMHf6NYICK6VYRtOFP24jrNs+REjXii8oowC0NX1jXQq5H9P9qxGMYv3JX
 uSaU4w396k5hlKkaDirgSdOsGeAIFkvEjONI11pSIowIbFUVohgeANVAJ5gFYQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=XabD2G0j
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
