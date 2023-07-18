Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6B7EB64DA
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 08:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED19260AD1;
	Tue, 18 Jul 2023 08:18:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED19260AD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EtElbu744w0m; Tue, 18 Jul 2023 08:18:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3975D60AEA;
	Tue, 18 Jul 2023 08:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3975D60AEA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4E50C1BF271
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 08:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2572B60AEA
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 08:18:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2572B60AEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AY_h8ZHRyHvP for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 08:18:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0F8860AD1
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C0F8860AD1
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 08:18:10 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fbea14706eso49447545e9.2
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 01:18:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689668289; x=1692260289;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CZ62LBPRBFuzCWg+aqSIdvBdXTLDdkYbAhMTGEhfngU=;
 b=T1CrrzqzSbptOUFvI9cbEbIabBwrPC4ApyL4+RP7HLxNVpf28c2pr//NYJNcInHeKL
 n1CHS3A/5UgvtsHQUEIw2IKTKJbxTdidYxxyqoZauPwfdmiGnjNBWXbl4Iqk/3eu6Uir
 9pdNckXywwa6GFGDYFIh6/rFA6AnJmhdHkLOEjHuq70KTpWjRno24XAq+nRC1WoJn/Bk
 VwnnR5I/ldjdxIJCI2Vi/vXkQhmEcNG+WjdcIsh72v0gkoAOq4OjSipzraaaimB7Gu76
 yRVR2Y4YIMOrvAmxPRyVnqxeS+vgt9JMYV4fSr8SZUNBlJTNlDycexrMGxGerNVpUN+N
 dxLQ==
X-Gm-Message-State: ABy/qLZGbgfr9fkivWqCh9mL0eTZQx087vTmH/wdIu4nJIPCmCcgOYzH
 cx0nTDNA3PiOfHZax2EJGcHS+Pm9Nypr+8hp6lI=
X-Google-Smtp-Source: APBJJlHx1HVRisllLukSjf5c5YAQjix4gIcz3iZcJfpy+iHro8WoRd2XYYqWCs6u0oY6/+xpPM8xFz3WbGC2P3s0jUk=
X-Received: by 2002:a1c:7c08:0:b0:3fb:e356:b60d with SMTP id
 x8-20020a1c7c08000000b003fbe356b60dmr1298048wmc.38.1689668288356; Tue, 18 Jul
 2023 01:18:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAOLWrZ-zYdgpvg-UUrHb8-Y+dfSauONGxf+Uynjj0d7XQ2HFYQ@mail.gmail.com>
 <43b3c8f2-17f0-fe13-5421-49abb44f2481@mind.be>
 <CAOLWrZ-2fNdKRwKzgeENfD=-x7CWbUwxE-1M3cnMqPapHUiEMg@mail.gmail.com>
 <CADvTj4oJM5=Ng0G6TMYpBk=7_TBX24Y-_CgASeMMxXzgENF9dw@mail.gmail.com>
In-Reply-To: <CADvTj4oJM5=Ng0G6TMYpBk=7_TBX24Y-_CgASeMMxXzgENF9dw@mail.gmail.com>
From: Andreas <andreasembbuild@gmail.com>
Date: Tue, 18 Jul 2023 10:17:56 +0200
Message-ID: <CAOLWrZ8m1eM0K+5su-Skgfia-TeD1d9c5q20+_zxJ0E6wWKhTg@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689668289; x=1692260289;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CZ62LBPRBFuzCWg+aqSIdvBdXTLDdkYbAhMTGEhfngU=;
 b=P7achNDcLv8hQmiFibMF+DnDKPHABNAVdji3jkdyNWBjOupKTcU6Yo5ZRzdscLtVjP
 OdpaE57B3S0crk6gioMR/Q8KUBaoKcauVueLMQigk8cpOhV694JP/QjuewG2iuXbUA9v
 I16vHFGRHpXQa5OKjbDtmWib6kyFOXy8EQmt6vfonThnUKCVjlQlGmRKiNUUTACYT4XW
 fKqHim5CDoHuSlIvUBh2F9PYKoGKD1wUPIqxniJv4IT5FUinFNgrQHA3+xKOXoGznMWM
 SA6q4sNStRbL/7/6Bt06hC5zFh/n0JqksDhTKy6q0G+isKz+J4/vWf02sUuPVjXGHgo1
 uzbw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=P7achNDc
Subject: Re: [Buildroot] Missing dependencies
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
Content-Type: multipart/mixed; boundary="===============2981505881962978365=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2981505881962978365==
Content-Type: multipart/alternative; boundary="0000000000001da62e0600be8ee9"

--0000000000001da62e0600be8ee9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear James,

