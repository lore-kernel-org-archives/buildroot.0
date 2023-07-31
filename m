Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00359C001DC
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 11:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65B4F8188D;
	Mon, 31 Jul 2023 11:18:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65B4F8188D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j62JVw8c3ror; Mon, 31 Jul 2023 11:18:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DCA481447;
	Mon, 31 Jul 2023 11:18:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DCA481447
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF83C1BF37F
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 11:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 987F740364
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 11:18:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 987F740364
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K0XNmAN7afZD for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 11:18:19 +0000 (UTC)
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6EAE40207
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 11:18:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6EAE40207
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-26825239890so3050827a91.0
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 04:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690802299; x=1691407099;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NPPZVqJxt106TfO0zFXU2YkLrKtLocQ/su364nCx7to=;
 b=WNLoYWqiB3Gb/mtV8/XehuwHGo7j8E3FkyvL062lUMLfMrHH3DQN6tOHYtADeQSga/
 VMSzyV7YYJaQ8+BIH9L3YpqBnxH/0Y20+uai/Uc2XjZlJT3t7xIEt78NwIlDxXzSeQDE
 JFSCOHu6U2uPGik5LjAI3q3LaCNvWLiRQEqodYSJelLZbEY9gN8AmPwipaHJZP+l3Mef
 wja0XTbBanzJLchShWPNS8rK0FBUwWN+W7CUslgNkiNNvPvxQgSilA+z2cU2LoJYkneX
 SH8PNn6IwPntO3dFuGtWBvDh9DbfkR4sDuXh9/nQFkUImiXn+VBB5waLSJKSO4341Xb1
 XxUA==
X-Gm-Message-State: ABy/qLYkDYJVlQmNRzMeJ2IYkvmohEwsvX9wUY4EIxCMsv9Gkcgd3tXb
 hOdUHPL/0kL0vaqHWmo1k8c26VX7H8aDg2TskPw=
X-Google-Smtp-Source: APBJJlHtxsNSQJ96WQqGb6sPyIS0Ao7RLzhe9z+B+RfBEEHCYIf7PgkXRnEv+LdCJBvZ+tZkOyYV6pyB5As+k/fpnNo=
X-Received: by 2002:a17:90b:254:b0:268:b682:23de with SMTP id
 fz20-20020a17090b025400b00268b68223demr4059107pjb.28.1690802298985; Mon, 31
 Jul 2023 04:18:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230731104009.1071930-1-robimarko@gmail.com>
 <874jlk2w72.fsf@tarshish>
In-Reply-To: <874jlk2w72.fsf@tarshish>
From: Robert Marko <robimarko@gmail.com>
Date: Mon, 31 Jul 2023 13:18:08 +0200
Message-ID: <CAOX2RU5FDYcYG7X4d7Ou+jSg2HrzRtG85MH6js3FTuiCLJ7RNg@mail.gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690802299; x=1691407099;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NPPZVqJxt106TfO0zFXU2YkLrKtLocQ/su364nCx7to=;
 b=FnJTF7IP9wyAiR0XY4s/l0fbfwgGvlRSmgiK7fWvoSnMty5sfOAW67he3GG3CPoWEa
 KDU0uZlHj6S+3WysGRnIcwAEhrHAKuqvSEXepHo7jZb9iDdGbw1Q2LAvCJOzWjPQgXwd
 7eMSfen9L8zUIvTiZQbUmZMfAz7vQtAkOVH21WIv+EtXPf/b950uLv6ApDggnUY5Lh3k
 DwQQUqplVa1BeBc84QiCjQiJP2tREsG+7bXHPDqdEM8W8ZBSJ3BUMgFoUjFs7TPng3yj
 OJGur2TZ2FVtSXV/9ovlfVZocRSIuXuZ6QqImDv3F3Lrn47Za7egqQTEr2iv28OtpTNS
 TXrQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=FnJTF7IP
Subject: Re: [Buildroot] [PATCH] package/mhz: add new package
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

