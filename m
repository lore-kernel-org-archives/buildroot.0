Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C89C433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 06:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFC334011D;
	Fri,  3 Dec 2021 06:03:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5tIrzVtnEnTm; Fri,  3 Dec 2021 06:03:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20A2F40161;
	Fri,  3 Dec 2021 06:03:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AFF131BF85D
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 06:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97BD44011D
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 06:03:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pDrCOQso6kCS for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 06:03:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B8D1400EB
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 06:03:08 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id w1so7177009edc.6
 for <buildroot@buildroot.org>; Thu, 02 Dec 2021 22:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=67jeip7c5epYUDH9EbSuLzBanBYvSLwlXl3h9PUFpRs=;
 b=qjkhlGfCEm3FdmRWJLpjv3BT1Cy+CfJ+Y4qZJubfQ7HgAeojc0kd+qBBw2aymnDgKD
 SKc7Ct+N9Fcd+3QCWe62koOzLkuDwjd7Yazn44DSqfI9WCszdHpeA/791k+rPiPP65of
 e6i9H45YwLNFxR11xB/xWziSbv9UXV5Al/ttifRIdA2jCxHOUriELi3SZ+RGfLDu5b1Q
 t5N2dn4cDnN4eHzD8UtzlzyiA5vl4ClkMp3YKifVWmefvGMIdz+mOLxoDy42MeYTZSbD
 4vhscBCDSX+n77N5SH0HBVOMt8pA+40gQJUJK5kLV21vzm0nBmMX3EUY4n5J5Wk9f/+R
 yMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=67jeip7c5epYUDH9EbSuLzBanBYvSLwlXl3h9PUFpRs=;
 b=p+sqit5mge2CAW3CNsOsjInx79ahT+aPx93KeNPJynWCgNX11Bn1YoDtkMEGTFLYQu
 wLY6W/Uy5mFk8mUj+glILXupp6RC2RkgSzdnHsVtaIXnvOQitV+c3G84MAEOaeFj1RTZ
 8n2DRJ8mnnZzV/bhnB/DCWVyBA34i+kZEBSRbfvr4Ii2C0S1p4zl2lWY00DxmSUkVGM2
 NxdY/iy/GNgelui9zMaVwyf2c9V1HgAXD6092KM31vLt+SxdyPsQLDR9+jlbIyeQLVzN
 gOPGVQynlNRXdqbP4nrXghlDYFchcs2BicIO515dk323A0z5eNQASYRGTUdB3bBX7Hqj
 oFzA==
X-Gm-Message-State: AOAM531y0qEvay6XT96jYRABL+mjxdBp4/3pP7y3+N1abK2NysuKENRt
 V1YSJ4USB32l0YowS8emu9Oi/T0j/iuBU1SXZ7LsxA==
X-Google-Smtp-Source: ABdhPJxBCb948ruFCd5q1ms3lOsZEURlp8ijer3iOGS15OVpq6gQQuFQ3yvog1zXgxigQXwkVb6xtgjuISVx+IT2f7s=
X-Received: by 2002:a05:6402:1743:: with SMTP id
 v3mr24249437edx.274.1638511386131; 
 Thu, 02 Dec 2021 22:03:06 -0800 (PST)
MIME-Version: 1.0
References: <CAJPV9MrzFk0obQYSyFKeF-PgQfnOi6GKow3tSPomtLcmdor3Yw@mail.gmail.com>
 <20211202193049.13ceb96e@gmx.net>
In-Reply-To: <20211202193049.13ceb96e@gmx.net>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Fri, 3 Dec 2021 08:02:55 +0200
Message-ID: <CAJPV9MrpUq3QPF1YziE8gsXh+2VBL3XLn4YX3T8S4wPrxxFG0w@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
Subject: Re: [Buildroot] New packages question
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
Content-Type: multipart/mixed; boundary="===============5988662653656196392=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5988662653656196392==
Content-Type: multipart/alternative; boundary="00000000000021999a05d237a901"

