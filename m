Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08046C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 23:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7A2360B71;
	Sun,  9 Jan 2022 23:10:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P4q3doXK-vyC; Sun,  9 Jan 2022 23:09:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F26D6605E0;
	Sun,  9 Jan 2022 23:09:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 63DC51BF2E5
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 23:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F84E81B69
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 23:09:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WDIwsqRdhOdV for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 23:09:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F2AA81B52
 for <buildroot@busybox.net>; Sun,  9 Jan 2022 23:09:56 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id u13so38066726lff.12
 for <buildroot@busybox.net>; Sun, 09 Jan 2022 15:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+rSFRNdGwNoOXQcqBaCQ92P+2JJ1X/II91djzS2WK18=;
 b=UuvYLFU6kvqiKiQJ8b6DHICw1wKdiWN2kKX6UQsK9Gx89q0PJqqoToLs26iz3Asntk
 qPr99oHRH73mKfrbzjDZipgAsiztdFhrYY/+jOvWHG4iaNhhAAIHv/2dM86+NCOQ0NAV
 dTDIaablxydwiB99JEVAsdc57vPUtc2C4yx8Y5y+vH1tLGHMh1LlG5sRkdQvbd1+SGfN
 TF5CBnEmtzYHWE+jhqJoNvvMtyiy6gA7MtQwPMh/Ry/wGUWT/3uEbTVp1kaUjCeOhcfz
 B4Im1chj7/9kAQ1w+wbqNuDMtcVyXLwNkJ5ZGEmX/H20ZrX+VSTsgVInnSKtspQngu+A
 O3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+rSFRNdGwNoOXQcqBaCQ92P+2JJ1X/II91djzS2WK18=;
 b=UYNPjX7rAuau4X796qlaK99Cb5DLyaqnpSUtMurs7PzgYkwfEn24We/tBcZDVC363H
 sUHWOouQZLg9clOLmU+DftmZVCEhcdejMCRhvkOU4LvdmgwJFePcPhNuT2gC2u4YYCKy
 qZHnF4W3ZPpRm35QcTAiz9Z8zSwoovocdkxstR2C9bU2JbEsVq0gVr0DD3RdEyCmbNvZ
 uopI6+pxjn71D2xuC1wziqgSNgSZ0P4qlG+z34DmWftpBwNL/qHoZmwLw+hkKGh1Ypt2
 2kS3qLdzr6i/N4V2kR10LsXxcVuS6j5qddTFEHYdRVAME0IjfxwC8yjySGxlLsEH0l5B
 U7yA==
X-Gm-Message-State: AOAM532IaFi4c6Mjq75Hl/ntai3dpkSO8hASteZoVkApztl6nOEKewsp
 II9eJ1SuqUNlg5AYmzg3drysyQN0fznNEF4ROsg=
X-Google-Smtp-Source: ABdhPJy8YYaokm+gwCfFB6015E6Z2JQgf0En4onUZaAbsJjojZGGH94nxBGhqfFbUvWzMos2Oimct2vnnfvSulfRb84=
X-Received: by 2002:a2e:8781:: with SMTP id n1mr38359068lji.96.1641769794178; 
 Sun, 09 Jan 2022 15:09:54 -0800 (PST)
MIME-Version: 1.0
References: <20201017221743.160029-1-nolange79@gmail.com>
 <20201017221743.160029-4-nolange79@gmail.com>
 <20220109223145.GK1477939@scaer>
In-Reply-To: <20220109223145.GK1477939@scaer>
From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 10 Jan 2022 00:09:45 +0100
Message-ID: <CADYdroORcA9Uj1dfGY1SaJDD=VqLxeemEtrc+AUmjZfajRUTQw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH v2 4/4] package/glibc: force -fno-lto
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
Cc: buildroot@busybox.net
Content-Type: multipart/mixed; boundary="===============0491261694560442111=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0491261694560442111==
Content-Type: multipart/alternative; boundary="0000000000006290a705d52e517f"

--0000000000006290a705d52e517f
Content-Type: text/plain; charset="UTF-8"

Yann E. MORIN <yann.morin.1998@free.fr> schrieb am So., 9. Jan. 2022, 23:31:

> Norbert, All,
>
> On 2020-10-18 00:17 +0200, Norbert Lange spake thusly:
> > glibc requires compilation barriers between files, and will
> > fail with LTO enabled.
> > So force LTO off by appending -fno-lto to the flags, but only
> > if the GCC version is recent enough that an LTO build would
> > be possible.
> >
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
>
> Applied to master, thanks.
>
> Are the other C libraries (uClibc, musl) also affected by such an issue?
>

Likely, and unless they are tested with LTO I would not trust them to not
have weird runtime issues.

Ideally there would be a whitelist for packages doing fine with LTO, for
now I can only vouch for the couple I am using LTOed since years.

Since a few distros now use LTO by default, hopefully things will get
better.

Norbert

--0000000000006290a705d52e517f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@fr=
ee.fr" target=3D"_blank" rel=3D"noreferrer">yann.morin.1998@free.fr</a>&gt;=
 schrieb am So., 9. Jan. 2022, 23:31:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">Norbert, All,<br>
<br>
On 2020-10-18 00:17 +0200, Norbert Lange spake thusly:<br>
&gt; glibc requires compilation barriers between files, and will<br>
&gt; fail with LTO enabled.<br>
&gt; So force LTO off by appending -fno-lto to the flags, but only<br>
&gt; if the GCC version is recent enough that an LTO build would<br>
&gt; be possible.<br>
&gt; <br>
&gt; Signed-off-by: Norbert Lange &lt;<a href=3D"mailto:nolange79@gmail.com=
" rel=3D"noreferrer noreferrer" target=3D"_blank">nolange79@gmail.com</a>&g=
t;<br>
<br>
Applied to master, thanks.<br>
<br>
Are the other C libraries (uClibc, musl) also affected by such an issue?<br=
></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Lik=
ely, and unless they are tested with LTO I would not trust them to not have=
 weird runtime issues.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I=
deally there would be a whitelist for packages doing fine with LTO, for now=
 I can only vouch for the couple I am using LTOed since years.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Since a few distros now use LTO by d=
efault, hopefully things will get better.</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Norbert</div></div>

--0000000000006290a705d52e517f--

--===============0491261694560442111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0491261694560442111==--
