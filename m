Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200B4C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 18:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DB5C421EA;
	Fri, 29 Jul 2022 18:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DB5C421EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7SHU7qfPFbAK; Fri, 29 Jul 2022 18:36:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED719421C4;
	Fri, 29 Jul 2022 18:36:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED719421C4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12F711BF575
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 18:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF350842B4
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 18:36:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF350842B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vY4pO8oaHy3P for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 18:36:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACB3A81B23
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ACB3A81B23
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 18:36:21 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id 17so5399064pfy.0
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 11:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UCJqoX0+U4PCpNgFWJl8bbAtJDjOqQsplh8OsT4fS/g=;
 b=5Cg+zyP1ZemPP39vS9Pt7Hzc2c+/wqbPEFF9cLjfoL8JWQe9tWBtfbIO67wYplR1xU
 ySZu1nvHWgFlvTcOwjAcW5w4uOORiLOsSFLYHM++87V/wfnGenFCVqW2i9u0ArPOEX3a
 qngSGUT3wrdRHOb2qWCmCeE9B4nh8N5jWjJv2IXcncUSZWNaevEYAZyAzAYr2+G42cH3
 /uI5RmaCtdvgMJt7lOcN1O/Rj0LVBmY+GMMeY9QqOzeH7GYU+774DemoOO4izV3LRl9s
 LSUdUl/qnD4Hzpa9aA+cd/pNAso5mKAtIMEvJv0YkFu1zIfJc73G/ag+YWtaKhTGyqmS
 IdoQ==
X-Gm-Message-State: AJIora8mp3gADQNYu8eHy1TZ8W8f0Og8Bfs4SSO1Q/0srSOj0msGwEWA
 jin2l3o25Ij4CkeTztGt8YlFA9wwf/i7Ufx6vyQ=
X-Google-Smtp-Source: AGRyM1vs3mXm2I63TECAkD4gCk4zGa3/vqUkNI0WXqRCy0IblBIEa5Srmm64u3IG5K/2XFSskQc5UcOeDqkm3i3scaM=
X-Received: by 2002:a05:6a00:a8b:b0:4e1:52db:9e5c with SMTP id
 b11-20020a056a000a8b00b004e152db9e5cmr4733681pfl.38.1659119780943; Fri, 29
 Jul 2022 11:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220726193810.43817-1-pevik@seznam.cz>
 <20220726220405.4fbd3e0c@windsurf>
In-Reply-To: <20220726220405.4fbd3e0c@windsurf>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 29 Jul 2022 20:36:09 +0200
Message-ID: <CAB1t1Cxs_U0rtKxoaWByef71KOrOeuL9_MpYM--TQCwS8eA0wA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=UCJqoX0+U4PCpNgFWJl8bbAtJDjOqQsplh8OsT4fS/g=;
 b=ACWsUcaro6FkDILQXTp1a7gbUJchtVeU53r45ak92OhJKYUD+X7iSV72e+tkg7X0LX
 RW748+zImrgAJ7dBqDKhEP5Q/QDqXDURiLRtpzL93C0wpPi/5IaI2jjzEXtUEmcEy0Zl
 fjtF0iW1TsSyxHB5im09hmi4NpVEzjrHalWWt6XFOslO68EBKZ/3CkubEIOJC2h2mn/d
 DqAqrP9Olf0rqiLM3C1ueMOXAJ5qp2qYHvx6LHGsRztD123uS78Q13ZbBX+53CfS+u0i
 PazQKhkh/hgRjt0dzwkOhk1kRAXov62SQY4cxL75BE6E/RsLn9EV2jrtLhNFe3MEWDwv
 8QFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ACWsUcar
Subject: Re: [Buildroot] [PATCH 1/1] package/debianutils: bump version to
 5.7-0.2
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
Cc: Petr Vorel <pevik@seznam.cz>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1333691050583241030=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1333691050583241030==
Content-Type: multipart/alternative; boundary="0000000000002edf8805e4f5edfe"

--0000000000002edf8805e4f5edfe
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

...

