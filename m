Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89851C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 21:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C1B640BFA;
	Wed, 13 Apr 2022 21:29:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OKxVFdjoeNNE; Wed, 13 Apr 2022 21:29:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E5FE403AA;
	Wed, 13 Apr 2022 21:29:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF6F11BF3B9
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 21:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BCC0403AA
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 21:29:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4GQLWkTNOTCA for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 21:29:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2FECF401A0
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 21:29:36 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id q189so3430945oia.9
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 14:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=neAg1a/UN1f0rs5cIDH80+tS1oYjeHqAXbt3V72dJWE=;
 b=AuZ9rRSx0HE7Xxij7nOloDLX8lTFenaqEL/lh806/w17Cfw9uBCGwsr8ooB59bvx83
 xsiS4wEg6C/BbLhPpwySXJ64NirWAymtbHdo6vP/VeQ7JAON0kbeK/eSfePgkKgAV1tt
 7XFWBBwIxuM74jCd6AnSiR+gPInLRSEMTE6jQbJcejAy/TMj506EOzziAyRJ3CASQ0IA
 lxtcPEvYNdDC5WN2U1NDYD8Mu8bYnA0G3SU1Py+y50d1oOVUZQjc5/wSt42xNaaKAtWM
 F2KSHQhhnMJKTEtssg5DUJMuI85juf0zSt678tpPPaa4RXTWam3qlTfw3xNsCg3AgH66
 bpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=neAg1a/UN1f0rs5cIDH80+tS1oYjeHqAXbt3V72dJWE=;
 b=iDe6Ni6YufIwNebTD0Wkovhucfzy2lRH/HJmGMgwjJEwHafhX/p2mIkzoJYVcy0ELr
 Z6nIHQzDGDtBnM3Ye2THBm4X7iLpmIV8A5KN1x8hUcCxeRiLirZGywg/i0LkX7CpJhBz
 6YYDsdXq8dPqy/VH2Tc603quCL1YEQh2iAT2Yy6m7734M/PtwsMDWx5E9+PFBjZXLmnl
 GwEefU8vVI7/K+ozYBrBrCJ9ZZgFokBGPTpJzOOoW2PByG4jMCa0N6w7Uz5+9YlqZX/v
 VcV8NZOh02f3kW2CMJzOAyxoFH6qUB6VFmEKULFnjWyCDUzMRWC7j2QKffelacAwBdj7
 e9TQ==
X-Gm-Message-State: AOAM530pVjRycxbFq8ucMBx3VtiBTrK/lBTKc6AJA0LAprfnqJdu8j0O
 CeW7sQpJVmCpJqrCHcIKSqPCfuvb1NQsZNrPCbEkvvgqQGw=
X-Google-Smtp-Source: ABdhPJxN1DgJdJb6tNw4dM87iQXuK0OQShQ0SEUPnnf4wJZTiK4H5eFSroEROPCujeS87dR4A5tgYVOvM5YfBYRJfpo=
X-Received: by 2002:aca:3d88:0:b0:321:141:ce0b with SMTP id
 k130-20020aca3d88000000b003210141ce0bmr167654oia.200.1649885374958; Wed, 13
 Apr 2022 14:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220410043227.602485-1-james.hilliard1@gmail.com>
 <20220410043227.602485-2-james.hilliard1@gmail.com>
 <20220413230407.6c747891@windsurf>
In-Reply-To: <20220413230407.6c747891@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 13 Apr 2022 15:29:23 -0600
Message-ID: <CADvTj4oYoVTjQWjTTcTsaEHjZ57r17cfBmG0eGfv7mXSRTuyqw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v2 2/2] scripts/autobuild-run: add
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

On Wed, Apr 13, 2022 at 3:04 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Sat,  9 Apr 2022 22:32:27 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Since docopt is unmaintained and less flexible than argparse lets
> > drop it and migrate to argparse.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> Thanks! I think it would have been great to split the conversion from
> docopt to argparse from the addition of no-toolchains-csv. Regardless
> of that, I wanted to apply, but spotted something incorrect in the help
> text, showing that the argparse logic is probably wrong. Look:
>
>   --toolchains-csv TOOLCHAINS_CSV
>                         Toolchain configuration file (default: support/config-fragments/autobuild/toolchain-
>                         configs.csv)
>   --no-toolchains-csv   Generate random toolchain configuration (default: support/config-
>                         fragments/autobuild/toolchain-configs.csv)
>
> See how --no-toolchains-csv option has a default value... that doesn't
> make any sense?

It's due to both those options mapping to the same variable.
>
> > +    toolchains_csv = parser.add_mutually_exclusive_group(required=False)
> > +    toolchains_csv.add_argument("--toolchains-csv",
> > +                                dest="toolchains_csv",
> > +                                help="Toolchain configuration file",
> > +                                type=pathlib.Path)
> > +    toolchains_csv.add_argument("--no-toolchains-csv",
> > +                                dest="toolchains_csv",
> > +                                help="Generate random toolchain configuration",
> > +                                action='store_false')
> > +    parser.set_defaults(toolchains_csv=pathlib.Path("support/config-fragments/autobuild/toolchain-configs.csv"))
>
> I suppose this is what makes it have this incorrect "default value".

Yeah, should be fixed here:
https://patchwork.ozlabs.org/project/buildroot/patch/20220413212745.480101-1-james.hilliard1@gmail.com/

>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
