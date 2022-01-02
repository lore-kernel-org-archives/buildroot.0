Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14214C433F5
	for <buildroot@archiver.kernel.org>; Sun,  2 Jan 2022 06:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 979A681445;
	Sun,  2 Jan 2022 06:39:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1lYrDFJL0IyY; Sun,  2 Jan 2022 06:39:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D74BE81443;
	Sun,  2 Jan 2022 06:39:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ADB971BF429
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 06:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA4D181443
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 06:39:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VBEf5ETuECuM for <buildroot@lists.busybox.net>;
 Sun,  2 Jan 2022 06:39:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8682681441
 for <buildroot@buildroot.org>; Sun,  2 Jan 2022 06:39:09 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id w27so22340385qkj.7
 for <buildroot@buildroot.org>; Sat, 01 Jan 2022 22:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dF2JhVt2ZyC3hK17ar73ndsCkaI31lZM8Q7wxULBxyQ=;
 b=PmgVvM7dRACs/K5BE58HyCDyIBLUZ3QvBx5CmJKolw0/bV6KR3cw+8CNOF302ECt8n
 ecsPEo6I0WEAqbK/BrwcpWw2mGEQBMXHf0HXsOHhvAshA9UfGF8X6FJ4D0kAH1H3cedx
 hx5lYhTClnKUEvTfl8A9Uu8QCAKWgIREQyAJ6rG8CV4371vrM2bTKHNfqE8KKSu9mVDT
 So/EukZIb815Fqr1f5X6AgTB1dx2aR0HB4eDhGq75w6cxZ8WuFcnytqcZScj9Od2Pwe8
 KVg4bVzXhkg5fExGPclpOFy9blfajudFsrEYWoaisBCOU2A4PIcJwLALMqLnsGMqzPXB
 SPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dF2JhVt2ZyC3hK17ar73ndsCkaI31lZM8Q7wxULBxyQ=;
 b=a7tadj/XMIywcNd2Z4yPb9c2fT50/zpBgLRXn1kk9+yAJKNe0hji5FVk7swx0BLKjH
 1fbKv5K35vtKWDJspJX8D34v0takELTXNHvk14W6EdeZMCtePJiB31rIGg6hdRQw4scl
 EAaz/TuJYx9ltYbQ17krazTHFibX7ApdrewMVNvF/4FFd32t9O+NK2COkNdzUPur6CJv
 NGo/BjOz9GluXGwjwwUG9ZPyPSQr9mBK1sU/Gwl6aoFEHfjQc62nzx9OGLD/iCGBy+s5
 wWVFTSqH8oHapsS9QnREUxfu1HAxzV+UtuocKvemoZjqlAzAxHGzHvxhx07Nl45zdNo0
 bLkg==
X-Gm-Message-State: AOAM533J/QRHleSuDV6/58AFTSWcdyJi86XX3mVnfyB+DfJUChvua/OV
 0R2A/ar8GrLxwfGILx0TyzzIiPLITcUsWzzILpI=
X-Google-Smtp-Source: ABdhPJw2wYBd7nJLiVjv58edv+IKur63LOBsNAknhVl4yMC/4w8+g7EK+P7R5chsXS3ko315JIc/zt2N3Nv8LTUigrw=
X-Received: by 2002:a05:620a:1129:: with SMTP id
 p9mr27941476qkk.405.1641105548318; 
 Sat, 01 Jan 2022 22:39:08 -0800 (PST)
MIME-Version: 1.0
References: <CACaKL1yLOT159yE2Kptoay7Ng+1+vb+tCUxJoVqr9gLha660jw@mail.gmail.com>
 <20220101173705.142a0496@audacityteam.org>
In-Reply-To: <20220101173705.142a0496@audacityteam.org>
From: Jacques Samoun <jacques.samoun33@gmail.com>
Date: Sun, 2 Jan 2022 08:38:57 +0200
Message-ID: <CACaKL1w0oBbXUx-EiP34cs1RLzUv_AfiRaO7nywqD10+ShQmLA@mail.gmail.com>
To: Richard Ash <richard@audacityteam.org>
Subject: Re: [Buildroot] Patching a BR package makefile
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============6448815216570579559=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6448815216570579559==
Content-Type: multipart/alternative; boundary="0000000000003f201505d493a9a1"

--0000000000003f201505d493a9a1
Content-Type: text/plain; charset="UTF-8"

Hi Richard,
thanks for that.
I think option 3 is the way to go, at least till this openssh/openssl issue
has been fixed, which should happen (there is an PR at openssh already).
Thanks,
Jacques

On Sat, Jan 1, 2022 at 7:37 PM Richard Ash <richard@audacityteam.org> wrote:

