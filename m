Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFFFC433F5
	for <buildroot@archiver.kernel.org>; Wed,  8 Dec 2021 12:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E7EB400CD;
	Wed,  8 Dec 2021 12:16:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OU773w0ACeTl; Wed,  8 Dec 2021 12:16:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 453FA40257;
	Wed,  8 Dec 2021 12:16:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F32FA1BF314
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 12:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFE8B82893
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 12:16:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LnFi5P9euziQ for <buildroot@lists.busybox.net>;
 Wed,  8 Dec 2021 12:16:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F07768284B
 for <buildroot@busybox.net>; Wed,  8 Dec 2021 12:16:09 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id u3so5289599lfl.2
 for <buildroot@busybox.net>; Wed, 08 Dec 2021 04:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=al2PqJBunEjetYWx4WOzu52QEdDo+njvwzgNFHYO0z8=;
 b=I2EVQ9cuZ71HPsQSlgSnWLhWgGPkprIzA96Aumkfkghtsr+mRiqVHihK0O2PdvyUqG
 0/UZEa6yTpZhKw24z5JH0i/jvIqc04SDbh5HNufmvihhPX9AoLNJN35ms/oRavoW5qJG
 rnr8jE5apg8u8XaQUe+1AzIa7sURcuu2LmLsN+gl0zJEd1aSVRB2Mk+u4BegOfQr4mih
 rct79uJgyWBleg5gTmuSaZBdDMS8awwDYP4GN0Spktl5MCn3GfkBvTfInlmiCAPlktns
 hQEPA3ImzeTEDUJ5/xA4oqWqV2oUI4NFMlQTvDlcdPLRV10hJvXbz1Zsj9leg1txoJRA
 Em4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=al2PqJBunEjetYWx4WOzu52QEdDo+njvwzgNFHYO0z8=;
 b=yWCnPTmNiiX/71TZqvfzW9+aXgLtNrJ/yOnyePaNoIH/Q6SwrUzdBW6oxM36lEW3b9
 XivZV++TqErObb7IoA4ndWHpXhKtpWmhUyYlOGCr27uXhn2uDhoTKQ8Uyp4aIJn0NeJ8
 +hzVjTRBzB3JzLplhO7lir9NmCkz5tMr2+Imi3+k8Gz597v+eBxiz3aiTlMJ+DQll3S4
 615gvijD7OqTxcSCDnHjz2JfdcQd4x1NfgQjFg2aHdnu+feNaT4VcQRrsiNTGywqLsDd
 d2kJKiC9gdsnHegrHo4H0Mg7D+zXsAf0FMxnO3t9bbbmCG8NhmTB31unrDGwAst4cJjy
 XzqA==
X-Gm-Message-State: AOAM531TwQNvbVOXod4M/Fq1W+Op0jE/fg3ajIuY7iMLg85irKEz2zoF
 FSlLXdLdk9SGAxwSQ87I14aJ50cfDSrvkjzHR6Q=
X-Google-Smtp-Source: ABdhPJzMJ0mmd5mBkS2YWIhF17L0wALeOwJpUPnAtVbIpTf/zEH99cD0Ze5fUU/Xl1sk4KYsYtEMAYpKukhSd3LNmGE=
X-Received: by 2002:a05:6512:12c3:: with SMTP id
 p3mr47855396lfg.298.1638965767858; 
 Wed, 08 Dec 2021 04:16:07 -0800 (PST)
MIME-Version: 1.0
References: <20211206193109.21218-1-guillaume.bressaix@gmail.com>
 <20211206215730.GE2603@scaer> <7d360d46-e4e5-bbf4-80a9-d5e1ff6a3ea1@mind.be>
 <ce501294-679b-fdbd-957e-de1a7cdb9ff9@andin.de>
