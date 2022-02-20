Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 101AFC433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 20:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5E00404B7;
	Sun, 20 Feb 2022 20:24:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HBcIqWlEPfrF; Sun, 20 Feb 2022 20:24:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8313040385;
	Sun, 20 Feb 2022 20:24:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9AF1B1BF4E6
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 20:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9696340385
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 20:24:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zDMi8zxvVidk for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 20:24:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01E8040187
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 20:24:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ec40:77b9:a48e:dc50])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 34C1920039F;
 Sun, 20 Feb 2022 21:24:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1645388678;
 bh=m1xvIceN5fe0Y5dneMGKPmr+F9X/Gg9GuQiSRyZeXdQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gc+H6bAKFetY1xfSdxdT4tAiAWl+1l9NILBFb4D57TPCuCtB8peKLvi9MHJtZlq3O
 HnJ9syEso4PXkvNotV+i22+tCJnRDIJMTB+GftL17XyilvIHf0aCtsw4cjeW0ZK4zY
 Kyfuirc2azhzjpUyiPkgjKBXAaXSohWKN/6yYOFTCOVpIc1ZmRZhd/MUxJL0NVeCxW
 8Xgmqk54ARbogeNQDnJ5ylggHmZczwHyPECXFYLhxhK1+eTp+6ECW13QDB2cj1cGib
 I0BG4RNRncjkAronqjMPiUzHNbNi7OGzQ3Q8+WzY+C2qAdc8+rrwnZ6uuG1frMxDEt
 /HelNdXofg/Zg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Feb 2022 21:24:35 +0100
Date: Sun, 20 Feb 2022 21:24:35 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220220202435.GZ522310@scaer>
References: <20220220121637.200393-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220220121637.200393-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2,
 1/2] package/gdk-pixbuf: enable relocatable option
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

Fabrice, All,

On 2022-02-20 13:16 +0100, Fabrice Fontaine spake thusly:
> Enable relocatable option to fix the following PPD build failure of
> adwaita-icon-theme:
> 
> Can't load file: Unrecognized image file format
> 
> This failure is raised because the SVG library is not found by
> gtk-encode-symbolic-svg. To find the SVG library,
> gtk-encode-symbolic-svg depends on libgtk_pixbuf library which reads the
> loaders.cache file using:
> - a hardcoded path (which points to host-gdk-pixbuf per-package
>   directory) if relocatable is disabled. The loaders.cache in this
>   directory doesn't declare SVG support because it has not yet been
>   updated by host-librsvg
> - or a dynamic path corresponding to the binary location if relocatable
>   is enabled.
> 
> So obviously, we need to set relocatable to true.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/0e00059b09b4445eaaec1030997883187c6a80d6

Thanks for providing more details, this is much better indeed, thanks! :-)

I've still felt the need to extend the commit log, because I found that
it left out some information adn explanations that may b needed in the
future.

Applied to master, thanks! :-)

Regards,
Yann E. MORIN.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Drop relocatable from target
>  - Enhance commit message
> 
>  package/gdk-pixbuf/gdk-pixbuf.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
> index cd30d450d5..b22e9568c9 100644
> --- a/package/gdk-pixbuf/gdk-pixbuf.mk
> +++ b/package/gdk-pixbuf/gdk-pixbuf.mk
> @@ -26,6 +26,7 @@ HOST_GDK_PIXBUF_CONF_OPTS = \
>  	-Dgio_sniffing=false \
>  	-Dinstalled_tests=false \
>  	-Dintrospection=disabled \
> +	-Drelocatable=true \
>  	-Dman=false
>  
>  ifeq ($(BR2_STATIC_LIBS),y)
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
