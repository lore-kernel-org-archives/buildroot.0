Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B188606A322
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 13:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cfWFCahI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EKbH6jUz
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 779B4607CE;
	Mon,  9 Nov 2026 13:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iKePTZk6yzwu; Mon,  9 Nov 2026 13:56:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 73E6F607BC
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794232608;
	b=RPTD7hn+BXmRW++IVbc6yqDJ/jJm7/4/p+YzSev9OOrQs9gQuhZJYCakGR3wWMDfTf4d
	 FcWOYs+IGTw0yNSz0x+MLfxKGbT+rJ1o39z35YkaNJP9TysUUhKXke1DSLcf+UIleW3Vh
	 Yi0FQZaB2zWJBe5vKwOsCg4SN1uvnQQzCLgjIvc/lVSSeF+OCMa2xmU6FxFK/NLgI4dEe
	 DoziE6z8rdTFNt9+tiyW6b5L62bV3afz3PtNbatmxH5f/M8Mbjs/gmA+hlvxLmwIA9H/L
	 FQVylBKJUtQq+WItoO64EmiupiZrLhndUUdvtXmNLz6gDGFJbCArGBX71f6aYKdopnw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794232608;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Errors-To:Sender;
	bh=PZVDxSNZvuzzIqcDn2Vgl7yaYU1vAfYGiHx8e4paO2E=;
	b=Tyc5j/UVFm1ITwFT97OSdp2ZKKqjYiZ2sgZ4uLDD6h2droXgK3ztwpSbbKS+jSEqU+27
	 je59HI8NeGQ09WQeSH8gSVC5pKkUiiqCC2D/kP5A661+FjQuGAHvimMynqknmzn+D65Vx
	 3z64bWwzCelinTL9mAgjfO5BEbc7G4KCjX2zmtLvCMtpt3anl49OVrPVxFng+gn0tosIi
	 +la678QQjspvdkF5TVlu2pWxAqpil5AXqK+9HeJ7Honpd58+kUY0MzQkfvKlJTJPQwZVV
	 czE2UlcAmZTlX55aPQiUtsv11wgPjrAgvRWRczRoi7Chk6m6jlNNNsxojl7MJChYFQg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EKbH6jUz;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794232608;
	bh=PZVDxSNZvuzzIqcDn2Vgl7yaYU1vAfYGiHx8e4paO2E=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cfWFCahIsRwbHJ9Pker5ByArETor+6cdEvKdOwefHb8RA5f96RZEUMYPj/XFta8u6
	 gIkgLYb81b6bCokDN7fYptonHfIcZX+//XhtaTqyCJsEwuY1NT0Onk8M9NVbDJ8ULw
	 tuOz/6OUUECZ2nsg9CWT4eE+7R1EIOEY42bALR+35K4tNfzpBZvDtKwWe+KcKeZ/Te
	 qzu+Taa3Dh4aCL1O3AvyJSs8lDtr4Gv1S0X+wha5DX3UlGEoBS+JaAyTabJZK1uNaJ
	 tHNiSN+ccZHXR9cgY2ZKvnBhP8G3oZDuunDDmk9pQkZY585EbN2kWTCvhgoqn0ph6b
	 cNq2Io3pS7xUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73E6F607BC;
	Mon,  9 Nov 2026 13:56:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 04A102AC
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 13:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7830607CE
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 13:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SZnpvNyv3701 for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 13:56:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3FB3B607BC
Authentication-Results: smtp3.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=EKbH6jUz
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3FB3B607BC
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 13:56:44 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-8479f46ecd8so423728a34.0
 for <buildroot@buildroot.org>; Mon, 09 Nov 2026 05:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794232604; x=1794837404; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=MSBpPyHwisF1UChEiS3AKCkEUSkrgJy14ckfUimC7o0=;
 b=EKbH6jUzRZy6SBX133lkl678V+YVjH0Dxh5A0+1y7kJFqW8yo4Peta5BKEam3Fkcz6
 ggwbXRWlzQym63tQdj0W7PQ+IGRdnmgdmR3ZIv164X/ilCuX1ycKMm3hB/56cs1k9tdG
 gsYmz0NaJ3HqTgMzVpbm39NB6VUALeC1bzITiGoeQPeuhQIGoL8EU2Ngaom+Hw67cxc3
 TVpVAAl9CIESS+UHJa26yS30qI6C8eZHHOBp0nZ+xKjNliTHx/E4gxJ1vv/B0dzWi1kJ
 GK2I/FOxAkfCq6ertPwGHSqQOgCRgq0lQz4yFSNZ7QVlI7ukxx3pq5DjoQpDZ1U56DBz
 Uz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794232604; x=1794837404;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=MSBpPyHwisF1UChEiS3AKCkEUSkrgJy14ckfUimC7o0=;
 b=jNOflTCKdLbNgULQak7SVZ9WI3MoPi3HDq+9mifuy1Y/NGuDrfwvOqk1/SxbVrsx1c
 6rA6KDKxv3KtOio2wNrN534QAgMrXG6wXUa8taq9z/cZ6c69hmnEh2Dn9j9GXMq3mMTV
 b6FGq/B5lTW6tu3v7s1akKsCJkV5jdeu5dNq623WWNV6V9KXU6vAbh8GmicxM2vJ8vGY
 x8Uqc5E8Vyucb3v5s4pKvqBHf5i/wV63WyZrl19k4zkQC4uUBTOx4BI9SLP6iE/bCw74
 npJ3XoiQ34q1+DgMkpegEQV6r/QRujOtVZOWxj75UqGw5rZwY5R3sY2C9uL/i9TO4Bzo
 MTPQ==