In-Reply-To: <ce501294-679b-fdbd-957e-de1a7cdb9ff9@andin.de>
From: Guillaume Bres <guillaume.bressaix@gmail.com>
Date: Wed, 8 Dec 2021 13:15:42 +0100
Message-ID: <CAJe0E3dAgXLTRGr1rK8CdZ0jeiHYr9Lr5RtojVr+jQaQvOROqQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>, dev@andin.de
Subject: Re: [Buildroot] [PATCH v2 1/2] package/python-pybind: fix upgrade
 to version 2.6.1
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
Cc: buildroot@busybox.net, "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: multipart/mixed; boundary="===============4130214735925269089=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4130214735925269089==
Content-Type: multipart/alternative; boundary="000000000000646f0b05d2a174ee"

--000000000000646f0b05d2a174ee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Arnout,
I also prefer your second option.
I need to run some more tests & inquire what Yann proposed on IRC.
This might take a couple of days, I am not submitting until I reach a
solution, but will keep in touch on IRC.
At least I understand what is going on in all scenarios now

Andreas,

>They both built on my
>but I needed to change three things:
>1. Add PYTHON_PYBIND_INSTALL_STAGING =3D YES
>2. Set ZXING_CPP_CONF_OPTS +=3D
>-Dpybind11_DIR=3D$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/sit=
e-packages/pybind11/share/cmake/pybind11
>3. Apply one of the proposed fixes for the pybind11 crosscompile problem
>(to tools/pybind11Tools.cmake)

Once I come to a solution, my next contribution will allow to
install pybind to staging.
At that time we should have a solution good enough so other packages will
no longer have to internally ship pybind.

>Apply one of the proposed fixes for the pybind11 crosscompile problem (to
tools/pybind11Tools.cmake)
We should keep an eye on the pybind devs topics you pointed out. We might
have a near future solution,
but it's probably going to need to involve (hopefuly sanitized/simplified)
in also a near future

Guillaume W. Bres
Software engineer
<guillaume.bressaix@gmail.com>


Le mer. 8 d=C3=A9c. 2021 =C3=A0 12:19, Andreas Naumann <dev@andin.de> a =C3=
=A9crit :

