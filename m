Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00870ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 16:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5626980BCF;
	Mon, 24 Oct 2022 16:38:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5626980BCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A9LqK80C7AXg; Mon, 24 Oct 2022 16:38:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 457C5808B1;
	Mon, 24 Oct 2022 16:38:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 457C5808B1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE4781BF3EE
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 16:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89DDD605EC
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 16:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89DDD605EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r1YwcYerJRHy for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 16:38:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EFAB600C6
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5EFAB600C6
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 16:38:27 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id j12so8916578plj.5
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 09:38:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R61/mcuEG59TTVSIYdoU3Re01O8B1PEcAv1TDoM7TsA=;
 b=tgQq3L07pxTxGbG1hTMu355f3wGzJBB0QAkXs9cWB92BIKAghyXxvQTteRTmk+Ccqp
 cDesWFZxv502s6GeEcILwGqpatLrft2Q84WzKB4zSJDjJjx+aOidPtzhkZ2DMf/J3mjL
 E6CRF7jspXyRRghsXGgTA8IAUf0tE5N55HHvrwO43JjrsFU/5NxeqaVBkEbbHDXJLnzB
 giQkTI/sbRnrDQ/fHWItKcschlyzdMTiZh4mbZB7KqQTSAhp1i0uNMntGDitC+iX6L0k
 D2Kn7B2z3QYMiNIL3rmX6Cg4ja+66kSDnRUPysUJ4ydGcZJowSCzKfWpX9PVW7+EYZ0/
 wchg==
X-Gm-Message-State: ACrzQf0VApd3YoNGteSxeh+P3eA5sheCCk6/WyZYdx44ykwYEIk6j0Qw
 /ToTJXaPZvBnxMPUXPySfau3Z08iCN/KeLowTRs91OqzAWZUxg==
X-Google-Smtp-Source: AMsMyM5Pw7r1lPiOve0rKQ8tW/K5Hw2grcys53rQOJWgEBmu8laQpZSiFWg6YvKbaTu7jdkw3VIwN6vwmhuYm0eeQ10=
X-Received: by 2002:a17:90b:3b87:b0:213:1f87:f092 with SMTP id
 pc7-20020a17090b3b8700b002131f87f092mr4214329pjb.92.1666629506282; Mon, 24
 Oct 2022 09:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <20221019220019.8418-1-moritz@h6t.eu>
 <20221019220019.8418-2-moritz@h6t.eu>
 <CADvTj4rBgVG3FYMeT1DO_83w5JCJm8hAVZBKf6gq93SzEwpPdg@mail.gmail.com>
 <1c451d96-4f2a-ed48-c7a0-ab83cb935361@h6t.eu>
 <CADvTj4p7RzkEx4NPvPde1FpSWRvRXy+Z_7nK7RceFQfX1zachA@mail.gmail.com>
 <8fee3b0b-e481-455b-5674-b152965b2525@h6t.eu>
 <CADvTj4qKt8kzhqiZDUEH9gaSZoS0cGi8bN2FYxU7hnN_iB9Lrw@mail.gmail.com>
 <b4f788bd-faa8-7643-6bd7-c0d269c7beb1@h6t.eu>
In-Reply-To: <b4f788bd-faa8-7643-6bd7-c0d269c7beb1@h6t.eu>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 24 Oct 2022 12:38:13 -0400
Message-ID: <CADvTj4rYTE0Rh+a8fkzKtZ9yFhoxpMV_Lf5r+vm+bh-9MSDJwA@mail.gmail.com>
To: Moritz Bitsch <moritz@h6t.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=R61/mcuEG59TTVSIYdoU3Re01O8B1PEcAv1TDoM7TsA=;
 b=hsHoijQtatdPcfxqwS0I3R3R9SW1ts5dOFwTvFhyQkFrBQjwmNJvejD8aRVxcEm9eJ
 NpRgdDBfYGvm0BujSSVk/F4orM59GdZuF08Sgh9jSjY0SW8NZOF+en0Ecktffw47QZvc
 P9JEwqwbfrq6Qp1LUVjod/KF6kzqpzC+ZQ5+ORde0HpVkKfGKSIqjhkHeuHmWPPhXi6Y
 IH2iuH2CrG3fD1WgiW/COn1AbqzlIWSrbXIn0o6/1aF7F89h7Dz+of6QpgE0ZuwZonne
 gMZjNM236MIB8RJ8rcYbyCIuqksI9C1jaVhhXbaAkAlKs2xiPa9xzociNGiCTakCCelu
 W4UA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hsHoijQt