On Mon, 31 Jul 2023 at 12:48, Baruch Siach <baruch@tkos.co.il> wrote:
>
> Hi Robert,
>
> On Mon, Jul 31 2023, Robert Marko wrote:
> > mhz is a tool to mathematically calculate the real running CPU frequency
> > and as such has proved as invaluable tool for developing CPUFreq and
> > similar features in the kernel.
> >
> > Its source finally got a license recently so it can be packaged.
> >
> > Signed-off-by: Robert Marko <robimarko@gmail.com>
> > ---
> >  package/Config.in     |  1 +
> >  package/mhz/Config.in |  6 ++++++
> >  package/mhz/mhz.hash  |  2 ++
> >  package/mhz/mhz.mk    | 21 +++++++++++++++++++++
> >  4 files changed, 30 insertions(+)
> >  create mode 100644 package/mhz/Config.in
> >  create mode 100644 package/mhz/mhz.hash
> >  create mode 100644 package/mhz/mhz.mk
> >
> > diff --git a/package/Config.in b/package/Config.in
> > index a60a1a8858..b9b6dd2580 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -549,6 +549,7 @@ endmenu
> >       source "package/memtest86/Config.in"
> >       source "package/memtester/Config.in"
> >       source "package/memtool/Config.in"
> > +     source "package/mhz/Config.in"
> >       source "package/minicom/Config.in"
> >       source "package/msr-tools/Config.in"
> >       source "package/nanocom/Config.in"
> > diff --git a/package/mhz/Config.in b/package/mhz/Config.in
> > new file mode 100644
> > index 0000000000..2f4af5026e
> > --- /dev/null
> > +++ b/package/mhz/Config.in
> > @@ -0,0 +1,6 @@
> > +config BR2_PACKAGE_MHZ
> > +     bool "mhz"
> > +     help
> > +       CPU frequency measurement utility.
> > +
> > +       https://github.com/wtarreau/mhz.git
> > diff --git a/package/mhz/mhz.hash b/package/mhz/mhz.hash
> > new file mode 100644
> > index 0000000000..6b39eb4bb7
> > --- /dev/null
> > +++ b/package/mhz/mhz.hash
> > @@ -0,0 +1,2 @@
> > +# Locally calculated
> > +sha256  1e07bb0d455d63fd33fb87a24f65a803c7c2d920fde4e5b5378b8c1b07de3b47  mhz-11aac2399780a1f7ea9f007b14af0464797d5cf1-br1.tar.gz
> > diff --git a/package/mhz/mhz.mk b/package/mhz/mhz.mk
> > new file mode 100644
> > index 0000000000..c2485995cc
> > --- /dev/null
> > +++ b/package/mhz/mhz.mk
> > @@ -0,0 +1,21 @@
> > +################################################################################
> > +#
> > +# mhz
> > +#
> > +################################################################################
> > +
> > +MHZ_VERSION = 11aac2399780a1f7ea9f007b14af0464797d5cf1
> > +MHZ_SITE = https://github.com/wtarreau/mhz.git
> > +MHZ_SITE_METHOD = git
> > +MHZ_LICENSE = MIT/X11
> > +MHZ_LICENSE_FILES = LICENSE
> > +
> > +define MHZ_BUILD_CMDS
> > +     $(TARGET_CC) $(TARGET_CFLAGS) -o $(@D)/mhz $(@D)/mhz.c
>
> Have you tried to use the package Makefile? It looks like you only need
> to override the 'CC' and 'CFLAGS' variables.

Actually no, I had this packaged locally for a long time before it
finally got a license.
Will move to it in v2 as that works fine.

Regards,
Robert
>
> baruch
>
> > +endef
> > +
> > +define MHZ_INSTALL_TARGET_CMDS
> > +     $(INSTALL) $(@D)/mhz $(TARGET_DIR)/usr/bin/mhz
> > +endef
> > +
> > +$(eval $(generic-package))
>
>
> --
>                                                      ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
