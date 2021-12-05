Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B73C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 11:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01651607D9;
	Sun,  5 Dec 2021 11:35:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ru-pYrRY4ylN; Sun,  5 Dec 2021 11:35:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED8FF608EF;
	Sun,  5 Dec 2021 11:35:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E163C1BF27E
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 11:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D03D2831F2
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 11:35:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gptZFs1ImOen for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 11:35:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4211B830C5
 for <buildroot@busybox.net>; Sun,  5 Dec 2021 11:35:50 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id b40so18167700lfv.10
 for <buildroot@busybox.net>; Sun, 05 Dec 2021 03:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=g1nUNfctEAxi56uS2HZ5t7FbtAC3TOgfi6ki1Lp1aOo=;
 b=S0BX+4+11ZPBQdZuZVD/9cqbLrOCQ8mWloM9ggVat2CuPHFU6jMGJLCVuWAaNWQHfe
 0j7PiVC2qRREdBQQNQEFAVS/k6d9QjNce3txOdHOrba6e364dzGn3CxTHDMQ7u9LtmzM
 +8I96WfFEr7xIYe/BOdPrX4hDIneGMXepaOcW+nUMJpw3Dli++G22b1sgiLc8HkjFNUo
 mFCeg0SqSBydv+ws/jCZPefKqKYfAc5E1+Wfue1trs404yO8eL/sibj+FUZyWgtzzKO1
 MisePSh5jygThnFKm14qSv5xkKj9d9QW7FY0cq1FiYx6tvegrRIUsHhuxHz99GqGWXRW
 KtXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=g1nUNfctEAxi56uS2HZ5t7FbtAC3TOgfi6ki1Lp1aOo=;
 b=o+ruMGO+gcw9/0zjGHaoPXgD+Nk+sFPCCYI4Nxkpjvu9bf2Xr9d6ZkXKA71TRfXOb2
 7LfvlQFA0PIwSFK3LYxds/tLahP1OLpm5HR9bUJ4kNDysDLchuraJ2J5CoZfhdgYmaXC
 PqpgmszUrfZI57Tg3RsR7bLDT2plIjs/vrBTxGeSYaXW+eyVi1pnQkUtd84fCNVhxEDV
 kWRPFiPbxRJ6F3VTV3RFBZt2eEqaba5uW2wkZbAnUahY1+E2nWzg3LVlRs8+KbC7NgPP
 8yiH6vRr7W/zeFcmgFvL2s20TJzbAvK3ehd4TVZGyGHW1Bc7d/w6kIFOURt/+pU+mFjy
 nKbQ==
X-Gm-Message-State: AOAM533xn40njKuoernYfTi8ZURoDhsP0SNzbu2hGI9aptwGwYNgn6WQ
 yFKn9XGIWeUwj6ZsmKwXp2trxV9F9GXsi/mtZfc=
X-Google-Smtp-Source: ABdhPJxjACIpBVruZYYSKZBgWX5IOeIq0cZWRmGIgFn2abuOoPVJTRseNVU1RshBb2tu23B9k+QAq9g0fGzxfHoRWes=
X-Received: by 2002:a05:6512:203:: with SMTP id
 a3mr29803625lfo.409.1638704148058; 
 Sun, 05 Dec 2021 03:35:48 -0800 (PST)
MIME-Version: 1.0
References: <20211204120548.31170-1-guillaume.bressaix@gmail.com>
 <20211204134625.GK50662@scaer>
In-Reply-To: <20211204134625.GK50662@scaer>
From: Guillaume Bres <guillaume.bressaix@gmail.com>
Date: Sun, 5 Dec 2021 12:35:20 +0100
Message-ID: <CAJe0E3f4nKJjniCNZOpT=JWPXpCk3JMhFPk0bLhHm+qoNb7S-w@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@busybox.net, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH/next v2 1/2]: pybind11: new package
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
Content-Type: multipart/mixed; boundary="===============8145316768992849825=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8145316768992849825==
Content-Type: multipart/alternative; boundary="000000000000a3189405d2648aa4"

