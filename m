Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B68C433F5
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 23:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 043E740490;
	Wed, 18 May 2022 23:15:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cPGf4IExHJBv; Wed, 18 May 2022 23:15:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F18440207;
	Wed, 18 May 2022 23:15:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3CB641BF59A
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 23:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 388A440207
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 23:15:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CuImLzCLVrzI for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 23:15:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13619401C9
 for <buildroot@buildroot.org>; Wed, 18 May 2022 23:15:27 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id v65so4502675oig.10
 for <buildroot@buildroot.org>; Wed, 18 May 2022 16:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=itl8+hN6DCj86qOwdi9KfFEzwXrRQv8V0xgyv4uwmG4=;
 b=onKUQLEEmyc9ZUWwsjFluqeSP1gH7it121Lf4ADrHC7w/kGXmcCENzuFzlRS9j2QEa
 2jsUX1hB3Gex5cuhMWWPpxa7eNfx4avmlkWuQ1O5/DSh4lINwALPTQDf8LtKzOkw5JZu
 i24mg4bwAY6I3jHDZQNHGadBpMFihAjRADsvP31ZzmyPO8f+ExIZC4kqRwc7BOr1fJ5C
 u/Nq6bbXqSC8QAZew2x79KaiyVJhEstfBk6CU6KJYnCQeZpbMEANXWEdSJQh1UPeoL8g
 mQ4ZrEHj7QWMQfRn3QlJ3ESopS+aSgKcQf48uH+X4z0mGLGeLbtlDfsScQOqQ1ta7FsF
 Lh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=itl8+hN6DCj86qOwdi9KfFEzwXrRQv8V0xgyv4uwmG4=;
 b=5oeLCIQiYCAV1zMgr44Rh5AUgsiwuiTTYvbX7P2MdCj2bEnF+nsk131KYTzlwN56ll
 ZdiGmOnFtPf27p/IG0PBKidydC1jbgmU0+PKNGWBhwN0lc14zo1cIq5X+7izTlrV77Fa
 bP3iDQ/5WGUNDMZQvJQm2qCRy8FHzcq+BthGxaNNRSjH4zIdQLVJqHhdf2y7sLeSYbye
 jbgL95iq99FKYmSnZwcyqz10fZgNMXIv+Ra2IDWms8wpuTz4FbQuu9fcxrIA5qJLCB3J
 9GGdBFKX4w7PMWASDcPcrxz6GoFHnUjPUGjqtyxuvTkawkB3yxZGWa1/+0kIT6gBeLqV
 HvvQ==
X-Gm-Message-State: AOAM531TZ5eqNCqAR6Oc+VKfJIBUAYztQ/Z/2vaXQbx6hngmNHtDKreW
 1LYn+OqKXP0VLgRO5NctrLMEtjVgJfeYLLoQbZ9XqFs2Z34=
X-Google-Smtp-Source: ABdhPJyq2uiJioG3g0n3aML81wGLWc1du6cEt8bJaoPcCcvoJqX3H4YJ05w/nZtmdMXIdUDCr63WpMBc1rsgAzhZbMI=
X-Received: by 2002:a05:6808:1da:b0:325:bf8e:df25 with SMTP id
 x26-20020a05680801da00b00325bf8edf25mr1163431oic.99.1652915726910; Wed, 18
 May 2022 16:15:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220517192439.1034654-1-james.hilliard1@gmail.com>
 <e9dea93a-51b8-f807-5a89-f3908c864f08@mind.be>
In-Reply-To: <e9dea93a-51b8-f807-5a89-f3908c864f08@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 18 May 2022 17:15:15 -0600
Message-ID: <CADvTj4rop69VW2BuNc62DvqWCDd6XgMMVzi6AgmA4zkzLFVzGA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] system: generate and set C.UTF-8 locale
 by default
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, May 18, 2022 at 12:27 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 17/05/2022 21:24, James Hilliard wrote:
> > Now that glibc/localedef supports the C.UTF-8 locale we should default
> > to it as software like systemd generally expects it to be the locale
> > used.
> >
> > This should in general reduce the amount of locale related
> > compatibility issues and is what many distros have been using for
> > their default locale for quite a few years so it should be a well
> > tested configuration.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >   system/Config.in | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/system/Config.in b/system/Config.in
> > index 888c24ce81..7cc529d31e 100644
> > --- a/system/Config.in
> > +++ b/system/Config.in
> > @@ -440,7 +440,7 @@ config BR2_ENABLE_LOCALE_PURGE
> >
> >   config BR2_ENABLE_LOCALE_WHITELIST
> >       string "Locales to keep"
> > -     default "C en_US"
> > +     default "C.UTF-8"
> >       depends on BR2_ENABLE_LOCALE_PURGE
> >       help
> >         Whitespace seperated list of locales to allow on target.
> > @@ -455,7 +455,7 @@ config BR2_ENABLE_LOCALE_WHITELIST
> >
> >   config BR2_GENERATE_LOCALE
> >       string "Generate locale data"
> > -     default ""
> > +     default "C.UTF-8"
> >       depends on \
> >               (BR2_TOOLCHAIN_BUILDROOT_UCLIBC && BR2_ENABLE_LOCALE) || \
>
>   Is this locale also supported by uClibc?

Looks like there's issues there, I had assumed it was using
host-localedef but I guess
that's not the case, although wondering if it's possible as uclibc
locale support seems
pretty bad.

Also wondering if the musl locale handling is ok for BR2_ENABLE_LOCALE_WHITELIST
as I thought musl just used a built-in C.UTF-8 locale.

>
>   Regards,
>   Arnout
>
> >               BR2_TOOLCHAIN_USES_GLIBC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
