Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6CEC433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 19:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A4E682A28;
	Mon,  6 Dec 2021 19:28:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vtoYsrtYE_gG; Mon,  6 Dec 2021 19:28:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3328982A5D;
	Mon,  6 Dec 2021 19:28:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 336161BF29A
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 19:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E39B184B83
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 19:28:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B1tOLKwheyDW for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 19:27:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1AC2282A28
 for <buildroot@busybox.net>; Mon,  6 Dec 2021 19:27:58 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id v15so23050291ljc.0
 for <buildroot@busybox.net>; Mon, 06 Dec 2021 11:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nP9p0C4Gu0yiJ74mf6tNkwSIDtDgQM47/XB2Hmwj9W8=;
 b=DIjdeVe/i+ytrRxrfyV1PA/mPDGu0DjieOSQfRYOAp5amnmHQ7aDQ4lvPsAzosDGA4
 3GednK2NVLUbDrL/p6qFgh/XNBEhW/twicrhl20JFXUnwJkTZ4csNJqK4jstwghyicmj
 wLK1pqoQvKcQ3s1MTInDn6L8w4yS7GcWq5KrIdtL2MX6wYUFtJ9SWeL7sjm1dyU86F1s
 4x4DeZ3+CQ9ET726BOg3eoeKLz0jenBwwcoHhgJsfVNnoHigouKhxwY0CWbRBU2SANaQ
 SwsaQwRGXph/w6G3MVvh6jftBQON/tYNxS8lDSHMUwCDWWl13kR/+39cvg1y+v5orNvP
 V7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nP9p0C4Gu0yiJ74mf6tNkwSIDtDgQM47/XB2Hmwj9W8=;
 b=TzPR0r4FZ3ML6o7Pag/sPngwKC/EFWUuCgdtMlRKdHnfhPa8BGZ3uKOPeFpo91jpaY
 CVVMGauGPEkGyUHlkyAfc8bDYXwEMPojdqmqdX+W5IwREu0DG2hDnT1Kk5p1974caDvu
 sUTc7ByABlkIpDJZYqKqLxcrQ5HRPV4Cup4YB4T5s5WbhwTbSFerySi3xfQyFwdRkCo1
 HtQ9iXj2dNejdQKO89d6TkkodhA36i9JKntNlBDDoFPumQa3fueWMa1CdazoYj9rGd/v
 +LJZvx5TSCLmUfJ4zHrOTnsEi/QOghBgkC7C977OMSehKRKV+k7jZExMHl8MjPLrdvdo
 tOhA==
X-Gm-Message-State: AOAM533WZAChLa7qbFK8OF4OghgYQapKucjkIcbIM1km5nP/hyYZMeyl
 gVfyhAADut32S/uWAldIlMUvJg61POaVjKfzhVc=
X-Google-Smtp-Source: ABdhPJxKHW0i5k/ox8WHmrh8YczUr5H1g90sB4yLkenmHm7tgAMHyqDigATvjBGUAd1AZI5mKIVKPtJOuvnHkTAGju4=
X-Received: by 2002:a2e:a54d:: with SMTP id e13mr36692118ljn.319.1638818876408; 
 Mon, 06 Dec 2021 11:27:56 -0800 (PST)
MIME-Version: 1.0
References: <20211205204720.2831-1-guillaume.bressaix@gmail.com>
 <1e21be4a-2465-e5c9-f775-0430cd3b0cf1@mind.be>
 <CAJe0E3fN-kd=q0wus32=XSdZW5i=PPvSJ1Kaxw=KA_THrAWFRA@mail.gmail.com>
 <760f07ee-35ec-090e-237a-9f1501f0ff93@mind.be>
In-Reply-To: <760f07ee-35ec-090e-237a-9f1501f0ff93@mind.be>
From: Guillaume Bres <guillaume.bressaix@gmail.com>
Date: Mon, 6 Dec 2021 20:27:30 +0100
Message-ID: <CAJe0E3ez=k1Ay7tVWNH2mqJ0YS0rGHw8+2of5sBQtyEJUwX1Zg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/2] package/python-pybind: fix upgrade to
 version 2.6.1
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
Content-Type: multipart/mixed; boundary="===============4097945327926116903=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4097945327926116903==
Content-Type: multipart/alternative; boundary="000000000000fac8d505d27f4059"

