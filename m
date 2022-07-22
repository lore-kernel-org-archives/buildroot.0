Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BBBC433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 19:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ED5A84989;
	Fri, 22 Jul 2022 19:00:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5ED5A84989
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vIsgVAz9kaWH; Fri, 22 Jul 2022 19:00:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75040848BB;
	Fri, 22 Jul 2022 19:00:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75040848BB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 798DF1BF83C
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 19:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4591A60B01
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 19:00:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4591A60B01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ysZOf9PhmQlN for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 19:00:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05CAE60F4B
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 05CAE60F4B
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 19:00:07 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id s204so6513485oif.5
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 12:00:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8l27oTFT7HB9xKqD6Hb51zHQZy5TGCJnwTbaXu+j1ks=;
 b=EC2oOFpZsrQcYVyY8mR+Vh14PEjk6CvHYRzqb7pdck01Y3H6vBKfe2TJlkOEWfKXHv
 fIjGYEkMRDyYR940bz3z0RWhXpbaK4bMOXWelMGvNTg42ngW5aifsS8L2B3tPCQsZznz
 84qYcyJYg04qir9XmTeQjdMgKrmu/pxObdtS7PrglDM+eiXLWqSYVKjShuVIcgsVDvUK
 uaF1XuPuftm+++nW0p9WWfSh3rZgaMQ1vM9ldAJ62XpqwrTGJOmy6TTiK0R8Hvkt5buk
 m+wYO04ZxZBuZLa2lE+Ma+BbgtGQ6y+U/qdX0CQO3bUTPK/9ywNJyiKHwqGqATwGLrYP
 0ouQ==
X-Gm-Message-State: AJIora81O/VqXl4okwtIrYoqBbHhdG8tf+/M9VSfBP4ylE7ILFJ8laqv
 CuFfnRr90Z2C6ut5slU3L5L12ZqyUjcVnUv1HoI=
X-Google-Smtp-Source: AGRyM1vxIgOWgr1sjSlOB6791HccXQnAvPxYPllc3/KKTwXaTDaZi/Yl1GCGtUIs84exLFp5Ag9VUj2u3N0MSQw68Yc=
X-Received: by 2002:a05:6808:211a:b0:33a:9a59:fb31 with SMTP id
 r26-20020a056808211a00b0033a9a59fb31mr530685oiw.147.1658516407028; Fri, 22
 Jul 2022 12:00:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220721151907.212216-1-nolange79@gmail.com>
 <CADvTj4rXWb=_3kTFCdbmJ2hjNZ_GEGq3O+f-VP=_u6tK5D4o4w@mail.gmail.com>
 <CADYdroP7heqppp8ye20rv9ovgDG=NmVn8N3zi-Ln1KvU_DEwuQ@mail.gmail.com>
In-Reply-To: <CADYdroP7heqppp8ye20rv9ovgDG=NmVn8N3zi-Ln1KvU_DEwuQ@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 22 Jul 2022 12:59:55 -0600
Message-ID: <CADvTj4pKCBxXhsJN9=KJ5bct9CwpnnhYyXxZP8rxqeCWbdLCXA@mail.gmail.com>
To: Norbert Lange <nolange79@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8l27oTFT7HB9xKqD6Hb51zHQZy5TGCJnwTbaXu+j1ks=;
 b=Um/gVu6JjjEeScrH7leW4FP1n5DKWJuY6Eem7x4186KccmW/x9u6oNZs2rUY5JBTAU
 0zti/rtTlE0y9bUEEGwfjOspGP/4UOWUWwn2n0dHSdszG+U73Y0XGkxgpise9NNCLtkM
 qnkRH5KLaxR3rMa5OPP5WdFqU4kKV0WuSOqCNw/yadINvccq2hA8r+ipJUvCK7dDMJQU
 XohXk8aphxPZysJsk12HO9a2Qp+ytqANi7VFnJdRF4ok8Rx/Hg/bVv3KwULSHOIdTBN7
 ayGpml1WKc1o+305RM2hPD+FJXKvnBh/5CG+dwfdMOGhaO6YzzPm49sycPxHx1zI5KzZ
 XZEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Um/gVu6J
Subject: Re: [Buildroot] [PATCH v3 1/3] package/systemd: bump to version
 251.3
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Jul 22, 2022 at 3:25 AM Norbert Lange <nolange79@gmail.com> wrote:
>
> Am Do., 21. Juli 2022 um 21:32 Uhr schrieb James Hilliard
> <james.hilliard1@gmail.com>:
> >
> > On Thu, Jul 21, 2022 at 9:20 AM Norbert Lange <nolange79@gmail.com> wrote:
> > >
> > > LICENSES/README.md hash updated, this line got added in
> > > regards to files covered by CC0-1.0:
> > >
> > > >   -config files and examples under /network
> > >
> > > Add config option for the new sysupdate feature.
> > >
> > > Remove upstreamed patch.
> > >
> > > Update options: set new options to their default,
> > > remove option not available anymore.
> > >
> > > Signed-off-by: Norbert Lange <nolange79@gmail.com>
> > >
> > > ---
> > > v1->v2:
> > > *   note about changed LICENSES/README.md
> > > *   always set default-user-shell to /bin/sh
> > > *   always set default-locale to C-UTF-8
> > > *   fix typos in commit message
> >
> > You're missing a few things still, take a look at my patch here:
> > https://patchwork.ozlabs.org/project/buildroot/patch/20220522011729.117324-1-james.hilliard1@gmail.com/
>
> Sorry, missed that line before.
>
> >
> > Make sure you pick up the following changes from my patch:
> >  - dbus config option settings(to prevent dbus from becoming a build
> > time dependency)
>
> Ok.
>
> >  - dnssec changes(so that we pull in new dnssec backends properly)
>
> I don't understand those options, but I will bake them into lines ~510 following
> "ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)"

I don't think that will work correctly.

>
> >  - kernel headers minimum version bump
>
> The minimum it 3.15 (up from 3.13) according to the README,
> 4.15 is highly recommended.
> Probably better to flash a warning in kconfig for now, would make a
> seperate commit.
>
> Expect a v4 shortly.
>
> Regards, Norbert
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
