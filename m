Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB2EC00140
	for <buildroot@archiver.kernel.org>; Fri, 12 Aug 2022 06:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28152610D9;
	Fri, 12 Aug 2022 06:32:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28152610D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Viz4vT2wfFL8; Fri, 12 Aug 2022 06:32:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C5C5610C4;
	Fri, 12 Aug 2022 06:32:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C5C5610C4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CB9A51BF2BD
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 06:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACCCE4053C
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 06:32:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACCCE4053C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2_09QohiUFe5 for <buildroot@lists.busybox.net>;
 Fri, 12 Aug 2022 06:32:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E90294017A
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E90294017A
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 06:32:35 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-10ea30a098bso24100326fac.8
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 23:32:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=5OL7sa3o3gouty+NxI9MU9DRrQrWa3H1bn4IsPrlqIc=;
 b=J305YJr1B32v7Js+rIX0mJvl7ZFlI0bDFdv6I6+JLFVbe+1NHmZxkjo76byvmSLiY3
 0yqR7Fwes+qU6ZRkFvbPctF7lA4nPjbrXta1uOeqJcjW1mtayEdGL0uxlXxnf0vurAba
 //DOO9aG6UVh1LO1XDwo7v/ja88koq01bgKedIA9UUY6D3vSQeQP7erfibZkXO4/6ftS
 xZk30PPwTYim8zB9vhPS4tNrkquur/8BX4UnDaC3atDgrY92EjGoCUYgwYYs1oNT6HO8
 HmsB+4u4/AxKr+tcQ3l+2sEAp5uMWZKLR7PwHsvp0yZ/Io5Gdsdfc9o6AuhZlM/Ud8Ni
 O+tQ==
X-Gm-Message-State: ACgBeo2FtscW7+5qBZ4Hvc1Glw7quWnwq25i1211TmxkqqZo0pXjQCBW
 vo6wgDVsZAvuWQzE7HHDUbb1XBmvjtqPjAyFy1VNUw==
X-Google-Smtp-Source: AA6agR6ZaOL898HWHkwda/82tEC4yBZzg1szsTiSrb3xMBkQrK39CPq/bOdGqhRB63Qt5TRgwmEYIAYlziRvJkMVzJk=
X-Received: by 2002:a05:6870:b604:b0:116:a0ee:257a with SMTP id
 cm4-20020a056870b60400b00116a0ee257amr1065229oab.95.1660285954817; Thu, 11
 Aug 2022 23:32:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220806224338.0159e15c@windsurf>
 <CAEyMn7ZtrsEdo18p2pjvdhrROnSemX2spZyxN8Tj67RLTcZG-w@mail.gmail.com>
 <20220808102805.2ee4fa4c@windsurf>
In-Reply-To: <20220808102805.2ee4fa4c@windsurf>
From: Suniel Mahesh <sunil@amarulasolutions.com>
Date: Fri, 12 Aug 2022 12:02:24 +0530
Message-ID: <CAM+7aWsJvo1yZT9+_2vz-OF8eR+tW1srrOgA_EzZ_AeO0rYX8w@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=5OL7sa3o3gouty+NxI9MU9DRrQrWa3H1bn4IsPrlqIc=;
 b=Ri17AejNrGkMEEqC79TTvHs8hi1ial4f/trog/wRZyyAejq/Su0ZKs4D0FM5TiBtdM
 UYxTKeeHwYxYPmSxGlIo6nftHkehpuKlroNzoJtHui9ZfFzdM4RI8aXiOU+HGxCJ/fAb
 6wes9JygXPORckbGU8uTjQJBsonuIPsiomdqI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Ri17AejN
Subject: Re: [Buildroot] Buildroot defconfigs about to be removed
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Filip Skoneczny <fskoneczny@gmail.com>,
 Marek Belisko <marek.belisko@open-nandra.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Davide Viti <zinosat@gmail.com>,
 Mike Harmony <mike.harmony@snapav.com>, Peter Seiderer <ps.report@gmx.net>,
 Jagan Teki <jagan@amarulasolutions.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Heiko Thiery <heiko.thiery@gmail.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: multipart/mixed; boundary="===============3073091566680812928=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3073091566680812928==
Content-Type: multipart/alternative; boundary="0000000000009019b505e6057236"

--0000000000009019b505e6057236
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 8, 2022 at 1:58 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Heiko,
>
> On Sun, 7 Aug 2022 00:28:46 +0200
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > This is the first time I have been informed about this build failure.
> > I am surprised that I did not get any mail about this.
>
> Sorry, your issue is potentially new. It's mainly the other issues that
> I have already reported in the past, and which did not get any
> feedback, on defconfigs that are not properly maintained (all those
> friendlyarm/bananapi/orangepi boards).
>

Hi Thomas,

I will try to fix the defconfigs related to friendlyarm/bananapi/orangepi
boards ASAP.

Thanks
Suniel

>
> > Nonetheless I will fix that and send a patch.
>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--0000000000009019b505e6057236
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 8, 2022 at 1:58 PM Thomas=
 Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petaz=
zoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Hello Heiko,<br>
<br>
On Sun, 7 Aug 2022 00:28:46 +0200<br>
Heiko Thiery &lt;<a href=3D"mailto:heiko.thiery@gmail.com" target=3D"_blank=
">heiko.thiery@gmail.com</a>&gt; wrote:<br>
<br>
&gt; This is the first time I have been informed about this build failure.<=
br>
&gt; I am surprised that I did not get any mail about this.<br>
<br>
Sorry, your issue is potentially new. It&#39;s mainly the other issues that=
<br>
I have already reported in the past, and which did not get any<br>
feedback, on defconfigs that are not properly maintained (all those<br>
friendlyarm/bananapi/orangepi boards).<br></blockquote><div><br></div><div>=
Hi Thomas,</div><div><br></div><div>I will try to fix the defconfigs relate=
d to friendlyarm/bananapi/orangepi boards ASAP.</div><div><br></div><div>Th=
anks</div><div>Suniel=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
<br>
&gt; Nonetheless I will fix that and send a patch.<br>
<br>
Thanks a lot!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--0000000000009019b505e6057236--

--===============3073091566680812928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3073091566680812928==--