> Hi all,
>
> On 07.12.21 09:04, Arnout Vandecappelle wrote:
> >
> >
> > On 06/12/2021 22:57, Yann E. MORIN wrote:
> >> Guillaume, All,
> >>
> >> On 2021-12-06 20:31 +0100, guillaume.bressaix@gmail.com spake thusly:
> >>> From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
> >>>
> >>> The python 'setup.py' script needs header files
> >>> in $(@D)/pybind11 to work since v2.6.1, and these
> >>> files are generated by an internal minimalist cmake build.
> >>>
> >>> Fixes
> >>>
> >>>
> http://autobuild.buildroot.net/results/b89f1de64b308dffa73675f1f31ccb0b7b=
e5a10d
> >>>
> >>>
> >>>
> http://autobuild.buildroot.net/results/d0287b7f64f206b0f074908c5780a3632e=
0cb799
> >>>
> >>>
> >>>
> http://autobuild.buildroot.net/results/27efb545a5a719a5581c8f746d3a3555ff=
4216ce
> >>>
> >>>
> >>>
> http://autobuild.buildroot.net/results/d2f0a0ad8f6c7178517df109e7d885dac9=
134c3a
> >>>
> >>>
> >>>
> http://autobuild.buildroot.net/results/b57e9a3279260dae4a590f9421238fcabb=
2f7cab
> >>>
> >>>
> >>>
> http://autobuild.buildroot.net/results/515e6f2fc6b5780260d98d6bb52b541ce4=
bf1afe
> >>>
> >>>
> >>>
> http://autobuild.buildroot.net/results/d89c4ecc81222d4f80c951da2232d2e393=
fa1c69
> >>>
> >>>
> >>> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> >>>
> >>> ---
> >>> This remains a python-package.
> >>>
> >>> 'python setup.py' actually hardcodes a system call to cmake now,
> >>> which seems dirty at first. But if we have a cmake env when they
> >>> do that, the install variables are passed and installation
> >>> is smooth. They probably introduced this call to make setup.py
> >>> self sufficient, as most people install this package from 'pip'.
> >>>
> >>> ---
> >>>   package/python-pybind/python-pybind.mk | 7 +++++++
> >>>   1 file changed, 7 insertions(+)
> >>>
> >>> diff --git a/package/python-pybind/python-pybind.mk
> >>> b/package/python-pybind/python-pybind.mk
> >>> index a6a1bdb976..bfd7f6f59a 100644
> >>> --- a/package/python-pybind/python-pybind.mk
> >>> +++ b/package/python-pybind/python-pybind.mk
> >>> @@ -9,5 +9,12 @@ PYTHON_PYBIND_SITE =3D $(call
> >>> github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))
> >>>   PYTHON_PYBIND_LICENSE =3D BSD-3-Clause
> >>>   PYTHON_PYBIND_LICENSE_FILES =3D LICENSE
> >>>   PYTHON_PYBIND_SETUP_TYPE =3D setuptools
> >>> +PYTHON_PYBIND_INSTALL_STAGING =3D YES
> >>> +
> >>> +# every single 'python setup.py' call actually calls cmake
> >>> +# internally, to populate $(@D)/pybind11 with build requirements.
> >>> +# If we have a host-cmake env at that moment,
> >>> +# then the final installation paths are properly defined
> >>> +PYTHON_PYBIND_DEPENDENCIES =3D host-cmake
> >>
> >> I am sorry, but I fail to see how this actually fixes things.
> >>
> >> As I explained in my previous review, headers are supposed to be in
> >> $(STAGING_DIR)/usr/include/pybind11/. That's at least where they are i=
n
> >> Debian-based distributions;
> >>
> >>      $ apt-file search 'pybind11/pybind11.h'
> >>      pybind11-dev: /usr/include/pybind11/pybind11.h
> >>
> >> However, with the way pybind is currently packaged, the ehaders end up
> >> in:
> >>
> >>      $ sort output/build/python-pybind-2.8.1/.files-list.txt
> >>      python-pybind,./usr/bin/pybind11-config
> >>      [...]
> >>
> >>
> python-pybind,./usr/lib/python3.9/site-packages/pybind11/include/pybind11=
/pybind11.h
>
> >>
> >>      [...]
> >>
> >> So, those headers will most probably not be found by the compiler.
> >>
> >> Also, since pybind is supposed to be a headers'-only library, there is
> >> nothing supposed to go in target, so it should be;
> >>
> >>      PYTHON_PYBIND_INSTALL_TARGET =3D NO
> >
> >   Note that this is only relevant to make sure that pybind11-config
> > doesn't appear on target. The headers themselves are removed
> > automatically by Buildroot.
> >
> >>
> >> Furthermore, /usr/bin/pybind11-config is a python script which hardcod=
es
> >> its shabang to #!/usr/bin/python, and this is incorrect:
> >>
> >>    1. /usr/bin/python might be python2 or python3, we can't know
> >>    2. anyway, it would not use our host python, so it would miss the
> >>      proper modules search paths.
> >
> >   Yeah, this is something that needs to be fixed - in particular, there
> > may not be a /usr/bin/python at all.
> >
> >   However, I think that is kind of orthogonal to this patch. This patch
> > fixes a build failure of pybind itself. Your proposed change would be t=
o
> > fix the build of a dependency of pybind.
> >
> >
> >> So, if another package want to call that /usr/bin/pybind11-config to
> >> find pybind, they're gonna have incorrect results, if at all...
> >>
> >> So I think we really, really need a package (like scipy) that actually
> >> makes use of pybind, so we can see how it works, and to fix it...
>
> By chance I was playing with such a package just yesterday: zxing-cpp.
> Not the version buildroot uses (from github glassechidna), but the
> nu-book one which claims to be faster. (And is the one where the python
> bindings in the PyPi package zxing-cpp originate from).
>
> Until recently they shipped their own pybind11 version, which throws an
> error when included in a cmake project in a crosscompile environment.
> This is a known problem, https://github.com/pybind/pybind11/issues/2139
> but non of the proposed fixes has been merged yet.
>
> However, the unreleased master version of zxing-cpp hast been changed so
> it can be configured to use the a system pybind11. So I tried to include
> the br packaged one (2.6.1 as well as 2.8.1). They both built on my
> system (no problem with the hardcoded host cmake here) but I needed to
> change three things:
> 1. Add PYTHON_PYBIND_INSTALL_STAGING =3D YES
> 2. Set ZXING_CPP_CONF_OPTS +=3D
>
> -Dpybind11_DIR=3D$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/si=
te-packages/pybind11/share/cmake/pybind11
> 3. Apply one of the proposed fixes for the pybind11 crosscompile problem
> (to tools/pybind11Tools.cmake)
>
> So this patch here seems to help my (and possibly others) because 1. is
> already included. If interested, I could send a patch for 3.
>
>
> >
> >   Note that there are already two [1][2] submissions of scipy in
> > patchwork, so feel free to review those.
> >
> >   Note also that scipy depends on host-pybind, not pybind itself. I'm
> > not sure how *that* is supposed to work - although, being header-only,
>
>
> One assumption why scipy includes the host version of pybind is that it
> nicely avoids the problems where I need fix 1. and 3. for.
>
> > it probably doesn't really matter if you link with the host or the
> > target version of the library, and the host-installed pybind11-config
> > makes sure that you pick up the host headers (which are normally not in
> > include path). So conceptually wrong but works in practice.
>
> For getting conceptually right with my zxing-cpp I would appreciate some
> advice: When compiling it with above modificiations and
> BUILD_PYTHON_MODULE=3DON, cmake happily compiles the zxing pybind wrapper=
.
> But of course wrappers/python/setup.py would need to be run as well.
> However mixing $(eval $(python-package)) and $(eval $(cmake-package)) is
> not possible. So do I still need to create a second package
> python-zxingcpp for the bindings only (which might be a pain because the
> wrappers CMakeLists is not written to use an existant installation of
> zxing-cpp but rather downloads it again) ?
>
>
> regards,
> Andreas
>
>
>
> >
> >
> >   In conclusion: I think this patch is going in the right direction
> > (modulo BR2_CMAKE_HOST_DEPENDENCY). It's still "conceptually wrong but
> > works" because it doesn't set the toolchain file and other cmake
> > options, but that happens to work because it's header-only so it doesn'=
t
> > actually need any of the cmake options. So it's not entirely the correc=
t
> > thing to do, but it does guarantee to fix things. I'm not sure if that
> > means we should merge it or not...
> >
> >   The proper fix, I think, would require patching setup.py so we can
> > pass in additional cmake options to it.
> >
> >
> >   Regards,
> >   Arnout
> >
> > [1] https://patchwork.ozlabs.org/project/buildroot/list/?series=3D16899=
2
> > [2] https://patchwork.ozlabs.org/project/buildroot/list/?series=3D18614=
6
>
> So
>
> >
> >>
> >> Regards,
> >> Yann E. MORIN.
> >>
> >>>   $(eval $(python-package))
> >>> --
> >>> 2.20.1
> >>>
> >>
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> >
>

