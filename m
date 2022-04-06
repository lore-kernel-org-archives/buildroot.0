Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C48C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 22:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9815B83ED6;
	Wed,  6 Apr 2022 22:15:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 88mdbAAI7nKg; Wed,  6 Apr 2022 22:15:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EE8C83ED2;
	Wed,  6 Apr 2022 22:15:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 64D511BF3C0
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 22:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 540AB83ED2
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 22:15:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mK0cie88MaaM for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 22:15:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59DA483ED1
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 22:15:37 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id d138so6435055ybc.13
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 15:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JaD2VaOrF3Hxxuci3LKj9RnmDZvBuDJzqfz+l4Ul/DU=;
 b=dnEClGvxnSkgAQRjdIYND/1m7Yj6oXNtgBgymHjWjolX0Eec92QG7BBiMIyOVhSuBE
 O99XsVErxbeumzz2c5e+f6UNwDMiM4XiQr/101up8CtvhAPpLuB3TbiddTR9O1BGcr4j
 k9uiZ6g1wkYqYpyfUs9ivWYXqi7bwuYdLk2cX+l0clziUpzCw+Gi5/Pv9BTJu2lVWrge
 pFYvp6okfunyzsZseHBUsCy9E2DnprMMVu54vFisBa/y4wq2tmZ4MB+nEfclkP4Wc9KE
 Bc2zYXwyvvH0i+RA2rNzTZecScguBq5pclOUJaFfKRriClZYot3a/ZnF5ryzXQvt6P4d
 Ajjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JaD2VaOrF3Hxxuci3LKj9RnmDZvBuDJzqfz+l4Ul/DU=;
 b=jRjCyhNU9cg2KXTm3/pefKe38uUIhZO4Q+Blt8x2mHZVR467LZ9DFrJ4yok4eM+TOB
 2m5Bp/kEiovbBdypxNIwUS4E2k4cwiWxEzTMSPtSDyaJ+14e8pQPBky3c78LN+1Hiz65
 I5tCVvlEqFhEZsuyTiOGtkmxKVu2KBr6K6ChLgMTQsnw0rCE5PVdxykVAbGCK/MGq+a2
 meY38PH6lW9hgPoOjinIRyqeM5iknfRdH31+2hLQ806qoqOK8vZMF0rHCB9JYy4ebUoN
 0Y9fMiSkp8AXzdQvN+74+tvlzBKJBVWv4v5EDIa64/Bsrl4k5snnEPVys+1BS7RIH6oq
 a4Mw==
X-Gm-Message-State: AOAM533gkphxBI7qr4XC2oE9syte+eP1oF5ScTEMygWgbMULCOG6xqO+
 bYzyu6yXE4wpPtTY2tEQJqLp8Gx0Gl0F6W6WuLw=
X-Google-Smtp-Source: ABdhPJzr4cMxRlzwgEKnLVdd4497M4hMa+phEK/FHEtTHe4wMzJWjqVs7G7DAb+1W/kRxjblKWeLqaPjHHfvIPL+baU=
X-Received: by 2002:a25:adc8:0:b0:633:b79d:92ee with SMTP id
 d8-20020a25adc8000000b00633b79d92eemr7838133ybe.457.1649283336323; Wed, 06
 Apr 2022 15:15:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAM70yxCknY7qH9uiqNpDhynxAdsjw1zM9AH=UaiAzET+f7treA@mail.gmail.com>
 <a4724812-eafb-0ffc-b14d-df9ed04aac80@mind.be>
 <CAM70yxAu66JWhogiabz7fXqz4XpFGXmiOaahX5V3+GKQG_eUfw@mail.gmail.com>
 <CADvTj4oT2COBMmeg3jONzVX4_wXxKFLEe9Nh3AakSBbon5RQjQ@mail.gmail.com>
