Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D81ECAAD2
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 16:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E2EF41A5F;
	Fri, 26 Aug 2022 16:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E2EF41A5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZqsLl0ZKhNv1; Fri, 26 Aug 2022 16:31:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF8DA41A5D;
	Fri, 26 Aug 2022 16:31:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF8DA41A5D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 40C611BF2C7
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 16:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 189AF404F8
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 16:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 189AF404F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G5UKT_UhNMOk for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 16:31:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE839403F9
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE839403F9
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 16:31:13 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 s31-20020a17090a2f2200b001faaf9d92easo8557169pjd.3
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 09:31:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=z55badnvcGf+60rADiHESaz2+kPSvlxfxbe9muAvKao=;
 b=ATXmYPSDeVyzTSFrPuhwmZpaEXO8X1HkQjgXNxSztyk9Zo2C2VgEgZRHGcQw2vynC/
 kaBM+xZDzExYL3htBL6LHGuZDb67tqn5wWTBw9wMZhKJZKKhNhrb/tV8gMPiNNgAnnnh
 Eu4orJ98ZRfSNh4ic+emPNeggUHXQMH9e2pS9nD9P0gqz3XJ14Xaa0FD9pV8n/32jmGB
 vGhScvhHw8YfVAmCqyzB5FVbOPddYD63vrB8khfIgRMHmLqKMWn7cGrvehDgbATdOUPa
 X81WW3QyYvZ+X/iSL7RHNsq5um6pwMRQu0Zz74p4+buNf4YGzhIwY2+S1bX3dh4IOkwQ
 WzkA==
X-Gm-Message-State: ACgBeo3Pmyw8Gjepl6qZywaw9G+/IkCbn21/TeI2k2QciTyGpmbK0+KX
 9o1s2BEvI/Extoy4I6RjqjEmRgtu7GcdO2v6RGHA/1cKC1VsGA==
X-Google-Smtp-Source: AA6agR6Go8WJ8rW3X632FLkkZA6RC4LXcAZWUqjuWzVhoCiNfNvd02mKY05qgBDTpYUsdLwiM9PBzDMWIco/LvGIYow=
X-Received: by 2002:a17:902:6b82:b0:16d:d268:3842 with SMTP id
 p2-20020a1709026b8200b0016dd2683842mr4403851plk.16.1661531473103; Fri, 26 Aug
 2022 09:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAM6O0Zgc_jfn+m1ZhRByLQ4QDDAYpAOQv-9aDRgruSYKWV5wUA@mail.gmail.com>
 <20220808122020.0c1ec66a@windsurf>
 <CAM6O0ZjLizEsUWZr106T6+WowWdkqE7k_a1bCaPeAVbPScZ6Ag@mail.gmail.com>
 <ea0d3b02-e5e1-9f4d-0d3a-a498f5d184f0@mind.be>
In-Reply-To: <ea0d3b02-e5e1-9f4d-0d3a-a498f5d184f0@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 26 Aug 2022 10:31:00 -0600
Message-ID: <CADvTj4rFJZ=GrYoR=16WN58gr2EJEwH+YL5-TRCMHB1cdhxYgg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=z55badnvcGf+60rADiHESaz2+kPSvlxfxbe9muAvKao=;
 b=PiF+05QYFTkB0MoXXsrrPVhE8zRMU0U2IG1Zyv91e1+uqMSk08BdFXgeI4qstoxiKO
 dzp6qPSUDukCAfKw7u+EysodVZ5EHF/1kjoN7n3mdgdSbM9iKAQfYwtVNG/H5H2vs8B3
 gERZHwYAOjOVPCQKO6kEO00sx/j+HG0VyxxSDqlkX6caOrZJjluCHoXvn29rdE7cuK5n
 NKz4GxSxhRs2FWQArDRelTRH8kiS6w6CzLiLEEyfSPyIQLKHPBraeFZHeKAAB0aOGD8u
 i6RzrC/rhXjFpbrbSsxy+RIkqTcOe/FeiXIX1wcboS10KWiZiiEB5U7wIg3CoPgeGdh0
 ezdg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PiF+05QY
Subject: Re: [Buildroot] Python pyc only and problem with scripts
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
Cc: Federico Pellegrin <fede@evolware.org>,
 Marcus Hoffmann <marcus.hoffmann@othermo.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Aug 8, 2022 at 2:48 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>   Hi Federico, all,
>
>   [Please don't top-post, but reply inline like I do below. Note that this
> requires configuring your mailer to quote replies properly.]
>
>
> On 08/08/2022 15:19, Federico Pellegrin wrote:
> >
> > Hi Thomas, Marcus,
> > Many thanks for your feedback and ideas!
> >
> > I've looked a bit more now after your feedback online and indeed found that
> > likely it's mostly rt-tests (or other packages with a similar behaviour, as
> > mentioned by Marcus) that may be wrong-doing.
>
>   Well, rt-tests is certainly not the only package that does that - I've used
> other (proprietary) software that does similar things.
>
>
> > Indeed according to:
> > https://docs.python.org/3/install/#alternate-installation-unix-the-prefix-scheme
> > <https://docs.python.org/3/install/#alternate-installation-unix-the-prefix-scheme>
> > my understanding would be that they should indeed go to |/prefix//bin and not
> > with the modules.|
> > |This link
> > https://python-packaging.readthedocs.io/en/latest/command-line-scripts.html#the-scripts-keyword-argument
> > <https://python-packaging.readthedocs.io/en/latest/command-line-scripts.html#the-scripts-keyword-argument>
> > also somehow confirms it I believe as also setuptools assume the possibility to
> > deliver them.
>
>   I believe the proper way to install is to have a small script in /usr/bin/
> that simply imports the full script (relying on PYTHONPATH) and calls its main
> function.