> On Wed, 29 Dec 2021 14:57:54 +0200
> Jacques Samoun <jacques.samoun33@gmail.com> wrote:
>
> > I had to modify a OPENSSH_CONF_OPTS of the openssh.mk package
> > makefile to solve a known interoperability issue (openssh vs
> > libopenssl). Now the fix is verified, i would like to create a patch
> > to be applied to this openssh.mk .
> >
> > However, while I already did a couple of patches to other packages,
> > they were always so far applied to the course code of the packages. In
> > this specific case, I do not know how to make this on the
> > buildroot/package/<package>.mk file.
> >
> > Is there a preferred way to do so ?
>
> As far as I know, there isn't a way to do this within buildroot,
> because the buildroot tree is (has to be) immutable by the time
> buildroot runs. Put another way you can't patch what effectively
> becomes one vast Makefile from within that Makefile without badly
> upsetting make!
>
> The only options I have found are:
> 1. Write a wrapper script to unpack the buildroot tarball and apply
> your patches (note you may have problems if your patches change over
> time).
> 2. Have your own fork of buildroot git, and then your own branch from
> the relevant release tag with your changes on top. This means you can
> rebase your changes with git's help when you want to move to a newer
> buildroot. Convenient if the rest of your build is in git and you can
> use a git submodule to fetch your forked git automatically.
> 3. Don't try to modify the buildroot package, create your own
> custom-ssh package (copy of buildroot plus your patch) and maintain it
> in a buildroot external (see the manual). Could be a pain to keep up to
> date in the longer term.
>
> I'm not in any way a buildroot maintainer however!
>
> All of these are good reasons to get patches upstreamed (if possible)
> into buildroot!
>
> Richard
>

--0000000000003f201505d493a9a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Richard,<div>thanks for that.</div><div>I think option =
3 is the way to go, at least till this openssh/openssl issue has been fixed=
, which=C2=A0should happen (there is an PR at openssh already).</div><div>T=
hanks,</div><div>Jacques</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sat, Jan 1, 2022 at 7:37 PM Richard Ash &l=
t;<a href=3D"mailto:richard@audacityteam.org">richard@audacityteam.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On We=
d, 29 Dec 2021 14:57:54 +0200<br>
Jacques Samoun &lt;<a href=3D"mailto:jacques.samoun33@gmail.com" target=3D"=
_blank">jacques.samoun33@gmail.com</a>&gt; wrote:<br>
<br>
&gt; I had to modify a OPENSSH_CONF_OPTS of the <a href=3D"http://openssh.m=
k" rel=3D"noreferrer" target=3D"_blank">openssh.mk</a> package<br>
&gt; makefile to solve a known interoperability issue (openssh vs<br>
&gt; libopenssl). Now the fix is verified, i would like to create a patch<b=
r>
&gt; to be applied to this <a href=3D"http://openssh.mk" rel=3D"noreferrer"=
 target=3D"_blank">openssh.mk</a> .<br>
&gt; <br>
&gt; However, while I already did a couple of patches to other packages,<br=
>
&gt; they were always so far applied to the course code of the packages. In=
<br>
&gt; this specific case, I do not know how to make this on the<br>
&gt; buildroot/package/&lt;package&gt;.mk file.<br>
&gt; <br>
&gt; Is there a preferred way to do so ?<br>
<br>
As far as I know, there isn&#39;t a way to do this within buildroot,<br>
because the buildroot tree is (has to be) immutable by the time<br>
buildroot runs. Put another way you can&#39;t patch what effectively<br>
becomes one vast Makefile from within that Makefile without badly<br>
upsetting make!<br>
<br>
The only options I have found are:<br>
1. Write a wrapper script to unpack the buildroot tarball and apply<br>
your patches (note you may have problems if your patches change over<br>
time).<br>
2. Have your own fork of buildroot git, and then your own branch from<br>
the relevant release tag with your changes on top. This means you can<br>
rebase your changes with git&#39;s help when you want to move to a newer<br=
>
buildroot. Convenient if the rest of your build is in git and you can<br>
use a git submodule to fetch your forked git automatically.<br>
3. Don&#39;t try to modify the buildroot package, create your own<br>
custom-ssh package (copy of buildroot plus your patch) and maintain it<br>
in a buildroot external (see the manual). Could be a pain to keep up to<br>
date in the longer term.<br>
<br>
I&#39;m not in any way a buildroot maintainer however!<br>
<br>
All of these are good reasons to get patches upstreamed (if possible)<br>
into buildroot!<br>
<br>
Richard<br>
</blockquote></div>

--0000000000003f201505d493a9a1--

--===============6448815216570579559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6448815216570579559==--
