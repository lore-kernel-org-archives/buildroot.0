Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB2AC61DA4
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 09:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55D0060D70;
	Thu,  9 Feb 2023 09:29:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55D0060D70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eqf2nN8lbgKS; Thu,  9 Feb 2023 09:29:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79E9E60BF3;
	Thu,  9 Feb 2023 09:29:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79E9E60BF3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8658B1BF28D
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 09:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 601F0404AE
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 09:28:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 601F0404AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OSmgFYAZ5LBR for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 09:28:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 382454011B
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 382454011B
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 09:28:57 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1442977d77dso1793683fac.6
 for <buildroot@buildroot.org>; Thu, 09 Feb 2023 01:28:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NQj5yzqmKSZzUSw46tG65K1KmC5ZjvhHMYzfqvG+TGw=;
 b=Tppfa7tE1nvxXONj3uHkU3xkqeuMRpXGxj8O4+ZEWwZwDLIkhziGt86XkT3h4qsOep
 +gF6OWRBs2Tb3cJjQnVOHwLt7dDf4t31eRXa2ZqtnTVX4oy03viIyr9zpSGuJ5P/+l19
 OBIBRddIBkUu14W7yiXtfuE6dI+Jvgsj/WgmeO/9/NAAQVAwrEZHpJicQYiNs+r0sHtC
 qakLJUdnv+Gw3EXFBh/mAo1QvUkd2mg5cmd5xUZipAPDp8VtCpSpJWmu/qCQYeHG7oCy
 OSHSBVR7cFHiw1kdJeme7DDwWRCMXWl1yqt3T7eZ9ytcgDAt47gwAPslpmTJjkv94oo2
 FtJg==
X-Gm-Message-State: AO0yUKV759rX5Vl1GOedCFU3x2o8X4y6cZKhdhuEQAYaOvoIiccmUbo+
 FGjH1hflfG06CBf6dy5/iHuOQ+MX4AJQQ2YTiRc=
X-Google-Smtp-Source: AK7set8FW6akXf1vJ8YAStYI3GDU/YbtnAtXH0VU8QVRC8nMqA/1qhi6eTp4ESXczfhIEei9YKBxzfnB4GMojOQtS2k=
X-Received: by 2002:a05:6870:5691:b0:161:a7f6:af1 with SMTP id
 p17-20020a056870569100b00161a7f60af1mr733285oao.131.1675934936070; Thu, 09
 Feb 2023 01:28:56 -0800 (PST)
MIME-Version: 1.0
References: <CADYjeSsqfaF0P7g_hxQ2EjSh=zDG9=FTnLrbq5g4+22UNJq-xw@mail.gmail.com>
 <CACHw65+r07g=hU4yv1Xhb3TFVmOVkYdSpRy3dZF9y+U44TK=Qw@mail.gmail.com>
 <CADYjeStPWnGcr23XOGnB+61eZ=iZKVj8YkhDKSaw0BUFT7WC-A@mail.gmail.com>
 <36be5bdc-591c-71cb-ea31-9e38ae8d643d@inbox.ru>
 <CADYjeSuvmoMXDGgN9rmv+RecroVxqj1_d9x3G4iakwkvLs+j9Q@mail.gmail.com>
 <22e489f3-cc1d-985d-cca6-18f4f6ddecfa@inbox.ru>
 <CADYjeSuBvHsij7YTnyq5tW9jEv1JtV3u1WyYkX2cbffgkQ6_Kw@mail.gmail.com>
 <a481ffb1-5c10-d913-0f8a-cbb5e11ff631@inbox.ru>
 <CADYjeStesndVUqdWqmPVP5=xfW1PFcwzNk=9o0TUM+tXBez8mA@mail.gmail.com>
 <eeb3b4bc-12fa-eea5-4ec0-89c90ac75394@inbox.ru>
