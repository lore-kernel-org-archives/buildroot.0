Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC45C43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 22:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B204E60F1E;
	Tue,  7 Jun 2022 22:30:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TOJS7ZhgV0C0; Tue,  7 Jun 2022 22:29:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22D2B60E5B;
	Tue,  7 Jun 2022 22:29:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5BB791BF42D
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 22:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 485E960E5B
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 22:29:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LQU3u2MUk5Tf for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 22:29:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C65D60D7B
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 22:29:54 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id q184so8872137oia.1
 for <buildroot@buildroot.org>; Tue, 07 Jun 2022 15:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ReKiLpvYgRq1eYGHvHbbMqCwzU9L00n/4y0vWG/HY7k=;
 b=fAZMpLcWY+TU3Eimbsxg7eCHofDC33kYannk/p/W10bUrt7DH2extL8eQ1Z2CzFKSO
 jFzQwnq4NXtJPTW2id1isSbz+EXWVkh1gzeRbMxjWOrEF8h8Dqwlm5OsLE5EZ+tYcbrH
 YJ4p5L017X8Vv8++obs+YSdNm9WArjriu6KNiLTJb1s5KJclRYHJbZd3aS1haMDv3mbg
 kBOfW1JpLs7On8YhgfuGBF/HwnImuVVohvW/hyFFPH0iL1UytSx7k0Nan2ZM7tXGk8P2
 c4u45u5s2CSxpRmZh/Qm2RbECtQ27pFBriPxl6YlLv5vs5ksYU+gxBx1QsV5YjEwgttK
 Kkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ReKiLpvYgRq1eYGHvHbbMqCwzU9L00n/4y0vWG/HY7k=;
 b=gSxY90o9WvxmXjvKZ8eulEPaPSsmcxqCwyXDO4RzdyhlyEUVrObFWMk9iII1R6+hgX
 b8IEkhySbgS4mbcln/1SLhzv+E4qBFwRM2/M0NwXWTfE8LLwOAuTqvHY75bVfdgOW8mI
 p7APzg/BPrWcAqY77xaQjl2L41kmvsVd46v4iglifIG9FjHww8AfE8hgFGOpi6rrZPv3
 FVlHBtFiuSyapEaXfsZlVvJWBSn54YCFV1Qd3r8OkiR7kTEabzamhmzVznJusdiLyBiJ
 2kMzFfLL+bOwp0g35yj+s2i8PbWpNwIwDtfXiZTa7EBo2HCNFsx9FOEJqJ3INbhBmGl7
 5NdA==
X-Gm-Message-State: AOAM533EllrrNmWOoKr0OIGVkLl4ntgveP7guxeDuk+f1VB5P4N9Snux
 y7y0jco/vF7FozJvLo0v7lFwiyQkWpNguUDwO7yT0kqXDnk=
X-Google-Smtp-Source: ABdhPJz79Q+jpEgfTXlqR4hlANJ6srJeo6BBGDqEwXWIpyPEy789FSS68FTVdSOJwK1E8lmn56vMsNaqR/4yrTv3AmU=
X-Received: by 2002:a05:6808:114f:b0:32b:1be0:2316 with SMTP id
 u15-20020a056808114f00b0032b1be02316mr679086oiu.200.1654640993419; Tue, 07
 Jun 2022 15:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220413212745.480101-1-james.hilliard1@gmail.com>
 <20220608000128.046574c1@windsurf>
In-Reply-To: <20220608000128.046574c1@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 7 Jun 2022 16:29:41 -0600
Message-ID: <CADvTj4oXWedG7r8NJvHPipBLToK=gMNdMpTe9=nK3jC-OEoqZg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v3 1/1] scripts/autobuild-run: add
 --no-toolchains-csv option and drop docopt
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

On Tue, Jun 7, 2022 at 4:01 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello James,
>
> On Wed, 13 Apr 2022 15:27:45 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Since docopt is unmaintained and less flexible than argparse lets
> > drop it and migrate to argparse.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> > Changes v2 -> v3:
> >   - suppress --no-toolchains-csv default output from help
> > Changes v1 -> v2:
> >   - fix configparser
> > ---
> >  scripts/autobuild-run      | 202 ++++++-------
> >  scripts/docopt.LICENSE-MIT |  23 --
> >  scripts/docopt.py          | 581 -------------------------------------
> >  3 files changed, 93 insertions(+), 713 deletions(-)
> >  delete mode 100644 scripts/docopt.LICENSE-MIT
> >  delete mode 100644 scripts/docopt.py
>
> I have finally applied this patch, but after splitting it into two
> commits:
>
>  * One implementing the docopt -> argparse migration
>
>  * One implementing the --no-toolchains-csv option
>
> Also, the --no-toolchains-csv option of utils/genrandconfig did not
> exist back in the 2022.02.x branch, so when autobuild-run is executed
> with --no-toolchains-csv, it never built any configuration on
> 2022.02.x, which is problematic.

I've been running autobuilders restricted to master at the moment since
the other branches were rather broken anyways with full package randomization.

>
> I worked this around by doing a special case:
>
>   https://git.buildroot.org/buildroot-test/commit/?id=cae22243b75f7766095cbef196016b3b3143b677
>
> I have now deployed the new script on two of the autobuilder instances
> that I manage (gcc159 and gcc160).
>
> Could you on your side also update to use the latest version of
> autobuild-run, so that we are aligned?

Yeah, I'll give that a try. May keep the master restriction in place
for a little
since the full randomization triggered a lot of errors that weren't regressions
so much as things that just didn't have good coverage.

>
> Thanks a lot for this work, it has been extremely useful to find more
> problematic configurations!

I think this patch should make it easier to find problematic configurations
as well, right now there seems to be a heavy bias towards selecting packages
with very few dependencies:
https://patchwork.ozlabs.org/project/buildroot/patch/20220514214612.3221647-1-james.hilliard1@gmail.com/

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