> > ++++ b/Makefile.am
> > +@@ -1,6 +1,6 @@
> > + AUTOMAKE_OPTIONS = foreign
> > +
> > +-SUBDIRS = po4a
> > ++# SUBDIRS = po4a
>
> We already have a po4a directory in the current version of debianutils.
> Why suddenly do we have to remove this?
>
There is a build dependency on po4a binary [1] [2] (the same name as the
directory with translations)
just to get translations, which buildroot does not use it:

$ make
Making all in po4a
make[1]: Entering directory 'debianutils.git/po4a'
Making all in de
make[2]: Entering directory 'debianutils.git/po4a/de'
po4a-translate not installed, failing to rebuild changed man page
translation
make[2]: *** [Makefile:491: add-shell.8] Error 1
make[2]: Leaving directory 'debianutils.git/po4a/de'
make[1]: *** [Makefile:310: all-recursive] Error 1
make[1]: Leaving directory 'debianutils.git/po4a'
make: *** [Makefile:655: all-recursive] Error 1

I'm also a bit annoyed by patches like this that we cannot upstream
> (and therefore have to keep forever), and that require AUTORECONF :-/
>
Understand, I'm sorry. I can either add  po4a as host package to have it in
build or
discuss with Debian maintainer how to make translations (po4a
non-mandatory).
What do you prefer? Hope I'm now clear about the goal.

Do we have a better solution?
>
> Kind regards,
Petr

[1] https://po4a.org/
[2] https://packages.debian.org/bullseye/po4a

Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--0000000000002edf8805e4f5edfe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Thomas,</div><div class=3D"gmail_quote=
"><div><br></div><div>...=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">&gt; ++++ b/Makefile.am<br>
&gt; +@@ -1,6 +1,6 @@<br>
&gt; + AUTOMAKE_OPTIONS =3D foreign<br>
&gt; + <br>
&gt; +-SUBDIRS =3D po4a<br>
&gt; ++# SUBDIRS =3D po4a<br>
<br>
We already have a po4a directory in the current version of debianutils.<br>
Why suddenly do we have to remove this?<br></blockquote><div>There is a bui=
ld dependency on po4a binary [1] [2] (the same name as the directory with t=
ranslations)=C2=A0</div><div>just to get translations, which buildroot does=
 not use it:</div><div><br></div><div>$ make<br>Making all in po4a<br>make[=
1]: Entering directory &#39;debianutils.git/po4a&#39;<br>Making all in de<b=
r>make[2]: Entering directory &#39;debianutils.git/po4a/de&#39;<br>po4a-tra=
nslate not installed, failing to rebuild changed man page translation<br>ma=
ke[2]: *** [Makefile:491: add-shell.8] Error 1<br>make[2]: Leaving director=
y &#39;debianutils.git/po4a/de&#39;<br>make[1]: *** [Makefile:310: all-recu=
rsive] Error 1<br>make[1]: Leaving directory &#39;debianutils.git/po4a&#39;=
<br>make: *** [Makefile:655: all-recursive] Error 1</div><div><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">I&#39;m also a bit annoyed b=
y patches like this that we cannot upstream<br>
(and therefore have to keep forever), and that require AUTORECONF :-/<br></=
blockquote><div>Understand, I&#39;m sorry. I can either add=C2=A0 po4a as h=
ost package to have it in build or=C2=A0</div><div>discuss with Debian main=
tainer how to make translations (po4a non-mandatory).=C2=A0</div><div>What =
do you prefer? Hope I&#39;m now clear about the goal.</div><div><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Do we have a better soluti=
on?<br>
<br></blockquote><div>Kind regards,</div><div>Petr</div><div>=C2=A0</div><d=
iv>[1]=C2=A0<a href=3D"https://po4a.org/">https://po4a.org/</a></div><div>[=
2]=C2=A0<a href=3D"https://packages.debian.org/bullseye/po4a">https://packa=
ges.debian.org/bullseye/po4a</a>=C2=A0</div><div><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--0000000000002edf8805e4f5edfe--

--===============1333691050583241030==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1333691050583241030==--
