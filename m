Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6AFC433EF
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 17:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8594418C5;
	Wed, 30 Mar 2022 17:13:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aWwgcq5CGVFe; Wed, 30 Mar 2022 17:13:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6028A4088C;
	Wed, 30 Mar 2022 17:13:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 20BC41BF47E
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 17:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C54F402AD
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 17:13:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lIrxV3wDcBvQ for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 17:13:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 95F944088C
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 17:13:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 492FD61868
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 17:13:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 627A6C340EE
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 17:13:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="QXIC1kN4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1648660390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lrNjZuvZokD44M0SfutTcgirD9kMRbDOT0MmoWPJn7I=;
 b=QXIC1kN4dQvRtE+ixD1tPj3Mj2M7nVrWC4U2FzUI83/7WqQpzmRvrr77+5Bh5NTlKmiJTM
 g9OJG37BI8qxPO0VYhNfxdt3bb6dHiTgo0wZdB/2n+U4KtgQJ2FbtV0wMSeCAMk97myOZd
 e+fZ1EEvF546p38AwxF7hJNJBLF3ga0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d2b12da5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 17:13:10 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id g9so35439740ybf.1
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 10:13:10 -0700 (PDT)
X-Gm-Message-State: AOAM533nSXCJF5rVqX3HubJGiwkXcszCSAfTokn/aCe2wl+NdAYKZQsj
 nMoiEe0Fq083yeDWQNru8uyq6fhwQ1D5H93xX8k=
X-Google-Smtp-Source: ABdhPJy7sXVZUkpzX24HKZUD+VwTxAEZEX84JUg0PwzPhea0n1X3gGDFtlgw7SDYHPBOC2B5nmM0r2F+R85ILOVWuWw=
X-Received: by 2002:a5b:6cf:0:b0:61e:1371:3cda with SMTP id
 r15-20020a5b06cf000000b0061e13713cdamr602694ybq.235.1648660389038; Wed, 30
 Mar 2022 10:13:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7110:4707:b0:171:cd8f:b3d2 with HTTP; Wed, 30 Mar 2022
 10:13:08 -0700 (PDT)
In-Reply-To: <871qyj8kpk.fsf@dell.be.48ers.dk>
References: <20220327202415.1248312-1-Jason@zx2c4.com>
 <20220329050401.110856-1-Jason@zx2c4.com>
 <871qyj8kpk.fsf@dell.be.48ers.dk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 30 Mar 2022 13:13:08 -0400
X-Gmail-Original-Message-ID: <CAHmME9oRxF66kB9U93zTXC9EQq4xYTABPrZ9y2dPfhReAZdTpQ@mail.gmail.com>
Message-ID: <CAHmME9oRxF66kB9U93zTXC9EQq4xYTABPrZ9y2dPfhReAZdTpQ@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On 3/30/22, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Jason" == Jason A Donenfeld <Jason@zx2c4.com> writes:
>
> Hi,
>
>  > The RNG can't actually be seeded from a shell script, due to the
>  > reliance on ioctls. For this reason, the seedrng project provides a
>  > basic script meant to be copy and pasted into projects like buildroot
>  > and tweaked as needed: <https://git.zx2c4.com/seedrng/about/>.
>
>  > This commit imports it into buildroot and wires up the init scripts to
>  > call it. This also is a significant improvement over the current init
>  > script, which doesn't credit entropy and whose hashing in shell scripts
>  > is sort of fragile.
>
>  > As seedrng.c is a short tiny C program, we include this here in the
>  > package, like a few other packages do. Later we'll investigate adding
>  > this to busybox, but for now, this is a good start and a positive step
>  > in the right direction.
>
> As discussed on IRC, I think it would be nicer to just add a normal
> seedrng package and depend on that from urandom-scripts, so the standard
> version/license info/.. stuff works. I can do that change if needed.
>
> You mentioned something on IRC about this containing differences from
> what it is seedrng.git. Those changes/fixes are presumably not specific
> to Buildroot, will you add those changes to the git repo as well?

Absolutely not. This 100% does not work for me. I have made it
abundantly clear to you that seedrng is code that's meant to be copied
into individual distros and tweaked as needed, which I've done for
Buildroot. Do not attempt to package it from any repos I may have. If
you try to do that, I will intentionally interfere with those
operations server side, and take whatever other adversarial steps to
ensure my server is not misused for that purpose. I also will not
incorporate buildroot-specific tweaks into the sample code repo.