--000000000000646f0b05d2a174ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Arnout,<br>I also prefer your second option.<br>I need to =
run some more tests &amp; inquire what Yann proposed on IRC.<br>This might =
take a couple of days, I am not submitting until I reach a solution, but wi=
ll keep in touch on IRC.<br>At least I understand what is going on in all s=
cenarios now<br><br>Andreas,<div><br></div><div>&gt;They both built on my<b=
r>&gt;but I needed to change three things:<br>&gt;1. Add PYTHON_PYBIND_INST=
ALL_STAGING =3D YES<br>&gt;2. Set ZXING_CPP_CONF_OPTS +=3D<br>&gt;-Dpybind1=
1_DIR=3D$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages=
/pybind11/share/cmake/pybind11<br>&gt;3. Apply one of the proposed fixes fo=
r the pybind11 crosscompile problem<br>&gt;(to tools/pybind11Tools.cmake)<b=
r><br>Once I come to a solution, my next contribution will allow to install=
=C2=A0pybind to staging.<br>At that=C2=A0time we should have a solution goo=
d enough so other packages will no longer have to internally ship pybind.<b=
r><br>&gt;Apply one of the proposed fixes for the pybind11 crosscompile pro=
blem (to tools/pybind11Tools.cmake)<br>We should keep an eye on the pybind =
devs topics you pointed out. We might have a near future solution,</div><di=
v>but it&#39;s probably going to need to involve (hopefuly sanitized/simpli=
fied) in also a near future<br><br clear=3D"all"><div><div dir=3D"ltr" clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><=
div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div><div><div><font face=
=3D"arial,helvetica,sans-serif">Guillaume W. Bres<br></font></div><font fac=
e=3D"arial,helvetica,sans-serif">Software engineer</font><br></div><font fa=
ce=3D"arial,helvetica,sans-serif"></font></div><font face=3D"arial,helvetic=
a,sans-serif">&lt;<a href=3D"mailto:guillaume.bressaix@gmail.com" target=3D=
"_blank">guillaume.bressaix@gmail.com</a>&gt;<br></font></div></div></div><=
/div></div></div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">Le=C2=A0mer. 8 d=C3=A9c. 2021 =C3=A0=C2=A012:19,=
 Andreas Naumann &lt;<a href=3D"mailto:dev@andin.de">dev@andin.de</a>&gt; a=
 =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Hi all,<br>
