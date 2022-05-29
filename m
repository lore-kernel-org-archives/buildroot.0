Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18ACEC433F5
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 19:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5AE183339;
	Sun, 29 May 2022 19:41:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xj9kaauJXgQm; Sun, 29 May 2022 19:41:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7857D831E3;
	Sun, 29 May 2022 19:41:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E56EF1BF3C3
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 19:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D252940ACA
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 19:41:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BtGQlOOiXwEE for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 19:41:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 975B840915
 for <buildroot@buildroot.org>; Sun, 29 May 2022 19:41:36 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 30-20020a9d0121000000b0060ae97b9967so6494154otu.7
 for <buildroot@buildroot.org>; Sun, 29 May 2022 12:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g6++p2CnQ/+agWyq8rZpYWTrhBISJ2CfYuRoYRy8zW0=;
 b=YPAb9lG/vNkm7cpFjqDmoCOa0YBetA5ieRmcKTwhe5DRDlUw/9q81jy3nQePXRiusm
 2SC1ZsolMWOFpRzjDTs6yDKys5IPgpf5ODLaoz3ivoQdW+KOS6sBJUrbaIBnDuR08auU
 qgn50o6dkZA/2Q8V0PQdWbquA36i1KCUHeh8DhhyQtyOQNJmfJBpIHemh4ObpessPJa3
 eI3r+5CPZaXY9zZh58ygT7yYXeArzSFAZxvqmU+/U7YLDaDBJ62M7iCPJ8in+HAm3YjC
 WMH3ouJT1GCDYV3Us0MdgQerNM4Geq6jI6WcOJNrHiLnpoqlF0UFhpTKFXpM2u8dsFyj
 6i1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g6++p2CnQ/+agWyq8rZpYWTrhBISJ2CfYuRoYRy8zW0=;
 b=DeAhkS/o3fYDeWSERU/EV783E6AZeT+2I2LrvO8Wg75guE5L1xFvGsr/SQq1rvHjv+
 x9xLzHOyqb+KqruSNabd3ygz+h5tIjY+Xoln20IXgZK6p295vZnxDknPJ22uq+hGnFqV
 aQpTqKkCAMgynZQ7p6gRaFZrUzk/+WWucjdB/vayj1T1JzvAvoFmTg9ONPF/yqQy0gGE
 Wa1kj6Lzn6bl5gfmCyr5DelOsSxXJtfh7zYyi+VprOoxnazBcN4Nz4LPyBx2C117IC4i
 7fRF5vBEOs0bk0RKvfaXhR3eY3GRYhGJiLQg91ePjNin+Fh2LCpbcB2AbTiQi8vuV9Di
 7Rsw==
X-Gm-Message-State: AOAM5302pspPBueOCcDmp435Q035HKwhSFJHUMoEL5gSNXMKpF8lvoMF
 nsl2Q+dF1AJUyQ9N738UbW/T96ZZpZDnSr7Xr6g=
X-Google-Smtp-Source: ABdhPJx0NM8v86x6tPtRVgNrKbwg8VFvuTFXJWWMwoRjvAM4eGYHEUd9991jbrq5tIzVQWJHJXuQZJdqQhdCT6OmJCg=
X-Received: by 2002:a05:6830:4414:b0:60b:436f:d9c2 with SMTP id
 q20-20020a056830441400b0060b436fd9c2mr6698419otv.151.1653853295621; Sun, 29
 May 2022 12:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220517200923.1516695-1-james.hilliard1@gmail.com>
 <7585dcea-4e32-a582-e138-e7e225609398@gmail.com>
In-Reply-To: <7585dcea-4e32-a582-e138-e7e225609398@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 29 May 2022 13:41:22 -0600
Message-ID: <CADvTj4re+hCC9n=HRMsLQ+SaEPPH=XBkCG83mTp_U79rr9Nvyg@mail.gmail.com>
To: Romain Naour <romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flask: bump to version
 2.1.2
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
Cc: Lionel Flandrin <lionel@svkt.org>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============4378485393638607800=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4378485393638607800==
Content-Type: multipart/alternative; boundary="000000000000323b9e05e02bbaec"

--000000000000323b9e05e02bbaec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 29, 2022, 1:29 PM Romain Naour <romain.naour@gmail.com> wrote:

