Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5552FC4332F
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 19:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19C1B41086;
	Tue,  8 Nov 2022 19:30:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19C1B41086
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oz1Kb0ufcaTl; Tue,  8 Nov 2022 19:30:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8066940B7F;
	Tue,  8 Nov 2022 19:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8066940B7F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 426BB1BF422
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 19:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D47160E13
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 19:30:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D47160E13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wQk4-IMbYGve for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 19:30:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 368F160AA3
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 368F160AA3
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 19:30:20 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id s196so14252555pgs.3
 for <buildroot@buildroot.org>; Tue, 08 Nov 2022 11:30:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V3rLAr3YLEw9MPVrByo2e/qHUqtdQSgk+lnZ6qf+jpk=;
 b=16CIW3+w+Z2mv0Id2lXQt9YuxgMTkki7ueYh/9bVGyTL9d9lIrFk/jNGhWBzfiu0Dx
 tEnZWaVletHhx40ZCgkqGBMLXFyOMacMurtnc2E/dmkIM9vsVdgS6S8dlIPurH5EAY+W
 dFbAjR081OcfizLX+IlDgdDMyvuSgxPHEjtkfKdLUcJQ5Q7p3kkUW++WoVrC5mvZGUGV
 nRsajv9IySeErUWKgje6+n5R09W/lAwuevABjTZnHTygy40juaPf401ffSaPAAVCEYsz
 VGtYIVezVlqlbnXkMCHwFEyzclwfghGpXvzFSdZ6qVmUIZUrkWzxkAkU0NOeRy9Y8/Gw
 VNWw==
X-Gm-Message-State: ACrzQf2RyX1koa0uuID4+bIFp0MabY29v0Q4Lh60W6gJ4OeFIXFGtwlB
 TUYHjLRcseyVw0SOGdtFBxgFhQcZMDAIHsACmUujbg==
X-Google-Smtp-Source: AMsMyM4KEhpv0H9389a6OL1mCoCAek9vyHCscdww2yLtOxnsB+/ITn36K5FbSxl+yp96JkLc2zE5Ryawp2KnEgSb9D4=
X-Received: by 2002:a65:6148:0:b0:458:88cd:f46 with SMTP id
 o8-20020a656148000000b0045888cd0f46mr48240812pgv.303.1667935819643; Tue, 08
 Nov 2022 11:30:19 -0800 (PST)
MIME-Version: 1.0
References: <20221004111528.384625-1-nunog@fr24.com>
 <20221004111528.384625-2-nunog@fr24.com>
 <20221105144412.GH3918838@scaer>
In-Reply-To: <20221105144412.GH3918838@scaer>
Date: Tue, 8 Nov 2022 19:30:08 +0000
Message-ID: <CA+mKM5=E=PFa+mp6LrXkqG1bHT7wmvTxcZ0p-jHJZgixeoonCg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fr24.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=V3rLAr3YLEw9MPVrByo2e/qHUqtdQSgk+lnZ6qf+jpk=;
 b=hUIH7hu3Whl2p76Ez1Zzgd25rbBhqheWDUOcuI46ElZFO+VUz7qHvGbmKZGVs3d8Gj
 naGFimAqmgji61CvvSElsje0itvKSR5QuZ5LLoZZoBg6oVMa6TEWazicv5NDkP6Avff5
 /vgYhPtUMjXX5L+xf4UAQgz9xUP8/8N/+Db37oG7d0Hb4bpoISvU1xUTLJVR3B1DXKai
 1RB9+JPMud3s0NJGCYfQE6BsXcbUcweblciuJwdP/8jyBXrdo7N8wEe4KqffLsayGkyK
 BBE4HEGqi9gl8+80w6herOZuzayzWnIQNDr0LaWgc3RUQ21ET43x2iYFSoYsZATtg+AW
 saYw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=fr24.com header.i=@fr24.com
 header.a=rsa-sha256 header.s=google header.b=hUIH7hu3
