Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D628C433EF
	for <buildroot@archiver.kernel.org>; Sat, 21 May 2022 16:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 784CD40B08;
	Sat, 21 May 2022 16:47:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DBxCWsj8i0s0; Sat, 21 May 2022 16:47:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C79D40AFF;
	Sat, 21 May 2022 16:47:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B2E01BF423
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 16:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A35F83196
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 16:47:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nGHNv_OYji20 for <buildroot@lists.busybox.net>;
 Sat, 21 May 2022 16:47:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2DA583118
 for <buildroot@buildroot.org>; Sat, 21 May 2022 16:47:38 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 n124-20020a1c2782000000b003972dfca96cso4075320wmn.4
 for <buildroot@buildroot.org>; Sat, 21 May 2022 09:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2HT0Eni8smmFqx2Y82VL53HZ3kVT/Re/7KPm6z7/s+8=;
 b=J20fVKDluWk+iQcZFgc0bBXaYh+QSsSMg05WANk4FGXuMR45pIzGNSzjEX8hrEgty0
 qXdacemWdOdBrno+AEAWruRlggPSwOnjhNLeIJ5PZLsSdZaBkRmBshndQjyzED0Hnst0
 Gyd6LkyIzaqx9dB7x+QWDig67bCfTETTEzUNXIrPOK+j+1EHJR9N8j3CyVsNOooDdFL1
 wGJM2R89+Nt4YqsJulCfYKtVAXR7maoAcfC/jkFBh+unah2n9WabK6BtWPLhdgaXxsty
 hgwR8K47lHu/63/rdB05sF6aqy6c7EYIc8OuUVGi38A9+LNaX+xUZOYj4zE5BIHrEgtY
 QsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2HT0Eni8smmFqx2Y82VL53HZ3kVT/Re/7KPm6z7/s+8=;
 b=uw/OoonvwP9Kb3pQjc0bQvg7l4M6cteZrOhr+8ToGr59Hh+0QxaVl6bRBDgCmW9ftS
 RwzKlhh5eM0WpWSYlkSvo3DMJBgfiGpZO8JfgdAJ8SGbEP1n8VWsX5wNWUAkgVTLhiKP
 L41QSztyHtnxh0BjsFwyCDhV4A1LGU9KNVZXuln5WkE4Fs+pryAzECATTk0yCRjfTTv6
 2CQLIJOxnCfTYPV+7ENiC3UafbRdExDpF27cJhxh+NxLPO4kPKxqDPKXMXhL/HmlXKl+
 EOkXXERqi/KWatAC0JbVmDUGWUH1AVke+u2gCiR50EdMnndPYGM2sVhsMkiihtpaFCMs
 C3sw==
X-Gm-Message-State: AOAM533Gkd6FQjzMXcnUvgG/QhBHbRWcalI30doSPQg6Ljn+mLshT0YJ
 ndoZeTiupZMHOJ7l3ZGZcdC3wq+DqhDM5K3Cx78qF01sdm0=
X-Google-Smtp-Source: ABdhPJxuak29h76eoRA6gFdiiRjcCKz+f1UXV1B2SDiswsCX82eN/ndq7pgQgHYsEEa/ONGoya+8UqotW88OwdLCtDs=
X-Received: by 2002:a05:600c:2e53:b0:397:4730:ee7a with SMTP id
 q19-20020a05600c2e5300b003974730ee7amr388340wmf.118.1653151656891; Sat, 21
 May 2022 09:47:36 -0700 (PDT)
MIME-Version: 1.0
References: <62886d67.1c69fb81.ac372.4710SMTPIN_ADDED_MISSING@mx.google.com>
 <CAGi-RUKF09JmK_EACoQdBnS_Aw8G6Ep88Lx3rCHY3ZkxrqLvmQ@mail.gmail.com>
 <20220521164440.0f0df25f@windsurf>
In-Reply-To: <20220521164440.0f0df25f@windsurf>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Sat, 21 May 2022 19:47:24 +0300
Message-ID: <CAGi-RU+TOb+RCRzU=WeWw2DDwtcxk9_2gptgDpZJRZNonMGZUQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2022-05-20
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, May 21, 2022 at 5:44 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Ramon,
>
> On Sat, 21 May 2022 17:23:04 +0300
> Ramon Fried <rfried.dev@gmail.com> wrote:
>
> > > Build failures related to your packages:
> > >
> > >     arch     |             reason             |                                       url
> > > -------------+--------------------------------+---------------------------------------------------------------------------------
> > >     m68k     |          bitwise-0.43          | http://autobuild.buildroot.net/results/9e3b9a148bc84004fde4dfe9b389ca2b359a92e2
> > >   riscv64    |          bitwise-0.43          | http://autobuild.buildroot.net/results/348afc2a0fde85c098a12b58e8e2dcc3780bbb6b
> > >
> > >
> > > Thanks for your contribution to Buildroot!
> > >
> > > --
> > > http://autobuild.buildroot.net
> > Hi thomas.
> > as I mentioned in an earlier mail, it looks like it is probably in dependencies.
> > I took riscv64 as an example and built the qemu
> > qemu_riscv64_virt_defconfig + bitwise locally.
> > It is built successfully.
> >
> > How was the config file for building the above created ?
>
> If you follow the links above, you end up in a directory that contains
> the full .config file (config) as well as the corresponding defconfig
> (named "defconfig"). These are the configurations that triggered the
> build issue.
>
> You can also reproduce a build issue by downloading the script
> https://git.busybox.net/buildroot-test/plain/utils/br-reproduce-build
> and run:
>
>  ./br-reproduce-build 9e3b9a148bc84004fde4dfe9b389ca2b359a92e2
>
> Where 9e3b9a148bc84004fde4dfe9b389ca2b359a92e2 is the identifier of the
> failed build, as visible in the autobuild.buildroot.net URL.
>
> Let me know if this helps!
Yes.
I managed to reproduce.
How do I know if it's a regression, or a new configuration that was tested ?
How was the configuration generated ?
I'm asking because the autotools fails to detect libreadline.
libreadline is installed in the filesystem.
Something is different in libreadline in this setup. I can't point my
finger at the problem.
>
> Thomas Petazzoni
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