Subject: Re: [Buildroot] [PATCH 1/2] package/pkg-cargo.mk: fix handling of
 runtime debug builds
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Oct 24, 2022 at 5:15 AM Moritz Bitsch <moritz@h6t.eu> wrote:
>
> Am 22.10.22 um 00:57 schrieb James Hilliard:
> > On Fri, Oct 21, 2022 at 5:04 PM Moritz Bitsch <moritz@h6t.eu> wrote:
> >>
> >> Am 21.10.22 um 18:41 schrieb James Hilliard:
> >>> On Fri, Oct 21, 2022 at 2:48 AM Moritz Bitsch <moritz@h6t.eu> wrote:
> >>>>
> >>>> Am 20.10.22 um 00:12 schrieb James Hilliard:
> >>>>
> >>>>> On Wed, Oct 19, 2022 at 6:02 PM Moritz Bitsch via buildroot
> >>>>> <buildroot@buildroot.org> wrote:
> >>>>>> From: Moritz Bitsch <moritz@h6t.eu>
> >>>>>>
> >>>>>> The cargo --release flag is used to create optimized builds, not supplying
> >>>>>> --release has major performance implications.
> >
> > Looking at this further the cargo --release flag merely tells cargo to use the
> > release profile rather than the dev profile, however the issue of optimizations
> > being enabled or not is really a matter of what the profile configuration is,
> > right now we are effectively choosing between the default release or default
> > dev profile configuration which does not properly match the build settings.
> >
> > Instead what we really want to do is configure all cargo profiles based on the
> > selected buildroot build settings.
> >
> > Unfortunately cargo doesn't have any env variable that selects a profile, but
> > we can sidestep this simply by configuring both root profiles(which other
> > profiles inherit from).
> >
> > I think the existing cargo build flags are fine, I sent a patch which should fix
> > the profile configurations so that they match the buildroot build settings, let
> > me know if this fixes the optimization issue for you:
> > https://lore.kernel.org/buildroot/20221021224448.3502942-1-james.hilliard1@gmail.com/
>
> Thanks, for the detailed response. The mentioned patch works fine for my
> use case. I can reproduce the performance issue/improvement when
> switching between different optimization levels.

Great, can you reply to that patch with a "Tested-by:" so that patchwork
picks it up?

>
> >>>>> Is there an env variable we can use to set this instead?
> >>>>>
> >>>>> Some packages use cargo without the cargo infrastructure, for example
> >>>>> we have a number of pyo3(https://pyo3.rs/) based packages that use the
> >>>>> cargo env but not the cargo build commands from here.
> >>>> I could not find any env variable for switching profiles.
> >>>>
> >>>> I had a look at python-rtoml, and the used setuptools-rust: supplying
> >>>> --debug to
> >>>> the "setup.py build" removes the --release flag from the cargo invocation.
> >>>
> >>> Hmm, there are two pyo3 build backends, only setuptools-rust uses setup.py,
> >>> we also have maturin which is pep517 based.
> >>
> >> I'm in no way a a python expert, so take my words with a grain of salt.
> >>
> >> I could not find a way to specify what build profile is used by maturin
> >> when in a pep517 build. Even if maturin supports the -r flag for release
> >> builds when called directly.
> >
> > I think the real issue is actually not that the wrong build profile is
> > being used
> > so much as the build profile configuration itself is wrong.
>
> After looking into some crates with different behavior when built in
> debug or release mode (for example rust-embed) I think that most of them
> check for enabled debug_assertions, which you handle in your patch.

There are still ways for cargo packages to potentially change behavior
based on the selected profile even when the profile configurations are
otherwise identical.

>
> I think the conditional --release switch should be removed. Your patch
> is by far the more precise solution.

I think we should probably still leave the --release switch as it's possible
for cargo package build scripts to detect the configured profile using
the PROFILE build script env variable which gets set by cargo:
https://doc.rust-lang.org/cargo/reference/environment-variables.html#environment-variables-cargo-sets-for-build-scripts

There's probably not many cases where this will matter but it does appear
to be more correct to set the --release switch as well when possible.

>
> >>
> >>>
> >>>>>> Signed-off-by: Moritz Bitsch <moritz@h6t.eu>
> >>>>>> ---
> >>>>>>     package/pkg-cargo.mk | 2 +-
> >>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>>
> >>>>>> diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
> >>>>>> index f7e3f39503..e0556252fa 100644
> >>>>>> --- a/package/pkg-cargo.mk
> >>>>>> +++ b/package/pkg-cargo.mk
> >>>>>> @@ -119,7 +119,7 @@ define $(2)_BUILD_CMDS
> >>>>>>                    $$($(2)_CARGO_ENV) \
> >>>>>>                    cargo build \
> >>>>>>                            --offline \
> >>>>>> -                       $$(if $$(BR2_ENABLE_DEBUG),,--release) \
> >>>>>> +                       $$(if $$(BR2_ENABLE_RUNTIME_DEBUG),,--release) \
> >>>>>>                            --manifest-path Cargo.toml \
> >>>>>>                            --locked \
> >>>>>>                            $$($(2)_CARGO_BUILD_OPTS)
> >>>>>> --
> >>>>>> 2.37.3
> >>>>>>
> >>>>>> _______________________________________________
> >>>>>> buildroot mailing list
> >>>>>> buildroot@buildroot.org
> >>>>>> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
