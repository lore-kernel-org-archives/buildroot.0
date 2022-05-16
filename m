Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3011C433F5
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 22:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A5F6830AB;
	Mon, 16 May 2022 22:09:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fl5Wie2tqdvw; Mon, 16 May 2022 22:09:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBBD683096;
	Mon, 16 May 2022 22:09:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 48F321BF2CF
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 22:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3720640119
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 22:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JTmlwHvM2WpU for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 22:09:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3CB164010C
 for <buildroot@buildroot.org>; Mon, 16 May 2022 22:09:45 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id r27so17540470iot.1
 for <buildroot@buildroot.org>; Mon, 16 May 2022 15:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=5hbQE3/Ml7jZROOBKig4P5H0EbKuTWUe6R69+riuo2I=;
 b=WyiSsoa1tdBnDHDfNEZE7O5mH8Qo1ika77Sf8F2+Z7w1shJxoEgZzGAlvjyUGKeIId
 anwV0MfJy1ziNv/Ws/Zvsj4fHoyKqbRy+fjtCOCzA/Ftz7lM1aBiH0+9TH9NeccvaMq7
 HoT+Ak9Yyn1JY9WV829gywWAmGwbvp+X6JcnQvniidLGFUMPgdN9Q/+0KutitDcZ9dst
 jJ5JG7LJs/z/0vo8MwQWERguYdFC2pG7tHS50fiKVnD4orORxUk6e/a0dC93O+Trua+7
 Qu/hjpTPOVkgVQFglS3m9xkL7GjW7k6NXshmpirtWrJvsVd3a01u6GTYgzLYhh3MafrL
 /REA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=5hbQE3/Ml7jZROOBKig4P5H0EbKuTWUe6R69+riuo2I=;
 b=Tg6vRW7vxQgiGb+OceX+2/d07ahHrMnR2Ureofl1rdnvcnlikmgdkVCq33TDmT1Tir
 TOwfXhlTvgqkNV8K6INZmTpOXlNfdUzwXqpm9OYg6FAtHU6jBb6ucOigCl8cYpR7gGif
 Apbr5CyRIMOFAxJoQXyKlwMWMj10Z+O32AreEd8GIrc2p8yqHs0IxqizMuESCeGFZ8hq
 jxNSDq7sB3mwrhLoO3DIWcdipvzTGlUaIAYAFOW6+KXORoupk0yIHsecghfAHTklThnu
 xXw5ixCNSAjzxUxbXOXANiF8nl7crqD03SeDZsebdUMxXtozdt2O1GRUbRDBU802/xGv
 8Ctw==
X-Gm-Message-State: AOAM531FwJ8UhedOHwCTLo+YL2a6vKZ9FsZeHsSwDVO3lSM8+l5vHNXr
 v7uhL36Y3czl4duAaDXiI+nqk7i1/j/TCEKP/O1f7W1D4/DF7w==
X-Google-Smtp-Source: ABdhPJwgooErugeFr9eXk/XDSCmGB2zpJv//ELRkfTCv3JmIjbadVxtjqEz1b92hmvGoZiMaYa0LbwrTcS9EARv4KC4=
X-Received: by 2002:a05:6638:14d3:b0:32b:66f8:75a7 with SMTP id
 l19-20020a05663814d300b0032b66f875a7mr8229909jak.114.1652738983964; Mon, 16
 May 2022 15:09:43 -0700 (PDT)
MIME-Version: 1.0
From: bryce.schober@gmail.com
Date: Mon, 16 May 2022 15:09:08 -0700
Message-ID: <CAJpxd07JQQ2_xZZqKQ9Oc4DG-nNRCsmH=MHdMOPJwMciEhocXA@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] sources.buildroot.net busybox download errors
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
Content-Type: multipart/mixed; boundary="===============3516653168099615617=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3516653168099615617==
Content-Type: multipart/alternative; boundary="0000000000000bb30005df2848dd"

--0000000000000bb30005df2848dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Our builds have been having a problem recently in downloading from
http://sources.buildroot.net/busybox. It appears that
busybox-1.35.0.tar.bz2 and some / many others have been corrupted, and
cause both unexpected download behavior and checksum failures:

$  wget http://sources.buildroot.net/busybox/busybox-1.35.0.tar.bz2
--2022-05-16 14:41:38--
http://sources.buildroot.net/busybox/busybox-1.35.0.tar.bz2
Resolving sources.buildroot.net (sources.buildroot.net)... 104.26.1.37,
172.67.72.56, 104.26.0.37, ...
Connecting to sources.buildroot.net (sources.buildroot.net)|104.26.1.37|:80=
...
connected.
HTTP request sent, awaiting response... 200 OK
Length: 2480624 (2.4M) [application/x-gtar-compressed]
Saving to: =E2=80=98busybox-1.35.0.tar.bz2=E2=80=99

