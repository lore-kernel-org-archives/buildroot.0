Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCEEC433F5
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 18:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B7A7830A7;
	Sat,  2 Apr 2022 18:58:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wlykNoV6NOwf; Sat,  2 Apr 2022 18:58:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CEE182AA7;
	Sat,  2 Apr 2022 18:58:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ACCD21BF2B5
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 18:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94AF941751
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 18:58:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vwkjh5c1CJrd for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 18:58:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA79A41739
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 18:58:45 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-d39f741ba0so6107089fac.13
 for <buildroot@buildroot.org>; Sat, 02 Apr 2022 11:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=674oniFriqIqbFt2gpFP0yJun/Q8PYfu7ptszI00kdI=;
 b=UNG2sLy4b4moc5HP6V+sTb47wTyfCObi88uWIPY+1v54GIrtQrPS+j02lu6t5TW8vo
 EqK2P+Of4cqnZd9Ya5mRjIHzsRhtZFOnbgW/Xkeah1asYIAkDVGru7QRcAtLtkzH0scc
 V53vlHuQk36phKNoJBe7RBbHETPJxm0vU9dM184rF2QjdS67kc7N8Amzu8AsRqFuQdm0
 HeXh4cm9iO1IWH9pTuXOOfCYLviWQrFaged2Nci030UbytqZrOjDOwIj157qEZJj7ANG
 wkCwNwpX9KTjqLWAZ7aGGz5DKvg++KsKAb7nuCMbWNSQLtV7FglHZat3tbnNrnShvGH7
 dhNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=674oniFriqIqbFt2gpFP0yJun/Q8PYfu7ptszI00kdI=;
 b=d0on5M07UxSnVoG5fz9NLNoPSQUwEj81Ndm0pAiccYcTIGzAUQMVZuWbGK0lSQt56w
 yjKFbzlmGk374Pjt14FVhGpeJFjsfr5QPib/Yd3tOJX+eUUfuN3htg/8PfBSwJ0AxXNL
 IHjU0EcJ33oIfQrri5TcmhMH+xe/veW26gboBogvRkB5IlaD64bqW7hHaL1erLROYFYH
 +pE52O22JTYqWgsaSSQRRGgaE7wU6TkxSu/k+2I0dM9+a9kqiWZ0XFG8f8EeHV/DxHpw
 XMTHusWCxwzoqrZbZe86bzSPL46YGijmtZIjkm7s/YFhQH3pX45iQkBJKcWIcZtvz0pJ
 gfrA==
X-Gm-Message-State: AOAM531OM7f7KierhhEim8PxocBBsD6UEEGNmG4jkHK59QdZZKWW3Mig
 /YMuSeUYp4b8rsRrfByZp1DHB1Yl/+n6PKFYyJ/+M07Ii1W72g==
X-Google-Smtp-Source: ABdhPJwbVLr4zmMs9HrLi08ShjpGQKptgSPfpDYkgYdudFBXd8S0lT6sAMJnGNbPMWb8w/BNW6hwUGRujrPYphWtwXc=
X-Received: by 2002:a05:6870:d0c4:b0:dd:c7f6:2d62 with SMTP id
 k4-20020a056870d0c400b000ddc7f62d62mr7634842oaa.99.1648925924790; Sat, 02 Apr
 2022 11:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220402010559.410834-1-james.hilliard1@gmail.com>
 <34c73050-b148-7887-63ec-56f1e90c854e@mind.be>
In-Reply-To: <34c73050-b148-7887-63ec-56f1e90c854e@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 2 Apr 2022 12:58:33 -0600
Message-ID: <CADvTj4oJnqUCN2MuTh+vUh8mPcpR7xa2OWX-RBJTA0Xb9CJcDA@mail.gmail.com>
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

On Sat, Apr 2, 2022 at 10:29 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>   Hi James,
>
> On 02/04/2022 03:05, James Hilliard wrote:
> > Currently we only test a limited set of toolchains that are mostly
> > prebuilt, add a flag to allow using randconfig for randomizing
> > additional toolchain settings instead of randpackageconfig.
>
>   Oooh, it's been on my wishlist for a loooong time to use randconfig instead of
> randpackageconfig in the autobuilders...
>
> >
> > To avoid invalid configs we need to add additional config validation
> > filtering and fixups.
>
>   I guess the following 4 patches are supposed to do that? Please keep them
> together in a series in the future.

I would say those are more bugs that this patch revealed, the config validation
filtering+fixups I'm referring to are just the ones in this patch.

>
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >   utils/genrandconfig | 52 ++++++++++++++++++++++++++++++---------------
> >   1 file changed, 35 insertions(+), 17 deletions(-)
> >
> > diff --git a/utils/genrandconfig b/utils/genrandconfig
> > index 3483d55c14..1e72e14461 100755
> > --- a/utils/genrandconfig
> > +++ b/utils/genrandconfig
> > @@ -315,6 +315,10 @@ def fixup_config(sysinfo, configfile):
> >           configlines.remove('BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE=""\n')
> >           configlines.append('BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="%s"\n' % bootscr)
> >
> > +    if 'BR2_ROOTFS_SKELETON_CUSTOM=y\n' in configlines and \
> > +       'BR2_ROOTFS_SKELETON_CUSTOM_PATH=""\n' in configlines:
> > +        configlines.remove('BR2_ROOTFS_SKELETON_CUSTOM=y\n')
>
>   I don't understand why for this particular one you remove it explicitly, while
> for other cases you rely (I guess) on the dependency check to make sure we get a
> valid config (eventually).