That's basically how python package entry points work:
https://packaging.python.org/en/latest/specifications/entry-points/

>
> > So after all if rt-tests (or similar) would follow that, Buildroot py->pyc
> > should be safe, assuming that those script will not be converted.
>
>   Given that rt-tests is not alone, I think it would be good if we could fix the
> issue on Buildroot side.

The bug is in rt-tests, it's installing a script to site-packages when it should
just be installing it like we would for a shell script(as the script
isn't a python
package but rather just a standalone python script).

>
>   I think the problem can be diagnosed when we encounter a .py file that is
> executable - normally they shouldn't be. We could simply leave those alone
> instead of removing them. Alternatively, perhaps it's possible to replace them
> with a symlink to the pyc file - although that may break things in horrible ways
> as well.

I don't think it's normal to execute .py files directly from
site-packages, packages
can provide entry points if needed which will handle both .py and .pyc
files without
issues.

>
>   In either case, it's nice we have this rt-tests failure, because it means we
> can have a runtime test for it!
>
>   Regards,
>   Arnout
>
>
> > |
> > |
> > |
> > |I'll try to contact the rt-tests team and see what they think of this and come
> > back with a patch for Buildroot!
> > |
> > |
> > |
> > |Cheers,|
> > |Federico
> > |
> > |
> > |
> >
> > Il giorno lun 8 ago 2022 alle ore 12:20 Thomas Petazzoni
> > <thomas.petazzoni@bootlin.com <mailto:thomas.petazzoni@bootlin.com>> ha scritto:
> >
> >     Hello Federico,
> >
> >     On Mon, 8 Aug 2022 09:40:02 +0200
> >     Federico Pellegrin <fede@evolware.org <mailto:fede@evolware.org>> wrote:
> >
> >      > I've found a minor problem related to the rt-tests package, but that maybe
> >      > is slightly more generic and wanted to report and in case understand which
> >      > approach would be best to fix it (and contribute a patch then if possible).
> >      >
> >      > The specific problem: rt-tests, besides a few compiled executables,
> >      > installs also two tools which are written in Python, namely hwlatdetect and
> >      > get_cyclictest_snapshot. These are Python scripts which get installed in
> >      > the PYLIB and then a symbolic link is done from /usr/bin to them, so ie we
> >      > have: /usr/bin/hwlatdetect ->
> >      > /usr/lib/python3.10/site-packages//hwlatdetect.py
> >      >
> >      > Needless to say that once the pycompile.py script is run and original .py
> >      > files are removed, of course in the "PYC only" setup (which is the
> >      > default), then the link is broken and it will not work.
> >      > Additionally that pyc files will not work for scripts like that, so just
> >      > somehow fixing the link mentioned above would anyhow not work, as you need
> >      > to execute them eventually by explicitly naming the interpreter.
> >      >
> >      > I could imagine that we could have some similar other cases when we are
> >      > installing Python scripts directly executed in PYLIB and not modules. But
> >      > I'm not sure that installing the scripts there is a good idea as well,
> >      > comparing with other distros that doesn't seem to be the case.
> >      > So maybe the problem is really in rt-tests after all and the location those
> >      > scripts get installed and I may just fix it that way (and contact upstream)?
> >      > Otherwise should it be more generic maybe could make sense to have a
> >      > facility to list some files that should not be converted to PYC?
> >
> >     Thanks for your bug report.
> >
> >     My initial gut feeling would indeed be that it is strange to install
> >     scripts in /usr/lib/python, and they should be installed in /usr/bin
> >     instead, so that /usr/lib/python is only for Python modules that can be
> >     byte-compiled. However, I am not an expert at all in terms of Python
> >     best practices and latest standards.
> >
> >     But from a Buildroot perspective, it really makes a lot of sense to be
> >     able to do the byte-compilation at build-time (to save on startup time)
> >     and drop the .py files (to save on filesystem footprint).
> >
> >     For the rt-tests case, I would therefore suggest to move those scripts
> >     to /usr/bin.
> >
> >     Of course, if that problem shows up in more packages, then yes we could
> >     think of a mechanism for packages to declare a number of py files that
> >     should not be byte-compiled, and that should be preserved on the target.
> >
> >     Best regards,
> >
> >     Thomas
> >     --
> >     Thomas Petazzoni, co-owner and CEO, Bootlin
> >     Embedded Linux and Kernel engineering and training
> >     https://bootlin.com <https://bootlin.com>
> >
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
