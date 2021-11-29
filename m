Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3973C433F5
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 07:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D00983104;
	Mon, 29 Nov 2021 07:10:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uf_qjLcsakGS; Mon, 29 Nov 2021 07:10:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C84C6830E2;
	Mon, 29 Nov 2021 07:10:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 50BBF1BF3FF
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 07:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4010F830E2
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 07:10:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XgEjmyCzY5bY for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 07:10:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86ABB828DE
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 07:10:45 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id x15so67501637edv.1
 for <buildroot@buildroot.org>; Sun, 28 Nov 2021 23:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KHQa8I3FqfaFpLedstf0ca802uMD7sHox7054nfLpiA=;
 b=VkG2I130CjSo7avUGD9GAKZtm3ZQztrm8dZdbHJO8NaSkDRaNJFQuWY/Ygtf8mTI0l
 3LYFpgUjWryhV1lBbsHanS7/u7nGnQzw77NrORNaKS6DeHVg06gdQPoMv3ED6jv7d7w/
 bqCsgj3KkdKDkQamHEL84kiWY7LbtQsNQjKRUihMFJr76zgPG82o4kRTMOcAzPKYC7un
 QZEc+RrfS2s10m637Fi5axa8oT2xesO4m2+82Ryz9MGyUBODW67kXwZS0O8Sia6T4mpI
 sEEMj6Ha07Yjgyzf2lbw8iofu+c8aIFIgTrYsmx1iRtvJbw2kSVrIOGoyGcHPEccQGL3
 ODDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KHQa8I3FqfaFpLedstf0ca802uMD7sHox7054nfLpiA=;
 b=61m+lR+jVxabDr5/7D7sgL5CGiohlo6+SXR1BWf921Id5XtDJmKnZ0OebDs+x2Mhct
 h7StVZKex9iQtCSIDo4wTRxVqPzOzFnNaxu8+RMbSLd7xY9Rl9ZYi2JWqTZV4A2v7+lV
 a/iScsoo2/8c5R+1UfWEdljTSSR+2t2Tz2W2ppT1iHQ+5yvipAmSRBuUP9uUqYC7M3MB
 MCMuu4ZN/xaQJtiRRq/yrPkKMAZhuxYalRYXJHRh88XmDyPeze3uGkPodHhY0f6xEZJu
 Zwzvwpa002svEkhFH5U6TVHXmZmVM72Y7D3TAKQoUF99HSfw+syE3tWh9RlrNIciGOZF
 i0/Q==
X-Gm-Message-State: AOAM531V13J4G3fTokJ6oTEh3wWtfVs3NErlta2B8NfH5u/agWYg//QT
 QkM7PgoAPrt6wd8Lce973v5geHlZN3YeoyiWmWQsiA==
X-Google-Smtp-Source: ABdhPJwrNbzXvwNGzNiaO7FdcE3aUYwE+o4OVasVaglo3Lr5DoszW+kYY8o/AuwOScCWsHBn9hox8RGYBso569QQ4u0=
X-Received: by 2002:a05:6402:3596:: with SMTP id
 y22mr72422749edc.297.1638169843638; 
 Sun, 28 Nov 2021 23:10:43 -0800 (PST)
MIME-Version: 1.0
References: <CAJPV9MrtNQVuADbYs1HWE89Hnnf7h=68tRZEQ6=0n8XPMPYb6g@mail.gmail.com>
 <c719dff6-f3c9-c2af-5692-e0810058639f@mind.be>
In-Reply-To: <c719dff6-f3c9-c2af-5692-e0810058639f@mind.be>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Mon, 29 Nov 2021 09:10:32 +0200
Message-ID: <CAJPV9MroG-_8cgF_BO806L1O9krKY1kUpiE5Rox6iSHzDB+bvA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] Package dependency
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============2531843280556922192=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2531843280556922192==
Content-Type: multipart/alternative; boundary="0000000000009cb37d05d1e823d6"

--0000000000009cb37d05d1e823d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 25, 2021 at 4:51 PM Arnout Vandecappelle <arnout@mind.be> wrote=
:

