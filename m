Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E29C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 12:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6B0F81CD0;
	Mon,  6 Dec 2021 12:40:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J2C5JSA9uLLH; Mon,  6 Dec 2021 12:40:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFF7581CDC;
	Mon,  6 Dec 2021 12:40:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1CDA21BF41C
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 12:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CA1281CDC
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 12:40:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dTSxLyavk-5F for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 12:40:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9491581CD0
 for <buildroot@busybox.net>; Mon,  6 Dec 2021 12:40:16 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id k23so20754862lje.1
 for <buildroot@busybox.net>; Mon, 06 Dec 2021 04:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ONczIE6B4G2wDUpmm6HFZN3iO8aIQAUVmN/Q7gEWugo=;
 b=FTYxkFc5fiqqQpWcXhiHN/H0i0ey9Bx/8pMJxF2tQ26IBfCEpyB/w8926IAO7wBI3C
 xRywDzNPwuBoXwLjMnhMp/F99KDKemcxiR1AKmj3GsiIF8iXWXDqHeQliDAV9DaO8jAy
 VACH18pCuBhhcg8A+5GpFko53DXwXrhTl0DtpuKpM6E0JfQAV0Uj4TNU0sJLb21hfk/e
 FfhsoY+FKSBytVXoec3VMmIJT1xshHue52SIrUWUPD63dvcHi2kA9YcRh85H8YFfh2Rt
 klojlMiY8iA3GrPzWu6zFgJBxNN2GYa5wE8L5bzwA2iSt6gjlma/LE9HBiFDLDfHXrDg
 oUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ONczIE6B4G2wDUpmm6HFZN3iO8aIQAUVmN/Q7gEWugo=;
 b=08Z3dhjYwsCFbLwmnFH6+6UfWLn8bg0lpDtYHJiNQPIjp85Zn26pDP/37mkCH0VLzs
 ZC27foNHmkdJq44pDjJRspSR1i+v+GMpiyNR/RJJ395RZUPLjbbOe1AFTyJRPShCqk4t
 C0IuQcL532BJMljJc4Yumnv6fV5k+oPnwgl9HDIrvomyfCvIXMmUsOdc3OPEedOJcQ+j
 nyOwX/cUWPLbHrPjggj9ucuwBvuqNOPmP95wL/MMwTzTl+nkv3VFACorrLaVCh8WlUNZ
 wSonRA7Cv26hAbzNI0+bfKWaUVanrpCTZ1BntdxQmK7gfQsV64a1pbw7SLwHSqLk6mky
 zcjA==
X-Gm-Message-State: AOAM532rCOltpvsxlgP+FNyGFrPnO4LSIlQv5QsaX1hZJEbIjwsMk8wN
 PF3Cnb3akt9S6at+/AAeZn1EzegYqTDcerlHJSs=
X-Google-Smtp-Source: ABdhPJyN6Z43D66pKYjhaKDEw7DSb3ESRQKCM5OPHUCynDc2oZw4fxqdLLp7tSTZ/hyA6yiarAtWRJhOj21l7VjBrFE=
X-Received: by 2002:a2e:a54d:: with SMTP id e13mr34712581ljn.319.1638794414469; 
 Mon, 06 Dec 2021 04:40:14 -0800 (PST)
MIME-Version: 1.0
References: <20211205204720.2831-1-guillaume.bressaix@gmail.com>
 <1e21be4a-2465-e5c9-f775-0430cd3b0cf1@mind.be>
In-Reply-To: <1e21be4a-2465-e5c9-f775-0430cd3b0cf1@mind.be>
From: Guillaume Bres <guillaume.bressaix@gmail.com>
Date: Mon, 6 Dec 2021 13:39:48 +0100
Message-ID: <CAJe0E3fN-kd=q0wus32=XSdZW5i=PPvSJ1Kaxw=KA_THrAWFRA@mail.gmail.com>
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
Cc: buildroot@busybox.net, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="===============0625935521365897933=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0625935521365897933==
Content-Type: multipart/alternative; boundary="000000000000ef36c205d2798e09"

