Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2542ECAAD3
	for <buildroot@archiver.kernel.org>; Mon, 19 Sep 2022 19:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FF7741710;
	Mon, 19 Sep 2022 19:41:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FF7741710
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ZoBAct6R0Bc; Mon, 19 Sep 2022 19:41:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FA6B41716;
	Mon, 19 Sep 2022 19:41:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FA6B41716
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 307351BF59A
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 19:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B96B81B69
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 19:41:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B96B81B69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JwMW8Do8qsKX for <buildroot@lists.busybox.net>;
 Mon, 19 Sep 2022 19:41:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 065FC81B53
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 065FC81B53
 for <buildroot@buildroot.org>; Mon, 19 Sep 2022 19:41:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ff43:9597:808d:a748])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 4FF0B19F576;
 Mon, 19 Sep 2022 21:41:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 19 Sep 2022 21:41:27 +0200
Date: Mon, 19 Sep 2022 21:41:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20220919194127.GP1419013@scaer>
References: <20220919142007.1967434-1-aperez@igalia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220919142007.1967434-1-aperez@igalia.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1663616489;
 bh=HfEGe21VOnX2aLVV5+g7qZ6mqUbhwhNtQ+43VSY/xiM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N0QpfyWlgUYs4uu4Hz8yziQBPJzJ7URc0WMFByAcFWlw4PhoyzGW93fsAXr9Ewhq7
 MFEeI+cYG+5QWMwBKg3eOFra5iv/wqN6cfrgpHAtZv7Y/m/R4a8cAW5ZQChMT4Cq8Y
 DJjsrhi3LvS3/j1LYnTfVtEj5WjVIYO9acV5+IW/iv+RQ+9wpryFjuGR2VVb+22ZM8
 uJjnxe8Kgg6leYGzUU+DKzUSHaIyHKb4FN6dGEtHuGp+U0FAdx1jlfmtUtaBT8buKX
 7A3KOhZdofwGyI5FX7tPnXY9WGG7BaERzxPWjOQarK19O0VQbn1t+QSwR4y4LzSKfe
 NaByetslcLe9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=N0QpfyWl
Subject: Re: [Buildroot] [PATCH] package/webkitgtk: bump to version 2.38.0
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

Adrian, All,

On 2022-09-19 17:20 +0300, Adrian Perez de Castro spake thusly:
> Update to a new major release which brings in improvements and a few
> new features. Release notes:
> 
>   https://webkitgtk.org/2022/09/16/webkitgtk2.38.0-released.html
> 
> This release also includes security fixes for CVE-2022-32886,
> CVE-2022-32891, and CVE-2022-32912. Accompanying security advisory:
> 
>   https://webkitgtk.org/security/WSA-2022-0009.html
> 
> The CMake option to build the documentation has been renamed from
> ENABLE_GTK_DOC to ENABLE_DOCUMENTATION, therefore update the build
> recipe accordingly. Option USE_LIBNOTIFY is no longer available, as
> WebKit now uses the notification portal D-Bus API directly without
> relying on libnotify. Lastly, version 2.38.0 introduces a new WebRTC
> implementation based on GstWebRTC which is left disabled for now to
> keep the existing status quo (WebRTC not available), and adding an
> option to enable it can be done in a follow-up patch.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/webkitgtk/webkitgtk.hash | 8 ++++----
>  package/webkitgtk/webkitgtk.mk   | 6 +++---
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
> index 7c6d7d65b5..c2512be9c6 100644
> --- a/package/webkitgtk/webkitgtk.hash
> +++ b/package/webkitgtk/webkitgtk.hash
> @@ -1,7 +1,7 @@
> -# From https://webkitgtk.org/releases/webkitgtk-2.36.7.tar.xz.sums
> -md5  466351cf35e4f742590919380b5dee93  webkitgtk-2.36.7.tar.xz
> -sha1  36078148b6e0ef002f0279b25b1caf173f851ac8  webkitgtk-2.36.7.tar.xz
> -sha256  0c260cf2b32f0481d017670dfed1b61e554967cd067195606c9f9eb5fe731743  webkitgtk-2.36.7.tar.xz
> +# From https://webkitgtk.org/releases/webkitgtk-2.38.0.tar.xz.sums
> +md5  a69cd8fc05f7299458b4faf1bc99b875  webkitgtk-2.38.0.tar.xz
> +sha1  6dcb65b8dc56c52f086bfeecfca7920e9cc78348  webkitgtk-2.38.0.tar.xz
> +sha256  f9ce6375a3b6e1329b0b609f46921e2627dc7ad6224b37b967ab2ea643bc0fbd  webkitgtk-2.38.0.tar.xz
>  
>  # Hashes for license files:
>  sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> index 014d92bb41..336744954e 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WEBKITGTK_VERSION = 2.36.7
> +WEBKITGTK_VERSION = 2.38.0
>  WEBKITGTK_SITE = https://www.webkitgtk.org/releases
>  WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
>  WEBKITGTK_INSTALL_STAGING = YES
> @@ -18,12 +18,12 @@ WEBKITGTK_DEPENDENCIES = host-ruby host-python3 host-gperf \
>  	libtasn1 libxml2 libxslt openjpeg sqlite webp woff2
>  WEBKITGTK_CONF_OPTS = \
>  	-DENABLE_API_TESTS=OFF \
> +	-DENABLE_DOCUMENTATION=OFF \
>  	-DENABLE_GEOLOCATION=OFF \
> -	-DENABLE_GTKDOC=OFF \
>  	-DENABLE_MINIBROWSER=ON \
>  	-DENABLE_SPELLCHECK=ON \
> +	-DENABLE_WEB_RTC=OFF \
>  	-DPORT=GTK \
> -	-DUSE_LIBNOTIFY=OFF \
>  	-DUSE_LIBHYPHEN=OFF \
>  	-DUSE_OPENJPEG=ON \
>  	-DUSE_SOUP2=ON \
> -- 
> 2.37.3
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