--000000000000a3189405d2648aa4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Yann,
thanks for the feedback.

I integrated all your recommendations for my next submission, and I am
currently testing all combinations.
I will follow your suggestion and integrate this as a patch serie, so there
won't be an actual v3 follow up,
but this way you guys can see the whole picture.

First, here's the answer to your question that is still pending:

>But since this is the same upstream, you should just fix the existing
>pybind package in-place; there is no reason to intriduce a new pacjage
>to fix an existing one.

This is not doable, because of the python-pkg naming convention.
The previous approach was partially fine, that is true.
It delivered C++/Py bindings (and only those) and was built as a python-pkg=
.
So basically, the cmake side (Py/C++ bindings) was left out.
Now the package requires cmake whatever happens, therefore it can no longer
be a python-only package.

>why is a host-only package? If it installs C++ headers, then
>we can expect packages built for the target to include those headers,
>and so we need them in staging too. And this is made obvious by your
>post-install hook, that uses STAGING_DIR
I am in the process of testing all the combinations, but I managed to have
a target + staging install to also work.
This being a pure library, would be handy to other people that might have a
different use case than mine

Guillaume W. Bres
Software engineer
<guillaume.bressaix@gmail.com>


Le sam. 4 d=C3=A9c. 2021 =C3=A0 14:46, Yann E. MORIN <yann.morin.1998@free.=
fr> a
=C3=A9crit :

