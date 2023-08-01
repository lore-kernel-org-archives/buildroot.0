Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1075BC001DF
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 08:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76E0E60743;
	Tue,  1 Aug 2023 08:00:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76E0E60743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ka9z0HM4PkV3; Tue,  1 Aug 2023 08:00:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FF4A60E53;
	Tue,  1 Aug 2023 08:00:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FF4A60E53
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 118DB1BF308
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 08:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 652B7402BB
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 08:00:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 652B7402BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VvwXJxPZFwDG for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 08:00:02 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 899D7417A7
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 08:00:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 899D7417A7
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.209.147]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCbIn-1qaKfQ3Vyt-009ksX; Tue, 01
 Aug 2023 09:59:55 +0200
Date: Tue, 1 Aug 2023 09:59:54 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20230801095954.1f25440f@gmx.net>
In-Reply-To: <20230801000735.4f6608d2@windsurf>
References: <20230418213241.28635-1-ps.report@gmx.net>
 <20230801000735.4f6608d2@windsurf>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:Rqh2DSDK/5yAHH7EwTsCBpSTH5pGK8lG1Or/CYdXk+nj19gDkAF
 BjPIuCYKTGjihVivuYm9Zz6jcHdAVNygPUDQ73mLs2WqZez8DhJj7ZNN9ytTMtenqKzrKK1
 S7xsImsiAV7AZaBX8kRphpf2YX4MGjz1/gaTHFxp8ZLmmci+reTJFTo93cnsKwW23LeAXhc
 py8wV3RVKw9OTlYH0zvVg==
UI-OutboundReport: notjunk:1;M01:P0:yLb2aV7eLCc=;UOEVnNYEaAZwwEqWNnBdUsScbgJ
 644q5MHgYePL4epTuJiGawVdwYLRqALR1pF0RVh0Ft4mhQAmPfWqfT/AByYBC4NhVqE7DR6Ca
 7dcd14kZlOh8mmUY1/Y/yLsdzghEUE5Qoip0rcQowjHAJfvhdVPf4EfijHh25zv2skGIQGFgp
 iYMaYK6SfBmWK2r540Ippw0O1ZQYhEF8NxZC14eCbGaJ/54zy4KujgB1jpWaZ6hL2G9UuJ1OF
 FG2tgrh/qVNfVN3sr7eo2Pe4dw047YDkSzG9gvGdcgmK2gHvFkDo8MPoAe3UTcuAsZ219wlPk
 eeFt+iNLewMK98PWrd8PuLMv8equrdza43gEmaHhTYvyrgrwrKjkoyW9Je+9lC2zzfVWED4Ez
 FOeVI8yBn2zGFBwNNnKLMhyoCJ6FJtEtOuOI825C5qEO0tjfAjAgpttHatObjl0bcN8ztkvwl
 W31ix9WD9v0QGifGTpssdHAsWasaRFx4RGRunq3ksM/8DM6joao6N7HyYEn6d95178eBHWyw3
 ZiNgk1YjqVvbKc7metw8JEvky5Yso6Q4S5jdUr+GhMRwl7qXogAsPQlwGLKyGsk/OKJfwyQex
 bcXXwaXtj4n9y8oXkla5B17+OLCHYf7PP6DkANhDg9LooZp3sMIYf/1t6ZhU//q3n3QrH8WEp
 eJ8hEdUXe8kL26kbmfj4RxcnNqEt7ZsI/B2y1Rnk+sEEwqpBi5MvC9Y7XF5ZBLTDzJHEvgudI
 pt7JAipZS5OamzSKmfcSl64fa8FQ5h7BXIq8abC/IPPrJVVbS8m+Do9xctcNXyI9UctMzde91
 ML6Mve5DpcWdyAiadCSZhTt0AIAWuGsDogEHy17NopcinedbBOU48BwerltymkKfIdoGYUuhN
 p1B0T2rcjRAQE04rhGBGKi8Gdibgu3ztUbtuoNNpJ1PmNpfE0boB2JJdFpoorZNJJWopHtBt+
 ZQ8U9mwzdkrY3S/DyU/6AFgF/N0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1690876796; x=1691481596; i=ps.report@gmx.net;
 bh=zR+XPevdUxDGxXbIJuYlhL2gt4H/l12b/aFpR7h3itE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=r99AN5DqcDl3FpLxgPNRpIzPNKsxyWf0ux8e0b00TPsOcWExzUCrCvNid+cuikoN/NZw5uB
 RtnDztieyOz6idxqjlVcOyhesYXkCK5OPe4i/UJ+z/M3dnAq+Is+jTDpL+84otmVYBrJPSYtH
 BD1pHmIZPdUhTA2m+rO9hmDOXUrtln4Do/o44qYMwvMk7bWugj0/3Vma6hH5UJF6ZaxJbwP1A
 hsVfrXFzl95l3z3o6moqVtCfxOv3rr/Zp+gjL0XUu6yK9aGojc2fgzE9zOOcr7kl1qmIMjt3m
 vyYCjaxAGy8IOjiprm1ceXbt3ZEOJMXvmtXHL0d1jHsscuvEzU4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=r99AN5Dq
Subject: Re: [Buildroot] [RFC v1] package/python-babel: add purge locale
 data support
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Lionel Flandrin <lionel@svkt.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas, *,

On Tue, 1 Aug 2023 00:07:35 +0200, Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> On Tue, 18 Apr 2023 23:32:41 +0200
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > Add purge loacle data support (inspired by BR2_ENABLE_LOCALE_PURGE
> > handling in Makefile) to reduce target space allocation by the
> > python-babel package, e.g. from 32MB to 24K for
> > target/usr/lib/python3.11/site-packages/babel/locale-data with
> > BR2_ENABLE_LOCALE_WHITELIST="C en_US de_DE".
>
> I updated the commit log to add the explanation about en_US_POSIX, as
> requested by Yann.
>
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  package/python-babel/python-babel.mk | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/package/python-babel/python-babel.mk b/package/python-babel/python-babel.mk
> > index 890a8b02b9..ea383e9c05 100644
> > --- a/package/python-babel/python-babel.mk
> > +++ b/package/python-babel/python-babel.mk
> > @@ -12,5 +12,17 @@ PYTHON_BABEL_LICENSE = BSD-3-Clause
> >  PYTHON_BABEL_LICENSE_FILES = LICENSE
> >  HOST_PYTHON_BABEL_DEPENDENCIES = host-python-pytz
> >
> > +# purge locale data (if enabled), keep special en_US_POSIX data by default
> > +ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
> > +define PYTHON_BABEL_CLEANUP_LOCALE
> > +	for i in `ls $(TARGET_DIR)/usr/lib/python3.11/site-packages/babel/locale-data/*.dat`; \
>
> The hardcoded 3.11 was not good, it would break at the next major bump
> of Python, replace with $(PYTHON3_VERSION_MAJOR).
>
> > +	do \
> > +		i_base=`basename "$$i" .dat`; \
> > +		echo "$(BR2_ENABLE_LOCALE_WHITELIST) en_US_POSIX" | grep -qw "$$i_base" || rm "$$i"; \
> > +	done
> > +endef
> > +endif
> > +PYTHON_BABEL_POST_INSTALL_TARGET_HOOKS += PYTHON_BABEL_CLEANUP_LOCALE
>
> Changed to PYTHON_LABEL_TARGET_FINALIZE_HOOKS, as suggested by Yann,
> and moved inside the ifeq ... endif block.
>
> Applied with those changes.
>
> Thanks a lot!

Seems I missed to send an updated (non RFC) version, many thanks for
fixing and applying....

Regards,
Peter


>
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