Others were missing the empty string config for matching against so
this approach
didn't seem to work there.

>
>   Also, I think the proper approach for dealing with required string options is
> to give them a default value in support/config-fragments/minimal.config. Unlike
> the toolchainfile, the configlines in minimal.config don't all need to be
> present in the final .config, so we can add stuff there that is only available
> if the appropriate boolean option gets selected randomly.

Well most of these empty strings need to have a config option
removed/filtered IMO.

>
> > +
> >       with open(configfile, "w+") as configf:
> >           configf.writelines(configlines)
> >
> > @@ -331,11 +335,14 @@ def gen_config(args):
> >
> >       sysinfo = SystemInfo()
> >
> > -    # Select a random toolchain configuration
> > -    configs = get_toolchain_configs(args.toolchains_csv, args.buildrootdir)
> > +    if args.toolchains_csv:
> > +        # Select a random toolchain configuration
> > +        configs = get_toolchain_configs(args.toolchains_csv, args.buildrootdir)
> >
> > -    i = randint(0, len(configs) - 1)
> > -    toolchainconfig = configs[i]
> > +        i = randint(0, len(configs) - 1)
> > +        toolchainconfig = configs[i]
> > +    else:
> > +        toolchainconfig = []
>
>   Wow, you lost me here. The commit message says "for randomizing *additional*
> toolchain settings", so I assumed that it would still use a toolchainfile but
> allow randomizing other options.

Well currently toolchains selection is randomized based on the
toolchain csv, this
randomizes additional toolchain settings beyond the toolchain csv.

>
>   And I don't see a problem with that. We just have to first run randconfig, and
> apply the toolchain config after that.

This is deliberately not using the toolchain configs as I'm trying to
test randomizing
toolchains themselves here.

>
>   And I think we can do that unconditionally, even. It would require a little
> bit of testing (basically iterating over all the toolchain configs and checking
> that a valid config can still be generated for each of them) but can be deployed
> pretty much as is I think.

I think this is more an alternative to the toolchain random selection,
this random
method is kinda experimental at the moment IMO so I've kept the codepaths
separate.

>
>   I agree though that it's more work to do that than the current patch, so
> perhaps this is a good first step.

Yeah, best to do this incrementally IMO, since this is revealing issues already
in the autobuilder relating to config validation I'm running this on:
http://autobuild.buildroot.net/?submitter=James+Hilliard+%28asahi-mini%29

Note that this autobuilder is an aarch64(running
https://asahilinux.org/) host so
it doesn't use the prebuilt toolchains.

>
> >
> >       configlines = list(toolchainconfig)
> >
> > @@ -409,19 +416,22 @@ def gen_config(args):
> >           bounded_loop -= 1
> >           subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> >                                  "KCONFIG_PROBABILITY=%d" % randint(1, 20),
> > -                               "randpackageconfig"])
> > +                               "randpackageconfig" if args.toolchains_csv else "randconfig"])
> >
> >           if fixup_config(sysinfo, configfile):
>
>   I think the control flow is easier to follow if we change this into
>
>            if not fixup_config:
>                continue

Changed in v2:
https://patchwork.ozlabs.org/project/buildroot/patch/20220402184251.532287-1-james.hilliard1@gmail.com/

>
> > -            break
> > -
> > -    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> > -                           "olddefconfig"])
> > +            if subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> > +                                      "olddefconfig"]):
> > +                continue
> >
> > -    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> > -                           "savedefconfig"])
> > +            if subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> > +                                      "savedefconfig"]):
>
>   This one should simply never fail, so it should move outside of the loop,
> after checking dependencies.

I just tested that this can fail so I've kept it in the loop for now.

>
>
>   Regards,
>   Arnout
>
>
> > +                continue
> >
> > -    return subprocess.call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> > -                            "dependencies"])
> > +            if subprocess.call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> > +                                "dependencies"]):
> > +                continue
> > +            break
> > +    return 0
> >
> >
> >   if __name__ == '__main__':
> > @@ -433,10 +443,18 @@ if __name__ == '__main__':
> >       parser.add_argument("--buildrootdir", "-b",
> >                           help="Buildroot directory (relative to current directory)",
> >                           type=str, default='.')
> > -    parser.add_argument("--toolchains-csv",
> > -                        help="Path of the toolchain configuration file",
> > -                        type=str,
> > -                        default="support/config-fragments/autobuild/toolchain-configs.csv")
> > +
> > +    toolchains_csv = parser.add_mutually_exclusive_group(required=False)
> > +    toolchains_csv.add_argument("--toolchains-csv",
> > +                                dest="toolchains_csv",
> > +                                help="Path of the toolchain configuration file",
> > +                                type=str)
> > +    toolchains_csv.add_argument("--no-toolchains-csv",
> > +                                dest="toolchains_csv",
> > +                                help="Generate random toolchain configuration",
> > +                                action='store_false')
> > +    parser.set_defaults(toolchains_csv="support/config-fragments/autobuild/toolchain-configs.csv")
> > +
> >       args = parser.parse_args()
> >
> >       # We need the absolute path to use with O=, because the relative
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