> Guillaume, All,
>
> On 2021-12-04 13:05 +0100, guillaume.bressaix@gmail.com spake thusly:
> > From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
> >
> > fixes
> http://autobuild.buildroot.net/results/b89f1de64b308dffa73675f1f31ccb0b7b=
e5a10d
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
> > list goes on..
> >
> > ---
> > v2: Reviewed by gwen@trabucayre.com,
> > Removed some non needed empty lines,
> > force -DFINDPYTHON=3DOFF when using pybind11 without python,
> > handle legacy package properly in a seperate patch
> >
> > v1: python-pybind was not the right approach and is in failure since
> > it's been upgraded to V2.6.1.
>
> This form here:
>
> > Building with setup.py now requires a cmake build first.
> > With this new approach we can build the package with cmake
> > for python bindings in C++ AND we also have the
> > C++ bindings in python as an option (depending & requiring the first
> one).
> >
> > I make this a host-only package, in the sense that other packages will
> > require it at build time, and I don't forsee any reasons to have
> > such a package as a target package.
> >
> > Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
>
> ... to here, should be part of the commit log, i.e. before the first
> '---' line, above. Otherwise, it is dropped by git when the patch is
> applied.
>
> However, I am still not sure what is going on here...
>
> First, you are removing pybind to then introduce pybind11, although they
> are the exact same package upstream:
>     http://pybind11.readthedocs.org/en/master (home)
>     https://github.com/pybind/pybind11 (repo)
>
> But since this is the same upstream, you should just fix the existing
> pybind package in-place; there is no reason to intriduce a new pacjage
> to fix an existing one.
>
> Then, I did not find the explanations in the commit log very convincing.
> Why state that "python-pybind was not the right approach"? As far as I
> understand, it was working as expected until the bump to 2.6.1, and thus
> was not a "failure".
>
> If the bump to 2.6.1 broke the package, then that means the bump was not
> careful, not that the package is a failure.
>
> Fionally, why is a host-only package? If it installs C++ headers, then
> we can expect packages built for the target to include those ehaders,
> and so we need them in staging too. And this is made obvious by your
> post-install hook, that uses STAGING_DIR. This is ultimately wrong,
> because then that means that host packages won't be able to find/use
> those headers.
>
> Minor nit: the commit log should not be in the first singular person,
> ie.e do not use "I", but in the `neutral' first person plural, i.e. use
> "we".
>
> However, I admit that the whole situation evades my understanding, so I
> may have miss more tricky details... I will gladly accept being
> corrected on those. ;-)
>
> Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------=
------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There i=
s
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------=
------'
>

--000000000000a3189405d2648aa4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Yann,<br>thanks for the feedback. <br><br>I integrat=
ed all your recommendations for my next submission, and I am currently test=
ing all combinations.<br><div>I will follow your suggestion=C2=A0and integr=
ate this as a patch serie, so there won&#39;t be an actual=C2=A0v3 follow u=
p, <br>but this way you guys can see the whole picture.<br><br>First, here&=
#39;s the answer to your question that is still pending:<br><br><div><div>&=
gt;But since this is the same upstream, you should just fix the existing<br=
>&gt;pybind package in-place; there is no reason to intriduce a new pacjage=
<br>&gt;to fix an existing one.</div><div><br>This is not doable, because o=
f the python-pkg naming convention.<br>The previous approach was partially =
fine, that is true.<br>It delivered C++/Py bindings (and only those) and wa=
s built as a python-pkg.<br>So basically, the cmake side (Py/C++ bindings) =
was left out.<br>Now the package requires cmake whatever happens, therefore=
 it can no longer be a python-only package.</div><div><div></div><div><br>&=
gt;why is a host-only package? If it installs C++ headers, then<br>&gt;we c=
an expect packages built for the target to include those headers,<br>&gt;an=
d so we need them in staging too. And this is made obvious by your<br>&gt;p=
ost-install hook, that uses STAGING_DIR<br>I am in the process of testing a=
ll the combinations, but I managed to have a target=C2=A0+ staging install =
to also work.<br>This being a pure library, would be handy to other people =
that might have a different use case than mine<br><br clear=3D"all"><div><d=
iv dir=3D"ltr" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div dir=
=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div><div><div><font face=3D"ari=
al,helvetica,sans-serif">Guillaume W. Bres<br></font></div><font face=3D"ar=
ial,helvetica,sans-serif">Software engineer</font><br></div><font face=3D"a=
rial,helvetica,sans-serif"></font></div><font face=3D"arial,helvetica,sans-=
serif">&lt;<a href=3D"mailto:guillaume.bressaix@gmail.com" target=3D"_blank=
">guillaume.bressaix@gmail.com</a>&gt;<br></font></div></div></div></div></=
div></div><br></div></div></div></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 4 d=C3=A9c. 2021 =C3=A0=
=C2=A014:46, Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr" t=
arget=3D"_blank">yann.morin.1998@free.fr</a>&gt; a =C3=A9crit=C2=A0:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Guillaume, All,<br>
<br>
On 2021-12-04 13:05 +0100, <a href=3D"mailto:guillaume.bressaix@gmail.com" =
target=3D"_blank">guillaume.bressaix@gmail.com</a> spake thusly:<br>
&gt; From: &quot;Guillaume W. Bres&quot; &lt;<a href=3D"mailto:guillaume.br=
essaix@gmail.com" target=3D"_blank">guillaume.bressaix@gmail.com</a>&gt;<br=
>
&gt; <br>
&gt; fixes <a href=3D"http://autobuild.buildroot.net/results/b89f1de64b308d=
ffa73675f1f31ccb0b7be5a10d" rel=3D"noreferrer" target=3D"_blank">http://aut=
obuild.buildroot.net/results/b89f1de64b308dffa73675f1f31ccb0b7be5a10d</a><b=
r>
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
&gt; list goes on..<br>
&gt; <br>
&gt; ---<br>
&gt; v2: Reviewed by <a href=3D"mailto:gwen@trabucayre.com" target=3D"_blan=
k">gwen@trabucayre.com</a>,<br>
&gt; Removed some non needed empty lines,<br>
&gt; force -DFINDPYTHON=3DOFF when using pybind11 without python,<br>
&gt; handle legacy package properly in a seperate patch<br>
&gt; <br>
&gt; v1: python-pybind was not the right approach and is in failure since<b=
r>
&gt; it&#39;s been upgraded to V2.6.1.<br>
<br>
This form here:<br>
<br>
&gt; Building with setup.py now requires a cmake build first.<br>
&gt; With this new approach we can build the package with cmake<br>
&gt; for python bindings in C++ AND we also have the<br>
&gt; C++ bindings in python as an option (depending &amp; requiring the fir=
st one).<br>
&gt; <br>
&gt; I make this a host-only package, in the sense that other packages will=
<br>
&gt; require it at build time, and I don&#39;t forsee any reasons to have<b=
r>
&gt; such a package as a target package.<br>
&gt; <br>
&gt; Signed-off-by: Guillaume W. Bres &lt;<a href=3D"mailto:guillaume.bress=
aix@gmail.com" target=3D"_blank">guillaume.bressaix@gmail.com</a>&gt;<br>
<br>
... to here, should be part of the commit log, i.e. before the first<br>
&#39;---&#39; line, above. Otherwise, it is dropped by git when the patch i=
s<br>
applied.<br>
<br>
However, I am still not sure what is going on here...<br>
<br>
First, you are removing pybind to then introduce pybind11, although they<br=
>
are the exact same package upstream:<br>
=C2=A0 =C2=A0 <a href=3D"http://pybind11.readthedocs.org/en/master" rel=3D"=
noreferrer" target=3D"_blank">http://pybind11.readthedocs.org/en/master</a>=
 (home)<br>
=C2=A0 =C2=A0 <a href=3D"https://github.com/pybind/pybind11" rel=3D"norefer=
rer" target=3D"_blank">https://github.com/pybind/pybind11</a> (repo)<br>
<br>
But since this is the same upstream, you should just fix the existing<br>
pybind package in-place; there is no reason to intriduce a new pacjage<br>
to fix an existing one.<br>
<br>
Then, I did not find the explanations in the commit log very convincing.<br=
>
Why state that &quot;python-pybind was not the right approach&quot;? As far=
 as I<br>
understand, it was working as expected until the bump to 2.6.1, and thus<br=
>
was not a &quot;failure&quot;.<br>
<br>
If the bump to 2.6.1 broke the package, then that means the bump was not<br=
>
careful, not that the package is a failure.<br>
<br>
Fionally, why is a host-only package? If it installs C++ headers, then<br>
we can expect packages built for the target to include those ehaders,<br>
and so we need them in staging too. And this is made obvious by your<br>
post-install hook, that uses STAGING_DIR. This is ultimately wrong,<br>
because then that means that host packages won&#39;t be able to find/use<br=
>
those headers.<br>
<br>
Minor nit: the commit log should not be in the first singular person,<br>
ie.e do not use &quot;I&quot;, but in the `neutral&#39; first person plural=
, i.e. use<br>
&quot;we&quot;.<br>
<br>
However, I admit that the whole situation evades my understanding, so I<br>
may have miss more tricky details... I will gladly accept being<br>
corrected on those. ;-)<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
-- <br>
.-----------------.--------------------.------------------.----------------=
----.<br>
|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded | /&quot;\ ASCII RIBBON | =
Erics&#39; conspiracy: |<br>
| +33 662 376 056 | Software=C2=A0 Designer | \ / CAMPAIGN=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 ___=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
| +33 561 099 427 `------------.-------:=C2=A0 X=C2=A0 AGAINST=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 \e/=C2=A0 There is no=C2=A0 |<br>
| <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer" target=3D"_bl=
ank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=A0 =C2=A0 =
|=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;------------------------------^-------^------------------^------------=
--------&#39;<br>
</blockquote></div>

--000000000000a3189405d2648aa4--

--===============8145316768992849825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8145316768992849825==--
