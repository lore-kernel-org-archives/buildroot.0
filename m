Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6A3C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 11:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D2D8404BF;
	Sun, 20 Feb 2022 11:04:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B9LTlwIuKX4R; Sun, 20 Feb 2022 11:04:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3025D4048D;
	Sun, 20 Feb 2022 11:04:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 99BD41BF59D
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 11:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86F27404CA
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 11:04:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L7brjvyxACBG for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 11:04:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55EB9403B4
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 11:04:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ec40:77b9:a48e:dc50])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 099D42003C3;
 Sun, 20 Feb 2022 12:03:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1645355041;
 bh=Yk73z7NOqeAoyniIo0eEbJI8cIJBY+VuB2YciJSqvhc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ie2ODIxZsN4LixEjC/MeHq16wUicdwJ00c9medqfrfHsbHf7lZXBSGTCUIBS+H1Tr
 EAULSBI1EpU1NT6Jos+u4E5aru5uOsDkhEHdB2O0angYCxM29CBQslGFIH/Db99thg
 E7cwssM0GbWdqG6zHI5RY8iuBpilqJAidjVDs4b92mmHJ5eMaaZid9YgEyrvKJBtjl
 GCnPd1jfVXvwQTHfSKWJ5nKJnXh01L5vzCXg3vcK8kBN/m6p+Sufwxfg9XCs9oH+t9
 ubCO2iPpevtNUQsCZpI7BUsEipODsfN6TrThp52ofG15TE1TcpECVmQZYDR60zEf35
 yD+nLcX2UOWgg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Feb 2022 12:03:58 +0100
Date: Sun, 20 Feb 2022 12:03:58 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220220110358.GV522310@scaer>
References: <20220219122526.2954354-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220219122526.2954354-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] package/gdk-pixbuf: enable relocatable
 option
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

On 2022-02-19 13:25 +0100, Fabrice Fontaine spake thusly:
> Enable relocatable option to fix the following PPD build failure of
> adwaita-icon-theme raised since commit
> b06294e9897e90862656416e8b67fdace15488d7 which now correctly updates
> loaders.cache:
> 
> Can't load file: Unrecognized image file format

You probably need to explain a bit more what is going here.

> Fixes:
>  - http://autobuild.buildroot.org/results/0e00059b09b4445eaaec1030997883187c6a80d6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gdk-pixbuf/gdk-pixbuf.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
> index cd30d450d5..7b9c9cdbda 100644
> --- a/package/gdk-pixbuf/gdk-pixbuf.mk
> +++ b/package/gdk-pixbuf/gdk-pixbuf.mk
> @@ -20,12 +20,14 @@ HOST_GDK_PIXBUF_DEPENDENCIES = host-libpng host-pkgconf host-libglib2
>  GDK_PIXBUF_CONF_OPTS = \
>  	-Dgio_sniffing=false \
>  	-Dinstalled_tests=false \
> +	-Drelocatable=true \

As far as I can understand, we do not care about the relocation for the
target build, only for the host build, no?

Regards,
Yann E. MORIN.

>  	-Dman=false
>  
>  HOST_GDK_PIXBUF_CONF_OPTS = \
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
