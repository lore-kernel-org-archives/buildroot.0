Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD63C77B61
	for <buildroot@archiver.kernel.org>; Sun, 16 Apr 2023 13:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C27B41771;
	Sun, 16 Apr 2023 13:17:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C27B41771
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w4tfkU5boDu4; Sun, 16 Apr 2023 13:17:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C8A141747;
	Sun, 16 Apr 2023 13:17:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C8A141747
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB1EC1C4134
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 13:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EAD241902
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 13:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EAD241902
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9kNlRSLgx9mT for <buildroot@lists.busybox.net>;
 Sun, 16 Apr 2023 13:17:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34DAE418FA
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34DAE418FA
 for <buildroot@buildroot.org>; Sun, 16 Apr 2023 13:17:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 23F2A5FF33;
 Sun, 16 Apr 2023 15:17:37 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 16 Apr 2023 15:17:36 +0200
Date: Sun, 16 Apr 2023 15:17:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230416131736.GB2819@scaer>
References: <20220904144541.349495-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220904144541.349495-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681651060;
 bh=t7ErNHwiqxqzb9nfL0jy5b5b0Z06qGMOUTys4w+8F0w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OkxjpXkGOo35vQn4PmJNsrBXzPx/vNv5QAF8pm0fyGJMo0jSpkzmyRy2sW5IYI5yG
 o1U1FVDclxaiUmdMgIs5ULlK+9MMs0oxrz2znuyVNa4JUeMFToK3bnOHtbvupIFlpx
 CaeERIEqRvhjZiwfXFNE/87Tm+FwMKEEC8UMbWPKvdmO6Z1AIpEWrnrNVzQmm3MXiU
 Ks9Drs+IQAUwrExkZLOGxrZ0kbuhfAlaNAg0Qh/euA5sd4frFQ0vpIkRW8kFIc+JGD
 4nK25ooNJraPAC++VMyTNv5PX0C76tx15pZdKnKEbOXUBHg78toMjBrdeVXIaxbR8f
 PWoJdaoRT+Vpw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OkxjpXkG
Subject: Re: [Buildroot] [PATCH 1/1] package/ghostscript: add pdf support
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-09-04 16:45 +0200, Fabrice Fontaine spake thusly:
> pdf support was disabled in commit
> 7a4944569ce83b0b7b0cabd6e8aa184b8cb72a22
> 
> It depends on openjpeg and jbig2dec
> 
> Fixes:
>  - https://bugs.buildroot.org/show_bug.cgi?id=14976
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ghostscript/ghostscript.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
> index 5bf8b08966..a11aec1c54 100644
> --- a/package/ghostscript/ghostscript.mk
> +++ b/package/ghostscript/ghostscript.mk
> @@ -43,7 +43,6 @@ GHOSTSCRIPT_CONF_OPTS = \
>  	--enable-freetype \
>  	--disable-gtk \
>  	--without-libpaper \
> -	--without-pdf \
>  	--with-system-libtiff
>  
>  ifeq ($(BR2_PACKAGE_JBIG2DEC),y)
> @@ -63,6 +62,12 @@ endif
>  ifeq ($(BR2_PACKAGE_OPENJPEG),y)
>  GHOSTSCRIPT_DEPENDENCIES += openjpeg
>  GHOSTSCRIPT_CONF_OPTS += --enable-openjpeg
> +
> +ifeq ($(BR2_PACKAGE_JBIG2DEC),y)
> +GHOSTSCRIPT_CONF_OPTS += --with-pdf
> +else
> +GHOSTSCRIPT_CONF_OPTS += --without-pdf
> +endif

I found it weird that the dependency on jbig2dec was not added, but
that's because of the conditional block, above...

Furthemore, that would no longer explicitly disable PDF if jbig2dec was
enabled but openjpeg was not.

So, I extracted that and moved it to a dedicated conditional block:

   69 ifeq ($(BR2_PACKAGE_OPENJPEG)$(BR2_PACKAGE_JBIG2DEC),yy)
   70 # Dependencies already handle on per-package basis above,
   71 # but duplicated here for consistency.
   72 GHOSTSCRIPT_DEPENDENCIES += openjpeg jbig2dec
   73 GHOSTSCRIPT_CONF_OPTS += --with-pdf
   74 else
   75 GHOSTSCRIPT_CONF_OPTS += --without-pdf
   76 endif

Applied to master with the above change, thanks.

Regards,
Yann E. MORIN.

>  else
>  GHOSTSCRIPT_CONF_OPTS += --disable-openjpeg
>  endif
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