--000000000000fac8d505d27f4059
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Arnout,
I am submitting a revised version of these patches, please discard v1

>What was it for then? Was it already for scipy?
yep

>  Was it just by accident that you submitted a target version instead of a
host version?
I don't really know why I did so, but at the time I decided I would unlock
the host-pkg version in the scipy patch that requires it.
Actually it still has to be done because we might fix the pkg today, but
that won't be enough for future dependencies

Guillaume W. Bres
Software engineer
<guillaume.bressaix@gmail.com>


Le lun. 6 d=C3=A9c. 2021 =C3=A0 14:20, Arnout Vandecappelle <arnout@mind.be=
> a =C3=A9crit :

>
>
> On 06/12/2021 13:39, Guillaume Bres wrote:
> > Arnout,
> > thanks for the quick review
> >
> >  >Nitpick: to make it appear with the fixes tag in patchwork or in the
> summary
> >  >that Peter makes, you have to format it like this:
> > thanks, never done that before, I will correct that in a V2
> >
> >  >I don't see CMAKE_ENV anywhere in Buildroot, or in this patch.
> > I just meant the general cmake env. I will correct/improve my
> explanations in a V2,
> > especially those, because they are to remain visible to clarify things
> in case
> > of future problems.
> >
> >  >  This is still looking fairly weird to me...
> >  >Also, I don't think there's any way to tell CMake about "all BR
> variables"
> >  >other than passing a toolchainfile (with -DCMAKE_TOOLCHAIN_FILE=3D...=
).
> Are you
> >  >sure that it's really building correctly for the target?
> > the package is broken, it put on hold for about 3 years now, some
> > interesting contributions I would like to submit. It would be nice to
> fix it.
> >
> > Yesterday you explained the pkg name and build infrastructure are total
> > different things and we agreed to convert to a cmake package.
> > In the meantime, I was exploring both options, with my goal being able
> to
> > provide target + staging + host (basically all 3) combinations.
> >
> > I decided to keep it as a python-pkg and submit this content, in spite
> of our
> > conversation, as I ran into this fix unexpectedly.
> > I actually works (tested on 2 platforms), the intrinsic build failure i=
s
> fixed.
> >
> > With the cmake-package option, that I also inquired intensively, I neve=
r
> get a
> > staging + target install, build fails.
> > With this option, all combinations pass.
>
>   OK, excellent, then the current patch is good enough. You're of course
> welcome
> to submit a v2 with fixed commit message and comments.
>
>
> >  >sure that it's really building correctly for the target?
> > My next submission is scipy and it relies on the host- version of this
> pkg (now
> > supposedly 2.8.1 if you merge patch #2).
> > And I just redid a test of the produced scipy binaries on my zedboard,
> they work
> > fine.
> > The problem to answer fully your question is that:
> > * no pkg currently depend on pybind
> > * my next submission depends on host-pybind (to be submitted after all
> the
> > fixing), not on target-pybind.
> > This is why I wanted to move this pkg to a host-only package, but Yann
> corrected
> > otherwise
>
>   You yourself submitted the pybind package about a year ago. What was it
> for
> then? Was it already for scipy? Was it just by accident that you submitte=
d
> a
> target version instead of a host version?
>
>   Regards,
>   Arnout
>
> >
> > I will wait for you answer before submitting a V2 depending on what we
> decide
> >
> > Guillaume W. Bres
> > Software engineer
> > <guillaume.bressaix@gmail.com <mailto:guillaume.bressaix@gmail.com>>
> >
> >
> > Le lun. 6 d=C3=A9c. 2021 =C3=A0 08:45, Arnout Vandecappelle <arnout@min=
d.be
> > <mailto:arnout@mind.be>> a =C3=A9crit :
> >
> >        Hi Guillaume,
> >
> >        This is still looking fairly weird to me...
> >
> >     On 05/12/2021 21:47, guillaume.bressaix@gmail.com
> >     <mailto:guillaume.bressaix@gmail.com> wrote:
> >      > From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com
> >     <mailto:guillaume.bressaix@gmail.com>>
> >      >
> >      > The python 'setup.py' script needs header files
> >      > in $(@D)/pybind11 to work since v2.6.1, and these files
> >      > are created by an internal minimalist cmake build.
> >      >
> >      > fixes
> >
> http://autobuild.buildroot.net/results/b89f1de64b308dffa73675f1f31ccb0b7b=
e5a10d
> >     <
> http://autobuild.buildroot.net/results/b89f1de64b308dffa73675f1f31ccb0b7b=
e5a10d
> >
> >
> >        Nitpick: to make it appear with the fixes tag in patchwork or in
> the summary
> >     that Peter makes, you have to format it like this:
> >
> >     Fixes:
> >
> http://autobuild.buildroot.net/results/b89f1de64b308dffa73675f1f31ccb0b7b=
e5a10d
> >     <
> http://autobuild.buildroot.net/results/b89f1de64b308dffa73675f1f31ccb0b7b=
e5a10d
> >
> >           http://...
> >
> >      > fixes
> >
> http://autobuild.buildroot.net/results/d0287b7f64f206b0f074908c5780a3632e=
0cb799
> >     <
> http://autobuild.buildroot.net/results/d0287b7f64f206b0f074908c5780a3632e=
0cb799
> >
> >      > fixes
> >
> http://autobuild.buildroot.net/results/27efb545a5a719a5581c8f746d3a3555ff=
4216ce
> >     <
> http://autobuild.buildroot.net/results/27efb545a5a719a5581c8f746d3a3555ff=
4216ce
> >
> >      > fixes
> >
> http://autobuild.buildroot.net/results/d2f0a0ad8f6c7178517df109e7d885dac9=
134c3a
> >     <
> http://autobuild.buildroot.net/results/d2f0a0ad8f6c7178517df109e7d885dac9=
134c3a
> >
> >      > fixes
> >
> http://autobuild.buildroot.net/results/b57e9a3279260dae4a590f9421238fcabb=
2f7cab
> >     <
> http://autobuild.buildroot.net/results/b57e9a3279260dae4a590f9421238fcabb=
2f7cab
> >
> >      > fixes
> >
> http://autobuild.buildroot.net/results/515e6f2fc6b5780260d98d6bb52b541ce4=
bf1afe
> >     <
> http://autobuild.buildroot.net/results/515e6f2fc6b5780260d98d6bb52b541ce4=
bf1afe
> >
> >      > fixes
> >
> http://autobuild.buildroot.net/results/d89c4ecc81222d4f80c951da2232d2e393=
fa1c69
> >     <
> http://autobuild.buildroot.net/results/d89c4ecc81222d4f80c951da2232d2e393=
fa1c69
> >
> >      >
> >      > Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com
> >     <mailto:guillaume.bressaix@gmail.com>>
> >      >
> >      > ---
> >      > This remains a python-package.
> >      >
> >      > 'python setup.py' actually hardcodes a system call to cmake,
> >      > which seems dirty at first.
> >      > Fortunately, if we have CMAKE ENV, all BR variables are retrieve=
d.
> >
> >        I don't see CMAKE_ENV anywhere in Buildroot, or in this patch.
> >
> >        Also, I don't think there's any way to tell CMake about "all BR
> variables"
> >     other than passing a toolchainfile (with
> -DCMAKE_TOOLCHAIN_FILE=3D...). Are you
> >     sure that it's really building correctly for the target?
> >
> >
> >        Regards,
> >        Arnout
> >
> >
> >      > I think they made this cmake call to make setup.py self
> sufficient.
> >      >
> >      > ---
> >      >   package/python-pybind/python-pybind.mk <http://python-pybind.m=
k>
> | 6 ++++++
> >      >   1 file changed, 6 insertions(+)
> >      >
> >      > diff --git a/package/python-pybind/python-pybind.mk
> >     <http://python-pybind.mk> b/package/python-pybind/python-pybind.mk
> >     <http://python-pybind.mk>
> >      > index a6a1bdb976..080586a877 100644
> >      > --- a/package/python-pybind/python-pybind.mk <
> http://python-pybind.mk>
> >      > +++ b/package/python-pybind/python-pybind.mk <
> http://python-pybind.mk>
> >      > @@ -9,5 +9,11 @@ PYTHON_PYBIND_SITE =3D $(call
> >     github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))
> >      >   PYTHON_PYBIND_LICENSE =3D BSD-3-Clause
> >      >   PYTHON_PYBIND_LICENSE_FILES =3D LICENSE
> >      >   PYTHON_PYBIND_SETUP_TYPE =3D setuptools
> >      > +PYTHON_PYBIND_INSTALL_STAGING =3D YES
> >      > +
> >      > +# every single 'python setup.py' call actually calls cmake
> >      > +# to populate $(@D)/pybind11 with .h and build requirements.
> >      > +# If we have a HOST_CMAKE_ENV, then installation paths are
> properly defined
> >      > +PYTHON_PYBIND_DEPENDENCIES =3D host-cmake
> >      >
> >      >   $(eval $(python-package))
> >      >
> >
>