<br>
On 07.12.21 09:04, Arnout Vandecappelle wrote:<br>
&gt; <br>
&gt; <br>
&gt; On 06/12/2021 22:57, Yann E. MORIN wrote:<br>
&gt;&gt; Guillaume, All,<br>
&gt;&gt;<br>
&gt;&gt; On 2021-12-06 20:31 +0100, <a href=3D"mailto:guillaume.bressaix@gm=
ail.com" target=3D"_blank">guillaume.bressaix@gmail.com</a> spake thusly:<b=
r>
&gt;&gt;&gt; From: &quot;Guillaume W. Bres&quot; &lt;<a href=3D"mailto:guil=
laume.bressaix@gmail.com" target=3D"_blank">guillaume.bressaix@gmail.com</a=
>&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The python &#39;setup.py&#39; script needs header files<br>
&gt;&gt;&gt; in $(@D)/pybind11 to work since v2.6.1, and these<br>
&gt;&gt;&gt; files are generated by an internal minimalist cmake build.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Fixes<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt;&gt;&gt; <a href=3D"http://autobuild.buildroot.net/results/b89f1de64b30=
8dffa73675f1f31ccb0b7be5a10d" rel=3D"noreferrer" target=3D"_blank">http://a=
utobuild.buildroot.net/results/b89f1de64b308dffa73675f1f31ccb0b7be5a10d</a>=
 <br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt;&gt;&gt; <a href=3D"http://autobuild.buildroot.net/results/d0287b7f64f2=
06b0f074908c5780a3632e0cb799" rel=3D"noreferrer" target=3D"_blank">http://a=
utobuild.buildroot.net/results/d0287b7f64f206b0f074908c5780a3632e0cb799</a>=
 <br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt;&gt;&gt; <a href=3D"http://autobuild.buildroot.net/results/27efb545a5a7=
19a5581c8f746d3a3555ff4216ce" rel=3D"noreferrer" target=3D"_blank">http://a=
utobuild.buildroot.net/results/27efb545a5a719a5581c8f746d3a3555ff4216ce</a>=
 <br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt;&gt;&gt; <a href=3D"http://autobuild.buildroot.net/results/d2f0a0ad8f6c=
7178517df109e7d885dac9134c3a" rel=3D"noreferrer" target=3D"_blank">http://a=
utobuild.buildroot.net/results/d2f0a0ad8f6c7178517df109e7d885dac9134c3a</a>=
 <br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt;&gt;&gt; <a href=3D"http://autobuild.buildroot.net/results/b57e9a327926=