That repo supplies sample code. After Yann's absence, I took the
necessary steps that a maintainer like him would have done to
customize it to Buildroot's needs, incorporating it into the project,
and taking into account James' comments. You now have the result of
that work here, and I think it'd be silly not to take it.

I am offering to maintain this code inside of Buildroot for you. I'm
generally very much on top of things in that regard. I'm not offering
to start and maintain an external project at your request, no matter
how much pressure and conditionalization you apply on this mailing
list or IRC. That's not work I'll do for you. However, again, I am
offering to maintain this for you inside the buildroot repo as this
patch does.

That's my offer; take it or leave it.


>
>
>  > +# The following knobs can be adjusted by placing uncommented modified
> lines
>  > +# into /etc/default/urandom:
>  > +#
>  > +# Set these to change where the seed and runtime lock file are stored:
>  > +#
>  > +#     export SEEDRNG_SEED_DIR=/var/lib/seedrng
>  > +#     export SEEDRNG_LOCK_FILE=/var/run/seedrng.lock
>  > +#
>
> Will you add the logic for these features to seedrng.git? If not, then I
> don't think we should have them here either. A bunch of other code already
> expects "normal" locations, so people generally have to handle such
> customizations by symlinks in their rootfs(-overlay).
>
> If this customization is left in, then it should ideally use the
> existing (directory part of) URANDOM_SEED, which used to be how the
> location could be customized for backwards compatibility.

As mentioned, no tweaks go up to seedrng.git. That's sample code.

I'm inclined to agree with James' assessment about this, that
Buildroot needs it to be customizable. Happy to send a v4 of this
patch adjusting the defaults to have paths similar to what was there
before.

>
>
>  >  case "$1" in
>  >  	start|restart|reload)
>  >  		# Carry a random seed from start-up to start-up
>  >  		# Load and then save the whole entropy pool
>  > -		init_rng && save_random_seed;;
>  > +		# Never fail, as this isn't worth making a fuss
>  > +		# over if it doesn't go as planned.
>  > +		seedrng || true;;
>  >  	stop)
>  >  		# Carry a random seed from shut-down to start-up
>  >  		# Save the whole entropy pool
>  > -		save_random_seed;;
>  > +		seedrng;;
>
> Nice and short! The comments above are not really correct any more, as
> the stop logic also loads.

Ack, will get rid of those comments for v4.

>
>
>  > +++ b/package/urandom-scripts/seedrng.c
> ..
>
>  > +#define le32_to_cpup(a) le32toh(*(a))
>  > +#define cpu_to_le32(a) htole32(a)
>
> What is the purpose of the to/from le32 stuff in this use case?

So that blake2s passes its test vectors. We're not about to go messing
around with the internal encoding of a hash function. B2s specifies
little endian, so that's what we use.

>
>  > +
>  > +	fprintf(stdout, "Saving %zu bits of %s seed for next boot\n",
> new_seed_len * 8, new_seed_creditable ? "creditable" : "non-creditable");
>  > +	fd = open(NON_CREDITABLE_SEED, O_WRONLY | O_CREAT | O_TRUNC, 0400);
>
> The 0400 confused me a bit, as that would normally cause the open to
> fail when the file exists, but it happens to work as you unlink above /
> use the lock file.
>
>
>> +	if (fd < 0) {
>  > +		fprintf(stderr, "ERROR: Unable to open seed file for writing: %s\n",
> strerror(errno));
>  > +		program_ret |= 1 << 4;
>  > +		goto out;
>  > +	}
>  > +	if (write(fd, new_seed, new_seed_len) != (ssize_t)new_seed_len ||
> fsync(fd) < 0) {
>  > +		fprintf(stderr, "ERROR: Unable to write seed file: %s\n",
> strerror(errno));
>  > +		program_ret |= 1 << 5;
>  > +		goto out;
>  > +	}
>  > +	if (new_seed_creditable && rename(NON_CREDITABLE_SEED, CREDITABLE_SEED)
> < 0) {
>  > +		fprintf(stderr, "WARNING: Unable to make new seed creditable: %s\n",
> strerror(errno));
>  > +		program_ret |= 1 << 6;
>  > +	}
>  > +out:
>  > +	if (fd >= 0)
>  > +		close(fd);
>  > +	if (lock >= 0)
>  > +		close(lock);
>
> No fsync of the directory like you do in seed_from_file_if_exists()?

No, it's not necessary here, because this is a transition from
no-credit to credit, so if the power clicks off at the bad moment, it
fails closed instead of open.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