Am Di., 18. Juli 2023 um 01:42 Uhr schrieb James Hilliard <
james.hilliard1@gmail.com>:

> On Mon, Jul 17, 2023 at 9:48=E2=80=AFAM Andreas <andreasembbuild@gmail.co=
m> wrote:
> >
> > Hi Arnout,
> >
> > Thanks for the quick response. I am indeed still on python 3.10.6 here.
> I think upgrading might be a major exercise. It requires more than just
> changing the version in packages/python3.mk doesn't it? Do I need to have
> the same python version also on the host system? I am currently running
> buildroot on a Ubuntu 22.04 VM.
>
> You should just update buildroot itself, newer versions use python
> 3.11 so updating
> buildroot will pull that in along with any required changes. What
> version of buildroot
> are you actually using right now? The installed version of python on
> your build host
> system shouldn't matter as buildroot will build a separate
> host-python3 for cross
> compilation.
>

I migrated a big existing system from buildroot 2018.11.1 to 2022.02.4 to
have a modern python (3.10 instead of 3.7) for new, additional applications
that requires 3.10+. I can try to jump to sth more recent I guess 2023.x
that has python 3.11. Here I am just worried that some packages that I need
are not yet fully compatible or maybe buggy.

Ok thanks for the info that is good news.



> >
> >
> > Am Mo., 17. Juli 2023 um 17:19 Uhr schrieb Arnout Vandecappelle <
> arnout@mind.be>:
> >>
> >>
> >>
> >> On 17/07/2023 16:10, Andreas wrote:
> >> > Hi,
> >> >
> >> > I am new to buildroot and I am trying to build the package
> >> > python-hatchling-1.18.0. However it fails with the following message=
:
> >> >
> >> > * Getting dependencies for wheel...
> >> >
> >> > ERROR Missing dependencies:
> >> > tomli>=3D1.2.2; python_version < '3.11'
> >>
> >>   That's really weird... This line means that it depends on tomli, but
> only for
> >> Python-3.10 or lower. Since we're using Python 3.11.4, this dependency
> shouldn't
> >> trigger at all... You're not using an old Buildroot version that still
> uses
> >> 3.10, are you?
> >>
> >>
> >> > make: *** [package/pkg-generic.mk:293 <http://pkg-generic.mk:293>:
> >> > /buildroot/output/build/python-hatchling-1.18.0/.stamp_built] Error =
1
> >> >
> >> > The python-hatchling.mk <http://python-hatchling.mk> file looks as
> follows:
> >> >
> #########################################################################=
#######
> >> > #
> >> > # python-hatchling
> >> > #
> >> >
> #########################################################################=
#######
> >> >
> >> > PYTHON_HATCHLING_VERSION =3D 1.18.0
> >>
> >>   Erm, python-hatchling was added to Buildroot in commit
> >> 626c5bedaa7e1461dd3747562b9c04dd40713c83, in 2022.11. Have you tried
> just
> >> updating the existing package (and sending the patch upstream to us, o=
f
> course)?
> >>
> >>   We only have a host package for it, because it's a pep517 so normall=
y
> not
> >> useful on the target. Why do you need the target package?
> >
> >
> > Let me double check but you might be correct that I do not need it on
> the target.
>
> Yeah, it doesn't really make sense to have a target python-hatchling
> package in
> buildroot from my understanding.
>
> Why are you trying to add this package? Is it a dependency for a
> different package
> you are trying to add or something?
>

Why I am trying to add this package is because I need ipykernel installed.
Checking the dependencies on my system gave me that tree:

hatchling=3D=3D1.12.2
=E2=94=9C=E2=94=80=E2=94=80 editables [required: >=3D0.3, installed: 0.4]
=E2=94=9C=E2=94=80=E2=94=80 packaging [required: >=3D21.3, installed: 21.3]
=E2=94=9C=E2=94=80=E2=94=80 pathspec [required: >=3D0.10.1, installed: 0.11=
.1]
=E2=94=9C=E2=94=80=E2=94=80 pluggy [required: >=3D1.0.0, installed: 1.2.0]
=E2=94=94=E2=94=80=E2=94=80 tomli [required: >=3D1.2.2, installed: 2.0.1]

