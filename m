Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F726C2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 19:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2104940E94;
	Tue,  9 Jul 2024 19:52:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pP9U8bgbf4fb; Tue,  9 Jul 2024 19:52:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 235B040ED2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 235B040ED2;
	Tue,  9 Jul 2024 19:52:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 757441BF5DE
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 19:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B8D640E94
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 19:52:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q80LoXhwtMyI for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 19:52:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E614340585
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E614340585
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E614340585
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 19:52:36 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42565670e20so593515e9.0
 for <buildroot@buildroot.org>; Tue, 09 Jul 2024 12:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720554755; x=1721159555;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lKYCskxB5vakS1UpKQMDY0TyP8oyAtLrgidS/Q734dw=;
 b=lDUGRWiXEtxO6hC8L6XjE8akMucFvRM961SnlFPj9HZaMkEraEo5ciZMS1to9NCxHI
 JLprs3SrNpSCOIGxS6f08AHsjgIvzMlbyG2cBuXaBqT+1q9r20CTvv3pQRyQIeFreZcH
 DnqmTzsP0qH9X8CCMBoLZUfHvqrIJ8ipW+tdCqDtTCCp0N3M0ebDkp61MVyreHFsqRKi
 6sDNkVH+kbZaBWTymNEDPQ5eWL3rEprTMB/BYCAPgP1GXA71UOsp9Vgy+4sJ7w+yOo26
 f5m12946q3wgcYzq5W3a78KsZMjAlyOx8XmETfzK9eAASG+kPUO6mp/qkEDcXrfht276
 NPBw==
X-Gm-Message-State: AOJu0Yx9AC5OtU93/G6rwEuqAvWumFoMZZgBzZl8NrzJuzU/2dxLrwWZ
 JDlSpPuDYarilXle+4oRrM/AibXw0mjCuBnhTj5DlgqZe78gCn/RbVDUxbQcsxdTNqPwEpGXQXT
 5wJnvxtA4Dml51X/dC1L+Qk5+TwY=
X-Google-Smtp-Source: AGHT+IEXtCqqn52ZayPrSeA2rte2kFypfWbtGDTpG8+z5wgdyxPJjxWQjblmZa2gRYIo5svnhnpYe1sdUblep7mTYIw=
X-Received: by 2002:a5d:6808:0:b0:367:8a2d:b354 with SMTP id
 ffacd0b85a97d-367d2b40e9fmr2586281f8f.14.1720554754301; Tue, 09 Jul 2024
 12:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240709101841.1145134-1-fiona.klute@gmx.de>
 <20240709101841.1145134-4-fiona.klute@gmx.de>
 <20240709214519.2c8c5968@windsurf>
In-Reply-To: <20240709214519.2c8c5968@windsurf>
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 9 Jul 2024 21:52:21 +0200
Message-ID: <CA+TH9V=JtqxKcR+PC9xms+iDtPq9M2itUx3qpkvMdMzyjL6p4A@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720554755; x=1721159555; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lKYCskxB5vakS1UpKQMDY0TyP8oyAtLrgidS/Q734dw=;
 b=Gz3U/fKQUzxZ9jRWJvKKWKOjq5eWUcClGM7+/JWY+x9lJhw7VjZh6rcvFmSEeMEMp3
 lENdIuFJm78808v0nnk3Zjr7gseWJtY2Ma7aR+jdTJm4mM8qqdA1H9mLk5QKuEBPaLGI
 EwqsFmQVgN8VJY52ljOGUaY9pgBKfIAWTFxC97lfkYwG/IQJG7NPcFCsy792xm9tvclO
 wns7d8+xVZjGWsVi9i6V/I9WWhMWK+mYR5G9shYCMiIh1vPST0nesAnxHfaDuLVpdWSb
 UxJ/QZ7qDhE88Ko61EFhK75DAbaxC2+rqaHyusGjfroeXBJntFyn3bJeiv5zKT9gof12
 +blw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Gz3U/fKQ
Subject: Re: [Buildroot] [PATCH v3 3/4] package/fail2ban: bump version to
 1.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>, Asaf Kahlon <asafka7@gmail.com>,
 Fiona Klute via buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============6037317938215775119=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6037317938215775119==
Content-Type: multipart/alternative; boundary="000000000000f26697061cd5deb5"

--000000000000f26697061cd5deb5
Content-Type: text/plain; charset="UTF-8"

Il mar 9 lug 2024, 21:45 Thomas Petazzoni <thomas.petazzoni@bootlin.com> ha
scritto:

