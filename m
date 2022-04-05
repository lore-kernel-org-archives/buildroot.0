Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5C3C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 11:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FFA1825C6;
	Tue,  5 Apr 2022 11:56:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x1_gFXqFED-f; Tue,  5 Apr 2022 11:56:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5929F8248F;
	Tue,  5 Apr 2022 11:56:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0698E1BF847
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 11:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 039B2410D1
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 11:56:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F7H9suZph-2Y for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 11:56:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D14A4410B3
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 11:56:13 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id j83so13125777oih.6
 for <buildroot@buildroot.org>; Tue, 05 Apr 2022 04:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w/6TliTg/hZEq1fGRz0UIo8TtwRlp7YMtu/Reg2BB90=;
 b=YqQr8yBB719o6w1O5dPzJFkWqBrRnC3bZv7WWjeLpLuLgzVBD8ftPiGJmcXq/Df9Rd
 2KIdT/K/EW6Ykz32VI8kP37XqIQ6yYLqP8fgFG/XCVW3FjezIAqbR0q23TKR5BewNIc8
 sUipvAOr0jtbcZl+vmLwUMBFTucCBAdVBYr6GzhezyrPfuPJJLUynvN+3NS+A9xwrgDe
 HqU2a4URXnF3MwnqaegLo96Kyq3zewA3YfpsoIZSc4xiIZaLoAhJ4lAbCUhtb753jjyv
 9tasdJB9c67ML8Uxbtou9dycZ3JKNJ9CJInqetJRXqwT8wiydIacbTuGyA2poMXi6VNq
 Q/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w/6TliTg/hZEq1fGRz0UIo8TtwRlp7YMtu/Reg2BB90=;
 b=Lk8hcjAJP71mA/tUq2EqTghyRxUqZtfKkFEHvb7ZCLsBir3T9HNquQ2s//fnpWx59D
 fiyT7v54garXGjaRqCI0f4PYMFDj4rT31UaNOGwhvNvTxcyFERBOI3GSPga6RgqZIUNw
 wo46lDpaH3cHXsS3ilqxNe0SZY6PgVdQVxKKTz2YGVP5UxCBvdGJ421R2DF7p7WhylV+
 q8uUPQBubfG/hf43ONt1ygKuDczyR+Cz20qWDrTbpAoB+M3I9rDLVJVWHyVDTWtJWwQ6
 b0IfnGdNFgnWlwyZXTfSiBGfOoPmg6/Ph1UHQf+ILtgysimxPIt3V7qfb+E6WlAbGAli
 MdMA==
X-Gm-Message-State: AOAM532CtSk/DY9wx6mgbhXPiPLy6IgBtylJgGAbSTTEsTgdf/2SQnO5
 r+4SeNTU6vBTwZV9enDOEitXJuOxmJKdbVO5MJc=
X-Google-Smtp-Source: ABdhPJzzKJgiBvk9ABXKumC8Tsd3tSosZbWG86pIxwcJmPVuxt+M4W4lvEiykYlHD9V8vnaPtS43DtR46fI41+9eB2A=
X-Received: by 2002:a05:6808:df1:b0:2ec:b193:ad6c with SMTP id
 g49-20020a0568080df100b002ecb193ad6cmr1141387oic.200.1649159772641; Tue, 05
 Apr 2022 04:56:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220402010559.410834-1-james.hilliard1@gmail.com>
 <34c73050-b148-7887-63ec-56f1e90c854e@mind.be>
 <CADvTj4oJnqUCN2MuTh+vUh8mPcpR7xa2OWX-RBJTA0Xb9CJcDA@mail.gmail.com>
 <7fa02b77-d609-4cd4-5b93-b8f58c50b45f@mind.be>
In-Reply-To: <7fa02b77-d609-4cd4-5b93-b8f58c50b45f@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 5 Apr 2022 05:56:01 -0600
Message-ID: <CADvTj4pseUWHWcGAsTJvZmdjyNrTJTeiKpHPoqzLYDty3DSYSQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: add randconfig
 based --no-toolchains-csv option
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