In-Reply-To: <eeb3b4bc-12fa-eea5-4ec0-89c90ac75394@inbox.ru>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Thu, 9 Feb 2023 10:28:47 +0100
Message-ID: <CADYjeStwFSJQDFvj2z5bAURD0eTLVgYrpEvdEdYMbbVkJmJupQ@mail.gmail.com>
To: Maxim Kochetkov <fido_max@inbox.ru>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NQj5yzqmKSZzUSw46tG65K1KmC5ZjvhHMYzfqvG+TGw=;
 b=GKXcuHLilSrGmja2/s+bzmvQkca9WE9p8cSGBbsiz7nRUqsOw4yhP5JqiRiSWL5xOM
 GR5sPwSY8bm8ZG32eSxmGLzgCkpazRfYyn4ZEOFsVwiIkJWV1qam+Ox3rjAalFUEiwP7
 qmKCA5IQUJWFrjzS/eDlOqynbvG93ad1YDMi4avy2eV+Eqz2bZJRtxhxpngqsy7NbXAK
 8x542pkOmJBVpTzxCMGF+7Hly485AlzVVb5TSR6RTAhfALG66l4D8mOa9XDZuUaO/awq
 yuD0M1y9Tp8PqYRp6U8xeCT/lxm0WRNwGvlZRPnQoFwMRXUpCuJjXCu14O4DWNrrp//A
 qfWQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GKXcuHLi
Subject: Re: [Buildroot] How to install custom sdk in buildroot?
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
Cc: Ramon Crichlow <rcrichlow9000@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0659444224464292659=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0659444224464292659==
Content-Type: multipart/alternative; boundary="00000000000087fd9b05f4410216"

--00000000000087fd9b05f4410216
Content-Type: text/plain; charset="UTF-8"

Hi Maxim,

I was missing python setuptools on my host. After installing it, I can add
the package. Also, the added package is available in menuconfig

Thank you for the support!

On Thu, 9 Feb 2023 at 10:10, Maxim Kochetkov <fido_max@inbox.ru> wrote:

>
>
> On 09.02.2023 12:03, Sourabh Hegde wrote:
> > Hello Maxim,
> >
> > Update:
> >
> > The above issue resolved by itself!
> >
> > Now when I do: utils/scanpypi awscrt -o package , it says
> >
> > spdx_lookup module is not installed. This can lead to an inaccurate
> > licence detection. Please install it via
> > pip install spdx_lookup
> > buildroot package name for awscrt: python-awscrt
> > Package: python-awscrt
> > Fetching package awscrt
> > ERROR: Could not find package awscrt.
> > Check syntax inside the python package index:
> > https://pypi.python.org/pypi/ <https://pypi.python.org/pypi/>
> >
> > But the package is available at https://pypi.org/project/awscrt/
> > <https://pypi.org/project/awscrt/>
>
> It works fine for me:
>
> buildroot package name for awscrt: python-awscrt
> Package: python-awscrt
> Fetching package awscrt
> Downloading package awscrt from
>
> https://files.pythonhosted.org/packages/ae/98/dda092078f2d47bad08e184ab9d364b8f89166497062bc1cf811c0bbbde2/awscrt-0.16.10.tar.gz.
> ..
> Checking if package package/python-awscrt already exists...
> Creating package/python-awscrt/python-awscrt.mk...
> More than one file found for license: LICENSE, crt/aws-c-common/LICENSE,
> crt/aws-c-io/LICENSE, crt/aws-lc/LICENSE,
> crt/aws-lc/third_party/fiat/LICENSE, crt/aws-c-mqtt/LICENSE,
> crt/aws-checksums/LICENSE, crt/aws-c-s3/LICENSE,
> crt/aws-c-compression/LICENSE, crt/aws-c-http/LICENSE,
> crt/aws-c-sdkutils/LICENSE, crt/s2n/LICENSE, crt/aws-c-cal/LICENSE,
> crt/aws-c-auth/LICENSE, crt/aws-c-event-stream/LICENSE
> Creating package/python-awscrt/python-awscrt.hash...
> Creating package/python-awscrt/Config.in...
> NOTE: Remember to also make an update to the DEVELOPERS file
>        and include an entry for the pkg in packages/Config.in
>
>