0dae4a590f9421238fcabb2f7cab" rel=3D"noreferrer" target=3D"_blank">http://a=
utobuild.buildroot.net/results/b57e9a3279260dae4a590f9421238fcabb2f7cab</a>=
 <br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt;&gt;&gt; <a href=3D"http://autobuild.buildroot.net/results/515e6f2fc6b5=
780260d98d6bb52b541ce4bf1afe" rel=3D"noreferrer" target=3D"_blank">http://a=
utobuild.buildroot.net/results/515e6f2fc6b5780260d98d6bb52b541ce4bf1afe</a>=
 <br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt;&gt;&gt; <a href=3D"http://autobuild.buildroot.net/results/d89c4ecc8122=
2d4f80c951da2232d2e393fa1c69" rel=3D"noreferrer" target=3D"_blank">http://a=
utobuild.buildroot.net/results/d89c4ecc81222d4f80c951da2232d2e393fa1c69</a>=
 <br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Guillaume W. Bres &lt;<a href=3D"mailto:guillau=
me.bressaix@gmail.com" target=3D"_blank">guillaume.bressaix@gmail.com</a>&g=
t;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt; This remains a python-package.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; &#39;python setup.py&#39; actually hardcodes a system call to =
cmake now,<br>
&gt;&gt;&gt; which seems dirty at first. But if we have a cmake env when th=
ey<br>
&gt;&gt;&gt; do that, the install variables are passed and installation<br>
&gt;&gt;&gt; is smooth. They probably introduced this call to make setup.py=
<br>
&gt;&gt;&gt; self sufficient, as most people install this package from &#39=
;pip&#39;.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt; =C2=A0 package/python-pybind/<a href=3D"http://python-pybind.m=
k" rel=3D"noreferrer" target=3D"_blank">python-pybind.mk</a> | 7 +++++++<br=
>
&gt;&gt;&gt; =C2=A0 1 file changed, 7 insertions(+)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/package/python-pybind/<a href=3D"http://python-py=
bind.mk" rel=3D"noreferrer" target=3D"_blank">python-pybind.mk</a> <br>
&gt;&gt;&gt; b/package/python-pybind/<a href=3D"http://python-pybind.mk" re=
l=3D"noreferrer" target=3D"_blank">python-pybind.mk</a><br>
&gt;&gt;&gt; index a6a1bdb976..bfd7f6f59a 100644<br>
&gt;&gt;&gt; --- a/package/python-pybind/<a href=3D"http://python-pybind.mk=
" rel=3D"noreferrer" target=3D"_blank">python-pybind.mk</a><br>
&gt;&gt;&gt; +++ b/package/python-pybind/<a href=3D"http://python-pybind.mk=
" rel=3D"noreferrer" target=3D"_blank">python-pybind.mk</a><br>
&gt;&gt;&gt; @@ -9,5 +9,12 @@ PYTHON_PYBIND_SITE =3D $(call <br>
&gt;&gt;&gt; github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))<br>
&gt;&gt;&gt; =C2=A0 PYTHON_PYBIND_LICENSE =3D BSD-3-Clause<br>
&gt;&gt;&gt; =C2=A0 PYTHON_PYBIND_LICENSE_FILES =3D LICENSE<br>
&gt;&gt;&gt; =C2=A0 PYTHON_PYBIND_SETUP_TYPE =3D setuptools<br>
&gt;&gt;&gt; +PYTHON_PYBIND_INSTALL_STAGING =3D YES<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +# every single &#39;python setup.py&#39; call actually calls =
cmake<br>
&gt;&gt;&gt; +# internally, to populate $(@D)/pybind11 with build requireme=
nts.<br>
&gt;&gt;&gt; +# If we have a host-cmake env at that moment,<br>
&gt;&gt;&gt; +# then the final installation paths are properly defined<br>
&gt;&gt;&gt; +PYTHON_PYBIND_DEPENDENCIES =3D host-cmake<br>
&gt;&gt;<br>
&gt;&gt; I am sorry, but I fail to see how this actually fixes things.<br>
&gt;&gt;<br>
&gt;&gt; As I explained in my previous review, headers are supposed to be i=
n<br>
&gt;&gt; $(STAGING_DIR)/usr/include/pybind11/. That&#39;s at least where th=
ey are in<br>
&gt;&gt; Debian-based distributions;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 $ apt-file search &#39;pybind11/pybind11.=
h&#39;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 pybind11-dev: /usr/include/pybind11/pybin=
d11.h<br>
&gt;&gt;<br>
&gt;&gt; However, with the way pybind is currently packaged, the ehaders en=
d up<br>
&gt;&gt; in:<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 $ sort output/build/python-pybind-2.8.1/.=
files-list.txt<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 python-pybind,./usr/bin/pybind11-config<b=
r>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 [...]<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 <br>
&gt;&gt; python-pybind,./usr/lib/python3.9/site-packages/pybind11/include/p=
ybind11/pybind11.h <br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 [...]<br>
&gt;&gt;<br>
&gt;&gt; So, those headers will most probably not be found by the compiler.=
<br>
&gt;&gt;<br>
&gt;&gt; Also, since pybind is supposed to be a headers&#39;-only library, =
there is<br>
&gt;&gt; nothing supposed to go in target, so it should be;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 PYTHON_PYBIND_INSTALL_TARGET =3D NO<br>
&gt; <br>
&gt;=C2=A0 =C2=A0Note that this is only relevant to make sure that pybind11=
-config <br>
&gt; doesn&#39;t appear on target. The headers themselves are removed <br>
&gt; automatically by Buildroot.<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; Furthermore, /usr/bin/pybind11-config is a python script which har=
dcodes<br>
&gt;&gt; its shabang to #!/usr/bin/python, and this is incorrect:<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0 1. /usr/bin/python might be python2 or python3, we ca=
n&#39;t know<br>
&gt;&gt; =C2=A0=C2=A0 2. anyway, it would not use our host python, so it wo=
uld miss the<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 proper modules search paths.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0Yeah, this is something that needs to be fixed - in partic=
ular, there <br>
&gt; may not be a /usr/bin/python at all.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0However, I think that is kind of orthogonal to this patch.=
 This patch <br>
