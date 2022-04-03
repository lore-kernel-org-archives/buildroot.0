Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71ADFC433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 16:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D67F6416C8;
	Sun,  3 Apr 2022 16:22:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I25Or_spGctG; Sun,  3 Apr 2022 16:22:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1380409F5;
	Sun,  3 Apr 2022 16:22:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 762391BF284
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 16:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63F0D40125
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 16:22:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OH1zidchZbpX for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 16:22:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D782400EA
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 16:22:32 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-e1e5e8d9faso2765832fac.4
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 09:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SKh0MhD1yiSUm4QzQaSL00qWvITtaGQohXGks4pDX0g=;
 b=QH65VzCaR1Flefcbvp5NiPkn+jK7MA6Tu8UauUK25rdk2/QjpGTADeNFKlkpi6VrVj
 tXIwrd1bx+0y2f1V5jGEGf+mX6+JrNDAILBpDrFoVRDIYaTpvV4L+VmlbH2kycjMUNpG
 Uqsyw/fTmi5oDPby2cra6dQz/HMRyZOPCmBa5B9zDEf7MT/0eQA9PRAkRbv8dH+/bUPb
 PyayQ2FNnczVGbtnchVWnqJmiz45vF9BoYhndv8KenYG8sbuDBb59kGU/le2X4+uILKY
 emMoSMjW7Md56VaADzwPnmDzt0RWeM/x+dodhqZfqIbKiadckmvp8Sm7fKIU1iZXRzsx
 QBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SKh0MhD1yiSUm4QzQaSL00qWvITtaGQohXGks4pDX0g=;
 b=f5+M4qNDzAnsKPyRlaoKq0YjUuxZTDTI7DN6+GY9/TwHgME8MmnivTuiuPN5BoBwer
 Szb/ZHgJeU59PbIeBQbzo3WUKCUqappLU1Ffj+BaFQ081bYAuBnQSbbXSCav9F4zd2xy
 qdfrS2s86t5aHXU4ff14K4TeHDh7q6lxzSN6kDNKZcMA7Ir939jnu+YpF90pqzpakp3f
 oSFcUaH1SQZa1QufGIyzqvSfbR1eJkpeGwqoIDouCwBFH5SrttLMpMW5JdS/Ol9Uu3w8
 xgwMujFTc9edsCFSxYNgpKwioaP6ASndF70bo9uPgj5ycRCxGMJDOHMu3zMNmpRsn+Up
 AUpA==
X-Gm-Message-State: AOAM532WYqRU3l5D2flM+OCBB5s8uqU7lfy1rzQpfD51AteFHn8B38Hk
 aeYqjGiAjtpA8mCTMVwj+HDnwwOsBqKuNgUbihJGf6IPv+iv2Q==
X-Google-Smtp-Source: ABdhPJwHN5bx88ntlJ17iuTqLJYKpca1WeoQQU2rIBTyE8qeYv4RqKlSjbJKclaQQ2ICma+f9anTDwNQIEk9Mboq/uQ=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr8452161oaa.200.1649002951257; Sun, 03
 Apr 2022 09:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220402010559.410834-1-james.hilliard1@gmail.com>
 <34c73050-b148-7887-63ec-56f1e90c854e@mind.be>
 <CADvTj4oJnqUCN2MuTh+vUh8mPcpR7xa2OWX-RBJTA0Xb9CJcDA@mail.gmail.com>
 <7fa02b77-d609-4cd4-5b93-b8f58c50b45f@mind.be>
In-Reply-To: <7fa02b77-d609-4cd4-5b93-b8f58c50b45f@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 3 Apr 2022 10:22:19 -0600
Message-ID: <CADvTj4oj3jHEmspBwsndLmK2GX5QdAmvtiNXnV0vKO-fwkSNBg@mail.gmail.com>
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

Using a fixup avoids extra randconfig regenerations mostly, it's not
strictly needed.

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

Yes, plus I'm using an out of tree utils/genrandconfig override to add
the option.

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

The make dependencies call is after savedefconfig so I think it would need
to be checked due to that.

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
