Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2674DC47DDB
	for <buildroot@archiver.kernel.org>; Tue, 23 Jan 2024 16:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9134D40131;
	Tue, 23 Jan 2024 16:04:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9134D40131
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m9aymGdOuAUa; Tue, 23 Jan 2024 16:04:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85D634014B;
	Tue, 23 Jan 2024 16:04:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85D634014B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 849FD1BF3A6
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 16:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CD874137D
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 16:04:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CD874137D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uYSP7eaXt_Wu for <buildroot@lists.busybox.net>;
 Tue, 23 Jan 2024 16:04:51 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C8ED410E7
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 16:04:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C8ED410E7
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 07EAD13F8C2;
 Tue, 23 Jan 2024 17:04:44 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 23 Jan 2024 17:04:44 +0100
Date: Tue, 23 Jan 2024 17:04:44 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <Za_jnMEzxoboGoJA@landeda>
References: <20230921164809.102741-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230921164809.102741-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706025888;
 bh=ZrXTLdDaCTi8XN3Hw+z89SoM2kGR1JS0dtxGBMIZcCE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BnE/2awKRRW7Y8mgnkXmsVzzQLYDjwMbKL5vKEfzTZdTZ1BrldRqT9KOvZGp57Oma
 8o0rXJzMcTkioCDKY6v35bvv9LD0smQMDUOn8jP2Nnhq2nMPriVt9mUTHffyLxM1Ta
 v8+k8SPM/gFlDcnFNdm7updPsXQeG/RGdZGckd/dzJLfxG14JlD6QWcx6YHCwrbTdO
 8K4kzTxlj90bPkUk8VGBRNQ2wOBOCyjHjB62aV9oJ6vLebbcXuiWc8fd0L3YdyNoe+
 l3nM3l4dxLOaYL+OY1G6rAoCPAQl5jlS79pgUQyyPkWP1cBKY0BgJ6DDS3RXVAk+iA
 MTIXmJsNtCvWw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BnE/2awK
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/vulkan-loader: fix x11 handling
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
Cc: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-09-21 18:48 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since the addition of the package
> in commit 6aa1bc31678ff9f8013084fda34b9f941cc63fc3:
> 
> In file included from /home/buildroot/autobuild/run/instance-3/output-1/build/vulkan-loader-1.3.262/loader/extension_manual.h:24,
>                  from /home/buildroot/autobuild/run/instance-3/output-1/build/vulkan-loader-1.3.262/loader/extension_manual.c:23:
> /home/buildroot/autobuild/run/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/vulkan/vulkan.h:71:10: fatal error: X11/extensions/Xrandr.h: No such file or directory
>    71 | #include <X11/extensions/Xrandr.h>
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/55ddfd44393e3bcc2f25bad2f9ecb7e1b142a985
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Your commits always contain the description of the failure (which is
mildly interesting), but often lacks the actual reason for the change.

In this case, it would have been interesting to state that xcb and xlib
support are orthogonal, but that for xlib, xrandr is also required, as
Adam noticed in his commit log [0].

I totally forgot to amend the commit before I push, though, sorry...

[0] https://lore.kernel.org/buildroot/20240122223047.736966-1-adam.duskett@amarulasolutions.com/

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Drop select
> 
>  package/vulkan-loader/vulkan-loader.mk | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/package/vulkan-loader/vulkan-loader.mk b/package/vulkan-loader/vulkan-loader.mk
> index f6dd9d0ac3..b1545a4972 100644
> --- a/package/vulkan-loader/vulkan-loader.mk
> +++ b/package/vulkan-loader/vulkan-loader.mk
> @@ -26,13 +26,16 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_LIBXCB),y)
>  VULKAN_LOADER_DEPENDENCIES += libxcb
> -VULKAN_LOADER_CONF_OPTS += \
> -	-DBUILD_WSI_XCB_SUPPORT=ON \
> -	-DBUILD_WSI_XLIB_SUPPORT=ON
> +VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XCB_SUPPORT=ON
>  else
> -VULKAN_LOADER_CONF_OPTS += \
> -	-DBUILD_WSI_XCB_SUPPORT=OFF \
> -	-DBUILD_WSI_XLIB_SUPPORT=OFF
> +VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XCB_SUPPORT=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_XLIB_LIBX11)$(BR2_PACKAGE_XLIB_LIBXRANDR),yy)
> +VULKAN_LOADER_DEPENDENCIES += xlib_libX11 xlib_libXrandr
> +VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XLIB_SUPPORT=ON
> +else
> +VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XLIB_SUPPORT=OFF
>  endif
>  
>  ifeq ($(BR2_PACKAGE_WAYLAND),y)
> -- 
> 2.40.1
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