--000000000000ef36c205d2798e09
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Arnout,
thanks for the quick review

>Nitpick: to make it appear with the fixes tag in patchwork or in the
summary
>that Peter makes, you have to format it like this:
thanks, never done that before, I will correct that in a V2

>I don't see CMAKE_ENV anywhere in Buildroot, or in this patch.
I just meant the general cmake env. I will correct/improve my explanations
in a V2,
especially those, because they are to remain visible to clarify things in
case of future problems.

>  This is still looking fairly weird to me...
>Also, I don't think there's any way to tell CMake about "all BR variables"
>other than passing a toolchainfile (with -DCMAKE_TOOLCHAIN_FILE=3D...). Ar=
e
you
>sure that it's really building correctly for the target?
the package is broken, it put on hold for about 3 years now, some
interesting contributions I would like to submit. It would be nice to fix
it.

Yesterday you explained the pkg name and build infrastructure are total
different things and we agreed to convert to a cmake package.
In the meantime, I was exploring both options, with my goal being able to
provide target + staging + host (basically all 3) combinations.

I decided to keep it as a python-pkg and submit this content, in spite of
our conversation, as I ran into this fix unexpectedly.
I actually works (tested on 2 platforms), the intrinsic build failure is
fixed.

With the cmake-package option, that I also inquired intensively, I never
get a staging + target install, build fails.
With this option, all combinations pass.

>sure that it's really building correctly for the target?
My next submission is scipy and it relies on the host- version of this pkg
(now supposedly 2.8.1 if you merge patch #2).
And I just redid a test of the produced scipy binaries on my zedboard, they
work fine.
The problem to answer fully your question is that:
* no pkg currently depend on pybind
* my next submission depends on host-pybind (to be submitted after all the
fixing), not on target-pybind.
This is why I wanted to move this pkg to a host-only package, but Yann
corrected otherwise

I will wait for you answer before submitting a V2 depending on what we
decide

Guillaume W. Bres
Software engineer
<guillaume.bressaix@gmail.com>


Le lun. 6 d=C3=A9c. 2021 =C3=A0 08:45, Arnout Vandecappelle <arnout@mind.be=
> a =C3=A9crit :

>   Hi Guillaume,
>
>   This is still looking fairly weird to me...
>
> On 05/12/2021 21:47, guillaume.bressaix@gmail.com wrote:
> > From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
> >
> > The python 'setup.py' script needs header files
> > in $(@D)/pybind11 to work since v2.6.1, and these files
> > are created by an internal minimalist cmake build.
> >
> > fixes
> http://autobuild.buildroot.net/results/b89f1de64b308dffa73675f1f31ccb0b7b=
e5a10d
>
>   Nitpick: to make it appear with the fixes tag in patchwork or in the
> summary
> that Peter makes, you have to format it like this:
>
> Fixes:
>
> http://autobuild.buildroot.net/results/b89f1de64b308dffa73675f1f31ccb0b7b=
e5a10d
>      http://...
>
> > fixes
> http://autobuild.buildroot.net/results/d0287b7f64f206b0f074908c5780a3632e=
0cb799
> > fixes
> http://autobuild.buildroot.net/results/27efb545a5a719a5581c8f746d3a3555ff=
4216ce
> > fixes
> http://autobuild.buildroot.net/results/d2f0a0ad8f6c7178517df109e7d885dac9=
134c3a
> > fixes
> http://autobuild.buildroot.net/results/b57e9a3279260dae4a590f9421238fcabb=
2f7cab
> > fixes
> http://autobuild.buildroot.net/results/515e6f2fc6b5780260d98d6bb52b541ce4=
bf1afe
> > fixes
> http://autobuild.buildroot.net/results/d89c4ecc81222d4f80c951da2232d2e393=
fa1c69
> >
> > Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> >
> > ---
> > This remains a python-package.
> >
> > 'python setup.py' actually hardcodes a system call to cmake,
> > which seems dirty at first.
> > Fortunately, if we have CMAKE ENV, all BR variables are retrieved.
>
>   I don't see CMAKE_ENV anywhere in Buildroot, or in this patch.
>
>   Also, I don't think there's any way to tell CMake about "all BR
> variables"
> other than passing a toolchainfile (with -DCMAKE_TOOLCHAIN_FILE=3D...). A=
re
> you
> sure that it's really building correctly for the target?
>
>
>   Regards,
>   Arnout
>
>
> > I think they made this cmake call to make setup.py self sufficient.
> >
> > ---
> >   package/python-pybind/python-pybind.mk | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >
> > diff --git a/package/python-pybind/python-pybind.mk
> b/package/python-pybind/python-pybind.mk
> > index a6a1bdb976..080586a877 100644
> > --- a/package/python-pybind/python-pybind.mk
> > +++ b/package/python-pybind/python-pybind.mk
> > @@ -9,5 +9,11 @@ PYTHON_PYBIND_SITE =3D $(call
> github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))
> >   PYTHON_PYBIND_LICENSE =3D BSD-3-Clause
> >   PYTHON_PYBIND_LICENSE_FILES =3D LICENSE
> >   PYTHON_PYBIND_SETUP_TYPE =3D setuptools
> > +PYTHON_PYBIND_INSTALL_STAGING =3D YES
> > +
> > +# every single 'python setup.py' call actually calls cmake
> > +# to populate $(@D)/pybind11 with .h and build requirements.
> > +# If we have a HOST_CMAKE_ENV, then installation paths are properly
> defined
> > +PYTHON_PYBIND_DEPENDENCIES =3D host-cmake
> >
> >   $(eval $(python-package))
> >
>

