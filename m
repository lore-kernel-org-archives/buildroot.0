Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4DECD040D
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 22:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E8484040E;
	Mon,  5 Jan 2026 22:01:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p6PJd_2XXL8l; Mon,  5 Jan 2026 22:01:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E690D40417
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767650485;
	bh=YV8cSUtM0eCVqQQnT61Jdg2rw/GpUznhJTw280iDzHU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YDyBPLwyqEoM7KNDWr0265QNuWSNR0HdelyVAEXCkHrB+yg/AGZMbsp0QNi4SgFD+
	 3EqfB8/6ScW21b4Gd/3pvOklr89l0Eugec1bC0xWe7Oga/nFyoLL0sjUu5d1eVobf1
	 7M3kMXQZ5pjFLYy6hiRKjSURH/XR661o/Yxa/I3j5KhKsdTNO9bal+oRbTD6Qzbxnn
	 aVae26RXJyFO/rUGjF0XnqdO5FBXcHEIOCxknXKnBUaOcN1IRUaEFFQlKW4I+Cynpe
	 C63GR68T2os8vRraDN1ZJt45y3r7JOHmLtcQEshH/tOIK9wglr/w4FYNdAoqLnPeYH
	 /3irL6iGyPMIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E690D40417;
	Mon,  5 Jan 2026 22:01:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9965696F
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 22:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F73140417
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 22:01:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L9_XiIqeYykc for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 22:01:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=nolange79@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5322E4040E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5322E4040E
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5322E4040E
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 22:01:21 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-59581e32163so345370e87.1
 for <buildroot@buildroot.org>; Mon, 05 Jan 2026 14:01:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767650479; x=1768255279;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G4rq9PR8dFsoExN/h27Zhf+1Dee+Db0RlhzXzak/jFQ=;
 b=jP1hhBgTdPMnLl6yBl1tkZPYrgIIPos88Tsxs6VVfX3etFQJU9dOl5BThMGbwAEpsK
 +V59krlexhz275BgspypowDI1ISpt0Bp2xPO2+YACRcOpsiDcmHK2kFcRI6lene3t2L/
 LMH1CdPwGpmlGjN86+vgyd7U4t0P+DWO11mvAUjKeG4rCyd1BiCYM5GQ5ZmLl+9yHGML
 Y7+xt+Q/wanQGP5vCgq/sROOUUKfyBRbC694prg8HFDs+z0JRtl/+lVxrJ8FP5k9TH1v
 V3CxbzRHsWpBzkIuflVved+iYyU1NPcm+pthUzvVooLAWDmGCXb58U/2EKro5hgy1yxB
 27Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5vWTbhSClv6ZyaKfGbBtrJyKZJkCUOIzUoJ8c0gVImESB5D3vYfPij6ITtMiQwpDcC5fNv2rx8m4=@buildroot.org
X-Gm-Message-State: AOJu0Yx9sX/NUKCz3WZJqByEtHq98KtyrRel2Rw3bQjwYphvSJqfjbEG
 dRzBzUAtQJ8UARQHaFgbkaBIs1n7B1Rdl6engj+1NeD+gA7mm0xmo66EFn3AStCe5sTMtRKHXSa
 OeQMdedz5dRlUOSNZrAPc4FRmobEf43N5bvIBv7FMOw==
X-Gm-Gg: AY/fxX5ZBNPfb/u8JVRFJRu7NKA2ChfdnT6x6AFdPXTUt2UC8dEaIdb4VH2ZOZFwU1f
 P8s0kV7EsnRai2JH3Ap5mdOocVCWirQRNKotPUl7H+w4AnP+SApEOGLtdPHaqDuZ41MFPhs1eQS
 H7AMBHrCxAzg26Ws9ZDQ580RIaFE6d1BIXIFu9K5J6fUOhyq9NMsksyvgYZbq06xL+hWLaYJTdZ
 1552ivHY76e8vt2KbfR6bT4Ta/9uAjz+cq+kGmtU+yVOwEAsScrXPMaEbGcPLdWbqGE+cMkifOy
 jC/+nGQL9uBXbmd6QXgUnaAtzO92
