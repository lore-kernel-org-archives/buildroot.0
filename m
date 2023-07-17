Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1653EB64DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 15:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25D79605B3;
	Mon, 17 Jul 2023 15:48:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25D79605B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lqYYY82SA11t; Mon, 17 Jul 2023 15:48:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F215F60AA4;
	Mon, 17 Jul 2023 15:48:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F215F60AA4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C45B51BF341
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 15:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9AEC40209
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 15:48:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9AEC40209
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bIoEpdhXyU5V for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 15:48:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8665F4098B
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8665F4098B
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 15:48:08 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b701e1ca63so69763471fa.1
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 08:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689608886; x=1692200886;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V3neSE92EhgYmlQNW+OfaWFJm2p/nO6CRZ1w1epP5IY=;
 b=jq6LvTZn95boW6YaG7yvSYCD1mJkhO4FK18HW9kMUm5AQMKZWOHAHAlpOM5BfE/dqM
 FtQWEvNq4yFij3HG1d/CkmY6Cd2y80bgiLRBYGZ2zubFBjKQL8LCl9TEMhCZMepHfEGL
 VRbBBC5cadgp3ql/gx/LqkIiU43+KnF6U4/495B9HBun5+VeMuuKySeuWBf2/2/ObpBz
 9iBF42bDYtk/DOuvbh1MBWv9skfzr6RN8zv8TNt55DARf7qkpILhU2vLXmKKHPkYed4c
 gcgLG14qYSKjV41tgGWo0i222Wc3k0CLkjPnNDxGocXeqH/2Q7M40QnOodsRGgXNxr++
 AxpA==
X-Gm-Message-State: ABy/qLZVUizO9+wuM7zZwArxtXUPF0TzN0Df1fzT9aVC/8UhYuiQ35EW
 rb0cRD9jYHSMw7iahYpNn3wO3GW6cBaBcVDbRQg=
X-Google-Smtp-Source: APBJJlG+F152mt4ETJd8oEkmoBNIGEixkdRLpEve6wHQzBj6+v7M2k9oDiHCXSTcGt05TMI/YqwgkJgVWQIOAQm5KZM=
X-Received: by 2002:a2e:b055:0:b0:2b6:cf6f:159e with SMTP id
 d21-20020a2eb055000000b002b6cf6f159emr8229068ljl.44.1689608885829; Mon, 17
 Jul 2023 08:48:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAOLWrZ-zYdgpvg-UUrHb8-Y+dfSauONGxf+Uynjj0d7XQ2HFYQ@mail.gmail.com>
 <43b3c8f2-17f0-fe13-5421-49abb44f2481@mind.be>
In-Reply-To: <43b3c8f2-17f0-fe13-5421-49abb44f2481@mind.be>
From: Andreas <andreasembbuild@gmail.com>
Date: Mon, 17 Jul 2023 17:47:54 +0200
Message-ID: <CAOLWrZ-2fNdKRwKzgeENfD=-x7CWbUwxE-1M3cnMqPapHUiEMg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689608886; x=1692200886;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=V3neSE92EhgYmlQNW+OfaWFJm2p/nO6CRZ1w1epP5IY=;
 b=PA/J09L87qF+OnyhELEEcmzpMB/fYLaZYZ9xpIMzadK9fpqSUq4Kb1M1YH8m7uOtHX
 fidL+fG8fGwi+n2vuVRTnFiaA9RR0+ZIGLAd3lBvSQv9bv4gcKhjEWfzmMoKYqm04tkM
 ikqkhJ9xtUWERvS71LpGkczHE9xIqGzbt6tfTZANnzpN75OjFouSodeqYoCVvHE9928g
 kx82R0cHsBQLny0v/NcWLRV16m3/qtLyzsHQBQiZKPIALhnAxZAxxQ5u0pi8rVyHoq3C
 10pnQGwxXaLJAJ5bOfedIOoroS/fipU3maEObHYkUXa/CTR/IV63Wws6JdaJ3As8hxnu
 3vIA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=PA/J09L8
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2196423848282333798=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2196423848282333798==
Content-Type: multipart/alternative; boundary="0000000000007304570600b0b9da"

--0000000000007304570600b0b9da
Content-Type: text/plain; charset="UTF-8"