In-Reply-To: <CADvTj4oT2COBMmeg3jONzVX4_wXxKFLEe9Nh3AakSBbon5RQjQ@mail.gmail.com>
From: Emile Cormier <emile.cormier.jr@gmail.com>
Date: Wed, 6 Apr 2022 19:15:25 -0300
Message-ID: <CAM70yxDPCUobSnoq7XhH=k7Q8B5x9j2=DSWS9a-VN3iX6zg5pA@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [Feature Request] Host cmake built with the
 --system-curl option
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
Content-Type: multipart/mixed; boundary="===============5029655164871099741=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5029655164871099741==
Content-Type: multipart/alternative; boundary="00000000000065475f05dc03b3ad"

--00000000000065475f05dc03b3ad
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 6, 2022 at 6:50 PM James Hilliard <james.hilliard1@gmail.com>
wrote:

> On Wed, Apr 6, 2022 at 2:13 PM Emile Cormier <emile.cormier.jr@gmail.com>
> wrote:
> > Buildroot's cmake is being executed in my post-build script instead of
> my system's cmake. How do I make my system's cmake take precedence?
>
> I think you just need to update your system's cmake to something that
> meets the
> required minimum version:
>
> https://github.com/buildroot/buildroot/blob/ac91235797fe9b234fb820c0112f21c26be1349f/support/dependencies/check-host-cmake.mk#L6
>

Ah, that explains why I started getting CMake https download failures
_after_ the buildroot cmake version was bumped. My system's cmake version
was in between buildroot's versions for cmake.

However, I think having to rely on the system's CMake version goes against
the buildroot philosophy of an image build not relying on the tools and
libraries available on the build system.

What I have done as a workaround in my post-build script is pre-download
the needed source tarballs via wget. Later, when ExternalProject_add
attempts to download the same source tarball, it sees that it's already
downloaded and matches the expected hash. It then skips the https download,
thus preventing the error. This way, whatever version of wget is installed
on the build system makes little difference.

--00000000000065475f05dc03b3ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, Apr 6, 2022 at 6:50 PM James Hilliard &lt;<a href=3D"mailto:=
james.hilliard1@gmail.com">james.hilliard1@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div>On Wed, Apr 6, 202=
2 at 2:13 PM Emile Cormier &lt;<a href=3D"mailto:emile.cormier.jr@gmail.com=
" target=3D"_blank">emile.cormier.jr@gmail.com</a>&gt; wrote:<br>
&gt; Buildroot&#39;s cmake is being executed in my post-build script instea=
d of my system&#39;s cmake. How do I make my system&#39;s cmake take preced=
ence?<br>
<br>
I think you just need to update your system&#39;s cmake to something that m=
eets the<br>
required minimum version:<br>
<a href=3D"https://github.com/buildroot/buildroot/blob/ac91235797fe9b234fb8=
20c0112f21c26be1349f/support/dependencies/check-host-cmake.mk#L6" rel=3D"no=
referrer" target=3D"_blank">https://github.com/buildroot/buildroot/blob/ac9=
1235797fe9b234fb820c0112f21c26be1349f/support/dependencies/check-host-cmake=
.mk#L6</a><br></div></blockquote><div><br></div><div>Ah, that explains why =
I started getting CMake https download failures _after_ the buildroot cmake=
 version was bumped. My system&#39;s cmake version was in between buildroot=
&#39;s versions for cmake.</div><div><br></div><div>However, I think having=
 to rely on the system&#39;s CMake version goes against the buildroot philo=
sophy of an image build not relying on the tools and libraries available on=
 the build system.</div><div><br></div><div>What I have done as a workaroun=
d in my post-build script is pre-download the needed source tarballs via wg=
et. Later, when ExternalProject_add attempts to download the same source ta=
rball, it sees that it&#39;s already downloaded and matches the expected ha=
sh. It then skips the https download, thus preventing the error. This way, =
whatever version of wget is installed on the build system makes little diff=
erence.<br></div></div></div>

--00000000000065475f05dc03b3ad--

--===============5029655164871099741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5029655164871099741==--