--00000000000021999a05d237a901
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 2, 2021 at 8:30 PM Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Jos=C3=A9,
>
> On Thu, 2 Dec 2021 12:41:30 +0200, Jos=C3=A9 Pekkarinen <
> jose.pekkarinen@unikie.com> wrote:
>
> > Hi,
> >
> > I'm reading a package for bmx7 to be upstreamed.
> >
> > I found the following error in one of the toolchains
> > (bootlin-x86-64-musl), and I wonder whether it is an issue
> > in the toolchain, and if it can be a blocker for the package to
> > be merged:
> >
> > In file included from
> >
> /home/debian/br-test-pkg/bootlin-x86-64-musl/host/x86_64-buildroot-linux-=
musl/sysroot/usr/include/net/ethernet.h:10,
> >                 from
> >
> /home/debian/br-test-pkg/bootlin-x86-64-musl/host/x86_64-buildroot-linux-=
musl/sysroot/usr/include/iwlib.h:29,
> >                 from ip.c:51:
> >
> /home/debian/br-test-pkg/bootlin-x86-64-musl/host/x86_64-buildroot-linux-=
musl/sysroot/usr/include/netinet/if_ether.h:116:8:
> > error: redefinition of =E2=80=98struct ethhdr=E2=80=99
> >  116 | struct ethhdr {
> >      |        ^~~~~~
> >
> > Best regards.
>
> Sometimes the musl build failure is fixable, search the git history for
> examples, e.g. [1], or at least resort disable for musl...
>
> Regards,
> Peter
>
> [1]
> https://git.buildroot.net/buildroot/commit/?id=3De0c1ce019f8a5aaf9f54ae85=
e18821048b23d940


I'll check it out! Thanks Peter!


Jos=C3=A9.

--00000000000021999a05d237a901
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 2, 2021 at 8:30 PM Peter =
Seiderer &lt;<a href=3D"mailto:ps.report@gmx.net">ps.report@gmx.net</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Jo=
s=C3=A9,<br>
<br>
On Thu, 2 Dec 2021 12:41:30 +0200, Jos=C3=A9 Pekkarinen &lt;<a href=3D"mail=
to:jose.pekkarinen@unikie.com" target=3D"_blank">jose.pekkarinen@unikie.com=
</a>&gt; wrote:<br>
<br>
&gt; Hi,<br>
&gt; <br>
&gt; I&#39;m reading a package for bmx7 to be upstreamed.<br>
&gt; <br>
&gt; I found the following error in one of the toolchains<br>
&gt; (bootlin-x86-64-musl), and I wonder whether it is an issue<br>
&gt; in the toolchain, and if it can be a blocker for the package to<br>
&gt; be merged:<br>
&gt; <br>
&gt; In file included from<br>
&gt; /home/debian/br-test-pkg/bootlin-x86-64-musl/host/x86_64-buildroot-lin=
ux-musl/sysroot/usr/include/net/ethernet.h:10,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from<br>
&gt; /home/debian/br-test-pkg/bootlin-x86-64-musl/host/x86_64-buildroot-lin=
ux-musl/sysroot/usr/include/iwlib.h:29,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ip.c=
:51:<br>
&gt; /home/debian/br-test-pkg/bootlin-x86-64-musl/host/x86_64-buildroot-lin=
ux-musl/sysroot/usr/include/netinet/if_ether.h:116:8:<br>
&gt; error: redefinition of =E2=80=98struct ethhdr=E2=80=99<br>
&gt;=C2=A0 116 | struct ethhdr {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~<br>
&gt; <br>
&gt; Best regards.<br>
<br>
Sometimes the musl build failure is fixable, search the git history for<br>
examples, e.g. [1], or at least resort disable for musl...<br>
<br>
Regards,<br>
Peter<br>
<br>
[1] <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3De0c1ce019f8=
a5aaf9f54ae85e18821048b23d940" rel=3D"noreferrer" target=3D"_blank">https:/=
/git.buildroot.net/buildroot/commit/?id=3De0c1ce019f8a5aaf9f54ae85e18821048=
b23d940</a></blockquote><div><br></div></div><blockquote style=3D"margin:0 =
0 0 40px;border:none;padding:0px"><div class=3D"gmail_quote"><div>I&#39;ll =
check it out! Thanks Peter!=C2=A0</div></div></blockquote><br><div dir=3D"l=
tr" class=3D"gmail_signature"><div dir=3D"ltr"><blockquote style=3D"margin:=
0px 0px 0px 40px;border:none;padding:0px">Jos=C3=A9.</blockquote></div></di=
v></div>

--00000000000021999a05d237a901--

--===============5988662653656196392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5988662653656196392==--