Subject: Re: [Buildroot] [PATCH 2/3] package/sudo: explicitly disable tzdir
 and tmpfiles as otherwise they are based on build host directories
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
From: =?utf-8?q?Nuno_Gon=C3=A7alves_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?Q?Nuno_Gon=C3=A7alves?= <nunog@fr24.com>
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0537143058250487083=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0537143058250487083==
Content-Type: multipart/alternative; boundary="00000000000009d33805ecfa9207"

--00000000000009d33805ecfa9207
Content-Type: text/plain; charset="UTF-8"

Hi Yann,

On Sat, Nov 5, 2022 at 2:44 PM Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> As I understand the code, this path is only used at runtime, to sanitize
> the TZ environment variable. So, we should be able to pass the proper
> path, but only if tzdata is enabled:
>
>     --with-tzdir=$(if $(BR2_PACKAGE_TZDATA),/usr/share/zoneinfo,no)
>
> (note that /usr/share/zoneinfo is where we install TZ data in the tzdata
> package).
>
> > +     --enable-tmpfiles.d=no \
>
> Ditto, I am not sure it makes sense to ubnconditionally disable support
> for tmpfiles, especially when systemd is actually used as the init
> system.
>
> Indeed, the code defaults to looking on the host to find where they
> should be, and of course tht does not work in cross-compilation. But
> that path is used to install files, so there is probably no reason not
> tell sudo where to install its files:
>
>     --enable-tmpfiles.d=$(if $(BR2_PACAKGE_SYSTEMD),/usr/lib/tmpfiles.d,no)
>
> Yes, it seems it is as you said.

My approach was just "if it is broken" (as it looks for host paths only),
then let's just disable it.

I am using systemd so your solution also likely fixes tmpfiles sudo support
for me (which I would only have depending if my build host/container used
systemd).

I will provide now the patches with your suggestions to fix it

Thanks,
Nuno

>
>

--00000000000009d33805ecfa9207
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Yann,</div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Nov 5, 2022 at 2:44 PM Ya=
nn E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr" target=3D"_blank=
">yann.morin.1998@free.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">As I understand the code, this path is only used a=
t runtime, to sanitize<br>
the TZ environment variable. So, we should be able to pass the proper<br>
path, but only if tzdata is enabled:<br>
<br>
=C2=A0 =C2=A0 --with-tzdir=3D$(if $(BR2_PACKAGE_TZDATA),/usr/share/zoneinfo=
,no)<br>
<br>
(note that /usr/share/zoneinfo is where we install TZ data in the tzdata<br=
>
package).<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--enable-tmpfiles.d=3Dno \<br>
<br>
Ditto, I am not sure it makes sense to ubnconditionally disable support<br>
for tmpfiles, especially when systemd is actually used as the init<br>
system.<br>
<br>
Indeed, the code defaults to looking on the host to find where they<br>
should be, and of course tht does not work in cross-compilation. But<br>
that path is used to install files, so there is probably no reason not<br>
tell sudo where to install its files:<br>
<br>
=C2=A0 =C2=A0 --enable-tmpfiles.d=3D$(if $(BR2_PACAKGE_SYSTEMD),/usr/lib/tm=
pfiles.d,no)<br>
<br></blockquote><div>Yes, it seems it is as you said.<br><br>My approach w=
as just &quot;if it is broken&quot; (as it looks for host paths only), then=
 let&#39;s just disable it.</div><div><br>I am using systemd so your soluti=
on also likely fixes tmpfiles sudo support for me (which I would only have =
depending if my build host/container used systemd).=C2=A0<br><br></div><div=
>I will provide now the patches with your suggestions to fix it=C2=A0</div>=
<div><br>Thanks,</div><div>Nuno</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><br>
</blockquote></div></div>

--00000000000009d33805ecfa9207--

--===============0537143058250487083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0537143058250487083==--
