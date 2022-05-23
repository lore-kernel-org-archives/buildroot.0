Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420C1C433F5
	for <buildroot@archiver.kernel.org>; Mon, 23 May 2022 18:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E96A418A4;
	Mon, 23 May 2022 18:24:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xzacQL6XZ9cY; Mon, 23 May 2022 18:24:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D87D4188F;
	Mon, 23 May 2022 18:24:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA5711BF2A7
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 18:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D85634188F
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 18:24:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oMGj1g3zh0-a for <buildroot@lists.busybox.net>;
 Mon, 23 May 2022 18:24:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C14B41842
 for <buildroot@buildroot.org>; Mon, 23 May 2022 18:24:52 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id w130so18856091oig.0
 for <buildroot@buildroot.org>; Mon, 23 May 2022 11:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ImvEIlMFxo9bJ6VdVtdTOxtnHlGNFP2Le8dUmHGfeKg=;
 b=q1bA7vfzvUY4mEbRX4RAJ+Zs/NLkUmiWIjduwGzCiCxXU1q8nuk3eIswOoxe/6sQOi
 IDHwv/wRMRuuIwnEekYjEmbX1Ne94IK0BS1fsLImTYcRKjxzp7D+uuhydMVpWSflNlCl
 Wj76YbMrlvGLJHgqtbAvjTkUHXRIFb2gsugMHFbnmSUheakSCma74vnUMap17UlywhHj
 6SROxZK5kzJ2eEJOfNVDUDorqaZ7QrjaIOiNUkHaI5djkwJrLwtYAHZOe2tw8XKa32s2
 xh8pEpIv4Ki76C8mz/pzVyqQAYMiz/idHO8fxkJ9nWe69KBcrFkMT9XE88QPfvDZpv/d
 3lqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ImvEIlMFxo9bJ6VdVtdTOxtnHlGNFP2Le8dUmHGfeKg=;
 b=OUwpUf/8Gu0JZan2YqoyIcJri64g5ZBcW8l9SxBlw1HAOHUBW4RGoebYoXJ+m+5rz6
 BTKtgbwtax92Po6IcQy2WSmGn0qx6zEErw2aUch1S13FtpTA5qSH/ZvSe8GXElBT2UCw
 Ha/JYpljymkYlvLEpi5kQU4BJT6LFd6k2w2xRjpodYerj/GIbfehw3IP7+Y/xYsEFKeR
 WVMe+Cp9GMx+obLWc9zt+aJeG+BBDsDan/PSOIqX6XAFd9/JEp/GMsjYCYbmwNNU+7QD
 3Ta6xJiPm+P5aj4HmXokJsa8hNHe1wuRVx1iUR74Sq6zBsl/radz96X8gV1xeeHZKZ5S
 5yWA==
X-Gm-Message-State: AOAM532cqDOBftlf1S522RPOmR4GYCdQHKxXER2cpnrMaBjophIroEE8
 0sR4oSaA4lDopLH7FwzMlUM/R/9rltExV+TzGyxceddf
X-Google-Smtp-Source: ABdhPJyhjPTWQ5xu4WUiDIWDZRA8T19T2S7imcEkKwPFfsoHXLUmyVzDM4nzBJ+SxwQqwyz3yON1uiV1gr5dNh4b9to=
X-Received: by 2002:a05:6808:2014:b0:32b:1806:8ed5 with SMTP id
 q20-20020a056808201400b0032b18068ed5mr190444oiw.99.1653330291244; Mon, 23 May
 2022 11:24:51 -0700 (PDT)
MIME-Version: 1.0
References: <62886d67.1c69fb81.ac372.4710SMTPIN_ADDED_MISSING@mx.google.com>
 <CAGi-RUKF09JmK_EACoQdBnS_Aw8G6Ep88Lx3rCHY3ZkxrqLvmQ@mail.gmail.com>
 <20220521164440.0f0df25f@windsurf>
 <CAGi-RU+TOb+RCRzU=WeWw2DDwtcxk9_2gptgDpZJRZNonMGZUQ@mail.gmail.com>
 <20220523174642.0c7a2fc2@windsurf>
In-Reply-To: <20220523174642.0c7a2fc2@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 23 May 2022 12:24:39 -0600
Message-ID: <CADvTj4qe_sP1mTA=7YUY9v-33dG6JdEQ+xUBtsAGornYsqqLCA@mail.gmail.com>
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
Cc: Ramon Fried <rfried.dev@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, May 23, 2022 at 9:47 AM Thomas Petazzoni via buildroot
<buildroot@buildroot.org> wrote:
>
> Hello Ramon,
>
> On Sat, 21 May 2022 19:47:24 +0300
> Ramon Fried <rfried.dev@gmail.com> wrote:
>
> > > Let me know if this helps!
> > Yes.
> > I managed to reproduce.
> > How do I know if it's a regression, or a new configuration that was tested ?
> > How was the configuration generated ?
>
> Configurations are randomly generated. So it can either be a
> configuration that was never tested before, or some other package that
> was updated, and which has an impact on bitwise.
>
> If you look at:
>
>   http://autobuild.buildroot.net/?reason=bitwise-0.43
>
> You can see that the problem started appearing on May 1, 2022. It
> affects only riscv64 and m68k/5208, which is extremely strange (which
> only those architectures ?).

Well it likely started getting hit due to the full randomization I
recently started
running on my autobuilders, if you notice only my two autobuilders are hitting
it(which are the only ones running the non-default full randomization rather
than just package configuration randomization).

>
> What can be tried is take the first of those build issues (from May 1),
> reproduce it. And then checkout progressively older commits of
> Buildroot (before May 1), and see when it started failing.

If it's only my autobuilders it likely just wasn't getting good coverage before,
there were also a lot of other bugs that full randomization uncovered that
were masking other issues by causing super early build failures, so good
chance it's not actually a regression but an issue that just never showed up
before due to poor test coverage of certain toolchain configurations.

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