busybox-1.35.0.tar.bz2
 95%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>   ] =
  2.26M  --.-KB/s
   in 5.8s

2022-05-16 14:41:45Resolved (Completed) (402 KB/s) - Connection closed at
byte 2374671. Retrying.

--2022-05-16 14:41:46--  (try: 2)
http://sources.buildroot.net/busybox/busybox-1.35.0.tar.bz2
Connecting to sources.buildroot.net (sources.buildroot.net)|104.26.1.37|:80=
...
connected.
HTTP request sent, awaiting response... 416 Requested range not satisfiable

    The file is already fully retrieved; nothing to do.

$ sha256sum busybox-1.35.0.tar.bz2
a7436caa65f0d51cc5c33a5d9be6b4b6d67e85ad1de106784921895176a164fc
 busybox-1.35.0.tar.bz2

$ grep 'sha256 .* busybox-1.35.0.tar.bz2' package/busybox/busybox.hash
sha256  faeeb244c35a348a334f4a59e44626ee870fb07b6884d68c10ae8bc19f83a694
 busybox-1.35.0.tar.bz2

<><  <><  <><
Bryce Schober

--0000000000000bb30005df2848dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Our builds have been having a problem recently in download=
ing from=C2=A0<a href=3D"http://sources.buildroot.net/busybox">http://sourc=
es.buildroot.net/busybox</a>. It appears that busybox-1.35.0.tar.bz2 and so=
me / many others have been corrupted, and cause both unexpected download be=
havior and checksum failures:<div><br></div><div>$=C2=A0=C2=A0wget <a href=
=3D"http://sources.buildroot.net/busybox/busybox-1.35.0.tar.bz2">http://sou=
rces.buildroot.net/busybox/busybox-1.35.0.tar.bz2</a><br>--2022-05-16 14:41=
:38-- =C2=A0<a href=3D"http://sources.buildroot.net/busybox/busybox-1.35.0.=
tar.bz2">http://sources.buildroot.net/busybox/busybox-1.35.0.tar.bz2</a><br=
>Resolving <a href=3D"http://sources.buildroot.net">sources.buildroot.net</=
a> (<a href=3D"http://sources.buildroot.net">sources.buildroot.net</a>)... =
104.26.1.37, 172.67.72.56, 104.26.0.37, ...<br>Connecting to <a href=3D"htt=
p://sources.buildroot.net">sources.buildroot.net</a> (<a href=3D"http://sou=
rces.buildroot.net">sources.buildroot.net</a>)|104.26.1.37|:80... connected=
.<br>HTTP request sent, awaiting response... 200 OK<br>Length: 2480624 (2.4=
M) [application/x-gtar-compressed]<br>Saving to: =E2=80=98busybox-1.35.0.ta=
r.bz2=E2=80=99<br><br>busybox-1.35.0.tar.bz2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A095%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
&gt; =C2=A0 ] =C2=A0 2.26M =C2=A0--.-KB/s =C2=A0 =C2=A0in 5.8s =C2=A0 =C2=
=A0<br><br>2022-05-16 14:41:45Resolved (Completed) (402 KB/s) - Connection =
closed at byte 2374671. Retrying.<br><br>--2022-05-16 14:41:46-- =C2=A0(try=
: 2) =C2=A0<a href=3D"http://sources.buildroot.net/busybox/busybox-1.35.0.t=
ar.bz2">http://sources.buildroot.net/busybox/busybox-1.35.0.tar.bz2</a><br>=
Connecting to <a href=3D"http://sources.buildroot.net">sources.buildroot.ne=
t</a> (<a href=3D"http://sources.buildroot.net">sources.buildroot.net</a>)|=
104.26.1.37|:80... connected.<br>HTTP request sent, awaiting response... 41=
6 Requested range not satisfiable<br><br>=C2=A0 =C2=A0 The file is already =
fully retrieved; nothing to do.</div><div><br></div><div>$ sha256sum busybo=
x-1.35.0.tar.bz2<br>a7436caa65f0d51cc5c33a5d9be6b4b6d67e85ad1de106784921895=
176a164fc =C2=A0busybox-1.35.0.tar.bz2<br></div><div><br></div><div>$ grep =
&#39;sha256 .* busybox-1.35.0.tar.bz2&#39; package/busybox/busybox.hash</di=
v>sha256 =C2=A0faeeb244c35a348a334f4a59e44626ee870fb07b6884d68c10ae8bc19f83=
a694 =C2=A0busybox-1.35.0.tar.bz2<div><div><div dir=3D"ltr" class=3D"gmail_=
signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div di=
r=3D"ltr"><div><div><br></div><div>&lt;&gt;&lt; =C2=A0&lt;&gt;&lt; =C2=A0&l=
t;&gt;&lt;</div><div>Bryce Schober</div></div></div></div></div></div></div=
></div></div>

--0000000000000bb30005df2848dd--

--===============3516653168099615617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3516653168099615617==--