&gt; fixes a build failure of pybind itself. Your proposed change would be =
to <br>
&gt; fix the build of a dependency of pybind.<br>
&gt; <br>
&gt; <br>
&gt;&gt; So, if another package want to call that /usr/bin/pybind11-config =
to<br>
&gt;&gt; find pybind, they&#39;re gonna have incorrect results, if at all..=
.<br>
&gt;&gt;<br>
&gt;&gt; So I think we really, really need a package (like scipy) that actu=
ally<br>
&gt;&gt; makes use of pybind, so we can see how it works, and to fix it...<=
br>
<br>
By chance I was playing with such a package just yesterday: zxing-cpp. <br>
Not the version buildroot uses (from github glassechidna), but the <br>
nu-book one which claims to be faster. (And is the one where the python <br=
>
bindings in the PyPi package zxing-cpp originate from).<br>
<br>
Until recently they shipped their own pybind11 version, which throws an <br=
>
error when included in a cmake project in a crosscompile environment. <br>
This is a known problem, <a href=3D"https://github.com/pybind/pybind11/issu=
es/2139" rel=3D"noreferrer" target=3D"_blank">https://github.com/pybind/pyb=
ind11/issues/2139</a> <br>
but non of the proposed fixes has been merged yet.<br>
<br>
However, the unreleased master version of zxing-cpp hast been changed so <b=
r>
it can be configured to use the a system pybind11. So I tried to include <b=
r>
the br packaged one (2.6.1 as well as 2.8.1). They both built on my <br>
system (no problem with the hardcoded host cmake here) but I needed to <br>
change three things:<br>
1. Add PYTHON_PYBIND_INSTALL_STAGING =3D YES<br>
2. Set ZXING_CPP_CONF_OPTS +=3D <br>
-Dpybind11_DIR=3D$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site=
-packages/pybind11/share/cmake/pybind11<br>
3. Apply one of the proposed fixes for the pybind11 crosscompile problem <b=
r>
(to tools/pybind11Tools.cmake)<br>
<br>
So this patch here seems to help my (and possibly others) because 1. is <br=
>
already included. If interested, I could send a patch for 3.<br>
<br>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0Note that there are already two [1][2] submissions of scip=
y in <br>
&gt; patchwork, so feel free to review those.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0Note also that scipy depends on host-pybind, not pybind it=
self. I&#39;m <br>
&gt; not sure how *that* is supposed to work - although, being header-only,=
 <br>