On Sun, Apr 3, 2022 at 7:58 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 02/04/2022 20:58, James Hilliard wrote:
> > On Sat, Apr 2, 2022 at 10:29 AM Arnout Vandecappelle <arnout@mind.be> wrote:
> >>
> >>    Hi James,
> >>
> >> On 02/04/2022 03:05, James Hilliard wrote:
> [snip]
> >>> +    if 'BR2_ROOTFS_SKELETON_CUSTOM=y\n' in configlines and \
> >>> +       'BR2_ROOTFS_SKELETON_CUSTOM_PATH=""\n' in configlines:
> >>> +        configlines.remove('BR2_ROOTFS_SKELETON_CUSTOM=y\n')
> >>
> >>    I don't understand why for this particular one you remove it explicitly, while
> >> for other cases you rely (I guess) on the dependency check to make sure we get a
> >> valid config (eventually).
> >
> > Others were missing the empty string config for matching against so
> > this approach
> > didn't seem to work there.
>
>   I still don't understand... If I have the time, I'll try to cook up a patch
> that does the check the same way as all the other checks are done, and you an
> tell me if you're happy with that.

I was looking at the defconfig actually instead of the config for
that, I think we don't
need the retry saving loop with this anymore, I ran randomizations in
a loop for a while
and I'm not seeing any failures anymore due to invalid configs getting
past fixup_config:
https://patchwork.ozlabs.org/project/buildroot/patch/20220405115040.3779242-1-james.hilliard1@gmail.com/

>
> [snip]
> >>    I agree though that it's more work to do that than the current patch, so
> >> perhaps this is a good first step.
> >
> > Yeah, best to do this incrementally IMO, since this is revealing issues already
> > in the autobuilder relating to config validation I'm running this on:
> > http://autobuild.buildroot.net/?submitter=James+Hilliard+%28asahi-mini%29
>
>   So this is running a modified buildroot-test that passes the
> --no-toolchains-csv option?
>
> > Note that this autobuilder is an aarch64(running
> > https://asahilinux.org/) host so
> > it doesn't use the prebuilt toolchains.
>
> [snip]
> >>> -    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> >>> -                           "savedefconfig"])
> >>> +            if subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> >>> +                                      "savedefconfig"]):
> >>
> >>    This one should simply never fail, so it should move outside of the loop,
> >> after checking dependencies.
> >
> > I just tested that this can fail so I've kept it in the loop for now.
>
>   Okay, let me rephrase: if 'make dependencies' passes, then 'make
> savedefconfig' should never fail. If you had a situation where make
> savedefconfig fails, I'd be interested to know about it and debug it.

I think it was this issue probably:
https://patchwork.ozlabs.org/project/buildroot/patch/20220405025054.966064-1-james.hilliard1@gmail.com/

>
>
>   Regards,
>   Arnout
>
> >>> +                continue
> >>>
> >>> -    return subprocess.call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> >>> -                            "dependencies"])
> >>> +            if subprocess.call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> >>> +                                "dependencies"]):
> >>> +                continue
> >>> +            break
> >>> +    return 0
> >>>
> >>>
> >>>    if __name__ == '__main__':
> >>> @@ -433,10 +443,18 @@ if __name__ == '__main__':
> >>>        parser.add_argument("--buildrootdir", "-b",
> >>>                            help="Buildroot directory (relative to current directory)",
> >>>                            type=str, default='.')
> >>> -    parser.add_argument("--toolchains-csv",
> >>> -                        help="Path of the toolchain configuration file",
> >>> -                        type=str,
> >>> -                        default="support/config-fragments/autobuild/toolchain-configs.csv")
> >>> +
> >>> +    toolchains_csv = parser.add_mutually_exclusive_group(required=False)
> >>> +    toolchains_csv.add_argument("--toolchains-csv",
> >>> +                                dest="toolchains_csv",
> >>> +                                help="Path of the toolchain configuration file",
> >>> +                                type=str)
> >>> +    toolchains_csv.add_argument("--no-toolchains-csv",
> >>> +                                dest="toolchains_csv",
> >>> +                                help="Generate random toolchain configuration",
> >>> +                                action='store_false')
> >>> +    parser.set_defaults(toolchains_csv="support/config-fragments/autobuild/toolchain-configs.csv")
> >>> +
> >>>        args = parser.parse_args()
> >>>
> >>>        # We need the absolute path to use with O=, because the relative
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