=E2=94=9C=E2=94=80=E2=94=80 ipykernel [required: Any, installed: 6.24.0]
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 comm [required: >=3D0.1.1, installe=
d: 0.1.3]
=E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 traitlets [required: >=
=3D5.3, installed: 5.9.0]
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 debugpy [required: >=3D1.6.5, insta=
lled: 1.6.7]
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 ipython [required: >=3D7.23.1, inst=
alled: 8.14.0]
=E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 backcall [required: Any=
, installed: 0.2.0]
=E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 decorator [required: An=
y, installed: 5.1.1]
=E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 jedi [required: >=3D0.1=
6, installed: 0.18.2]
=E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 parso [requ=
ired: >=3D0.8.0,<0.9.0, installed: 0.8.3]
=E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 matplotlib-inline [requ=
ired: Any, installed: 0.1.6]
=E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 traitlets [=
required: Any, installed: 5.9.0]
=E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 pexpect [required: >4.3=
, installed: 4.8.0]
=E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 pickleshare [required: =
Any, installed: 0.7.5]
=E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 prompt-toolkit [require=
d: >=3D3.0.30,<3.1.0,!=3D3.0.37, installed:
3.0.39]
=E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 wcwidth [re=
quired: Any, installed: 0.2.6]
=E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 Pygments [required: >=
=3D2.4.0, installed: 2.15.1]
=E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 stack-data [required: A=
ny, installed: 0.6.2]
=E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 asttokens [=
required: >=3D2.1.0, installed: 2.2.1]
=E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80=
 six [required: Any, installed: 1.16.0]
=E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 executing [=
required: >=3D1.2.0, installed: 1.2.0]
=E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 pure-eval [=
required: Any, installed: 0.2.2]
=E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 traitlets [required: >=
=3D5, installed: 5.9.0]
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 jupyter-client [required: >=3D6.1.1=
2, installed: 8.3.0]
=E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 jupyter-core [required:=
 >=3D4.12,!=3D5.0.*, installed: 5.3.1]
=E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 platformdir=
s [required: >=3D2.5, installed: 3.8.1]
=E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 traitlets [=
required: >=3D5.3, installed: 5.9.0]
=E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 python-dateutil [requir=
ed: >=3D2.8.2, installed: 2.8.2]
=E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 six [requir=
ed: >=3D1.5, installed: 1.16.0]
=E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 pyzmq [required: >=3D23=
.0, installed: 25.1.0]
=E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 tornado [required: >=3D=
6.2, installed: 6.3.2]
=E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 traitlets [required: >=
=3D5.3, installed: 5.9.0]
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 jupyter-core [required: >=3D4.12,!=
=3D5.0.*, installed: 5.3.1]
=E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 platformdirs [required:=
 >=3D2.5, installed: 3.8.1]
=E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 traitlets [required: >=
=3D5.3, installed: 5.9.0]
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 matplotlib-inline [required: >=3D0.=
1, installed: 0.1.6]
=E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 traitlets [required: An=
y, installed: 5.9.0]
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 nest-asyncio [required: Any, instal=
led: 1.5.6]
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 packaging [required: Any, installed=
: 21.3]
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 psutil [required: Any, installed: 5=
.9.5]
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 pyzmq [required: >=3D20, installed:=
 25.1.0]
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 tornado [required: >=3D6.1, install=
ed: 6.3.2]
=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 traitlets [required: >=3D5.4.0, ins=
talled: 5.9.0]

Actually I am also not sure why the system is asking me for hatchling as
the package itself does not directly depend on it. However, for sure I need
packaging and pyparsing. But maybe the problem is that I made a mistake and
try to build both on the host and target system and what I actually need to
do is use the host-python-hatchling for the PYTHON_*_DEPENDENCIES =3D
host-pyhton-hatchling  instead of the target one.


> >>
> >>
> >> > PYTHON_HATCHLING_SOURCE =3D hatchling-$(PYTHON_HATCHLING_VERSION).ta=
r.gz
> >> > PYTHON_HATCHLING_SITE =3D
> >> >
> https://files.pythonhosted.org/packages/e3/57/87da2c5adc173950ebe9f1acce4=
d5f2cd0a960783992fd4879a899a0b637
> >> > PYTHON_HATCHLING_SETUP_TYPE =3D pep517
> >> > PYTHON_HATCHLING_LICENSE =3D MIT
> >> > PYTHON_HATCHLING_LICENSE_FILES =3D LICENSE.txt
> >> >
> >> > PYTHON_HATCHLING_DEPENDENCIES =3D \
> >> > python-tomli \
> >>
> >>   I think the problem is that pep517 checks for the presence of tomli
> in the
> >> _host_ directory. So you'd need to add a dependency on
> host-python-tomli here.
> >> James is more aware of these things so I put him in Cc.
> >
> >
> > I will first try to add the host dependency as you suggested below and
> see what happens.
>
> I thought our pep517 infrastructure prior to updating to python 3.11 woul=
d
> pull
> in host-python-tomli automatically(due to it being a host-python-flit
> dependency
> prior to python 3.11). I'm not sure how you could be getting a missing
> tomli error
> like this in the first place as we didn't remove host-python-tomli
> from our pep517
> infrastructure dependency tree prior to python being updated to version
> 3.11.
>
>
I may have missed some files during the migration that is now causing the
problem. Which are the folders in buildroot that deal with the python
infrastructure I should check?