<br>
<br>
One assumption why scipy includes the host version of pybind is that it <br=
>
nicely avoids the problems where I need fix 1. and 3. for.<br>
<br>
&gt; it probably doesn&#39;t really matter if you link with the host or the=
 <br>
&gt; target version of the library, and the host-installed pybind11-config =
<br>
&gt; makes sure that you pick up the host headers (which are normally not i=
n <br>
&gt; include path). So conceptually wrong but works in practice.<br>
<br>
For getting conceptually right with my zxing-cpp I would appreciate some <b=
r>
advice: When compiling it with above modificiations and <br>
BUILD_PYTHON_MODULE=3DON, cmake happily compiles the zxing pybind wrapper. =
<br>
But of course wrappers/python/setup.py would need to be run as well. <br>
However mixing $(eval $(python-package)) and $(eval $(cmake-package)) is <b=
r>
not possible. So do I still need to create a second package <br>
python-zxingcpp for the bindings only (which might be a pain because the <b=
r>
wrappers CMakeLists is not written to use an existant installation of <br>
zxing-cpp but rather downloads it again) ?<br>
<br>
<br>
regards,<br>
Andreas<br>
<br>
<br>
<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0In conclusion: I think this patch is going in the right di=
rection <br>
&gt; (modulo BR2_CMAKE_HOST_DEPENDENCY). It&#39;s still &quot;conceptually =
wrong but <br>
&gt; works&quot; because it doesn&#39;t set the toolchain file and other cm=
ake <br>
&gt; options, but that happens to work because it&#39;s header-only so it d=
oesn&#39;t <br>
&gt; actually need any of the cmake options. So it&#39;s not entirely the c=
orrect <br>
&gt; thing to do, but it does guarantee to fix things. I&#39;m not sure if =
that <br>
&gt; means we should merge it or not...<br>
&gt; <br>
&gt;=C2=A0 =C2=A0The proper fix, I think, would require patching setup.py s=
o we can <br>
&gt; pass in additional cmake options to it.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0Regards,<br>
&gt;=C2=A0 =C2=A0Arnout<br>
&gt; <br>
&gt; [1] <a href=3D"https://patchwork.ozlabs.org/project/buildroot/list/?se=
ries=3D168992" rel=3D"noreferrer" target=3D"_blank">https://patchwork.ozlab=
s.org/project/buildroot/list/?series=3D168992</a><br>
&gt; [2] <a href=3D"https://patchwork.ozlabs.org/project/buildroot/list/?se=
ries=3D186146" rel=3D"noreferrer" target=3D"_blank">https://patchwork.ozlab=
s.org/project/buildroot/list/?series=3D186146</a><br>
<br>
So<br>
<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt; Yann E. MORIN.<br>
&gt;&gt;<br>
&gt;&gt;&gt; =C2=A0 $(eval $(python-package))<br>
&gt;&gt;&gt; -- <br>
&gt;&gt;&gt; 2.20.1<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
&gt; <br>
</blockquote></div>

--000000000000646f0b05d2a174ee--

--===============4130214735925269089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4130214735925269089==--