Hi Arnout,

Thanks for the quick response. I am indeed still on python 3.10.6 here. I
think upgrading might be a major exercise. It requires more than just
changing the version in packages/python3.mk doesn't it? Do I need to have
the same python version also on the host system? I am currently running
buildroot on a Ubuntu 22.04 VM.


Am Mo., 17. Juli 2023 um 17:19 Uhr schrieb Arnout Vandecappelle <
arnout@mind.be>:

>
>
> On 17/07/2023 16:10, Andreas wrote:
> > Hi,
> >
> > I am new to buildroot and I am trying to build the package
> > python-hatchling-1.18.0. However it fails with the following message:
> >
> > * Getting dependencies for wheel...
> >
> > ERROR Missing dependencies:
> > tomli>=1.2.2; python_version < '3.11'
>
>   That's really weird... This line means that it depends on tomli, but
> only for
> Python-3.10 or lower. Since we're using Python 3.11.4, this dependency
> shouldn't
> trigger at all... You're not using an old Buildroot version that still
> uses
> 3.10, are you?
>
>
> > make: *** [package/pkg-generic.mk:293 <http://pkg-generic.mk:293>:
> > /buildroot/output/build/python-hatchling-1.18.0/.stamp_built] Error 1
> >
> > The python-hatchling.mk <http://python-hatchling.mk> file looks as
> follows:
> >
> ################################################################################
> > #
> > # python-hatchling
> > #
> >
> ################################################################################
> >
> > PYTHON_HATCHLING_VERSION = 1.18.0
>
>   Erm, python-hatchling was added to Buildroot in commit
> 626c5bedaa7e1461dd3747562b9c04dd40713c83, in 2022.11. Have you tried just
> updating the existing package (and sending the patch upstream to us, of
> course)?
>
>   We only have a host package for it, because it's a pep517 so normally
> not
> useful on the target. Why do you need the target package?
>

Let me double check but you might be correct that I do not need it on the
target.

>
> > PYTHON_HATCHLING_SOURCE = hatchling-$(PYTHON_HATCHLING_VERSION).tar.gz
> > PYTHON_HATCHLING_SITE =
> >
> https://files.pythonhosted.org/packages/e3/57/87da2c5adc173950ebe9f1acce4d5f2cd0a960783992fd4879a899a0b637
> > PYTHON_HATCHLING_SETUP_TYPE = pep517
> > PYTHON_HATCHLING_LICENSE = MIT
> > PYTHON_HATCHLING_LICENSE_FILES = LICENSE.txt
> >
> > PYTHON_HATCHLING_DEPENDENCIES = \
> > python-tomli \
>
>   I think the problem is that pep517 checks for the presence of tomli in
> the
> _host_ directory. So you'd need to add a dependency on host-python-tomli
> here.
> James is more aware of these things so I put him in Cc.
>

I will first try to add the host dependency as you suggested below and see
what happens.


>
> > python-editables \
> > python-packaging \
> > python-pathspec \
> > python-pluggy \
> > python-trove-classifiers
> > HOST_PYTHON_HATCHLING_DEPENDENCIES = \
> > host-python-tomli \
> > host-python-editables \
> > host-python-packaging \
> > host-python-pathspec \
> > host-python-pluggy \
> > host-python-trove-classifiers
> >
> > $(eval $(python-package))
> > $(eval $(host-python-package))
> >
> > I do have a python-tomli.mk <http://python-tomli.mk> file therefore I
> am
> > confused why I am seeing this error. If I remove the tomli dependency
> from the
> > pyproject.toml file in hatchling (in
> output/build/python-hatchling-1.18.0)
> > manually it continoues the build.
> >
> > dependencies = [
> >    "editables>=0.3",
> >    "packaging>=21.3",
> >    "pathspec>=0.10.1",
> >    "pluggy>=1.0.0",
> >    "tomli>=1.2.2; python_version < '3.11'",
> >    "trove-classifiers",
> > ]
> >
> > My impression is that my current buildroot setup has a problem to
> properly
> > interpret the line ` "tomli>=1.2.2; python_version < '3.11'"` maybe
> because of
> > an outdated package that I am not aware of.
>
>   I think this way of expressing version-dependent dependencies is already
> pretty old, and certainly predates the pep517 infrastructure in Buildroot,
> so
> I'd be surprised if this were the case.
>

