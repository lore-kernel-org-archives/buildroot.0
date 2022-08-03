Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D2FC00140
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 01:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C86960DE5;
	Wed,  3 Aug 2022 01:53:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C86960DE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8NDn5BWfxRoM; Wed,  3 Aug 2022 01:53:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D84060AC2;
	Wed,  3 Aug 2022 01:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D84060AC2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 239251BF3D0
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 01:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F28914053F
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 01:53:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F28914053F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wDPsPnL-LOiS for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 01:53:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B870E400DB
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B870E400DB
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 01:53:34 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id 204so25105503yba.1
 for <buildroot@buildroot.org>; Tue, 02 Aug 2022 18:53:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=r9jgq3Bfz3res/jzNvjdgVz2key4/9zKap6LVMY2FGk=;
 b=GJi7CoOvMfoF9B9TD/vY1IDN1ZxZ6F+wT0I9LwRIFbU3wY7KcODXf9Mr/zKYWd0BEz
 eXpzc98mO8x4xNUD4YAxG0E9obPlUY1NR2ej21RMiePk3cARPwhwXsUfk9s+x5FK6+vU
 PiCSr6RrYkMTL6VUHbh2pNgvze9wJG5fxw4Q3nOj5b2KkcW5G7GPV/9dtBH19ZcWCwEZ
 tgm64HEM40t4ITvrZ44i7EH00FHxghHiWDigwfY6c6ANs5AJl+uqZ+0wuD3kQVkB69xT
 7vbIOX7uleI0QdECECkfDAac6ZtM+gT8rT7WiMBXhJHKaiYK0wuW+dhzAOPuX+mBCBqk
 B5hQ==
X-Gm-Message-State: ACgBeo0ztLHDA5Uee7ph/c2Wz9R89tKHTx5j5MfDbAYAhlMxW7UF9TKP
 EMp3h5VRID940CB7Vg+4wuysVvIDx4I/xQv5NFPes06Xu0egSg==
X-Google-Smtp-Source: AA6agR6u/wSnGrU1LlKZcVN5ulan3uhOO4F1rTgP2WR18ydjWAjP4sZD3adI90uV2ASnb/c5GfEcj7p5OPXmPGSLcLQ=
X-Received: by 2002:a25:c087:0:b0:673:e09d:7e9 with SMTP id
 c129-20020a25c087000000b00673e09d07e9mr19265668ybf.534.1659491613633; Tue, 02
 Aug 2022 18:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220802212005.1644270-1-kyle@balena.io>
 <20220803002249.3265508b@windsurf>
In-Reply-To: <20220803002249.3265508b@windsurf>
Date: Tue, 2 Aug 2022 21:53:22 -0400
Message-ID: <CAMgvH3pEzvSfPXsYd+mY+BxV+FbzZ4-NaZOuKZPsjxjE5jugfA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=balena.io; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=r9jgq3Bfz3res/jzNvjdgVz2key4/9zKap6LVMY2FGk=;
 b=PU1HkVE2a33QyPP1k5k66sw/Jwna1IsoWEd132YjzXwLMmAXaWI27v2YwVQxZoAK28
 gLbYDV0OwTWxA8VCdbPI8GWudeID4kSfZN7Vntc52J7mlI+dXD+u/kwuV7229axIHPo1
 2EWD5nxJp6+IwUy37KQdlW9GipmXxKGoyFkmluxnz5Qi4emdDFHb/poVg7xa/nhvusuW
 SXhMEHBO8qSowKf889OP9+dlbhy+4yqxDU18Vsb8ErW5TcBQXWjJgAhKvcBf6vXKu0Hq
 ligqpUx+K2VJ4YKczlT2B63oN7b9ck70FzCQQ06nHaHfSmLZRi6rsXeHFnmPe1Q0DjR5
 Q6PA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=balena.io header.i=@balena.io
 header.a=rsa-sha256 header.s=google header.b=PU1HkVE2
