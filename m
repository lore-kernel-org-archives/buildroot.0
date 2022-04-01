Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91A7C433F5
	for <buildroot@archiver.kernel.org>; Fri,  1 Apr 2022 10:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33B7C40607;
	Fri,  1 Apr 2022 10:57:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CMFpQ493mKOi; Fri,  1 Apr 2022 10:57:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2083E405DB;
	Fri,  1 Apr 2022 10:57:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1BA3C1BF861
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 10:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B8BC612DA
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 10:57:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DDoPpNm4M3Oa for <buildroot@lists.busybox.net>;
 Fri,  1 Apr 2022 10:57:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D816260E28
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 10:57:39 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id b188so2387569oia.13
 for <buildroot@buildroot.org>; Fri, 01 Apr 2022 03:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jOS7ahWefGZ5anLUvlkLBIIypYRP+3eYzeR1qfLMeQI=;
 b=I5YRaCwOeOgD4Vgk0EomrbLg1yObeAAY/rD5IyZf/peaGHQszFuVliVT+xmGwX4CcC
 7Kw/miqt8ZelSJRFxpbbpuf3fsWOqad+mdhR2wp5hx6QCzslAdBfnOLK2rfaiWo9985w
 DnrdZysFT3GPI+ZX5h5hf0Jtkg3Qwb3SIYb2ZFo2GRDnYH2W3mLsFUn5eGzKYSHbZRPq
 orxXfUeZif/JczD900H5KV4hRripGGmnwg35rJumuv1VgRTyCVhOeiDqg4DQw46XIWqe
 55nmioA3NzXV33YUtwOC2ggoZF8MWxtoMAmbvCxglL+Fct18hBIvf1x4NyzVNmbMJgQ1
 HjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jOS7ahWefGZ5anLUvlkLBIIypYRP+3eYzeR1qfLMeQI=;
 b=GrIE4fDyoJ/VBqIgUqkbKLskqrxbCtgO2d3ffXSttdmG9LjLxhdqqZLjRZxNR7FpfO
 /Y7HTrOgNPQfnRp/QUElLX40YpTK45sM3EXUnzYYOLBoQEKf/r1Bt/6S1HrT9Dzhpj70
 BOSKaANSSyV3TuExGXIFbR9HI0gqV+u63XaGujS24kztnE6P8VkS2cgzamcYJImJ1fwr
 aZJhFo/iKaBf5zvqUOrYeBx4qwyU6hSt5Qaaal/aBJw6pHRgoQrsP+Qon+WQToKx23xI
 29dRvzR2Pe05CSPEprH2imWhXRH3PNhFfgmadhcJJEVKbABgimyOy8DFYbDJQDQfzcem
 AU6g==
X-Gm-Message-State: AOAM532sGWtGleFPt2iJVBC3QT0gKXwcuifu0OqDA9e9nCoqTJ3JBjyx
 Gf0h+BQ7LtNwE8KYgrGSi7IN58pu5bTMgrS/T0o=
X-Google-Smtp-Source: ABdhPJyK83d/0ebUEsypxWzcOQejMr3EQJs5AMVTelpWfmzV68IIo3cWFFHM7Ed/bTE+5sr3nTgA5vn/9shjwcCwpB4=
X-Received: by 2002:a54:450e:0:b0:2ef:3c3f:f61d with SMTP id
 l14-20020a54450e000000b002ef3c3ff61dmr4510619oil.99.1648810658802; Fri, 01
 Apr 2022 03:57:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220327202415.1248312-1-Jason@zx2c4.com>
 <20220329050401.110856-1-Jason@zx2c4.com>
 <871qyj8kpk.fsf@dell.be.48ers.dk>
 <CAHmME9oRxF66kB9U93zTXC9EQq4xYTABPrZ9y2dPfhReAZdTpQ@mail.gmail.com>
In-Reply-To: <CAHmME9oRxF66kB9U93zTXC9EQq4xYTABPrZ9y2dPfhReAZdTpQ@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 1 Apr 2022 04:57:26 -0600
Message-ID: <CADvTj4obQf+p-bES_5NLK85D=TbjqFhVyxNgNTmWtHzY+nAkcQ@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [Buildroot] [PATCH v3] package/urandom-scripts: actually credit
 seed files via seedrng
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

On Wed, Mar 30, 2022 at 11:13 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Peter,
>
> On 3/30/22, Peter Korsgaard <peter@korsgaard.com> wrote:
> >>>>>> "Jason" == Jason A Donenfeld <Jason@zx2c4.com> writes:
> >
> > Hi,
> >
> >  > The RNG can't actually be seeded from a shell script, due to the
> >  > reliance on ioctls. For this reason, the seedrng project provides a
> >  > basic script meant to be copy and pasted into projects like buildroot
> >  > and tweaked as needed: <https://git.zx2c4.com/seedrng/about/>.
> >
> >  > This commit imports it into buildroot and wires up the init scripts to
> >  > call it. This also is a significant improvement over the current init
> >  > script, which doesn't credit entropy and whose hashing in shell scripts
> >  > is sort of fragile.
> >
> >  > As seedrng.c is a short tiny C program, we include this here in the
> >  > package, like a few other packages do. Later we'll investigate adding
> >  > this to busybox, but for now, this is a good start and a positive step
> >  > in the right direction.
> >
> > As discussed on IRC, I think it would be nicer to just add a normal
> > seedrng package and depend on that from urandom-scripts, so the standard
> > version/license info/.. stuff works. I can do that change if needed.
> >
> > You mentioned something on IRC about this containing differences from
> > what it is seedrng.git. Those changes/fixes are presumably not specific
> > to Buildroot, will you add those changes to the git repo as well?
>
> Absolutely not. This 100% does not work for me. I have made it
> abundantly clear to you that seedrng is code that's meant to be copied
> into individual distros and tweaked as needed, which I've done for
> Buildroot. Do not attempt to package it from any repos I may have. If
> you try to do that, I will intentionally interfere with those
> operations server side, and take whatever other adversarial steps to
> ensure my server is not misused for that purpose. I also will not
> incorporate buildroot-specific tweaks into the sample code repo.
>
> That repo supplies sample code. After Yann's absence, I took the
> necessary steps that a maintainer like him would have done to
> customize it to Buildroot's needs, incorporating it into the project,
> and taking into account James' comments. You now have the result of
> that work here, and I think it'd be silly not to take it.