--000000000000fac8d505d27f4059
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Arnout,<br>I am submitting a revised version of these patc=
hes, please discard v1<br><br>&gt;What was it for then? Was it already for =
scipy?<br>yep<br><br>&gt;=C2=A0=C2=A0Was it just by accident that you submi=
tted a target version instead of a host version?<br>I don&#39;t really know=
 why I did so, but at the time I decided I would unlock the host-pkg versio=
n in the scipy patch that requires it.<br>Actually it still has to be done =
because we might fix the pkg today, but that won&#39;t be enough for future=
 dependencies<br><br clear=3D"all"><div><div dir=3D"ltr" data-smartmail=3D"=
gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div><div><div><font face=3D"arial,helvetica,sans-serif">Guillaum=
e W. Bres<br></font></div><font face=3D"arial,helvetica,sans-serif">Softwar=
e engineer</font><br></div><font face=3D"arial,helvetica,sans-serif"></font=
></div><font face=3D"arial,helvetica,sans-serif">&lt;<a href=3D"mailto:guil=
laume.bressaix@gmail.com" target=3D"_blank">guillaume.bressaix@gmail.com</a=
>&gt;<br></font></div></div></div></div></div></div><br></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 6 d=C3=
=A9c. 2021 =C3=A0=C2=A014:20, Arnout Vandecappelle &lt;<a href=3D"mailto:ar=
nout@mind.be" target=3D"_blank">arnout@mind.be</a>&gt; a =C3=A9crit=C2=A0:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 06/12/2021 13:39, Guillaume Bres wrote:<br>
&gt; Arnout,<br>
&gt; thanks for the quick review<br>
&gt; <br>
&gt;=C2=A0 &gt;Nitpick: to make it appear with the fixes tag in patchwork o=
r in the summary<br>
&gt;=C2=A0 &gt;that Peter makes, you have to format it like this:<br>
&gt; thanks, never done that before, I will correct that in a V2<br>
&gt; <br>
&gt;=C2=A0 &gt;I don&#39;t see CMAKE_ENV anywhere in Buildroot, or in this =
patch.<br>
&gt; I just meant the=C2=A0general cmake env. I will correct/improve my exp=
lanations in a V2,<br>
&gt; especially those, because they are to remain visible to clarify things=
 in case <br>