> Hello Fiona,
>
> On Tue,  9 Jul 2024 12:18:40 +0200
> Fiona Klute via buildroot <buildroot@buildroot.org> wrote:
>
> > From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> >
> > Fail2ban 1.1.0 brings Python 3.12 compatibility, and removes support
> > for 2.x. This means 2to3 handling can be dropped.
> >
> > Unfortunately fail2ban 1.1.0 still relies on asynchat and asyncore,
> > which have been removed from the Python standard library in
> > 3.12. Depend on the compatibility package python-pyasynchat (which
> > pulls in python-pyasyncore) and remove copies bundled in upstream
> > code.
> >
> > Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> > ---
> > Changes v2 -> v3:
> > * Add "# runtime" comment for pyasynchat dependency, drop
> >   FAIL2BAN_DEPENDENCIES in fail2ban.mk
>
> Unfortunately, this updated package fails to build for me:
>
> /bin/sed -i -e '/^socket/c\socket = /run/fail2ban.sock'
> /home/thomas/projets/buildroot/output/target/etc/fail2ban/fail2ban.conf
> /bin/sed: can't read
> /home/thomas/projets/buildroot/output/target/etc/fail2ban/fail2ban.conf: No
> such file or directory
> make: *** [package/pkg-generic.mk:378:
> /home/thomas/projets/buildroot/output/build/fail2ban-1.1.0/.stamp_target_installed]
> Error 2
>
> The /etc/fail2ban/fail2ban.conf file is apparently no longer installed.
> Did you try the fail2ban build from a fully clean build?
>

It doesn't work without applying my previous fixes (for python and
fail2ban).
Fiona documented in the cover letter.

Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--000000000000f26697061cd5deb5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mar 9 lug 2024, 21:45 Thomas Petazzoni &lt;<a href=
=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&g=
t; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello Fiona,<br>
<br>
On Tue,=C2=A0 9 Jul 2024 12:18:40 +0200<br>
Fiona Klute via buildroot &lt;<a href=3D"mailto:buildroot@buildroot.org" ta=
rget=3D"_blank" rel=3D"noreferrer">buildroot@buildroot.org</a>&gt; wrote:<b=
r>
<br>
&gt; From: &quot;Fiona Klute (WIWA)&quot; &lt;<a href=3D"mailto:fiona.klute=
@gmx.de" target=3D"_blank" rel=3D"noreferrer">fiona.klute@gmx.de</a>&gt;<br=
>
&gt; <br>
&gt; Fail2ban 1.1.0 brings Python 3.12 compatibility, and removes support<b=
r>
&gt; for 2.x. This means 2to3 handling can be dropped.<br>
&gt; <br>
&gt; Unfortunately fail2ban 1.1.0 still relies on asynchat and asyncore,<br=
>
&gt; which have been removed from the Python standard library in<br>
&gt; 3.12. Depend on the compatibility package python-pyasynchat (which<br>
&gt; pulls in python-pyasyncore) and remove copies bundled in upstream<br>
&gt; code.<br>
&gt; <br>
&gt; Signed-off-by: Fiona Klute (WIWA) &lt;<a href=3D"mailto:fiona.klute@gm=
x.de" target=3D"_blank" rel=3D"noreferrer">fiona.klute@gmx.de</a>&gt;<br>
&gt; ---<br>
&gt; Changes v2 -&gt; v3:<br>
&gt; * Add &quot;# runtime&quot; comment for pyasynchat dependency, drop<br=
>
&gt;=C2=A0 =C2=A0FAIL2BAN_DEPENDENCIES in <a href=3D"http://fail2ban.mk" re=
l=3D"noreferrer noreferrer" target=3D"_blank">fail2ban.mk</a><br>
<br>
Unfortunately, this updated package fails to build for me:<br>
<br>
/bin/sed -i -e &#39;/^socket/c\socket =3D /run/fail2ban.sock&#39; /home/tho=
mas/projets/buildroot/output/target/etc/fail2ban/fail2ban.conf<br>
/bin/sed: can&#39;t read /home/thomas/projets/buildroot/output/target/etc/f=
ail2ban/fail2ban.conf: No such file or directory<br>
make: *** [package/<a href=3D"http://pkg-generic.mk:378" rel=3D"noreferrer =
noreferrer" target=3D"_blank">pkg-generic.mk:378</a>: /home/thomas/projets/=
buildroot/output/build/fail2ban-1.1.0/.stamp_target_installed] Error 2<br>
<br>
The /etc/fail2ban/fail2ban.conf file is apparently no longer installed.<br>
Did you try the fail2ban build from a fully clean build?<br></blockquote></=
div></div><div dir=3D"auto"><br></div><div dir=3D"auto">It doesn&#39;t work=
 without applying my previous fixes (for python and fail2ban).</div><div di=
r=3D"auto">Fiona documented in the cover letter.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, CTO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
</blockquote></div></div></div>

--000000000000f26697061cd5deb5--

--===============6037317938215775119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6037317938215775119==--