Subject: Re: [Buildroot] [PATCH 1/1] package/unbound: bump version to 1.16.2
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
From: Kyle Harding via buildroot <buildroot@buildroot.org>
Reply-To: Kyle Harding <kyle@balena.io>
Cc: Stefan Ott <stefan@ott.net>,
 Kyle Harding via buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============5804297965117473387=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5804297965117473387==
Content-Type: multipart/alternative; boundary="0000000000002382b105e54c80a2"

--0000000000002382b105e54c80a2
Content-Type: text/plain; charset="UTF-8"

I just noticed that too, a new patch is incoming. Sorry for the noise!

On Tue, Aug 2, 2022 at 6:22 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> On Tue,  2 Aug 2022 17:20:05 -0400
> Kyle Harding via buildroot <buildroot@buildroot.org> wrote:
>
> > Signed-off-by: Kyle Harding <kyle@balena.io>
> > ---
> >  package/unbound/unbound.hash | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
> > index 68087cc28e..8bfe48df9f 100644
> > --- a/package/unbound/unbound.hash
> > +++ b/package/unbound/unbound.hash
> > @@ -1,5 +1,5 @@
> > -# From
> https://nlnetlabs.nl/downloads/unbound/unbound-1.16.0.tar.gz.sha256
> > -sha256
> 6701534c938eb019626601191edc6d012fc534c09d2418d5b92827db0cbe48a5
> unbound-1.16.0.tar.gz
> > +# From
> https://nlnetlabs.nl/downloads/unbound/unbound-1.16.2.tar.gz.sha256
> > +sha256
> 2e32f283820c24c51ca1dd8afecfdb747c7385a137abe865c99db4b257403581
> unbound-1.16.2.tar.gz
> >
> >  # Locally calculated
> >  sha256
> 8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
>
> Thanks, but this patch is missing the change to unbound.mk.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--0000000000002382b105e54c80a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I just noticed that too, a new patch is incoming. Sorry fo=
r the noise!</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Tue, Aug 2, 2022 at 6:22 PM Thomas Petazzoni &lt;<a href=3D"=
mailto:thomas.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue,=C2=
=A0 2 Aug 2022 17:20:05 -0400<br>
Kyle Harding via buildroot &lt;<a href=3D"mailto:buildroot@buildroot.org" t=
arget=3D"_blank">buildroot@buildroot.org</a>&gt; wrote:<br>
<br>
&gt; Signed-off-by: Kyle Harding &lt;<a href=3D"mailto:kyle@balena.io" targ=
et=3D"_blank">kyle@balena.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/unbound/unbound.hash | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.ha=
sh<br>
&gt; index 68087cc28e..8bfe48df9f 100644<br>
&gt; --- a/package/unbound/unbound.hash<br>
&gt; +++ b/package/unbound/unbound.hash<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt; -# From <a href=3D"https://nlnetlabs.nl/downloads/unbound/unbound-1.16=
.0.tar.gz.sha256" rel=3D"noreferrer" target=3D"_blank">https://nlnetlabs.nl=
/downloads/unbound/unbound-1.16.0.tar.gz.sha256</a><br>
&gt; -sha256=C2=A0 6701534c938eb019626601191edc6d012fc534c09d2418d5b92827db=
0cbe48a5=C2=A0 unbound-1.16.0.tar.gz<br>
&gt; +# From <a href=3D"https://nlnetlabs.nl/downloads/unbound/unbound-1.16=
.2.tar.gz.sha256" rel=3D"noreferrer" target=3D"_blank">https://nlnetlabs.nl=
/downloads/unbound/unbound-1.16.2.tar.gz.sha256</a><br>
&gt; +sha256=C2=A0 2e32f283820c24c51ca1dd8afecfdb747c7385a137abe865c99db4b2=
57403581=C2=A0 unbound-1.16.2.tar.gz<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Locally calculated<br>
&gt;=C2=A0 sha256=C2=A0 8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001=
e51fbe6fd45db=C2=A0 LICENSE<br>
<br>
Thanks, but this patch is missing the change to <a href=3D"http://unbound.m=
k" rel=3D"noreferrer" target=3D"_blank">unbound.mk</a>.<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--0000000000002382b105e54c80a2--

--===============5804297965117473387==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5804297965117473387==--