--00000000000087fd9b05f4410216
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Maxim,<div><br></div><div>I was missing python setuptoo=
ls on my host. After installing it, I can add the package. Also, the added =
package is available in menuconfig</div><div><br></div><div>Thank you for t=
he support!</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Thu, 9 Feb 2023 at 10:10, Maxim Kochetkov &lt;<a href=
=3D"mailto:fido_max@inbox.ru">fido_max@inbox.ru</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 09.02.2023 12:03, Sourabh Hegde wrote:<br>
&gt; Hello Maxim,<br>
&gt; <br>
&gt; Update:<br>
&gt; <br>
&gt; The above issue resolved by itself!<br>
&gt; <br>
&gt; Now when I do:=C2=A0utils/scanpypi awscrt -o package , it says<br>
&gt; <br>
&gt; spdx_lookup module is not installed. This can lead to an inaccurate <b=
r>
&gt; licence detection. Please install it via<br>
&gt; pip install spdx_lookup<br>
&gt; buildroot package name for awscrt: python-awscrt<br>
&gt; Package: python-awscrt<br>
&gt; Fetching package awscrt<br>
&gt; ERROR: Could not find package awscrt.<br>
&gt; Check syntax inside the python package index:<br>
&gt; <a href=3D"https://pypi.python.org/pypi/" rel=3D"noreferrer" target=3D=
"_blank">https://pypi.python.org/pypi/</a> &lt;<a href=3D"https://pypi.pyth=
on.org/pypi/" rel=3D"noreferrer" target=3D"_blank">https://pypi.python.org/=
pypi/</a>&gt;<br>
&gt; <br>
&gt; But the package is available=C2=A0at <a href=3D"https://pypi.org/proje=
ct/awscrt/" rel=3D"noreferrer" target=3D"_blank">https://pypi.org/project/a=
wscrt/</a> <br>
&gt; &lt;<a href=3D"https://pypi.org/project/awscrt/" rel=3D"noreferrer" ta=
rget=3D"_blank">https://pypi.org/project/awscrt/</a>&gt;<br>
<br>
It works fine for me:<br>
<br>
buildroot package name for awscrt: python-awscrt<br>
Package: python-awscrt<br>
Fetching package awscrt<br>
Downloading package awscrt from <br>
<a href=3D"https://files.pythonhosted.org/packages/ae/98/dda092078f2d47bad0=
8e184ab9d364b8f89166497062bc1cf811c0bbbde2/awscrt-0.16.10.tar.gz." rel=3D"n=
oreferrer" target=3D"_blank">https://files.pythonhosted.org/packages/ae/98/=
dda092078f2d47bad08e184ab9d364b8f89166497062bc1cf811c0bbbde2/awscrt-0.16.10=
.tar.gz.</a>..<br>
Checking if package package/python-awscrt already exists...<br>
Creating package/python-awscrt/python-awscrt.mk...<br>
More than one file found for license: LICENSE, crt/aws-c-common/LICENSE, <b=
r>
crt/aws-c-io/LICENSE, crt/aws-lc/LICENSE, <br>
crt/aws-lc/third_party/fiat/LICENSE, crt/aws-c-mqtt/LICENSE, <br>
crt/aws-checksums/LICENSE, crt/aws-c-s3/LICENSE, <br>
crt/aws-c-compression/LICENSE, crt/aws-c-http/LICENSE, <br>
crt/aws-c-sdkutils/LICENSE, crt/s2n/LICENSE, crt/aws-c-cal/LICENSE, <br>
crt/aws-c-auth/LICENSE, crt/aws-c-event-stream/LICENSE<br>
Creating package/python-awscrt/python-awscrt.hash...<br>
Creating package/python-awscrt/Config.in...<br>
NOTE: Remember to also make an update to the DEVELOPERS file<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0and include an entry for the pkg in packages/Con=
fig.in<br>
<br>
</blockquote></div>

--00000000000087fd9b05f4410216--

--===============0659444224464292659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0659444224464292659==--
