Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A45C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 05:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44E088482E;
	Sun, 24 Jul 2022 05:09:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44E088482E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HUQmyDoIjLgA; Sun, 24 Jul 2022 05:09:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49D818469E;
	Sun, 24 Jul 2022 05:09:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49D818469E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C12691BF59B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A92444053E
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:09:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A92444053E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FR6Xjo2c1OKk for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 05:09:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05AC04052B
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05AC04052B
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 05:09:43 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id d10so7680534pfd.9
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 22:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J4DWbusvRbvHOJZuAFDlblAJ7KLU1YdWgNSTJ2wlCM4=;
 b=iQp6fHy2rNGkNQJKZ0+IsDIrqtDMcrFbZKoV3ePVdfX3fW3gFw8TzXRtIbo5HzNKhi
 yLd/Zsv5Mhx7UTnICoaBqLqaQ3GL5W0aSzoedcIPmMG6huLX0d9yEwwVQ3nXAJO368BP
 1e6oYH6xC7KVUbwjMDb4zRZLZtj+WNgwvUrndomUXKT5Toz0mffGyBOx4qi5KE3ev3qc
 TRI6oI9xNy9/BNVckQdlpCQMWiBfS+Oc5mIo0XPG+pr9oacxlxLDy8ZRvFsWlQkNy726
 eqjSLgj5nU/s6FlL0NVTalqOjXh6rDI3RgnciIxkbHkDSz5+bQaYR0CTE8qgaGED/IAd
 6+mQ==
X-Gm-Message-State: AJIora+s9YQdlqL1WdhbpuAUCBnLgnsB9L8WPFFC73TsXsMVy9+DZkJp
 DewoxyrVb2s8DRskC3JKgnieoGUERtNCkhliais=
X-Google-Smtp-Source: AGRyM1uxUw7rHYH4r7LrANpPgIKr1KpOT5lpLwzif90dc4oLn1mFDRaRcavWxFzSfdIxkh5SqkY6ZkTReESuNG5mWIU=
X-Received: by 2002:a63:293:0:b0:412:4f02:950f with SMTP id
 141-20020a630293000000b004124f02950fmr6020020pgc.187.1658639383373; Sat, 23
 Jul 2022 22:09:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220613232005.166636-1-pevik@seznam.cz>
 <20220722231650.0fe7223f@windsurf>
In-Reply-To: <20220722231650.0fe7223f@windsurf>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Sun, 24 Jul 2022 07:09:32 +0200
Message-ID: <CAB1t1CwiY=ssqF5eYvsmjkHcP59aJFm=dE33PKAe1xzjgb8pVw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=J4DWbusvRbvHOJZuAFDlblAJ7KLU1YdWgNSTJ2wlCM4=;
 b=JtzUMem0yGrqtlKafl2TGwoyXfgGGCheSmEW2BP+RDUjknhhBnRIJjlALk8MM+tOnU
 gugzhS04D6l+ysabYDXC1HyvqugfOpsmACFCRnSML3rT3F25NnxsbRBnp4EUwgZ5jRSU
 A3e2q1TZH9LPZoct/4tIfpm29m8XoKoUTtNWhP6ogrt7Qz5l2oy4D6BOKsvOJNiZNHLR
 Dq7Xn21Cueckm+ueW1TH9SJcosmiEyUgRQDxif0v35fgRaEYXeZAJcNnPKEre0v+Vrfy
 jJI/Y3tzv2oNXp81r5kBZWS/Q5z5L3hokjLWj8c2e1Nihd43hU5u7dBH5ut5buAYo4QQ
 GUAw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JtzUMem0
Subject: Re: [Buildroot] [PATCH 1/1] ltp-testsuite: bump version to 20220527
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
Cc: Petr Vorel <pevik@seznam.cz>, buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============6934590431743304007=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6934590431743304007==
Content-Type: multipart/alternative; boundary="00000000000041ad9e05e4861361"

--00000000000041ad9e05e4861361
Content-Type: text/plain; charset="UTF-8"

Hi all,
 ...

> Thanks applied to master. There were two minor nits:
>
>  (1) package/ prefix was missing in the commit title.
>
>  (2) Patch 0002 has a inside itself: [PATCH 1/2], we want that to be
>      [PATCH]... precisely for the reason that those 1/2 are often wrong...
>      as it was the case here! This issue is spotted by "make
>      check-package" that you can run before sending a patch.
>

Thomas, thanks for fixes and tip how to avoid errors next time!
Kind regards,
Petr

--00000000000041ad9e05e4861361
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div>Hi all,</div><div>=C2=A0..=
.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
Thanks applied to master. There were two minor nits:<br>
<br>
=C2=A0(1) package/ prefix was missing in the commit title.<br>
<br>
=C2=A0(2) Patch 0002 has a inside itself: [PATCH 1/2], we want that to be<b=
r>
=C2=A0 =C2=A0 =C2=A0[PATCH]... precisely for the reason that those 1/2 are =
often wrong...<br>
=C2=A0 =C2=A0 =C2=A0as it was the case here! This issue is spotted by &quot=
;make<br>
=C2=A0 =C2=A0 =C2=A0check-package&quot; that you can run before sending a p=
atch.<br></blockquote><div><br></div><div>Thomas, thanks for fixes and tip =
how to avoid errors next time!=C2=A0</div><div>Kind regards,</div><div>Petr=
</div></div></div>

--00000000000041ad9e05e4861361--

--===============6934590431743304007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6934590431743304007==--