>
>
> On 25/11/2021 13:27, Jos=C3=A9 Pekkarinen wrote:
> >
> >     Hi buildroot list,
> >
> >     I'm working on a package for minijail that
> >
> > has a build dependency on libcap. I'm having
> > troubles to set the dependency in the recipe and
> > I fail to find what is wrong, so I want to ask for hints.
> >
> >     Current Config.in:
> >
> >
> > config BR2_PACKAGE_MINIJAIL
> >         bool "minijail"
> >         select BR2_PACKAGE_HOST_LIBCAP
> >         select BR2_PACKAGE_LIBCAP
> >         help
> >           Minijail is a sandboxing tool maintained by google.
> >
> > https://google.github.io/minijail/
> >
> >     Current recipe:
> >
> >
> >
> #########################################################################=
#######
> > #
> > # minijail
> > #
> >
> #########################################################################=
#######
> >
> > MINIJAIL_VERSION =3D linux-v17
> > MINIJAIL_SOURCE =3D $(MINIJAIL_VERSION).tar.gz
> > MINIJAIL_SITE =3D "https://github.com/google/minijail/archive/refs/tags=
"
> > MINIJAIL_LICENSE =3D BSD-Style
> > MINIJAIL_LICENSE_FILES =3D LICENSE
> > MINIJAIL_DEPENDENCY=3Dlibcap host-libcap
>
>   Try MINIJAIL_DEPENDENCIES.
>
>   Also, of course, formatting - use check-package.
>

Ah! What a typo, thanks Arnout!


Jos=C3=A9.

--0000000000009cb37d05d1e823d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 25, 2021 at 4:51 PM Arnou=
t Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be">arnout@mind.be</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 25/11/2021 13:27, Jos=C3=A9 Pekkarinen wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi buildroot list,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I&#39;m working on a package for minijail that<br>
&gt; <br>
&gt; has a build dependency on libcap. I&#39;m having<br>
&gt; troubles to set the dependency in the recipe and<br>
&gt; I fail to find what is wrong, so I want to ask for hints.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Current Config.in:<br>
&gt; <br>
&gt; <br>
&gt; config BR2_PACKAGE_MINIJAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;minijail&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HOST_LIBCAP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBCAP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Minijail is a sandboxing tool =
maintained by google.<br>
&gt; <br>
&gt; <a href=3D"https://google.github.io/minijail/" rel=3D"noreferrer" targ=
et=3D"_blank">https://google.github.io/minijail/</a><br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Current recipe:<br>
&gt; <br>
&gt; <br>
&gt; ######################################################################=
##########<br>
&gt; #<br>
&gt; # minijail<br>
&gt; #<br>
&gt; ######################################################################=
##########<br>
&gt; <br>
&gt; MINIJAIL_VERSION =3D linux-v17<br>
&gt; MINIJAIL_SOURCE =3D $(MINIJAIL_VERSION).tar.gz<br>
&gt; MINIJAIL_SITE =3D &quot;<a href=3D"https://github.com/google/minijail/=
archive/refs/tags" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
google/minijail/archive/refs/tags</a>&quot;<br>
&gt; MINIJAIL_LICENSE =3D BSD-Style<br>
&gt; MINIJAIL_LICENSE_FILES =3D LICENSE<br>
&gt; MINIJAIL_DEPENDENCY=3Dlibcap host-libcap<br>
<br>
=C2=A0 Try MINIJAIL_DEPENDENCIES.<br>
<br>
=C2=A0 Also, of course, formatting - use check-package.<br></blockquote><di=
v><br></div></div><blockquote style=3D"margin:0 0 0 40px;border:none;paddin=
g:0px"><div class=3D"gmail_quote"><div>Ah! What a typo, thanks Arnout!=C2=
=A0</div></div></blockquote><br><div dir=3D"ltr" class=3D"gmail_signature">=
<div dir=3D"ltr"><blockquote style=3D"margin:0px 0px 0px 40px;border:none;p=
adding:0px">Jos=C3=A9.</blockquote></div></div></div>

--0000000000009cb37d05d1e823d6--

--===============2531843280556922192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2531843280556922192==--