X-Gm-Message-State: APuU4Z9q8zBMg1Ochq/R1Tn3MucNjjZIUKqCLx5Q+QiR8yB0U4GYlVbK
 Mq2I1jhq6Ks4Hyn+z7BGulDjtAdJBeZ6xyLCqq+cszZba3OJ5ehDX78tm2zEG/aC2EmD7fVgo6P
 jJyYMD2z4XLYOaM/71gPJ+lH+x7RQy0o=
X-Gm-Gg: AYBFou3f7Tx9brBEM5k6ApI8TvBNvg91fPJaqXi48tHoATT/FTNK+XPnx2XD4O7c0C3
 +cy/zN7NAu8xpJfZrFh4RC2F+vjVMbrYGm5WfKwJq1lA4ep1chMNhajtCf0szIY6+n1/lcvCMxh
 42y4w5uudO+UWrURfHBOpmeLe6hfWQhJT0NfIecOR+SjRvICCfUUAhuN5KlqM3UodP6uHW2/WNp
 EoR+F4rwHVA4ZqKe6k/cWiaTYpDCT45lHU157kSzMLxhGpsIGCuhV6kuUaQzTZ7GD3huAjVcZko
 /Yhh8KbYoH6ZH9t2JLNXormQm5p6UHOYpR3UDG3ke8w0P9zFuN5jhMdcJCKJ7EAgpbJwJCoQHAh
 oieU7HZGekFolYy3M4a4EKZLxaHJCC9cTReW2
X-Received: by 2002:a05:6808:3502:b0:503:aaf8:ef12 with SMTP id
 5614622812f47-568146c3723mr2924358b6e.34.1794232603724; Mon, 09 Nov 2026
 05:56:43 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261109130533.4171508-1-angelo.compagnucci@gmail.com>
 <ed565657-1ebf-4733-8003-c40f2104e9dd@cherry.de>
In-Reply-To: <ed565657-1ebf-4733-8003-c40f2104e9dd@cherry.de>
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 9 Nov 2026 14:56:07 +0100
X-Gm-Features: AclHuK_S3tFokJbBLfiORaM1Og4UxBL9pes7wvnsJPizci-_TyJucRM5DJFJVBg
Message-ID: <CA+TH9VnTPNYrB=i4cQ9s8FqBhKUz3DXB7_=A=FFDERMJowh+-Q@mail.gmail.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [Buildroot] [PATCH 0/2] package/qt5: security bump to version
 5.15.19
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joshua Henderson <joshua.henderson@microchip.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Peter Seiderer <ps.report@gmx.net>,
 buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: multipart/mixed; boundary="===============5497029919391634111=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=2.1 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5497029919391634111==
Content-Type: multipart/alternative; boundary="000000000000fd4fbe065fd854ca"

--000000000000fd4fbe065fd854ca
Content-Type: text/plain; charset="UTF-8"

Il giorno lun 9 nov 2026 alle ore 14:42 Quentin Schulz <
quentin.schulz@cherry.de> ha scritto:

> Hi Angelo,
>
> Thanks for working on this! I'll try to find time to review this soon.
>
> On 11/9/26 2:05 PM, Angelo Compagnucci wrote:
> > This bumps the qt5 packages to Qt 5.15.19, from the kde/5.15 branch of
> > KDE's Qt5 Patch Collection, which is now rebased on it. qt5webengine
> > is bumped in its own patch, as it drops and refreshes some patches of
> > qt5webengine-chromium.
> >
>
> I don't think this warrants separate patches, c.f. ff4243147d54
> ("package/qt5: bump packages to latest 5.15 kde submodule version") for
> the previous bump. Please do not send a v2 only for this, unless a
> Buildroot maintainer requests it explicitly.