X-Google-Smtp-Source: AGHT+IErQ33FRz+WPCrmkkc/ZTZFxdsu+G1EEtwJxIOQ3vkMAfzPakhMoIrj2cyBufZhtwKUG5985jZjZfEpKVidxS0=
X-Received: by 2002:a05:6512:2388:b0:598:e9f9:bdd with SMTP id
 2adb3069b0e04-59b65257dd4mr423113e87.27.1767650478340; Mon, 05 Jan 2026
 14:01:18 -0800 (PST)
MIME-Version: 1.0
References: <20251119154819.3416176-1-nolange79@gmail.com>
 <20260101230904.6d78e9f5@windsurf>
 <CADvTj4r8prXxRJT1h6Mf-XjbDzq0YmUeYZL++gxGG0dHwSdeKA@mail.gmail.com>
In-Reply-To: <CADvTj4r8prXxRJT1h6Mf-XjbDzq0YmUeYZL++gxGG0dHwSdeKA@mail.gmail.com>
From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 5 Jan 2026 23:01:07 +0100
X-Gm-Features: AQt7F2rMlCMQMbFTWo1rhMiivIFf261pOWLwr1IXxFrwFPegQUaeO4dv9e24RYs
Message-ID: <CADYdroMdP4MmfvSK6ziAzTPV_orJMBHLQ0-1+11sR-EKLT1CCQ@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org, 
 Sen Hastings <sen@hastings.org>, Marcus Hoffmann <buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767650479; x=1768255279; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=G4rq9PR8dFsoExN/h27Zhf+1Dee+Db0RlhzXzak/jFQ=;
 b=Q8fPIUfe1TnjsHg5PfSv4ef5yUh0FXw1+JNn9GgGLyfAC/N+LOdSwxsZ7lf9vHOkBu
 zn2NXxkTKAdb/aXI4ZErmMlCh6GcRa5o+F9nBfHzdONeUlwm6L0mMTQ75Znt5A17FDPw
 kT/3AGb53+1wyJ38/GwPh80cz+nkbzGwo9sB+EAJaZmRPLu3epbRceF1YdG2lDClSgbr
 XtN09w57FMXzfCjGkWeuh5bzQRrMID+0D2pa1tqiz496SvQkmh5FU2msa9vTzaoVSjSf
 0y5PImQRzbKs331fum/fJmpHbmEE2WjoKTeTHwyaUwcjmmZQbTg/rPY/+Lh6c8iTOFqf
 iXGg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Q8fPIUfe
Subject: Re: [Buildroot] [PATCH] package/systemd: remove several Kernel
 config options
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8092555566971423177=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8092555566971423177==
Content-Type: multipart/alternative; boundary="000000000000d940070647ab3242"

--000000000000d940070647ab3242
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Do., 1. Jan. 2026 um 23:30 Uhr schrieb James Hilliard <
james.hilliard1@gmail.com>:

> On Thu, Jan 1, 2026 at 3:09=E2=80=AFPM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > Hello Norbert, James, Marcus,
> >
> > On Wed, 19 Nov 2025 16:48:18 +0100
> > Norbert Lange <nolange79@gmail.com> wrote:
> >
> > > All those features are optional and prevent customization of the
> kernel.
> > > Forcing IPv6 is particularly nasty.
> > >
> > > This reverts parts of "package/systemd: bump to version 256.4"
> > >
> > > Signed-off-by: Norbert Lange <nolange79@gmail.com>
> >
> > Thanks for the patch, and thanks everyone for participating to the
> > discussion.
> >
> > Buildroot's "philosophy" has always been to be reasonably minimal. So I
> > would tend to agree with both Norbert and Marcus that we should not
> > enable all possible options that may be needed for all possible
> > use-cases. We want to enable what's needed to get our systemd package
> > to "work" as-is, but not necessarily every possible feature that the
> > user may use through systemd unit files or specific features.
>
> IMO we should generally default to enabling the recommended options
> as there are often good reasons for having those enabled.
>

systemd's recommendations are for everything + the kitchensink,
not the normal functionality.


