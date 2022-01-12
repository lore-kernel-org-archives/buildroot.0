Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13455C43219
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 08:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A9476FB86;
	Wed, 12 Jan 2022 08:54:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5F_Uqa4eYwvw; Wed, 12 Jan 2022 08:53:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B65BB6FB83;
	Wed, 12 Jan 2022 08:53:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4AA021BF2C7
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 08:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 397296FB83
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 08:53:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fXiUS2ONHeRp for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 08:53:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5412D6FB7A
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 08:53:56 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id s9so2450801oib.11
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 00:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=26WLP9iCRCp+0evfPGFV2tb5KMBDOqSvja0ChZNK/fY=;
 b=C0EjID0RZOCMIlFt1XoipqZgva1KhCqdwJMSFFoCgmlDAcCP2GOyC2MYdUlgfRAem6
 whTuogVxkZUxhZpxMR7IZvKz7cWZ6BeZLo1EJe6vxCV7e9r2UuoR3K7C8tiCDRY942zy
 oFkBtq2/Mevz6NV+uJtoU8ooMvsCF2m4Z7smJanXJIt1HDYtJ702ha3R4A2m0COx+aYI
 VmylD8VJSK5WiGHtfSgpFkp0CHuWTiQOL74i4fFbMYRvpUJn2VZr0vu3t1bLhIA5gKrH
 aBbP3zPFb9fbWnxA/iVbFh0melP0DicBqrdvNjDNXS1KwrXQJLcQCbkH0VFksRNrOJFb
 JtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=26WLP9iCRCp+0evfPGFV2tb5KMBDOqSvja0ChZNK/fY=;
 b=oVyUEWU3b4UhTu/PgBLOKYa+xUL2I18HgZ8qV6cEmo9ByletM1lWUB196PRTDJRUsp
 bFk1jZ6LZPsRxZVuk7Oji7wuqu8+qPTVzKEuf/B3h3M7gISSCdVHbtJ+KIjZ0tmeEt5z
 TfLnbrj/3rV9Qq6inx2Pd8QR+0d6a/u50wtQJ853W7Zx1hzmkW/C7qs1u7kHV9l5s3ZA
 k+y9Xc5vgHIVXssYvNjp2n3mtmNJGDFut560CbjZEbB7CJPM31Qer/txptgBJnvbLIiu
 IVsNxkw/LsJFwrOKPQhJuWEbAgbqwPGtq/5EsgU7N62p05oiLCt0SqtWz7+hhlRPy5pT
 bJ7Q==
X-Gm-Message-State: AOAM532C7JDuiwhBX37G4bYxESepMrNCLbMH9rG1HjnplcfuWz09kSV9
 YfRr9miiuVe2CCFGClYmATtenPsaDM+7EmqI5EU=
X-Google-Smtp-Source: ABdhPJxl09qB01+SuNmiNoBIs3ZcPwz04SfGJV8AfJXtqmS4R5Oi4E9jBH+2XCjaTU4cE8bj77P755zmLpBN9dfxqVc=
X-Received: by 2002:a05:6808:1248:: with SMTP id
 o8mr4419073oiv.157.1641977635394; 
 Wed, 12 Jan 2022 00:53:55 -0800 (PST)
MIME-Version: 1.0
References: <20201004224137.193808-1-nolange79@gmail.com>
 <20220112091422.1cd29c1f@windsurf>
In-Reply-To: <20220112091422.1cd29c1f@windsurf>
From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 12 Jan 2022 09:53:44 +0100
Message-ID: <CADYdroO91V3OkkyZfsKTW9jPfi0rxw6+f+ei=SUUSW7V5+ZkRQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH] skeleton + init: prepare /run/lock and
 adjust compat symlinks
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Adam Duskett <aduskett@gmail.com>,
 =?UTF-8?B?TWljaGHFgiDFgXlzemN6ZWs=?= <michal.lyszczek@bofc.pl>,
 buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============2816824277876993239=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2816824277876993239==
Content-Type: multipart/alternative; boundary="000000000000afd66905d55eb510"

--000000000000afd66905d55eb510
Content-Type: text/plain; charset="UTF-8"

Thomas Petazzoni <thomas.petazzoni@bootlin.com> schrieb am Mi., 12. Jan.
2022, 09:14:

> Hello Norbert,
>
> On Mon,  5 Oct 2020 00:41:36 +0200
> Norbert Lange <nolange79@gmail.com> wrote:
>
> > Linux distros changed /var/run and /var/lock to reside on an tmpfs in
> > /run a long time ago, and buildroot seems to agree by providing this
> > tmpfs on all supported init systems.
>
> I am not 100% sure but it seems like this patch has potentially broken
> the build of vtun, which now fails with:
>
>   /usr/bin/install: cannot create directory
> '/home/giuliobenetti/autobuild/run/instance-0/output-1/target/var/lock':
> File exists
>
> If you look at http://autobuild.buildroot.net/?reason=vtun%, vtun
> version 3.0.4 restarted failing to build on January 10, with this error.
>
> Could you have a look ?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com


Seems like the issue is, that run/lock is not existing when installing.
Anything installed there will be gone (already before this commit), so it's
kinda pointless to do so.

I don't know how many packages have this issue, imho it would be better to
fix them instead of making a run/lock directory for broken packages (that
will get removed later)

Norbert

--000000000000afd66905d55eb510
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div dir=3D"auto"><br></div><br><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Thomas Petazzoni &lt;<a hr=
ef=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>=
&gt; schrieb am Mi., 12. Jan. 2022, 09:14:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">Hello Norbert,<br>
<br>
On Mon,=C2=A0 5 Oct 2020 00:41:36 +0200<br>
Norbert Lange &lt;<a href=3D"mailto:nolange79@gmail.com" target=3D"_blank" =
rel=3D"noreferrer">nolange79@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Linux distros changed /var/run and /var/lock to reside on an tmpfs in<=
br>
&gt; /run a long time ago, and buildroot seems to agree by providing this<b=
r>
&gt; tmpfs on all supported init systems.<br>
<br>
I am not 100% sure but it seems like this patch has potentially broken<br>
the build of vtun, which now fails with:<br>
<br>
=C2=A0 /usr/bin/install: cannot create directory &#39;/home/giuliobenetti/a=
utobuild/run/instance-0/output-1/target/var/lock&#39;: File exists<br>
<br>
If you look at <a href=3D"http://autobuild.buildroot.net/?reason=3Dvtun%" r=
el=3D"noreferrer noreferrer" target=3D"_blank">http://autobuild.buildroot.n=
et/?reason=3Dvtun%</a>, vtun<br>
version 3.0.4 restarted failing to build on January 10, with this error.<br=
>
<br>
Could you have a look ?<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, CTO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a></blockquote></div></div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Seems like the issue is, that run/lock is not exist=
ing when installing.</div><div dir=3D"auto">Anything installed there will b=
e gone (already before this commit), so it&#39;s kinda pointless to do so.<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">I don&#39;t know how man=
y packages have this issue, imho it would be better to fix them instead of =
making a run/lock directory for broken packages (that will get removed late=
r)</div><div dir=3D"auto"><br></div><div dir=3D"auto">Norbert</div><div dir=
=3D"auto"><br></div></div>

--000000000000afd66905d55eb510--

--===============2816824277876993239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2816824277876993239==--
