Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDE8C46CD4
	for <buildroot@archiver.kernel.org>; Fri, 29 Dec 2023 21:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9094A4095E;
	Fri, 29 Dec 2023 21:56:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9094A4095E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0pxh62cUWl3B; Fri, 29 Dec 2023 21:56:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8999441726;
	Fri, 29 Dec 2023 21:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8999441726
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 362951BF995
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F31982531
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:56:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F31982531
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s870UvMT7f-f for <buildroot@lists.busybox.net>;
 Fri, 29 Dec 2023 21:56:33 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C945882525
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 21:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C945882525
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 8AE6EB0055E;
 Fri, 29 Dec 2023 22:56:26 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 29 Dec 2023 22:56:26 +0100
Date: Fri, 29 Dec 2023 22:56:26 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Message-ID: <ZY9AigY5WWfIPT-m@landeda>
References: <20231227181756.156827-1-bernd@kuhls.net>
 <20231228095121.5255f937@booty>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231228095121.5255f937@booty>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703886990;
 bh=Us5Mv9giLAPXOJl1xhKbNpLvzPhrslW+PA/tInqKK04=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W97o7r+YohSOSYBfj2GmRjlTmVY+xoa4yaJ8V6s47uKQKoP59buaaxoAlodrtTTIA
 FWbVc7LdufJsNX7XJevB04Cwo7PyxcP0yYJ71PGpt99IMLzDjMNGZ1FtLxhB8nIgYl
 2Mvh9VyF9MMn80ILNHjwLVqCHYddkF7uCx5Q0f0/CcRm9i2IhmkU77M5DVV/DHKW0R
 qi06ctVM79pdPOPxVR4ddLN0IROhPovrAlt2qpQQY6hmdCtQsDwimsUpT9cQ0+cpx7
 rSUNKotH3BmKmIVdR5qtbffV1XUD7qZot+wVdUT7D0mErXi29sfyHqkfNhdU+6YmH9
 OhwZIY7RLdYzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=W97o7r+Y
Subject: Re: [Buildroot] [PATCH 1/2] package/exim: fix build with libexecinfo
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, Luca, All,

On 2023-12-28 09:51 +0100, Luca Ceresoli via buildroot spake thusly:
> On Wed, 27 Dec 2023 19:17:55 +0100
> Bernd Kuhls <bernd@kuhls.net> wrote:
> > Upstream added optional support for execinfo
[--SNIP--]
> > @@ -126,6 +127,15 @@ ifeq ($(BR2_STATIC_LIBS),y)
> >  EXIM_STATIC_FLAGS = LFLAGS="-pthread --static"
> >  endif
> >  
> > +ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
> > +EXIM_DEPENDENCIES += libexecinfo
> > +define EXIM_EXTRALIBS
> > +$(call exim-config-add,EXTRALIBS,-lexecinfo)
> > +endef
> > +else
> > +EXIM_C_FLAGS = -DNO_EXECINFO
> > +endif
> 
> I think this logic is not entirely correct. As I read it:
> 
>  * on non-glibc systems it automatically enables the new exim
>    stack dump feature if libexecinfo is enabled
>  * on glibc systems, which always have the backtrace() and related
>    functions without additional libraries, we never enable this feature
> 
> For consistency, the else branch should just be removed to avoid
> setting NO_EXECINFO, thus enabling the stack dump feature whenever it
> is possible.

If I understand correctly, your proposal would not work either: for a
non-glibc config that does not have libexecinfo eabled, we do want to
define NO_EXECINFO.

Instead, the logic should be somthong like:

    if glibc:
        do nothing, execinfo is available
    elif libexecinfo enabled:
        add dependency and extra-lib
    else:
        define NO_EXECINFO

Since libexecinfo embedds the fact that it is also non-glibc, we can
rewrite the condition as:

    if libexecinfo:
        add dependency and extra-lib
    elif non-glibc;
        define NO_EXECINFO

So, the 'else' clause only needs to be changed into:
    else ifneq ($(BR2_TOOLCHAIN_USES_GLIBC),y)

Unless I missed something less obvious...

Regards,
Yann E. MORIN.

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