I should add that I do also think this should be upstreamed to busybox, which
will also reduce the amount of duplicate work as busybox is commonly used
across many distros.

Buildroot isn't a normal distro, we don't normally maintain application code
in-tree like this at all.

>
> I am offering to maintain this code inside of Buildroot for you. I'm
> generally very much on top of things in that regard. I'm not offering
> to start and maintain an external project at your request, no matter
> how much pressure and conditionalization you apply on this mailing
> list or IRC. That's not work I'll do for you. However, again, I am
> offering to maintain this for you inside the buildroot repo as this
> patch does.
>
> That's my offer; take it or leave it.
>
>
> >
> >
> >  > +# The following knobs can be adjusted by placing uncommented modified
> > lines
> >  > +# into /etc/default/urandom:
> >  > +#
> >  > +# Set these to change where the seed and runtime lock file are stored:
> >  > +#
> >  > +#     export SEEDRNG_SEED_DIR=/var/lib/seedrng
> >  > +#     export SEEDRNG_LOCK_FILE=/var/run/seedrng.lock
> >  > +#
> >
> > Will you add the logic for these features to seedrng.git? If not, then I
> > don't think we should have them here either. A bunch of other code already
> > expects "normal" locations, so people generally have to handle such
> > customizations by symlinks in their rootfs(-overlay).
> >
> > If this customization is left in, then it should ideally use the
> > existing (directory part of) URANDOM_SEED, which used to be how the
> > location could be customized for backwards compatibility.
>
> As mentioned, no tweaks go up to seedrng.git. That's sample code.
>
> I'm inclined to agree with James' assessment about this, that
> Buildroot needs it to be customizable. Happy to send a v4 of this
> patch adjusting the defaults to have paths similar to what was there
> before.
>
> >
> >
> >  >  case "$1" in
> >  >    start|restart|reload)
> >  >            # Carry a random seed from start-up to start-up
> >  >            # Load and then save the whole entropy pool
> >  > -          init_rng && save_random_seed;;
> >  > +          # Never fail, as this isn't worth making a fuss
> >  > +          # over if it doesn't go as planned.
> >  > +          seedrng || true;;
> >  >    stop)
> >  >            # Carry a random seed from shut-down to start-up
> >  >            # Save the whole entropy pool
> >  > -          save_random_seed;;
> >  > +          seedrng;;
> >
> > Nice and short! The comments above are not really correct any more, as
> > the stop logic also loads.
>
> Ack, will get rid of those comments for v4.
>
> >
> >
> >  > +++ b/package/urandom-scripts/seedrng.c
> > ..
> >
> >  > +#define le32_to_cpup(a) le32toh(*(a))
> >  > +#define cpu_to_le32(a) htole32(a)
> >
> > What is the purpose of the to/from le32 stuff in this use case?
>
> So that blake2s passes its test vectors. We're not about to go messing
> around with the internal encoding of a hash function. B2s specifies
> little endian, so that's what we use.
>
> >
> >  > +
> >  > +  fprintf(stdout, "Saving %zu bits of %s seed for next boot\n",
> > new_seed_len * 8, new_seed_creditable ? "creditable" : "non-creditable");
> >  > +  fd = open(NON_CREDITABLE_SEED, O_WRONLY | O_CREAT | O_TRUNC, 0400);
> >
> > The 0400 confused me a bit, as that would normally cause the open to
> > fail when the file exists, but it happens to work as you unlink above /
> > use the lock file.
> >
> >
> >> +    if (fd < 0) {
> >  > +          fprintf(stderr, "ERROR: Unable to open seed file for writing: %s\n",
> > strerror(errno));
> >  > +          program_ret |= 1 << 4;
> >  > +          goto out;
> >  > +  }
> >  > +  if (write(fd, new_seed, new_seed_len) != (ssize_t)new_seed_len ||
> > fsync(fd) < 0) {
> >  > +          fprintf(stderr, "ERROR: Unable to write seed file: %s\n",
> > strerror(errno));
> >  > +          program_ret |= 1 << 5;
> >  > +          goto out;
> >  > +  }
> >  > +  if (new_seed_creditable && rename(NON_CREDITABLE_SEED, CREDITABLE_SEED)
> > < 0) {
> >  > +          fprintf(stderr, "WARNING: Unable to make new seed creditable: %s\n",
> > strerror(errno));
> >  > +          program_ret |= 1 << 6;
> >  > +  }
> >  > +out:
> >  > +  if (fd >= 0)
> >  > +          close(fd);
> >  > +  if (lock >= 0)
> >  > +          close(lock);
> >
> > No fsync of the directory like you do in seed_from_file_if_exists()?
>
> No, it's not necessary here, because this is a transition from
> no-credit to credit, so if the power clicks off at the bad moment, it
> fails closed instead of open.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