> >
> >>
> >>
> >> > python-editables \
> >> > python-packaging \
> >> > python-pathspec \
> >> > python-pluggy \
> >> > python-trove-classifiers
> >> > HOST_PYTHON_HATCHLING_DEPENDENCIES =3D \
> >> > host-python-tomli \
> >> > host-python-editables \
> >> > host-python-packaging \
> >> > host-python-pathspec \
> >> > host-python-pluggy \
> >> > host-python-trove-classifiers
> >> >
> >> > $(eval $(python-package))
> >> > $(eval $(host-python-package))
> >> >
> >> > I do have a python-tomli.mk <http://python-tomli.mk> file therefore
> I am
> >> > confused why I am seeing this error. If I remove the tomli dependenc=
y
> from the
> >> > pyproject.toml file in hatchling (in
> output/build/python-hatchling-1.18.0)
> >> > manually it continoues the build.
> >> >
> >> > dependencies =3D [
> >> >    "editables>=3D0.3",
> >> >    "packaging>=3D21.3",
> >> >    "pathspec>=3D0.10.1",
> >> >    "pluggy>=3D1.0.0",
> >> >    "tomli>=3D1.2.2; python_version < '3.11'",
> >> >    "trove-classifiers",
> >> > ]
> >> >
> >> > My impression is that my current buildroot setup has a problem to
> properly
> >> > interpret the line ` "tomli>=3D1.2.2; python_version < '3.11'"` mayb=
e
> because of
> >> > an outdated package that I am not aware of.
> >>
> >>   I think this way of expressing version-dependent dependencies is
> already
> >> pretty old, and certainly predates the pep517 infrastructure in
> Buildroot, so
> >> I'd be surprised if this were the case.
> >
> >
> > Well that is how the dependency is defined in hatchling defined it (see
> here https://github.com/pypa/hatch/blob/master/backend/pyproject.toml)
>
> Yeah, it should work fine, we didn't have to add a host-python-tomli
> dependency
> when I added host-python-hatchling.
>
>
> https://github.com/buildroot/buildroot/commit/626c5bedaa7e1461dd3747562b9=
c04dd40713c83


Thanks I will checkout this link.
FYA prior adding the ipykernel package everything built just fine telling
me that my migration should be OK and its just these packages that
challenge me.

Regrads,
Andreas


>
> >
> >>
> >>   Regards,
> >>   Arnout
> >>
> >> > Any idea how to address this issue
> >> > and how to debug such an error in buildroot in future? I already
> checked the
> >> > manual, especially the section for python packages.
> >> >
> >> > Regards,
> >> > Andreas
> >> >
> >> >
> >> > _______________________________________________
> >> > buildroot mailing list
> >> > buildroot@buildroot.org
> >> > https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000001da62e0600be8ee9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Dear James,</div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">Am Di., 18. Juli 2023 um 01:42=
=C2=A0Uhr schrieb James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmai=
l.com">james.hilliard1@gmail.com</a>&gt;:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On Mon, Jul 17, 2023 at 9:48=E2=80=AFAM Andreas &=
lt;<a href=3D"mailto:andreasembbuild@gmail.com" target=3D"_blank">andreasem=
bbuild@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Arnout,<br>
&gt;<br>
&gt; Thanks for the quick response. I am indeed still on python 3.10.6 here=
. I think upgrading might be a major exercise. It requires more than just c=
hanging the version in packages/<a href=3D"http://python3.mk" rel=3D"norefe=
rrer" target=3D"_blank">python3.mk</a> doesn&#39;t it? Do I need to have th=
e same python version also on the host system? I am currently running build=
root on a Ubuntu 22.04 VM.<br>
<br>
You should just update buildroot itself, newer versions use python<br>
3.11 so updating<br>
buildroot will pull that in along with any required changes. What<br>
version of buildroot<br>
are you actually using right now? The installed version of python on<br>
your build host<br>
system shouldn&#39;t matter as buildroot will build a separate<br>
host-python3 for cross<br>
compilation.<br></blockquote><div><br></div><div>I migrated a big existing =
system from buildroot 2018.11.1 to 2022.02.4 to have a modern python (3.10 =
instead of 3.7) for new, additional applications that requires 3.10+. I can=
 try to jump to sth more recent I guess 2023.x that has python 3.11. Here I=
 am just worried that some packages that I need are not yet fully compatibl=
e or maybe buggy.=C2=A0</div><div><br></div><div>Ok thanks for the info tha=
t is good news.</div><div><br></div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
&gt;<br>
&gt;<br>
&gt; Am Mo., 17. Juli 2023 um 17:19 Uhr schrieb Arnout Vandecappelle &lt;<a=
 href=3D"mailto:arnout@mind.be" target=3D"_blank">arnout@mind.be</a>&gt;:<b=
r>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On 17/07/2023 16:10, Andreas wrote:<br>
&gt;&gt; &gt; Hi,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I am new to buildroot and I am trying to build the package<br=
>
&gt;&gt; &gt; python-hatchling-1.18.0. However it fails with the following =
message:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; * Getting dependencies for wheel...<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; ERROR Missing dependencies:<br>
&gt;&gt; &gt; tomli&gt;=3D1.2.2; python_version &lt; &#39;3.11&#39;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0That&#39;s really weird... This line means that it dep=
ends on tomli, but only for<br>
&gt;&gt; Python-3.10 or lower. Since we&#39;re using Python 3.11.4, this de=
pendency shouldn&#39;t<br>
&gt;&gt; trigger at all... You&#39;re not using an old Buildroot version th=
at still uses<br>
&gt;&gt; 3.10, are you?<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt; make: *** [package/<a href=3D"http://pkg-generic.mk:293" rel=
=3D"noreferrer" target=3D"_blank">pkg-generic.mk:293</a> &lt;<a href=3D"htt=
p://pkg-generic.mk:293" rel=3D"noreferrer" target=3D"_blank">http://pkg-gen=
eric.mk:293</a>&gt;:<br>
&gt;&gt; &gt; /buildroot/output/build/python-hatchling-1.18.0/.stamp_built]=
 Error 1<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The <a href=3D"http://python-hatchling.mk" rel=3D"noreferrer"=
 target=3D"_blank">python-hatchling.mk</a> &lt;<a href=3D"http://python-hat=
chling.mk" rel=3D"noreferrer" target=3D"_blank">http://python-hatchling.mk<=
/a>&gt; file looks as follows:<br>
&gt;&gt; &gt; #############################################################=
###################<br>
&gt;&gt; &gt; #<br>
&gt;&gt; &gt; # python-hatchling<br>
&gt;&gt; &gt; #<br>
&gt;&gt; &gt; #############################################################=
###################<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; PYTHON_HATCHLING_VERSION =3D 1.18.0<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0Erm, python-hatchling was added to Buildroot in commit=
<br>
&gt;&gt; 626c5bedaa7e1461dd3747562b9c04dd40713c83, in 2022.11. Have you tri=
ed just<br>
&gt;&gt; updating the existing package (and sending the patch upstream to u=
s, of course)?<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0We only have a host package for it, because it&#39;s a=
 pep517 so normally not<br>
&gt;&gt; useful on the target. Why do you need the target package?<br>
&gt;<br>
&gt;<br>
&gt; Let me double check but you might be correct that I do not need it on =
the target.<br>
<br>
Yeah, it doesn&#39;t really make sense to have a target python-hatchling pa=
ckage in<br>
buildroot from my understanding.<br>
<br>
Why are you trying to add this package? Is it a dependency for a<br>
different package<br>
you are trying to add or something?<br></blockquote><div><br></div><div>Why=
 I am trying to add this package is because I need ipykernel installed. Che=
cking the dependencies on my system gave me that tree:</div><div><br></div>=
<div>hatchling=3D=3D1.12.2<br>=E2=94=9C=E2=94=80=E2=94=80 editables [requir=
ed: &gt;=3D0.3, installed: 0.4]<br>=E2=94=9C=E2=94=80=E2=94=80 packaging [r=
equired: &gt;=3D21.3, installed: 21.3]<br>=E2=94=9C=E2=94=80=E2=94=80 paths=
pec [required: &gt;=3D0.10.1, installed: 0.11.1]<br>=E2=94=9C=E2=94=80=E2=
=94=80 pluggy [required: &gt;=3D1.0.0, installed: 1.2.0]<br>=E2=94=94=E2=94=
=80=E2=94=80 tomli [required: &gt;=3D1.2.2, installed: 2.0.1]<br></div><div=
>=C2=A0</div><div>=E2=94=9C=E2=94=80=E2=94=80 ipykernel [required: Any, ins=
talled: 6.24.0]<br>=E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 comm [requi=
red: &gt;=3D0.1.1, installed: 0.1.3]<br>=E2=94=82 =C2=A0 =E2=94=82 =C2=A0 =
=E2=94=94=E2=94=80=E2=94=80 traitlets [required: &gt;=3D5.3, installed: 5.9=
.0]<br>=E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 debugpy [required: &gt;=
=3D1.6.5, installed: 1.6.7]<br>=E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
 ipython [required: &gt;=3D7.23.1, installed: 8.14.0]<br>=E2=94=82 =C2=A0 =
=E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 backcall [required: Any, insta=
lled: 0.2.0]<br>=E2=94=82 =C2=A0 =E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=
=80 decorator [required: Any, installed: 5.1.1]<br>=E2=94=82 =C2=A0 =E2=94=
=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 jedi [required: &gt;=3D0.16, install=
ed: 0.18.2]<br>=E2=94=82 =C2=A0 =E2=94=82 =C2=A0 =E2=94=82 =C2=A0 =E2=94=94=
=E2=94=80=E2=94=80 parso [required: &gt;=3D0.8.0,&lt;0.9.0, installed: 0.8.=
3]<br>=E2=94=82 =C2=A0 =E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 matplot=
lib-inline [required: Any, installed: 0.1.6]<br>=E2=94=82 =C2=A0 =E2=94=82 =
=C2=A0 =E2=94=82 =C2=A0 =E2=94=94=E2=94=80=E2=94=80 traitlets [required: An=
y, installed: 5.9.0]<br>=E2=94=82 =C2=A0 =E2=94=82 =C2=A0 =E2=94=9C=E2=94=
=80=E2=94=80 pexpect [required: &gt;4.3, installed: 4.8.0]<br>=E2=94=82 =C2=
=A0 =E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 pickleshare [required: Any=
, installed: 0.7.5]<br>=E2=94=82 =C2=A0 =E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 prompt-toolkit [required: &gt;=3D3.0.30,&lt;3.1.0,!=3D3.0.37, ins=
talled: 3.0.39]<br>=E2=94=82 =C2=A0 =E2=94=82 =C2=A0 =E2=94=82 =C2=A0 =E2=
=94=94=E2=94=80=E2=94=80 wcwidth [required: Any, installed: 0.2.6]<br>=E2=
=94=82 =C2=A0 =E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 Pygments [requir=
ed: &gt;=3D2.4.0, installed: 2.15.1]<br>=E2=94=82 =C2=A0 =E2=94=82 =C2=A0 =
=E2=94=9C=E2=94=80=E2=94=80 stack-data [required: Any, installed: 0.6.2]<br=
>=E2=94=82 =C2=A0 =E2=94=82 =C2=A0 =E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=
=94=80 asttokens [required: &gt;=3D2.1.0, installed: 2.2.1]<br>=E2=94=82 =
=C2=A0 =E2=94=82 =C2=A0 =E2=94=82 =C2=A0 =E2=94=82 =C2=A0 =E2=94=94=E2=94=
=80=E2=94=80 six [required: Any, installed: 1.16.0]<br>=E2=94=82 =C2=A0 =E2=
=94=82 =C2=A0 =E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 executing [requi=
red: &gt;=3D1.2.0, installed: 1.2.0]<br>=E2=94=82 =C2=A0 =E2=94=82 =C2=A0 =
=E2=94=82 =C2=A0 =E2=94=94=E2=94=80=E2=94=80 pure-eval [required: Any, inst=
alled: 0.2.2]<br>=E2=94=82 =C2=A0 =E2=94=82 =C2=A0 =E2=94=94=E2=94=80=E2=94=
=80 traitlets [required: &gt;=3D5, installed: 5.9.0]<br>=E2=94=82 =C2=A0 =
=E2=94=9C=E2=94=80=E2=94=80 jupyter-client [required: &gt;=3D6.1.12, instal=
led: 8.3.0]<br>=E2=94=82 =C2=A0 =E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=
=80 jupyter-core [required: &gt;=3D4.12,!=3D5.0.*, installed: 5.3.1]<br>=E2=
=94=82 =C2=A0 =E2=94=82 =C2=A0 =E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
 platformdirs [required: &gt;=3D2.5, installed: 3.8.1]<br>=E2=94=82 =C2=A0 =
=E2=94=82 =C2=A0 =E2=94=82 =C2=A0 =E2=94=94=E2=94=80=E2=94=80 traitlets [re=
quired: &gt;=3D5.3, installed: 5.9.0]<br>=E2=94=82 =C2=A0 =E2=94=82 =C2=A0 =
=E2=94=9C=E2=94=80=E2=94=80 python-dateutil [required: &gt;=3D2.8.2, instal=
led: 2.8.2]<br>=E2=94=82 =C2=A0 =E2=94=82 =C2=A0 =E2=94=82 =C2=A0 =E2=94=94=
=E2=94=80=E2=94=80 six [required: &gt;=3D1.5, installed: 1.16.0]<br>=E2=94=
=82 =C2=A0 =E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 pyzmq [required: &g=
t;=3D23.0, installed: 25.1.0]<br>=E2=94=82 =C2=A0 =E2=94=82 =C2=A0 =E2=94=
=9C=E2=94=80=E2=94=80 tornado [required: &gt;=3D6.2, installed: 6.3.2]<br>=
=E2=94=82 =C2=A0 =E2=94=82 =C2=A0 =E2=94=94=E2=94=80=E2=94=80 traitlets [re=
quired: &gt;=3D5.3, installed: 5.9.0]<br>=E2=94=82 =C2=A0 =E2=94=9C=E2=94=
=80=E2=94=80 jupyter-core [required: &gt;=3D4.12,!=3D5.0.*, installed: 5.3.=
1]<br>=E2=94=82 =C2=A0 =E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 platfor=
mdirs [required: &gt;=3D2.5, installed: 3.8.1]<br>=E2=94=82 =C2=A0 =E2=94=
=82 =C2=A0 =E2=94=94=E2=94=80=E2=94=80 traitlets [required: &gt;=3D5.3, ins=
talled: 5.9.0]<br>=E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 matplotlib-i=
nline [required: &gt;=3D0.1, installed: 0.1.6]<br>=E2=94=82 =C2=A0 =E2=94=
=82 =C2=A0 =E2=94=94=E2=94=80=E2=94=80 traitlets [required: Any, installed:=
 5.9.0]<br>=E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 nest-asyncio [requi=
red: Any, installed: 1.5.6]<br>=E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
 packaging [required: Any, installed: 21.3]<br>=E2=94=82 =C2=A0 =E2=94=9C=
=E2=94=80=E2=94=80 psutil [required: Any, installed: 5.9.5]<br>=E2=94=82 =
=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 pyzmq [required: &gt;=3D20, installed: 2=
5.1.0]<br>=E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 tornado [required: &=
gt;=3D6.1, installed: 6.3.2]<br>=E2=94=82 =C2=A0 =E2=94=94=E2=94=80=E2=94=
=80 traitlets [required: &gt;=3D5.4.0, installed: 5.9.0]<br></div><div><br>=
</div><div>Actually I am also not sure why the system is asking me for hatc=
hling as the package itself does not directly depend on it. However, for su=
re I need packaging and pyparsing. But maybe the problem is that I made a m=
istake and try to build both on the host and target system and what I actua=
lly need to do is use the host-python-hatchling for the=C2=A0PYTHON_*_DEPEN=
DENCIES =3D host-pyhton-hatchling=C2=A0 instead of the target one.</div><di=
v><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt; PYTHON_HATCHLING_SOURCE =3D hatchling-$(PYTHON_HATCHLING_VERS=
ION).tar.gz<br>
&gt;&gt; &gt; PYTHON_HATCHLING_SITE =3D<br>
&gt;&gt; &gt; <a href=3D"https://files.pythonhosted.org/packages/e3/57/87da=
2c5adc173950ebe9f1acce4d5f2cd0a960783992fd4879a899a0b637" rel=3D"noreferrer=
" target=3D"_blank">https://files.pythonhosted.org/packages/e3/57/87da2c5ad=
c173950ebe9f1acce4d5f2cd0a960783992fd4879a899a0b637</a><br>
&gt;&gt; &gt; PYTHON_HATCHLING_SETUP_TYPE =3D pep517<br>
&gt;&gt; &gt; PYTHON_HATCHLING_LICENSE =3D MIT<br>
&gt;&gt; &gt; PYTHON_HATCHLING_LICENSE_FILES =3D LICENSE.txt<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; PYTHON_HATCHLING_DEPENDENCIES =3D \<br>
&gt;&gt; &gt; python-tomli \<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0I think the problem is that pep517 checks for the pres=
ence of tomli in the<br>
&gt;&gt; _host_ directory. So you&#39;d need to add a dependency on host-py=
thon-tomli here.<br>
&gt;&gt; James is more aware of these things so I put him in Cc.<br>
&gt;<br>
&gt;<br>
&gt; I will first try to add the host dependency as you suggested below and=
 see what happens.<br>
<br>
I thought our pep517 infrastructure prior to updating to python 3.11 would =
pull<br>
in host-python-tomli automatically(due to it being a host-python-flit depen=
dency<br>
prior to python 3.11). I&#39;m not sure how you could be getting a missing<=
br>
tomli error<br>
like this in the first place as we didn&#39;t remove host-python-tomli<br>
from our pep517<br>
infrastructure dependency tree prior to python being updated to version 3.1=
1.<br>
<br></blockquote><div><br></div><div>I may have missed some files during th=
e migration that is now causing the problem. Which are the folders in build=
root that deal with the python infrastructure I should check?</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt; python-editables \<br>
&gt;&gt; &gt; python-packaging \<br>
&gt;&gt; &gt; python-pathspec \<br>
&gt;&gt; &gt; python-pluggy \<br>
&gt;&gt; &gt; python-trove-classifiers<br>
&gt;&gt; &gt; HOST_PYTHON_HATCHLING_DEPENDENCIES =3D \<br>
&gt;&gt; &gt; host-python-tomli \<br>
&gt;&gt; &gt; host-python-editables \<br>
&gt;&gt; &gt; host-python-packaging \<br>
&gt;&gt; &gt; host-python-pathspec \<br>
&gt;&gt; &gt; host-python-pluggy \<br>
&gt;&gt; &gt; host-python-trove-classifiers<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; $(eval $(python-package))<br>
&gt;&gt; &gt; $(eval $(host-python-package))<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I do have a <a href=3D"http://python-tomli.mk" rel=3D"norefer=
rer" target=3D"_blank">python-tomli.mk</a> &lt;<a href=3D"http://python-tom=
li.mk" rel=3D"noreferrer" target=3D"_blank">http://python-tomli.mk</a>&gt; =
file therefore I am<br>
&gt;&gt; &gt; confused why I am seeing this error. If I remove the tomli de=
pendency from the<br>
&gt;&gt; &gt; pyproject.toml file in hatchling (in output/build/python-hatc=
hling-1.18.0)<br>
&gt;&gt; &gt; manually it continoues the build.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; dependencies =3D [<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 &quot;editables&gt;=3D0.3&quot;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 &quot;packaging&gt;=3D21.3&quot;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 &quot;pathspec&gt;=3D0.10.1&quot;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 &quot;pluggy&gt;=3D1.0.0&quot;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 &quot;tomli&gt;=3D1.2.2; python_version &lt; &#3=
9;3.11&#39;&quot;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 &quot;trove-classifiers&quot;,<br>
&gt;&gt; &gt; ]<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; My impression is that my current buildroot setup has a proble=
m to properly<br>
&gt;&gt; &gt; interpret the line ` &quot;tomli&gt;=3D1.2.2; python_version =
&lt; &#39;3.11&#39;&quot;` maybe because of<br>
&gt;&gt; &gt; an outdated package that I am not aware of.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0I think this way of expressing version-dependent depen=
dencies is already<br>
&gt;&gt; pretty old, and certainly predates the pep517 infrastructure in Bu=
ildroot, so<br>
&gt;&gt; I&#39;d be surprised if this were the case.<br>
&gt;<br>
&gt;<br>
&gt; Well that is how the dependency is defined in hatchling defined it (se=
e here <a href=3D"https://github.com/pypa/hatch/blob/master/backend/pyproje=
ct.toml" rel=3D"noreferrer" target=3D"_blank">https://github.com/pypa/hatch=
/blob/master/backend/pyproject.toml</a>)<br>
<br>
Yeah, it should work fine, we didn&#39;t have to add a host-python-tomli de=
pendency<br>
when I added host-python-hatchling.<br>
<br>
<a href=3D"https://github.com/buildroot/buildroot/commit/626c5bedaa7e1461dd=
3747562b9c04dd40713c83" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/buildroot/buildroot/commit/626c5bedaa7e1461dd3747562b9c04dd40713c83</a=
></blockquote><div><br></div><div>Thanks I will checkout this link.=C2=A0</=
div><div>FYA prior adding the ipykernel package everything built just fine =
telling me that my migration should be OK and its just these packages that =
challenge me.</div><div>=C2=A0</div><div>Regrads,</div><div>Andreas</div><d=
iv><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0Regards,<br>
&gt;&gt;=C2=A0 =C2=A0Arnout<br>
&gt;&gt;<br>
&gt;&gt; &gt; Any idea how to address this issue<br>
&gt;&gt; &gt; and how to debug such an error in buildroot in future? I alre=
ady checked the<br>
&gt;&gt; &gt; manual, especially the section for python packages.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Regards,<br>
&gt;&gt; &gt; Andreas<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; _______________________________________________<br>
&gt;&gt; &gt; buildroot mailing list<br>
&gt;&gt; &gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">=
buildroot@buildroot.org</a><br>
&gt;&gt; &gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/build=
root" rel=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mail=
man/listinfo/buildroot</a><br>
</blockquote></div></div>

--0000000000001da62e0600be8ee9--

--===============2981505881962978365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2981505881962978365==--