> Hello James,
>
> Le 17/05/2022 =C3=A0 22:09, James Hilliard a =C3=A9crit :
> > License hash change due to license title syntax change:
> >
> https://github.com/pallets/flask/commit/9e7d3a6b694b27f997266889ae463e06d=
d83a189
>
> This patch along with python-werkzeug version bump [1] fixes the
> tests.package.test_python_flask.TestPythonPy3Flask build issue in
> gitlab-ci [2].
>
> This test fail since the python-jinja2 version bump 3.1.2 [3].
>
> Do you know if bumping python-flash and python-werkzeug may introduce oth=
er
> runtime issue? Is any followup version bump required?
>
I sent a few python package bumps that should fix it.

> Is reverting python-jinja2 safe?
>
It's used by stuff other than flask so best to apply my patches bumping the
flask deps think.

>
> Tested-by: Romain Naour <romain.naour@gmail.com>
>
> [1]
>
> http://patchwork.ozlabs.org/project/buildroot/patch/20220517201249.151835=
8-1-james.hilliard1@gmail.com/
> [2] https://gitlab.com/buildroot.org/buildroot/-/jobs/2491321291
> [3] http://lists.busybox.net/pipermail/buildroot/2022-May/642942.html
>
> Best regards,
> Romain
>
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/python-flask/python-flask.hash | 13 ++++++-------
> >  package/python-flask/python-flask.mk   |  4 ++--
> >  2 files changed, 8 insertions(+), 9 deletions(-)
> >
> > diff --git a/package/python-flask/python-flask.hash
> b/package/python-flask/python-flask.hash
> > index c6ccd633f8..5f19a450a1 100644
> > --- a/package/python-flask/python-flask.hash
> > +++ b/package/python-flask/python-flask.hash
> > @@ -1,7 +1,6 @@
> > -# From
> https://pypi.org/project/Flask/#copy-hash-modal-911ffb67-fe84-4e25-a1a9-f=
4c745a0a980
> > -md5  0da4145d172993cd28a6c619630cc19c  Flask-1.1.2.tar.gz
> > -sha256
>  4efa1ae2d7c9865af48986de8aeb8504bf32c7f3d6fdc9353d34b21f4b127060
> Flask-1.1.2.tar.gz
> > -
> > -# License files
> > -sha256
>  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea
> LICENSE.rst
> > -sha256
>  0ef3ae025f4a398761079f0d687ff3d66f4fef3a32ac2607318e909c0cba9150
> docs/license.rst
> > +# md5, sha256 from https://pypi.org/pypi/flask/json
> > +md5  93f1832e5be704ef6ff2a4124579cd85  Flask-2.1.2.tar.gz
> > +sha256
> 315ded2ddf8a6281567edb27393010fe3406188bafbfe65a3339d5787d89e477
> Flask-2.1.2.tar.gz
> > +# Locally computed sha256 checksums
> > +sha256
> 489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea
> LICENSE.rst
> > +sha256
> 7535eac513edd12fb8e33f203c6a403549629e34b363418cdbd6c6ea5464515d
> docs/license.rst
> > diff --git a/package/python-flask/python-flask.mk
> b/package/python-flask/python-flask.mk
> > index 077aa600b8..b684aff480 100644
> > --- a/package/python-flask/python-flask.mk
> > +++ b/package/python-flask/python-flask.mk
> > @@ -4,9 +4,9 @@
> >  #
> >
> #########################################################################=
#######
> >
> > -PYTHON_FLASK_VERSION =3D 1.1.2
> > +PYTHON_FLASK_VERSION =3D 2.1.2
> >  PYTHON_FLASK_SOURCE =3D Flask-$(PYTHON_FLASK_VERSION).tar.gz
> > -PYTHON_FLASK_SITE =3D
> https://files.pythonhosted.org/packages/4e/0b/cb02268c90e67545a0e3a37ea1c=
a3d45de3aca43ceb7dbf1712fb5127d5d
> > +PYTHON_FLASK_SITE =3D
> https://files.pythonhosted.org/packages/d3/3c/94f38d4db919a9326a706ad56f0=
5a7e6f0c8f7b7d93e2997cca54d3bc14b
> >  PYTHON_FLASK_SETUP_TYPE =3D setuptools
> >  PYTHON_FLASK_LICENSE =3D BSD-3-Clause
> >  PYTHON_FLASK_LICENSE_FILES =3D LICENSE.rst docs/license.rst
>
>