> In general I think we tend to default to enabling recommended options
> from packages unless there is a good reason not to in most cases
> already.
>

generally thats a big generalization. systemd is more of a whole suite,
and the defaults/recommendations arent that of an embedded system.
(I upstreamed several patches to adopt systemd for this environment)


> Also many packages include systemd unit files and it would often
> be difficult to track which kernel features those unit files depend
> on as most packages are likely to assume the system has any
> recommended kernel options enabled.
>

Depending on the feature, systemd will mostly do as-good-as-possible
and output warnings to the log.
Rarely things will just not work, and easy to diagnose.


> > However, it would be good to draw a clear line, and rather than
> > applying Norbert's patch as-is, I'd prefer to see a commit that cleans
> > up those options, with a comment on top of SYSTEMD_LINUX_CONFIG_FIXUPS
> > that documents our "policy" on this, like "Following what's documented
> > at https://github.com/systemd/systemd/blob/v257.10/README, by enabling
> > all mandatory options, leaving disabled only 'recommended' options,
> > with the exception of A, B, C because blabla".
>
> I think relying on users to manually configure recommended options
> is probably going to cause a lot more issues.
>
> IMO the better option is to have a default enabled kconfig option
> that controls the recommended but not required fixups.
>
> Or maybe a default disabled kconfig option that when selected
> disables the recommended kernel option fixups?
>
> Part of the issue is that most users probably aren't going to be
> manually tracking all the systemd recommended kconfig options
> so having them maintained as part of the package simplifies things
> a lot in practice


I explicitely configure the kernel to have as little attack surface
as possible. Those things are competely opposed to that.

Maybe there should be a set of options to switch between one (or a few)
"managed" modes and a "custom" mode which will only add the kconfig
options that are absolutely needed.

Just thinking loud:
Splitting KCONFIG options for packages into a few variables:
REQUIRED, BASE, RECOMMEND and potentially DIS_* equivalents.
Dependend on the picked MODE different KCONFIGS are applied,
For diagnostics buildroot could output the BASE/RECOMMEND KCONFIGS
that werent applied (based on the MODE).


> There may also be security implications if certain recommended
> but not required kconfig fixups are disabled.
>

You think silently enabling kernel options like IPv6 between Buildroot
versions does not cause security implications?
IP4 is a magnitude easier to lock down via a NAT, IPv6 automatically poked
holes into our system. Hence my angry post.

> Norbert, or Marcus, do you think you could propose something like this?
>

I think some more discussion is necessary. Particalularly if we want some
global
options.

Norbert

--000000000000d940070647ab3242
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Am Do., 1. Jan.=
 2026 um 23:30=C2=A0Uhr schrieb James Hilliard &lt;<a href=3D"mailto:james.=