&gt; of future problems.<br>
&gt; <br>
&gt;=C2=A0 &gt;=C2=A0 This is still looking fairly weird to me...<br>
&gt;=C2=A0 &gt;Also, I don&#39;t think there&#39;s any way to tell CMake ab=
out &quot;all BR variables&quot;<br>
&gt;=C2=A0 &gt;other than passing a toolchainfile (with -DCMAKE_TOOLCHAIN_F=
ILE=3D...). Are you<br>
&gt;=C2=A0 &gt;sure that it&#39;s really building correctly for the target?=
<br>
&gt; the package is=C2=A0broken, it put=C2=A0on hold for about 3 years now,=
 some <br>
&gt; interesting=C2=A0contributions I would like to submit. It would be nic=
e to fix it.<br>
&gt; <br>
&gt; Yesterday you explained the pkg name and build infrastructure are tota=
l <br>
&gt; different things and we agreed to convert to a cmake package.<br>
&gt; In the meantime, I was exploring both options, with my goal being able=
 to <br>
&gt; provide target=C2=A0+ staging=C2=A0+ host (basically all 3) combinatio=
ns.<br>
&gt; <br>
&gt; I decided to keep it as a python-pkg and submit this content, in spite=
 of our <br>
&gt; conversation, as I ran into this fix unexpectedly.<br>
&gt; I actually works (tested on 2 platforms), the intrinsic build failure =
is fixed.<br>
&gt; <br>
&gt; With the cmake-package option, that=C2=A0I also inquired intensively, =
I never get a <br>
&gt; staging=C2=A0+ target install, build fails.<br>
&gt; With this option, all combinations pass.<br>
<br>
=C2=A0 OK, excellent, then the current patch is good enough. You&#39;re of =
course welcome <br>
to submit a v2 with fixed commit message and comments.<br>
<br>
<br>
&gt;=C2=A0 &gt;sure that it&#39;s really building correctly for the target?=
<br>
&gt; My next submission is scipy and it relies on the host- version of this=
 pkg (now <br>
&gt; supposedly 2.8.1 if you merge patch #2).<br>
&gt; And I just redid a test of the produced scipy binaries on my zedboard,=
 they work <br>
&gt; fine.<br>
&gt; The problem to answer fully your question is that:<br>
&gt; * no pkg currently depend on pybind<br>
&gt; * my next submission depends on host-pybind (to be submitted after all=
 the <br>
&gt; fixing), not on target-pybind.<br>
&gt; This is why I wanted to move this pkg to a host-only package, but Yann=
 corrected <br>
&gt; otherwise<br>
<br>
=C2=A0 You yourself submitted the pybind package about a year ago. What was=
 it for <br>
then? Was it already for scipy? Was it just by accident that you submitted =
a <br>
target version instead of a host version?<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt; <br>
&gt; I will wait for you answer before submitting a V2 depending on what we=
 decide<br>
&gt; <br>
&gt; Guillaume W. Bres<br>
&gt; Software engineer<br>
&gt; &lt;<a href=3D"mailto:guillaume.bressaix@gmail.com" target=3D"_blank">=
guillaume.bressaix@gmail.com</a> &lt;mailto:<a href=3D"mailto:guillaume.bre=
ssaix@gmail.com" target=3D"_blank">guillaume.bressaix@gmail.com</a>&gt;&gt;=
<br>
&gt; <br>
&gt; <br>
&gt; Le=C2=A0lun. 6 d=C3=A9c. 2021 =C3=A0=C2=A008:45, Arnout Vandecappelle =
&lt;<a href=3D"mailto:arnout@mind.be" target=3D"_blank">arnout@mind.be</a> =
<br>
&gt; &lt;mailto:<a href=3D"mailto:arnout@mind.be" target=3D"_blank">arnout@=
mind.be</a>&gt;&gt; a =C3=A9crit=C2=A0:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Hi Guillaume,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 This is still looking fairly weird to me...=
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 05/12/2021 21:47, <a href=3D"mailto:guillaume.br=
essaix@gmail.com" target=3D"_blank">guillaume.bressaix@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:guillaume.bressaix@gma=
il.com" target=3D"_blank">guillaume.bressaix@gmail.com</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; From: &quot;Guillaume W. Bres&quot; &lt;<a hr=
ef=3D"mailto:guillaume.bressaix@gmail.com" target=3D"_blank">guillaume.bres=
saix@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:guillaume.bressaix@gma=
il.com" target=3D"_blank">guillaume.bressaix@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; The python &#39;setup.py&#39; script needs he=
ader files<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; in $(@D)/pybind11 to work since v2.6.1, and t=
hese files<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; are created by an internal minimalist cmake b=
uild.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; fixes<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://autobuild.buildroot.net/results/b=
89f1de64b308dffa73675f1f31ccb0b7be5a10d" rel=3D"noreferrer" target=3D"_blan=
k">http://autobuild.buildroot.net/results/b89f1de64b308dffa73675f1f31ccb0b7=
be5a10d</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://autobuild.buildroot.net/resul=
ts/b89f1de64b308dffa73675f1f31ccb0b7be5a10d" rel=3D"noreferrer" target=3D"_=
blank">http://autobuild.buildroot.net/results/b89f1de64b308dffa73675f1f31cc=
b0b7be5a10d</a>&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Nitpick: to make it appear with the fixes t=
ag in patchwork or in the summary<br>
&gt;=C2=A0 =C2=A0 =C2=A0that Peter makes, you have to format it like this:<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Fixes:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://autobuild.buildroot.net/results/b=
89f1de64b308dffa73675f1f31ccb0b7be5a10d" rel=3D"noreferrer" target=3D"_blan=
k">http://autobuild.buildroot.net/results/b89f1de64b308dffa73675f1f31ccb0b7=
be5a10d</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://autobuild.buildroot.net/resul=
ts/b89f1de64b308dffa73675f1f31ccb0b7be5a10d" rel=3D"noreferrer" target=3D"_=
blank">http://autobuild.buildroot.net/results/b89f1de64b308dffa73675f1f31cc=
b0b7be5a10d</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0http://...<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; fixes<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://autobuild.buildroot.net/results/d=
0287b7f64f206b0f074908c5780a3632e0cb799" rel=3D"noreferrer" target=3D"_blan=
k">http://autobuild.buildroot.net/results/d0287b7f64f206b0f074908c5780a3632=
e0cb799</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://autobuild.buildroot.net/resul=
ts/d0287b7f64f206b0f074908c5780a3632e0cb799" rel=3D"noreferrer" target=3D"_=
blank">http://autobuild.buildroot.net/results/d0287b7f64f206b0f074908c5780a=
3632e0cb799</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; fixes<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://autobuild.buildroot.net/results/2=
7efb545a5a719a5581c8f746d3a3555ff4216ce" rel=3D"noreferrer" target=3D"_blan=
k">http://autobuild.buildroot.net/results/27efb545a5a719a5581c8f746d3a3555f=
f4216ce</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://autobuild.buildroot.net/resul=
ts/27efb545a5a719a5581c8f746d3a3555ff4216ce" rel=3D"noreferrer" target=3D"_=
blank">http://autobuild.buildroot.net/results/27efb545a5a719a5581c8f746d3a3=
555ff4216ce</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; fixes<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://autobuild.buildroot.net/results/d=
2f0a0ad8f6c7178517df109e7d885dac9134c3a" rel=3D"noreferrer" target=3D"_blan=
k">http://autobuild.buildroot.net/results/d2f0a0ad8f6c7178517df109e7d885dac=
9134c3a</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://autobuild.buildroot.net/resul=
ts/d2f0a0ad8f6c7178517df109e7d885dac9134c3a" rel=3D"noreferrer" target=3D"_=
blank">http://autobuild.buildroot.net/results/d2f0a0ad8f6c7178517df109e7d88=
5dac9134c3a</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; fixes<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://autobuild.buildroot.net/results/b=
57e9a3279260dae4a590f9421238fcabb2f7cab" rel=3D"noreferrer" target=3D"_blan=
k">http://autobuild.buildroot.net/results/b57e9a3279260dae4a590f9421238fcab=
b2f7cab</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://autobuild.buildroot.net/resul=
ts/b57e9a3279260dae4a590f9421238fcabb2f7cab" rel=3D"noreferrer" target=3D"_=
blank">http://autobuild.buildroot.net/results/b57e9a3279260dae4a590f9421238=
fcabb2f7cab</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; fixes<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://autobuild.buildroot.net/results/5=
15e6f2fc6b5780260d98d6bb52b541ce4bf1afe" rel=3D"noreferrer" target=3D"_blan=
k">http://autobuild.buildroot.net/results/515e6f2fc6b5780260d98d6bb52b541ce=
4bf1afe</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://autobuild.buildroot.net/resul=
ts/515e6f2fc6b5780260d98d6bb52b541ce4bf1afe" rel=3D"noreferrer" target=3D"_=
blank">http://autobuild.buildroot.net/results/515e6f2fc6b5780260d98d6bb52b5=
41ce4bf1afe</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; fixes<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://autobuild.buildroot.net/results/d=
89c4ecc81222d4f80c951da2232d2e393fa1c69" rel=3D"noreferrer" target=3D"_blan=
k">http://autobuild.buildroot.net/results/d89c4ecc81222d4f80c951da2232d2e39=
3fa1c69</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://autobuild.buildroot.net/resul=
ts/d89c4ecc81222d4f80c951da2232d2e393fa1c69" rel=3D"noreferrer" target=3D"_=
blank">http://autobuild.buildroot.net/results/d89c4ecc81222d4f80c951da2232d=
2e393fa1c69</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Signed-off-by: Guillaume W. Bres &lt;<a href=
=3D"mailto:guillaume.bressaix@gmail.com" target=3D"_blank">guillaume.bressa=
ix@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:guillaume.bressaix@gma=
il.com" target=3D"_blank">guillaume.bressaix@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; This remains a python-package.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &#39;python setup.py&#39; actually hardcodes =
a system call to cmake,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; which seems dirty at first.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Fortunately, if we have CMAKE ENV, all BR var=
iables are retrieved.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 I don&#39;t see CMAKE_ENV anywhere in Build=
root, or in this patch.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Also, I don&#39;t think there&#39;s any way=
 to tell CMake about &quot;all BR variables&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0other than passing a toolchainfile (with -DCMAKE_TO=
OLCHAIN_FILE=3D...). Are you<br>
&gt;=C2=A0 =C2=A0 =C2=A0sure that it&#39;s really building correctly for th=
e target?<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Arnout<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I think they made this cmake call to make set=
up.py self sufficient.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0package/python-pybind/<a href=3D"=
http://python-pybind.mk" rel=3D"noreferrer" target=3D"_blank">python-pybind=
.mk</a> &lt;<a href=3D"http://python-pybind.mk" rel=3D"noreferrer" target=
=3D"_blank">http://python-pybind.mk</a>&gt; | 6 ++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A01 file changed, 6 insertions(+)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/package/python-pybind/<a href=3D=
"http://python-pybind.mk" rel=3D"noreferrer" target=3D"_blank">python-pybin=
d.mk</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://python-pybind.mk" rel=3D"nore=
ferrer" target=3D"_blank">http://python-pybind.mk</a>&gt; b/package/python-=
pybind/<a href=3D"http://python-pybind.mk" rel=3D"noreferrer" target=3D"_bl=
ank">python-pybind.mk</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://python-pybind.mk" rel=3D"nore=
ferrer" target=3D"_blank">http://python-pybind.mk</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index a6a1bdb976..080586a877 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/package/python-pybind/<a href=3D"http:/=
/python-pybind.mk" rel=3D"noreferrer" target=3D"_blank">python-pybind.mk</a=
> &lt;<a href=3D"http://python-pybind.mk" rel=3D"noreferrer" target=3D"_bla=
nk">http://python-pybind.mk</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/package/python-pybind/<a href=3D"http:/=
/python-pybind.mk" rel=3D"noreferrer" target=3D"_blank">python-pybind.mk</a=
> &lt;<a href=3D"http://python-pybind.mk" rel=3D"noreferrer" target=3D"_bla=
nk">http://python-pybind.mk</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -9,5 +9,11 @@ PYTHON_PYBIND_SITE =3D $(cal=
l<br>
&gt;=C2=A0 =C2=A0 =C2=A0github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0PYTHON_PYBIND_LICENSE =3D BSD-3-C=
lause<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0PYTHON_PYBIND_LICENSE_FILES =3D L=
ICENSE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0PYTHON_PYBIND_SETUP_TYPE =3D setu=
ptools<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +PYTHON_PYBIND_INSTALL_STAGING =3D YES<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +# every single &#39;python setup.py&#39; cal=
l actually calls cmake<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +# to populate $(@D)/pybind11 with .h and bui=
ld requirements.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +# If we have a HOST_CMAKE_ENV, then installa=
tion paths are properly defined<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +PYTHON_PYBIND_DEPENDENCIES =3D host-cmake<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0$(eval $(python-package))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; <br>
</blockquote></div>

--000000000000fac8d505d27f4059--

--===============4097945327926116903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4097945327926116903==--
