Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44988C4332F
	for <buildroot@archiver.kernel.org>; Fri,  2 Dec 2022 21:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91EC0403AA;
	Fri,  2 Dec 2022 21:31:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91EC0403AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zOarsir8_iek; Fri,  2 Dec 2022 21:31:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A468D40286;
	Fri,  2 Dec 2022 21:31:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A468D40286
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A5AB1BF3CA
 for <buildroot@lists.busybox.net>; Fri,  2 Dec 2022 21:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2DEA40286
 for <buildroot@lists.busybox.net>; Fri,  2 Dec 2022 21:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2DEA40286
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f07CrzEweMlb for <buildroot@lists.busybox.net>;
 Fri,  2 Dec 2022 21:31:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8810400CB
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E8810400CB
 for <buildroot@buildroot.org>; Fri,  2 Dec 2022 21:31:35 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id v13so6622342oie.3
 for <buildroot@buildroot.org>; Fri, 02 Dec 2022 13:31:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xKyuk+KkvCHb5at5c4MckjaNOwjrmI7YWbe8iwyDxoI=;
 b=u1xc4QKlgNEDqDIjgE/xbhNhpI+s/rEdD+7eOxqw8xnKfsVsXQ85b7LQeA06Dqe9Gj
 Rc6uO5nT3ZWcMMxVSG8dPvE8nW2FtdwM3gKv0p96RqchqbKThSEipfth6Y62rB+CN711
 KoyzeBjRH/KTRPUTDUfLWT4p9DDUcdOZlekA+EpbN2yYXgKNvM8XgCUMk2T6tcG4sS2j
 VBXgGV9iFPhSNa/puMYUGr3MJN5Uo8XGx4JiuXv/pWx9WNIa+xH+lKdMHAmumwjhi4Em
 3TPTCusYBzKmiGwcJuUOAZwW7ccuaZuZEb8CFaLl3xRSWTUu/11Fxd3xYPitKTlAJxfz
 2dIw==
X-Gm-Message-State: ANoB5pm02JVW+up9db4y0OVJtsRAFswxaCEtXYnQ0370BwUUmIm+SpEk
 HE26kf7zChyYGla5iL3YMMSRkX0SoVX1ZIBMGELyGuMPdgJf/Q==
X-Google-Smtp-Source: AA0mqf4t1Uu5RW0XjpNAXHccp2DvIjPgXNA0Mejsv1nEUVR/ODBQ2rxLBnbrHlVOds4tmMnKmxd0U1LWXBCusr1CW+o=
X-Received: by 2002:a54:4886:0:b0:35b:8d24:4786 with SMTP id
 r6-20020a544886000000b0035b8d244786mr18641187oic.110.1670016694943; Fri, 02
 Dec 2022 13:31:34 -0800 (PST)
MIME-Version: 1.0
References: <6381c264.df0a0220.f5907.df2dSMTPIN_ADDED_MISSING@mx.google.com>
 <CAEyMn7bgj1VgmCNyn89AnepPPvSfOChpA6NQbz8Rw14HAeZVxg@mail.gmail.com>
 <CAEyMn7afOkcPGNp6CYrxXUinWPrAyzbMr0cnCQQ9QGujdh96HQ@mail.gmail.com>
In-Reply-To: <CAEyMn7afOkcPGNp6CYrxXUinWPrAyzbMr0cnCQQ9QGujdh96HQ@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 2 Dec 2022 17:31:21 -0400
Message-ID: <CADvTj4oAxttuZ8dmoOLeXFsZ-tepm+-=F_rYF0ATSfWZVYndEA@mail.gmail.com>
To: Heiko Thiery <heiko.thiery@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xKyuk+KkvCHb5at5c4MckjaNOwjrmI7YWbe8iwyDxoI=;
 b=Oq4KwcbiwbumhfWIUmPi2ftjMcCu0j8p7gImOFlbvOWc0qwLFh4hsoBeO1G2FDLwDO
 bgKHvS3tXBYUxPkXduttXxXkWCjxn6DDbXfBaNe68TCAhOyuMH3Tl5b1/bZeX8yWFqjF
 aERdt31uh2RaaRym5Zai8xShSLwed12ON2iTuvQwE0h+LLRVuQ0WpbXy+rj3ac32I/PO
 FDZ/fDQHFAVOM0Xvt95qJNbAIxoFEsGo0doiLWb1ywkv5BxatgBy2YYJJiFu3uqfUOHG
 CuoOalZtlhS+glKD2l9XOdP/HYbFuEtlxLslvZ0Djl+WZRIQwEbGH3RYQDyvRCbWLxhW
 9raw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Oq4Kwcbi
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2022-11-25
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Dec 2, 2022 at 3:55 AM Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> Hi James,
>
> Am Sa., 26. Nov. 2022 um 10:14 Uhr schrieb Heiko Thiery
> <heiko.thiery@gmail.com>:
> >
> > Hi James,
> >
> >
> >
> > Am Sa., 26. Nov. 2022 um 08:38 Uhr schrieb Thomas Petazzoni
> > <thomas.petazzoni@bootlin.com>:
> > >
> > > Hello,
> > >
> > > Autobuilder failures
> > > ====================
> > >
> > > Below is a list of build failures reported by the Buildroot autobuilders
> > > in relation to packages or CPU architectures you are in charge of.
> > > Please help us improving the quality of Buildroot by investigating those
> > > build failures and sending patches to fix them.
> > >
> > > Results for the 'master' branch
> > > -------------------------------
> > >
> > > Build failures related to your packages:
> > >
> > >     arch     |             reason             |                                       url
> > > -------------+--------------------------------+---------------------------------------------------------------------------------
> > >    mips64    |       libnetconf2-2.1.11       | http://autobuild.buildroot.net/results/1fcfb9929b07a6b89d85dbfa4c7f2cfeb4b3ae1b
> > > powerpc64le  |         linuxptp-3.1.1         | http://autobuild.buildroot.net/results/8dff570499024da0f9d0c922619c8f07462633ec
> > >    mipsel    |         linuxptp-3.1.1         | http://autobuild.buildroot.net/results/31214bf6399e7f1bbafc96fd7055ca4629c4021f
> > >    s390x     |         linuxptp-3.1.1         | http://autobuild.buildroot.net/results/30e18e048fe426ec6a1522875cf37fb224b56bbf
> > >
> >
> > The autobuild failures appear since some time. I now tried to
> > reproduce it on my machine but I'm not able to do so. I see that it
> > probably only happens on the autobuild machines of yours.
> >
> > What I know so far is that there is a script [1] that looks for the
> > supported timestamp for PTP in the kernel sources. With that a define
> > is set -DHAVE_ONESTEP_P2P. But then when compiling the sources the
> > definition is not found.
> >
> > [1] https://github.com/richardcochran/linuxptp/blob/master/incdefs.sh
>
>
> I just checked again the output of a autobuild failure and see that
> the include path -I is not set on the builds that are running on your
> machines. I do not know why this is the case. Are you willing to do
> some tests to figure out what is going on?

You can reproduce the error by using make version 4.4 which was recently
released.

>
> [1] https://github.com/richardcochran/linuxptp/blob/master/incdefs.sh#L79
>
> --
> Heiko
>
> > --
> > Heiko
> >
> > > Thanks for your contribution to Buildroot!
> > >
> > > --
> > > http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