hilliard1@gmail.com">james.hilliard1@gmail.com</a>&gt;:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Thu, Jan 1, 2026 at 3:09=E2=80=
=AFPM Thomas Petazzoni<br>
&lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" target=3D"_blank">thoma=
s.petazzoni@bootlin.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello Norbert, James, Marcus,<br>
&gt;<br>
&gt; On Wed, 19 Nov 2025 16:48:18 +0100<br>
&gt; Norbert Lange &lt;<a href=3D"mailto:nolange79@gmail.com" target=3D"_bl=
ank">nolange79@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; All those features are optional and prevent customization of the =
kernel.<br>
&gt; &gt; Forcing IPv6 is particularly nasty.<br>
&gt; &gt;<br>
&gt; &gt; This reverts parts of &quot;package/systemd: bump to version 256.=
4&quot;<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Norbert Lange &lt;<a href=3D"mailto:nolange79@gmai=
l.com" target=3D"_blank">nolange79@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Thanks for the patch, and thanks everyone for participating to the<br>
&gt; discussion.<br>
&gt;<br>
&gt; Buildroot&#39;s &quot;philosophy&quot; has always been to be reasonabl=
y minimal. So I<br>
&gt; would tend to agree with both Norbert and Marcus that we should not<br=
>
&gt; enable all possible options that may be needed for all possible<br>
&gt; use-cases. We want to enable what&#39;s needed to get our systemd pack=
age<br>
&gt; to &quot;work&quot; as-is, but not necessarily every possible feature =
that the<br>
&gt; user may use through systemd unit files or specific features.<br>
<br>
IMO we should generally default to enabling the recommended options<br>
as there are often good reasons for having those enabled.<br></blockquote><=
div><br></div><div>systemd&#39;s recommendations are for everything=C2=A0+ =
the kitchensink,<br>not the normal functionality.</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
In general I think we tend to default to enabling recommended options<br>
from packages unless there is a good reason not to in most cases<br>
already.<br></blockquote><div><br></div><div>generally thats a big=C2=A0gen=
eralization. systemd is more of a whole suite,</div><div>and the defaults/r=
ecommendations arent that of an embedded system.</div><div>(I upstreamed se=
veral patches to adopt systemd for this environment)</div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
Also many packages include systemd unit files and it would often<br>
be difficult to track which kernel features those unit files depend<br>
on as most packages are likely to assume the system has any<br>
recommended kernel options enabled.<br></blockquote><div><br></div><div>Dep=
ending on the feature, systemd will mostly do as-good-as-possible<br>and ou=
tput warnings to the log.<br>Rarely things will just not work, and easy to =
diagnose.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
&gt; However, it would be good to draw a clear line, and rather than<br>
&gt; applying Norbert&#39;s patch as-is, I&#39;d prefer to see a commit tha=
t cleans<br>
&gt; up those options, with a comment on top of SYSTEMD_LINUX_CONFIG_FIXUPS=
<br>
&gt; that documents our &quot;policy&quot; on this, like &quot;Following wh=
at&#39;s documented<br>
&gt; at <a href=3D"https://github.com/systemd/systemd/blob/v257.10/README" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/systemd/systemd/blo=
b/v257.10/README</a>, by enabling<br>
&gt; all mandatory options, leaving disabled only &#39;recommended&#39; opt=
ions,<br>
&gt; with the exception of A, B, C because blabla&quot;.<br>
<br>
I think relying on users to manually configure recommended options<br>
is probably going to cause a lot more issues.<br>
<br>
IMO the better option is to have a default enabled kconfig option<br>
that controls the recommended but not required fixups.<br>
<br>
Or maybe a default disabled kconfig option that when selected<br>
disables the recommended kernel option fixups?<br>
<br>
Part of the issue is that most users probably aren&#39;t going to be<br>
manually tracking all the systemd recommended kconfig options<br>
so having them maintained as part of the package simplifies things<br>
a lot in practice=C2=A0</blockquote><div><br>I explicitely configure the ke=
rnel to have as little attack surface</div><div>as possible. Those things a=
re competely opposed to that.<br><br>Maybe there should be a set of options=
 to switch between one (or a few)<br>&quot;managed&quot; modes and a &quot;=
custom&quot; mode which will only add the kconfig<br>options that are absol=
utely needed.<br><br>Just thinking loud:<br>Splitting KCONFIG options for p=
ackages into a few variables:<br>REQUIRED, BASE, RECOMMEND and potentially =
DIS_* equivalents.<br>Dependend on the picked MODE different KCONFIGS are a=
pplied,</div><div>For diagnostics buildroot could output the BASE/RECOMMEND=
 KCONFIGS<br>that werent applied (based on the MODE).<br></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
There may also be security implications if certain recommended<br>
but not required kconfig fixups are disabled.<br></blockquote><div><br></di=
v><div>You think silently enabling kernel options like IPv6 between Buildro=
ot</div><div>versions does not cause security implications?</div><div>IP4 i=
s a magnitude easier to lock down via a NAT, IPv6 automatically poked</div>=
<div>holes into our system. Hence my angry post.<br><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">&gt; Norbert, or Marcus, do you think =
you could propose something like this?<br></blockquote><div><br></div><div>=
I think some more discussion is necessary. Particalularly if we want some g=
lobal<br>options.</div><div><br>Norbert</div></div></div>

--000000000000d940070647ab3242--

--===============8092555566971423177==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8092555566971423177==--