> > This should be the last Qt5 bump: Qt 5.15.19 is the very last Qt 5.15
> > release, and the Qt Company ended its support of Qt 5.15 after 26 May
> > 2025 [1]. KDE keeps its Qt5 Patch Collection only for the open source
> > projects still on Qt 5.15 until they move to Qt 6, and only for very
> > critical fixes [2]. Qt5 users should plan their move to Qt6.
> >
> > FYI: I am working on a series moving the Qt5 users to Qt6 and removing
> > Qt5 from Buildroot. Before sending it, I would like to get feedback on
> > this: would the removal be welcome, and when (for example after the
> > next LTS)?
> >
>
> If upstream is not going to fix CVEs, I'm not sure it makes sense to
> have support for qt5 in the next LTS. But maybe the LTS maintainers have
> a different opinion. The cleanup will likely not be straightforward and
> will remove a lot of Kconfig symbols, ifdefery in packages and even
> packages and defconfigs making use of qt5. Someone will need to do it at
> some point though :)
>

I have the series already implemented, I'm testing it currently, it takes a
lot of time, but I think it'sgood enough.
I only wait for a green light ;)


>
> As far as I'm concerned, if I still need qt5, then it's my burden to
> maintain it in a downstream fork.
>
> Cheers,
> Quentin
>


-- 
Profile: http://it.linkedin.com/in/compagnucciangelo

--000000000000fd4fbe065fd854ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Il giorno lun 9=
 nov 2026 alle ore 14:42 Quentin Schulz &lt;<a href=3D"mailto:quentin.schul=
z@cherry.de">quentin.schulz@cherry.de</a>&gt; ha scritto:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Hi Angelo,<br>
<br>
Thanks for working on this! I&#39;ll try to find time to review this soon.<=
br>
<br>
On 11/9/26 2:05 PM, Angelo Compagnucci wrote:<br>
&gt; This bumps the qt5 packages to Qt 5.15.19, from the kde/5.15 branch of=
<br>
&gt; KDE&#39;s Qt5 Patch Collection, which is now rebased on it. qt5webengi=
ne<br>
&gt; is bumped in its own patch, as it drops and refreshes some patches of<=
br>
&gt; qt5webengine-chromium.<br>
&gt; <br>
<br>
I don&#39;t think this warrants separate patches, c.f. ff4243147d54 <br>
(&quot;package/qt5: bump packages to latest 5.15 kde submodule version&quot=
;) for <br>
the previous bump. Please do not send a v2 only for this, unless a <br>
Buildroot maintainer requests it explicitly.=C2=A0</blockquote><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
&gt; This should be the last Qt5 bump: Qt 5.15.19 is the very last Qt 5.15<=
br>
&gt; release, and the Qt Company ended its support of Qt 5.15 after 26 May<=
br>
&gt; 2025 [1]. KDE keeps its Qt5 Patch Collection only for the open source<=
br>
&gt; projects still on Qt 5.15 until they move to Qt 6, and only for very<b=
r>
&gt; critical fixes [2]. Qt5 users should plan their move to Qt6.<br>
&gt; <br>
&gt; FYI: I am working on a series moving the Qt5 users to Qt6 and removing=
<br>
&gt; Qt5 from Buildroot. Before sending it, I would like to get feedback on=
<br>
&gt; this: would the removal be welcome, and when (for example after the<br=
>
&gt; next LTS)?<br>
&gt; <br>
<br>
If upstream is not going to fix CVEs, I&#39;m not sure it makes sense to <b=
r>
have support for qt5 in the next LTS. But maybe the LTS maintainers have <b=
r>
a different opinion. The cleanup will likely not be straightforward and <br=
>
will remove a lot of Kconfig symbols, ifdefery in packages and even <br>
packages and defconfigs making use of qt5. Someone will need to do it at <b=
r>
some point though :)<br></blockquote><div><br></div><div>I have the series =
already implemented, I&#39;m testing it currently, it takes a lot of time, =
but I think it&#39;sgood enough.</div><div>I only wait for a green light ;)=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
As far as I&#39;m concerned, if I still need qt5, then it&#39;s my burden t=
o <br>
maintain it in a downstream fork.<br>
<br>
Cheers,<br>
Quentin<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Pr=
ofile: <a href=3D"http://it.linkedin.com/in/compagnucciangelo" target=3D"_b=
lank">http://it.linkedin.com/in/compagnucciangelo</a></div></div>

--000000000000fd4fbe065fd854ca--

--===============5497029919391634111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5497029919391634111==--
