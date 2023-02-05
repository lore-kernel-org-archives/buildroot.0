Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0870CC636CC
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 12:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 979FC60591;
	Sun,  5 Feb 2023 12:36:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 979FC60591
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZypM0Qf5n8qj; Sun,  5 Feb 2023 12:36:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DD196060A;
	Sun,  5 Feb 2023 12:36:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DD196060A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 602751BF364
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4719281501
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:36:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4719281501
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AELm7w4M6atS for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 12:36:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E944814B8
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E944814B8
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 12:36:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.112.17])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id AFD7A2003E0;
 Sun,  5 Feb 2023 13:36:45 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 Feb 2023 13:36:44 +0100
Date: Sun, 5 Feb 2023 13:36:44 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230205123644.GF2960@scaer>
References: <20230205023709.799349-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230205023709.799349-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675600608;
 bh=wr5wZgCBeD4wyY8nccWBtD4DiQ+5rQZV364KWxtCmxw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U6IG46+cus1Y5nJdjzJMqzuRPgwFpGRs+2ZyiHgIG3vVGf6Hnq5xnX76nXoxuZnNa
 n3aJMwmJcKFLVWdXuAoj+mMKc+F7kHFcO6wSuAykTz1/0ZtF6ihA2GxfDh2B/syGT4
 hia8vlwprFCVdU6zYs9OfD8tyG21s6CrYDfwxsoxg3OwOJAIS6vRpZuMWftyNl9bjB
 R2ch8zP+Rpy7PDJSZXtNgakvkKgleyQqUokEjtOEL6d2fpGn40lgEhza58ZJFQxgsW
 KTxXqmvdFisQeZj4fTCgI9OXHh5UL0QJh9cJJOgNP17qtzgjAjiUMYZsG97ujH+k2P
 B+YC3irX4iQLg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=U6IG46+c
Subject: Re: [Buildroot] [PATCH 1/1] package/gst1-vaapi: fix x11 dependencies
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

James, All,

On 2023-02-04 19:37 -0700, James Hilliard spake thusly:
> The x11 feature needs libx11 and libxrandr support.
> 
> Select and depend on these when x11 is enabled.
> 
> Fixes:
> gst1-vaapi-1.22.0/meson.build:96:0: ERROR: Dependency "xrandr" not found, tried pkgconfig and cmake
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gstreamer1/gst1-vaapi/Config.in     | 2 ++
>  package/gstreamer1/gst1-vaapi/gst1-vaapi.mk | 3 ++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/gstreamer1/gst1-vaapi/Config.in b/package/gstreamer1/gst1-vaapi/Config.in
> index ade8b83a5f..a1062097ed 100644
> --- a/package/gstreamer1/gst1-vaapi/Config.in
> +++ b/package/gstreamer1/gst1-vaapi/Config.in
> @@ -8,6 +8,8 @@ config BR2_PACKAGE_GST1_VAAPI
>  	select BR2_PACKAGE_LIBDRM
>  	select BR2_PACKAGE_GST1_PLUGINS_BASE
>  	select BR2_PACKAGE_GST1_PLUGINS_BAD # gstreamer-codecparsers
> +	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_XORG7
>  	help
>  	  gstreamer-vaapi consists in a collection of VA-API based
>  	  plugins for GStreamer and helper libraries.
> diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
> index 3d9eb91ffb..9533cdf2b6 100644
> --- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
> +++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
> @@ -43,8 +43,9 @@ else
>  GST1_VAAPI_CONF_OPTS += -Dwayland=disabled
>  endif
>  
> -ifeq ($(BR2_PACKAGE_XORG7),y)
> +ifeq ($(BR2_PACKAGE_XLIB_LIBX11)$(BR2_PACKAGE_XLIB_LIBXRANDR),yy)
>  GST1_VAAPI_CONF_OPTS += -Dx11=enabled
> +GST1_VAAPI_DEPENDENCIES += xlib_libX11 xlib_libXrandr
>  ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
>  GST1_VAAPI_CONF_OPTS += -Dglx=enabled
>  else
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