Well that is how the dependency is defined in hatchling defined it (see
here https://github.com/pypa/hatch/blob/master/backend/pyproject.toml)


>   Regards,
>   Arnout
>
> > Any idea how to address this issue
> > and how to debug such an error in buildroot in future? I already checked
> the
> > manual, especially the section for python packages.
> >
> > Regards,
> > Andreas
> >
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000007304570600b0b9da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Arnout,<div><br></div><div>Thanks for =
the quick response. I am indeed still on python 3.10.6 here. I think upgrad=
ing might be a major exercise. It requires more than just changing the vers=
ion in packages/<a href=3D"http://python3.mk">python3.mk</a> doesn&#39;t it=
? Do I need to have the same python version also on the host system? I am c=
urrently running buildroot on a Ubuntu 22.04 VM.</div><div><br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Am Mo.=
, 17. Juli 2023 um 17:19=C2=A0Uhr schrieb Arnout Vandecappelle &lt;<a href=
=3D"mailto:arnout@mind.be">arnout@mind.be</a>&gt;:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><br>
<br>
On 17/07/2023 16:10, Andreas wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; I am new to buildroot and I am trying to build the package <br>
&gt; python-hatchling-1.18.0. However it fails with the following message:<=
br>
&gt; <br>
&gt; * Getting dependencies for wheel...<br>
&gt; <br>
&gt; ERROR Missing dependencies:<br>
&gt; tomli&gt;=3D1.2.2; python_version &lt; &#39;3.11&#39;<br>
<br>
=C2=A0 That&#39;s really weird... This line means that it depends on tomli,=
 but only for <br>
Python-3.10 or lower. Since we&#39;re using Python 3.11.4, this dependency =
shouldn&#39;t <br>
trigger at all... You&#39;re not using an old Buildroot version that still =
uses <br>
3.10, are you?<br>
<br>
<br>
&gt; make: *** [package/<a href=3D"http://pkg-generic.mk:293" rel=3D"norefe=
rrer" target=3D"_blank">pkg-generic.mk:293</a> &lt;<a href=3D"http://pkg-ge=
neric.mk:293" rel=3D"noreferrer" target=3D"_blank">http://pkg-generic.mk:29=
3</a>&gt;: <br>
&gt; /buildroot/output/build/python-hatchling-1.18.0/.stamp_built] Error 1<=
br>
&gt; <br>
&gt; The <a href=3D"http://python-hatchling.mk" rel=3D"noreferrer" target=
=3D"_blank">python-hatchling.mk</a> &lt;<a href=3D"http://python-hatchling.=
mk" rel=3D"noreferrer" target=3D"_blank">http://python-hatchling.mk</a>&gt;=
 file looks as follows:<br>
&gt; ######################################################################=
##########<br>
&gt; #<br>
&gt; # python-hatchling<br>
&gt; #<br>
&gt; ######################################################################=
##########<br>
&gt; <br>
&gt; PYTHON_HATCHLING_VERSION =3D 1.18.0<br>
<br>
=C2=A0 Erm, python-hatchling was added to Buildroot in commit <br>
626c5bedaa7e1461dd3747562b9c04dd40713c83, in 2022.11. Have you tried just <=
br>
updating the existing package (and sending the patch upstream to us, of cou=
rse)?<br>
<br>
=C2=A0 We only have a host package for it, because it&#39;s a pep517 so nor=
mally not <br>
useful on the target. Why do you need the target package?<br></blockquote><=
div><br></div><div>Let me double check but you might be correct that I do n=
ot need it on the target.=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
&gt; PYTHON_HATCHLING_SOURCE =3D hatchling-$(PYTHON_HATCHLING_VERSION).tar.=
gz<br>
&gt; PYTHON_HATCHLING_SITE =3D <br>
&gt; <a href=3D"https://files.pythonhosted.org/packages/e3/57/87da2c5adc173=
950ebe9f1acce4d5f2cd0a960783992fd4879a899a0b637" rel=3D"noreferrer" target=
=3D"_blank">https://files.pythonhosted.org/packages/e3/57/87da2c5adc173950e=
be9f1acce4d5f2cd0a960783992fd4879a899a0b637</a><br>
&gt; PYTHON_HATCHLING_SETUP_TYPE =3D pep517<br>
&gt; PYTHON_HATCHLING_LICENSE =3D MIT<br>
&gt; PYTHON_HATCHLING_LICENSE_FILES =3D LICENSE.txt<br>
&gt; <br>
&gt; PYTHON_HATCHLING_DEPENDENCIES =3D \<br>
&gt; python-tomli \<br>
<br>
=C2=A0 I think the problem is that pep517 checks for the presence of tomli =
in the <br>
_host_ directory. So you&#39;d need to add a dependency on host-python-toml=
i here. <br>
James is more aware of these things so I put him in Cc.<br></blockquote><di=
v><br></div><div>I will first try to add the host dependency=C2=A0as you su=
ggested below and see what happens.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
&gt; python-editables \<br>
&gt; python-packaging \<br>
&gt; python-pathspec \<br>
&gt; python-pluggy \<br>
&gt; python-trove-classifiers<br>
&gt; HOST_PYTHON_HATCHLING_DEPENDENCIES =3D \<br>
&gt; host-python-tomli \<br>
&gt; host-python-editables \<br>
&gt; host-python-packaging \<br>
&gt; host-python-pathspec \<br>
&gt; host-python-pluggy \<br>
&gt; host-python-trove-classifiers<br>
&gt; <br>
&gt; $(eval $(python-package))<br>
&gt; $(eval $(host-python-package))<br>
&gt; <br>
&gt; I do have a <a href=3D"http://python-tomli.mk" rel=3D"noreferrer" targ=
et=3D"_blank">python-tomli.mk</a> &lt;<a href=3D"http://python-tomli.mk" re=
l=3D"noreferrer" target=3D"_blank">http://python-tomli.mk</a>&gt; file ther=
efore I am <br>
&gt; confused why I am seeing this error. If I remove the tomli dependency =
from the <br>
&gt; pyproject.toml file in hatchling (in output/build/python-hatchling-1.1=
8.0) <br>
&gt; manually it continoues=C2=A0the build.<br>
&gt; <br>
&gt; dependencies =3D [<br>
&gt;=C2=A0 =C2=A0 &quot;editables&gt;=3D0.3&quot;,<br>
&gt;=C2=A0 =C2=A0 &quot;packaging&gt;=3D21.3&quot;,<br>
&gt;=C2=A0 =C2=A0 &quot;pathspec&gt;=3D0.10.1&quot;,<br>
&gt;=C2=A0 =C2=A0 &quot;pluggy&gt;=3D1.0.0&quot;,<br>
&gt;=C2=A0 =C2=A0 &quot;tomli&gt;=3D1.2.2; python_version &lt; &#39;3.11&#3=
9;&quot;,<br>
&gt;=C2=A0 =C2=A0 &quot;trove-classifiers&quot;,<br>
&gt; ]<br>
&gt; <br>
&gt; My impression is that my current buildroot setup has a problem to prop=
erly <br>
&gt; interpret the line ` &quot;tomli&gt;=3D1.2.2; python_version &lt; &#39=
;3.11&#39;&quot;` maybe because of <br>
&gt; an outdated package that I am not aware of.<br>
<br>
=C2=A0 I think this way of expressing version-dependent dependencies is alr=
eady <br>
pretty old, and certainly predates the pep517 infrastructure in Buildroot, =
so <br>
I&#39;d be surprised if this were the case.<br></blockquote><div><br></div>=
<div>Well that is how the dependency is defined in hatchling defined it (se=
e here <a href=3D"https://github.com/pypa/hatch/blob/master/backend/pyproje=
ct.toml">https://github.com/pypa/hatch/blob/master/backend/pyproject.toml</=
a>)<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt; Any idea how to address=C2=A0this issue <br>
&gt; and=C2=A0how to debug such an error in=C2=A0buildroot in future? I alr=
eady checked the <br>
&gt; manual, especially the section for python packages.<br>
&gt; <br>
&gt; Regards,<br>
&gt; Andreas<br>
&gt; <br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
</blockquote></div></div>

--0000000000007304570600b0b9da--

--===============2196423848282333798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2196423848282333798==--