--000000000000323b9e05e02bbaec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sun, May 29, 2022, 1:29 PM Romain Naour &lt;<a href=
=3D"mailto:romain.naour@gmail.com">romain.naour@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">Hello James,<br>
<br>
Le 17/05/2022 =C3=A0 22:09, James Hilliard a =C3=A9crit=C2=A0:<br>
&gt; License hash change due to license title syntax change:<br>
&gt; <a href=3D"https://github.com/pallets/flask/commit/9e7d3a6b694b27f9972=
66889ae463e06dd83a189" rel=3D"noreferrer noreferrer" target=3D"_blank">http=
s://github.com/pallets/flask/commit/9e7d3a6b694b27f997266889ae463e06dd83a18=
9</a><br>
<br>
This patch along with python-werkzeug version bump [1] fixes the<br>
tests.package.test_python_flask.TestPythonPy3Flask build issue in gitlab-ci=
 [2].<br>
<br>
This test fail since the python-jinja2 version bump 3.1.2 [3].<br>
<br>
Do you know if bumping python-flash and python-werkzeug may introduce other=
<br>
runtime issue? Is any followup version bump required?<br></blockquote></div=
></div><div dir=3D"auto">I sent a few python package bumps that should fix =
it.</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">
Is reverting python-jinja2 safe?<br></blockquote></div></div><div dir=3D"au=
to">It&#39;s used by stuff other than flask so best to apply my patches bum=
ping the flask deps think.</div><div dir=3D"auto"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
<br>
Tested-by: Romain Naour &lt;<a href=3D"mailto:romain.naour@gmail.com" targe=
t=3D"_blank" rel=3D"noreferrer">romain.naour@gmail.com</a>&gt;<br>
<br>
[1]<br>
<a href=3D"http://patchwork.ozlabs.org/project/buildroot/patch/202205172012=
49.1518358-1-james.hilliard1@gmail.com/" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">http://patchwork.ozlabs.org/project/buildroot/patch/202205172=
01249.1518358-1-james.hilliard1@gmail.com/</a><br>
[2] <a href=3D"https://gitlab.com/buildroot.org/buildroot/-/jobs/2491321291=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.com/buildr=
oot.org/buildroot/-/jobs/2491321291</a><br>
[3] <a href=3D"http://lists.busybox.net/pipermail/buildroot/2022-May/642942=
.html" rel=3D"noreferrer noreferrer" target=3D"_blank">http://lists.busybox=
.net/pipermail/buildroot/2022-May/642942.html</a><br>
<br>
Best regards,<br>
Romain<br>
<br>
&gt; <br>
&gt; Signed-off-by: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gm=
ail.com" target=3D"_blank" rel=3D"noreferrer">james.hilliard1@gmail.com</a>=
&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/python-flask/python-flask.hash | 13 ++++++-------<br>
&gt;=C2=A0 package/python-flask/<a href=3D"http://python-flask.mk" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">python-flask.mk</a>=C2=A0 =C2=A0|=
=C2=A0 4 ++--<br>
&gt;=C2=A0 2 files changed, 8 insertions(+), 9 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/python-flask/python-flask.hash b/package/python-f=
lask/python-flask.hash<br>
&gt; index c6ccd633f8..5f19a450a1 100644<br>
&gt; --- a/package/python-flask/python-flask.hash<br>
&gt; +++ b/package/python-flask/python-flask.hash<br>
&gt; @@ -1,7 +1,6 @@<br>
&gt; -# From <a href=3D"https://pypi.org/project/Flask/#copy-hash-modal-911=
ffb67-fe84-4e25-a1a9-f4c745a0a980" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://pypi.org/project/Flask/#copy-hash-modal-911ffb67-fe84-4e25-=
a1a9-f4c745a0a980</a><br>
&gt; -md5=C2=A0 0da4145d172993cd28a6c619630cc19c=C2=A0 Flask-1.1.2.tar.gz<b=
r>
&gt; -sha256=C2=A0 =C2=A0 =C2=A0 =C2=A04efa1ae2d7c9865af48986de8aeb8504bf32=
c7f3d6fdc9353d34b21f4b127060=C2=A0 Flask-1.1.2.tar.gz<br>
&gt; -<br>
&gt; -# License files<br>
&gt; -sha256=C2=A0 =C2=A0 =C2=A0 =C2=A0489a8e1108509ed98a37bb983e11e0f7e1d3=
1f0bd8f99a79c8448e7ff37d07ea=C2=A0 LICENSE.rst<br>
&gt; -sha256=C2=A0 =C2=A0 =C2=A0 =C2=A00ef3ae025f4a398761079f0d687ff3d66f4f=
ef3a32ac2607318e909c0cba9150=C2=A0 docs/license.rst<br>
&gt; +# md5, sha256 from <a href=3D"https://pypi.org/pypi/flask/json" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://pypi.org/pypi/flask/js=
on</a><br>
&gt; +md5=C2=A0 93f1832e5be704ef6ff2a4124579cd85=C2=A0 Flask-2.1.2.tar.gz<b=
r>
&gt; +sha256=C2=A0 315ded2ddf8a6281567edb27393010fe3406188bafbfe65a3339d578=
7d89e477=C2=A0 Flask-2.1.2.tar.gz<br>
&gt; +# Locally computed sha256 checksums<br>
&gt; +sha256=C2=A0 489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7f=
f37d07ea=C2=A0 LICENSE.rst<br>
&gt; +sha256=C2=A0 7535eac513edd12fb8e33f203c6a403549629e34b363418cdbd6c6ea=
5464515d=C2=A0 docs/license.rst<br>
&gt; diff --git a/package/python-flask/<a href=3D"http://python-flask.mk" r=
el=3D"noreferrer noreferrer" target=3D"_blank">python-flask.mk</a> b/packag=
e/python-flask/<a href=3D"http://python-flask.mk" rel=3D"noreferrer norefer=
rer" target=3D"_blank">python-flask.mk</a><br>
&gt; index 077aa600b8..b684aff480 100644<br>
&gt; --- a/package/python-flask/<a href=3D"http://python-flask.mk" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">python-flask.mk</a><br>
&gt; +++ b/package/python-flask/<a href=3D"http://python-flask.mk" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">python-flask.mk</a><br>
&gt; @@ -4,9 +4,9 @@<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 ################################################################=
################<br>
&gt;=C2=A0 <br>
&gt; -PYTHON_FLASK_VERSION =3D 1.1.2<br>
&gt; +PYTHON_FLASK_VERSION =3D 2.1.2<br>
&gt;=C2=A0 PYTHON_FLASK_SOURCE =3D Flask-$(PYTHON_FLASK_VERSION).tar.gz<br>
&gt; -PYTHON_FLASK_SITE =3D <a href=3D"https://files.pythonhosted.org/packa=
ges/4e/0b/cb02268c90e67545a0e3a37ea1ca3d45de3aca43ceb7dbf1712fb5127d5d" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://files.pythonhosted.org=
/packages/4e/0b/cb02268c90e67545a0e3a37ea1ca3d45de3aca43ceb7dbf1712fb5127d5=
d</a><br>
&gt; +PYTHON_FLASK_SITE =3D <a href=3D"https://files.pythonhosted.org/packa=
ges/d3/3c/94f38d4db919a9326a706ad56f05a7e6f0c8f7b7d93e2997cca54d3bc14b" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://files.pythonhosted.org=
/packages/d3/3c/94f38d4db919a9326a706ad56f05a7e6f0c8f7b7d93e2997cca54d3bc14=
b</a><br>
&gt;=C2=A0 PYTHON_FLASK_SETUP_TYPE =3D setuptools<br>
&gt;=C2=A0 PYTHON_FLASK_LICENSE =3D BSD-3-Clause<br>
&gt;=C2=A0 PYTHON_FLASK_LICENSE_FILES =3D LICENSE.rst docs/license.rst<br>
<br>
</blockquote></div></div></div>

--000000000000323b9e05e02bbaec--

--===============4378485393638607800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4378485393638607800==--
