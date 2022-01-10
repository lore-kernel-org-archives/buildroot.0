Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B49C433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 18:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C30948333E;
	Mon, 10 Jan 2022 18:00:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3TxMrlnd4D8I; Mon, 10 Jan 2022 18:00:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E68682E19;
	Mon, 10 Jan 2022 18:00:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 16E2A1BF355
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 18:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 038874060E
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 18:00:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kw5ZQJdX4aDa for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 18:00:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7224D4016B
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 18:00:08 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id c71so45303666edf.6
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 10:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sCdBRJ1SLIslCiGKElC4WBrl0t1pSwy+tiPvZOwVZ5o=;
 b=jCK39K5hU19pi/2WjRbuzjHkDHyGVkgZ4wkVziysZJ11KG2PF6HTOHXlsWbwaGpLof
 npBQ0Lpe/DY+xlKbqxtdVCQgzt7NIRm0ZP6onjiVlGJsaE9rDYaIZZ203QvjotKp6ZiV
 OrpKg9X0I3SexTwGfE3RuExurw59N0ON42kCuZTjFt2+a14vS5nGcYbpVRhTAJxZar3t
 AKtwBqa4xgvRlxWsTZ3uVWfO+mnWna4Bz6ToUVJrTpTE1NB7VFiMxFpliG+zTg0je9A2
 eruSctoJMXtrvRO9OOgxny2GP8QQ+JH/WVpJRA5e3yGLIi4aIt6XyGVEu+3NZiMCLcU3
 PA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sCdBRJ1SLIslCiGKElC4WBrl0t1pSwy+tiPvZOwVZ5o=;
 b=r5dPYb5AWfqs0tk0XHbWVPBNAkCOGV1HsQxUH58DS/x5rtohLvKWp16Gg5oJNp8eyi
 FBPCOJI2jE7bHFvYK92AAWD/s4WnfN2///OaeYPXVe6/gWNZuZQoMrrrCMIw9DVHVSkg
 MwjYz74jxHaKwZ/SDL14t/pMLMo56TBqGPJ1THcYBJq+Ib3Xx0U85+zUAumw6Vaofl0N
 gHafX+VOkkTIem/pqXfS/QF399XaF7pqvNiJt+YudW2AmZUChwvY7xuFHRqtb9ZrWBlk
 VIioRA++YRRt8hO4FlwEjkunON7jmYenGfJDp0IEdEV7IoNz1BTzMSKaOMmbmZKWeFlv
 K0Ow==
X-Gm-Message-State: AOAM533H4U8Aggv85orAgVirJBGgna5IbfFTLfqrQuLn57C8x+VC6JJw
 7URX6PBGpXcCrZGIRQDzBDjkJ72Yywv5NtBPeInXNjwp
X-Google-Smtp-Source: ABdhPJzJqU/hYnc32C4kyppcqsKpC3VKsX71hNLEQVSFfmT3sl3cV5adfujxKfmubdH24tNpmSGa3rjtYa3YOsN/FBw=
X-Received: by 2002:a05:6402:1ac9:: with SMTP id
 ba9mr816624edb.248.1641837606664; 
 Mon, 10 Jan 2022 10:00:06 -0800 (PST)
MIME-Version: 1.0
References: <20220110085850.11095-1-yegorslists@googlemail.com>
 <20220110085850.11095-2-yegorslists@googlemail.com>
 <20220110140450.GO1477939@scaer>
In-Reply-To: <20220110140450.GO1477939@scaer>
Date: Mon, 10 Jan 2022 18:59:55 +0100
Message-ID: <CAGm1_kvtLsQW82XSjBHPz8CFdVsB4WBFZyyyhV_wYLbjfzVGVg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 2/2] package/avrdude: add support for Linux
 sysfs GPIO interface
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann, all,

On Mon, Jan 10, 2022 at 3:04 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Yegor, All,
>
> On 2022-01-10 09:58 +0100, yegorslists--- via buildroot spake thusly:
> > From: Yegor Yefremov <yegorslists@googlemail.com>
> >
> > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> > ---
> >  package/avrdude/Config.in  | 3 +++
> >  package/avrdude/avrdude.mk | 6 ++++++
> >  2 files changed, 9 insertions(+)
> >
> > diff --git a/package/avrdude/Config.in b/package/avrdude/Config.in
> > index 89558a5ff5..57a8df66ea 100644
> > --- a/package/avrdude/Config.in
> > +++ b/package/avrdude/Config.in
> > @@ -17,6 +17,9 @@ config BR2_PACKAGE_AVRDUDE
> >
> >  if BR2_PACKAGE_AVRDUDE
> >
> > +config BR2_PACKAGE_AVRDUDE_LINUXGPIO
> > +     bool "Linux sysfs GPIO interface support"
> > +
> >  config BR2_PACKAGE_AVRDUDE_SPI
> >       bool "SPI support"
> >       default y # Backward compatibility
> > diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
> > index accd92c1d5..3ccba80d8e 100644
> > --- a/package/avrdude/avrdude.mk
> > +++ b/package/avrdude/avrdude.mk
> > @@ -16,6 +16,12 @@ AVRDUDE_CONF_OPTS = --enable-linuxgpio
> >  AVRDUDE_DEPENDENCIES = elfutils libusb libusb-compat ncurses \
> >       host-flex host-bison
> >
> > +ifeq ($(BR2_PACKAGE_AVRDUDE_LINUXGPIO),y)
> > +AVRDUDE_CONF_OPTS += --enable-linuxgpio
> > +else
> > +AVRDUDE_CONF_OPTS += --disable-linuxgpio
> > +endif
>
> We already have an unconditional activation of those:
>
>     https://github.com/buildroot/buildroot/blob/master/package/avrdude/avrdude.mk#L15
>
> (which you can btw. incidentally also notice as part the hunk header).

My bad. I have just overlooked this setting. You can drop the patch.

Regards,
Yegor

> So, if the intention was to be able to enable linux-gpio, then this is a
> noop as they are already enabled. If the intention was to be able to
> disable them, then the unconditional enable should be dropped.
>
> But then, does it make sense to be able to disable linux GPIO?
>
> And what if both SPI and GPIO are disabled?
>
> Regards,
> Yann E. MORIN.
>
> >  ifeq ($(BR2_PACKAGE_AVRDUDE_SPI),y)
> >  AVRDUDE_CONF_OPTS += --enable-linuxspi
> >  else
> > --
> > 2.17.0
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
