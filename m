Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BA6C25B06
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 21:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BF104048B;
	Thu,  4 Aug 2022 21:27:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BF104048B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04BaccBZuI_A; Thu,  4 Aug 2022 21:27:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF69540370;
	Thu,  4 Aug 2022 21:27:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF69540370
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA4231BF842
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 21:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C53466F8E0
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 21:27:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C53466F8E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gl-c2q1TpOkf for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 21:27:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E827610BE
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E827610BE
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 21:27:34 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 p14-20020a17090a74ce00b001f4d04492faso968181pjl.4
 for <buildroot@buildroot.org>; Thu, 04 Aug 2022 14:27:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=aQqcIwJb4zRY8wd1lYOn1GHI3xDL0xni679HFbMQmDA=;
 b=MejtHVcuCCm9xvpUPJyKLUCPZjEDnXYubo3cIZY+zvcXRV9y2Gd8Nr8dI/ucdZyaUz
 tct5xLQAYXbKnxLF+Id3nFUm8tNiKf8t+E0/audlPJevnffxm1mWoYvIb1DgDN5NIQk7
 fuX0l7JNSR/wfPnjypPBEFy8NUjCk8C4BMKos8nqQLDbDVsytezjnOE/Wtbmmk0yTcM8
 V6PX78l7EOFFC075/BFp1QwffkOAOKZFqXXRRRHlMldV2/PqVXJG5JGDhX5tWhaL+PXH
 lOfsWm0Aym2iRBdcIxp0ZZZMeFh1Xb+KU1kDrOZkwgqTuT3iD1A5Q5w15kMQ5it6fnvt
 vpHg==
X-Gm-Message-State: ACgBeo09TOvMNM5BmFPZ9x6LGgocbT251ucYYfNm1XduhfoWkLH/8rn4
 WH5y1T1j8S6LxFSiYu7DDjBLXg+6R749S7fII9iqXz0MSy8=
X-Google-Smtp-Source: AA6agR53ZLSz4cdFZ7ngCYxZpqBvZ2l9E+FHWlPmb/yBZ5/cEJ+z0Iwvr60F+HvnQuMtHCVz3WHbE4muFvHg9y2exYI=
X-Received: by 2002:a17:903:22c1:b0:16e:fbcc:f298 with SMTP id
 y1-20020a17090322c100b0016efbccf298mr3778254plg.2.1659648453812; Thu, 04 Aug
 2022 14:27:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220726193810.43817-1-pevik@seznam.cz>
 <20220726220405.4fbd3e0c@windsurf>
 <CAB1t1Cxs_U0rtKxoaWByef71KOrOeuL9_MpYM--TQCwS8eA0wA@mail.gmail.com>
 <20220803235722.63985959@windsurf>
In-Reply-To: <20220803235722.63985959@windsurf>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 4 Aug 2022 23:27:22 +0200
Message-ID: <CAB1t1CxGi9rMyK0faY=fix5KVpBYL4XQ13mtqmQ-KZVNZA2ibQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=aQqcIwJb4zRY8wd1lYOn1GHI3xDL0xni679HFbMQmDA=;
 b=W5MMSIqoVQkox5qA9P8wmPdcqdEYqLDamT4k682bOMiqrsrdw6ez9MoXsXnB//gNe2
 FLhbWx4FbYky8HL7a2OyJeim8i/f4H+jGL+aLnzdRt5MG/92HKonpTlkI9FxIZ/7Khhe
 OB9z1QNoI4AOVQwHQWNYL5NwLQxFlQP7Hs7hMLaiio0FeRnQptONkGhW7yxjFTDoMvnO
 AXPE6QmMs9iCRaH6mgNIV36sq0XLWirlrIm25LJKvRvDTVBqsG96cTzjjn+EoNAZ574x
 UUllCwrgijDkiaQwOAdfT3gBK7PeQEf5UF7qR5HdTk7iCdiYVCafeO3CslGX70pN4JOJ
 7exg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=W5MMSIqo
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
Content-Type: multipart/mixed; boundary="===============2200495617518870403=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2200495617518870403==
Content-Type: multipart/alternative; boundary="0000000000008aa4ad05e5710492"

--0000000000008aa4ad05e5710492
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Wed, 3 Aug 2022 at 23:57, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> Hello Petr,
>
> On Fri, 29 Jul 2022 20:36:09 +0200
> Petr Vorel <petr.vorel@gmail.com> wrote:
>
> > I'm also a bit annoyed by patches like this that we cannot upstream
> > > (and therefore have to keep forever), and that require AUTORECONF :-/
> > >
> > Understand, I'm sorry. I can either add  po4a as host package to have it
> in
> > build or discuss with Debian maintainer how to make translations (po4a
> > non-mandatory).
> > What do you prefer? Hope I'm now clear about the goal.
>
> I would prefer to make translations not mandatory.

Thanks for info. Understand, makes sense.


> Actually, there is
> already some partial logic for it, but not used properly. The following
> patch is probably a useful start:
>
Thanks!

Kind regards,
Petr

--0000000000008aa4ad05e5710492
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Thomas,</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Wed, 3 Aug 2022 at 23:57, Thomas Petazzo=
ni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazzoni@boo=
tlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Hello Petr,<br>
<br>
On Fri, 29 Jul 2022 20:36:09 +0200<br>
Petr Vorel &lt;<a href=3D"mailto:petr.vorel@gmail.com" target=3D"_blank">pe=
tr.vorel@gmail.com</a>&gt; wrote:<br>
<br>
&gt; I&#39;m also a bit annoyed by patches like this that we cannot upstrea=
m<br>
&gt; &gt; (and therefore have to keep forever), and that require AUTORECONF=
 :-/<br>
&gt; &gt;=C2=A0 <br>
&gt; Understand, I&#39;m sorry. I can either add=C2=A0 po4a as host package=
 to have it in<br>
&gt; build or discuss with Debian maintainer how to make translations (po4a=
<br>
&gt; non-mandatory).<br>
&gt; What do you prefer? Hope I&#39;m now clear about the goal.<br>
<br>
I would prefer to make translations not mandatory.</blockquote><div>Thanks =
for info. Understand, makes sense.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"> Actually, there is<br>
already some partial logic for it, but not used properly. The following<br>
patch is probably a useful start:<br></blockquote><div>Thanks!=C2=A0</div><=
div><br></div><div>Kind regards,</div><div>Petr</div></div></div>

--0000000000008aa4ad05e5710492--

--===============2200495617518870403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2200495617518870403==--