--000000000000ef36c205d2798e09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Arnout,<br>thanks for the quick review<br><br>&gt;Nitpick:=
 to make it appear with the fixes tag in patchwork or in the summary<br>&gt=
;that Peter makes, you have to format it like this:<br>thanks, never done t=
hat before, I will correct that in a V2<br><br>&gt;I don&#39;t see CMAKE_EN=
V anywhere in Buildroot, or in this patch.<br>I just meant the=C2=A0general=
 cmake env. I will correct/improve my explanations in a V2,<div>especially =
those, because they are to remain visible to clarify things in case of futu=
re problems.<br><br>&gt;=C2=A0 This is still looking fairly weird to me...<=
br>&gt;Also, I don&#39;t think there&#39;s any way to tell CMake about &quo=
t;all BR variables&quot;<br>&gt;other than passing a toolchainfile (with -D=
CMAKE_TOOLCHAIN_FILE=3D...). Are you<br>&gt;sure that it&#39;s really build=
ing correctly for the target?<br>the package is=C2=A0broken, it put=C2=A0on=
 hold for about 3 years now, some interesting=C2=A0contributions I would li=
ke to submit. It would be nice to fix it.<br><br>Yesterday you explained th=
e pkg name and build infrastructure are total different things and we agree=
d to convert to a cmake package.<br>In the meantime, I was exploring both o=
ptions, with my goal being able to provide target=C2=A0+ staging=C2=A0+ hos=
t (basically all 3) combinations.<br><br>I decided to keep it as a python-p=
kg and submit this content, in spite of our conversation, as I ran into thi=
s fix unexpectedly.<br>I actually works (tested on 2 platforms), the intrin=
sic build failure is fixed.<br><br>With the cmake-package option, that=C2=
=A0I also inquired intensively, I never get a staging=C2=A0+ target install=
, build fails.</div><div>With this option, all combinations pass.<br><br>&g=
t;sure that it&#39;s really building correctly for the target?<br>My next s=
ubmission is scipy and it relies on the host- version of this pkg (now supp=
osedly 2.8.1 if you merge patch #2).<br>And I just redid a test of the prod=
uced scipy binaries on my zedboard, they work fine. <br>The problem to answ=
er fully your question is that:</div><div>* no pkg currently depend on pybi=
nd</div><div>* my next submission depends on host-pybind (to be submitted a=
fter all the fixing), not on target-pybind.<br>This is why I wanted to move=
 this pkg to a host-only package, but Yann corrected otherwise<br><br>I wil=
l wait for you answer before submitting a V2 depending on what we decide<br=
><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-sma=
rtmail=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r"><div dir=3D"ltr"><div><div><div><font face=3D"arial,helvetica,sans-serif=
">Guillaume W. Bres<br></font></div><font face=3D"arial,helvetica,sans-seri=
f">Software engineer</font><br></div><font face=3D"arial,helvetica,sans-ser=
if"></font></div><font face=3D"arial,helvetica,sans-serif">&lt;<a href=3D"m=
ailto:guillaume.bressaix@gmail.com" target=3D"_blank">guillaume.bressaix@gm=
ail.com</a>&gt;<br></font></div></div></div></div></div></div><br></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=
=C2=A0lun. 6 d=C3=A9c. 2021 =C3=A0=C2=A008:45, Arnout Vandecappelle &lt;<a =
href=3D"mailto:arnout@mind.be">arnout@mind.be</a>&gt; a =C3=A9crit=C2=A0:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 Hi Guillau=
me,<br>
<br>
=C2=A0 This is still looking fairly weird to me...<br>
<br>
On 05/12/2021 21:47, <a href=3D"mailto:guillaume.bressaix@gmail.com" target=
=3D"_blank">guillaume.bressaix@gmail.com</a> wrote:<br>
&gt; From: &quot;Guillaume W. Bres&quot; &lt;<a href=3D"mailto:guillaume.br=
essaix@gmail.com" target=3D"_blank">guillaume.bressaix@gmail.com</a>&gt;<br=
>
&gt; <br>
&gt; The python &#39;setup.py&#39; script needs header files<br>
&gt; in $(@D)/pybind11 to work since v2.6.1, and these files<br>
&gt; are created by an internal minimalist cmake build.<br>
&gt; <br>
&gt; fixes <a href=3D"http://autobuild.buildroot.net/results/b89f1de64b308d=
ffa73675f1f31ccb0b7be5a10d" rel=3D"noreferrer" target=3D"_blank">http://aut=
obuild.buildroot.net/results/b89f1de64b308dffa73675f1f31ccb0b7be5a10d</a><b=
r>
<br>
=C2=A0 Nitpick: to make it appear with the fixes tag in patchwork or in the=
 summary <br>
that Peter makes, you have to format it like this:<br>
<br>
Fixes:<br>
=C2=A0 =C2=A0 =C2=A0<a href=3D"http://autobuild.buildroot.net/results/b89f1=
de64b308dffa73675f1f31ccb0b7be5a10d" rel=3D"noreferrer" target=3D"_blank">h=
ttp://autobuild.buildroot.net/results/b89f1de64b308dffa73675f1f31ccb0b7be5a=
10d</a><br>
=C2=A0 =C2=A0 =C2=A0http://...<br>
<br>
&gt; fixes <a href=3D"http://autobuild.buildroot.net/results/d0287b7f64f206=
b0f074908c5780a3632e0cb799" rel=3D"noreferrer" target=3D"_blank">http://aut=
obuild.buildroot.net/results/d0287b7f64f206b0f074908c5780a3632e0cb799</a><b=
r>
&gt; fixes <a href=3D"http://autobuild.buildroot.net/results/27efb545a5a719=
a5581c8f746d3a3555ff4216ce" rel=3D"noreferrer" target=3D"_blank">http://aut=
obuild.buildroot.net/results/27efb545a5a719a5581c8f746d3a3555ff4216ce</a><b=
r>
&gt; fixes <a href=3D"http://autobuild.buildroot.net/results/d2f0a0ad8f6c71=
78517df109e7d885dac9134c3a" rel=3D"noreferrer" target=3D"_blank">http://aut=
obuild.buildroot.net/results/d2f0a0ad8f6c7178517df109e7d885dac9134c3a</a><b=
r>
&gt; fixes <a href=3D"http://autobuild.buildroot.net/results/b57e9a3279260d=
ae4a590f9421238fcabb2f7cab" rel=3D"noreferrer" target=3D"_blank">http://aut=
obuild.buildroot.net/results/b57e9a3279260dae4a590f9421238fcabb2f7cab</a><b=
r>
&gt; fixes <a href=3D"http://autobuild.buildroot.net/results/515e6f2fc6b578=
0260d98d6bb52b541ce4bf1afe" rel=3D"noreferrer" target=3D"_blank">http://aut=
obuild.buildroot.net/results/515e6f2fc6b5780260d98d6bb52b541ce4bf1afe</a><b=
r>
&gt; fixes <a href=3D"http://autobuild.buildroot.net/results/d89c4ecc81222d=
4f80c951da2232d2e393fa1c69" rel=3D"noreferrer" target=3D"_blank">http://aut=
obuild.buildroot.net/results/d89c4ecc81222d4f80c951da2232d2e393fa1c69</a><b=
r>
&gt; <br>
&gt; Signed-off-by: Guillaume W. Bres &lt;<a href=3D"mailto:guillaume.bress=
aix@gmail.com" target=3D"_blank">guillaume.bressaix@gmail.com</a>&gt;<br>
&gt; <br>
&gt; ---<br>
&gt; This remains a python-package.<br>
&gt; <br>
&gt; &#39;python setup.py&#39; actually hardcodes a system call to cmake,<b=
r>
&gt; which seems dirty at first.<br>
&gt; Fortunately, if we have CMAKE ENV, all BR variables are retrieved.<br>
<br>
=C2=A0 I don&#39;t see CMAKE_ENV anywhere in Buildroot, or in this patch.<b=
r>
<br>
=C2=A0 Also, I don&#39;t think there&#39;s any way to tell CMake about &quo=
t;all BR variables&quot; <br>
other than passing a toolchainfile (with -DCMAKE_TOOLCHAIN_FILE=3D...). Are=
 you <br>
sure that it&#39;s really building correctly for the target?<br>
<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
<br>
&gt; I think they made this cmake call to make setup.py self sufficient.<br=
>
&gt; <br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0package/python-pybind/<a href=3D"http://python-pybind.mk" =
rel=3D"noreferrer" target=3D"_blank">python-pybind.mk</a> | 6 ++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 6 insertions(+)<br>
&gt; <br>
&gt; diff --git a/package/python-pybind/<a href=3D"http://python-pybind.mk"=
 rel=3D"noreferrer" target=3D"_blank">python-pybind.mk</a> b/package/python=
-pybind/<a href=3D"http://python-pybind.mk" rel=3D"noreferrer" target=3D"_b=
lank">python-pybind.mk</a><br>
&gt; index a6a1bdb976..080586a877 100644<br>
&gt; --- a/package/python-pybind/<a href=3D"http://python-pybind.mk" rel=3D=
"noreferrer" target=3D"_blank">python-pybind.mk</a><br>
&gt; +++ b/package/python-pybind/<a href=3D"http://python-pybind.mk" rel=3D=
"noreferrer" target=3D"_blank">python-pybind.mk</a><br>
&gt; @@ -9,5 +9,11 @@ PYTHON_PYBIND_SITE =3D $(call github,pybind,pybind11,=
v$(PYTHON_PYBIND_VERSION))<br>
&gt;=C2=A0 =C2=A0PYTHON_PYBIND_LICENSE =3D BSD-3-Clause<br>
&gt;=C2=A0 =C2=A0PYTHON_PYBIND_LICENSE_FILES =3D LICENSE<br>
&gt;=C2=A0 =C2=A0PYTHON_PYBIND_SETUP_TYPE =3D setuptools<br>
&gt; +PYTHON_PYBIND_INSTALL_STAGING =3D YES<br>
&gt; +<br>
&gt; +# every single &#39;python setup.py&#39; call actually calls cmake<br=
>
&gt; +# to populate $(@D)/pybind11 with .h and build requirements.<br>
&gt; +# If we have a HOST_CMAKE_ENV, then installation paths are properly d=
efined<br>
&gt; +PYTHON_PYBIND_DEPENDENCIES =3D host-cmake<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0$(eval $(python-package))<br>
&gt; <br>
</blockquote></div>

--000000000000ef36c205d2798e09--

--===============0625935521365897933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0625935521365897933==--
