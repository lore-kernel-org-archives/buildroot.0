Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AED0C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 19:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49D1560E82;
	Sun,  3 Apr 2022 19:14:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kd-aLCcdcVBT; Sun,  3 Apr 2022 19:14:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6355060E37;
	Sun,  3 Apr 2022 19:14:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C642B1BF36B
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 19:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3AE44048B
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 19:14:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bjDB9FpT1pnO for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 19:14:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1922640236
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 19:14:08 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id z33so9553494ybh.5
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 12:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zdo0CQH98g3fLypMXDaaFCkZTHLIOfroS4B8wcLC3VI=;
 b=VFQsr1pmwXHss5XJ3ujS7xNj88xxSdF2Kr8XvX2tW7n2lbU6+w6aI44PF25xh5qypb
 79t4/7P0nLT5QRsCMd4v2wcdMHLvk/PMrG+GuiQBM0wI503TiPIN5gw8DO6PfaKJRGuv
 eCMs6Xf+VaiDDwxjKH/ZK6TEo/CSp1dwsIHSmH9WYuPlRef9FZ9xh9fyNnnXWbBtIqND
 NiJ2aTdyegwsovJ5lIsPr7ZO6eWfTtwj5VTIryqg3vU8FIXrhGCnP4XuLL0vUkDdgEKX
 uCrRccQT6IeEHT7vazCp4kJaLKfXXOOmUbmdksMI+7bLmVO61+89zPBoEh9htEd4PG9V
 mBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zdo0CQH98g3fLypMXDaaFCkZTHLIOfroS4B8wcLC3VI=;
 b=ZN3XjvuhVVVFOKRQdGRZm1VnBfqRojKW3L7tVYy/oxIWhMUj+MaAb+I9caDqW1mUHT
 4QgnCeX6zIMwER2qabFKk9Od/fip/QNZrs1kGPJevsi7QSlmRjY/H20evsnAPsUXkbdA
 +/J5DBq8BRqTVqqaSpuydptmKt3D6fGYk+wKTdJBfQ383C2l2NhNb2CmJ14V+/fblGti
 CWyaiLSJDd+a0NaCdWebaDCwynfVvcUFgDUEznDT69fIq8a/XwsZr8NX1lg6HtduU4cE
 XpwPBZTH4GJVMXUU2v0bfyYtyw3EbtWz/2BkeBLr3RiIWMiXRi7JKp8lHp179qnQfln4
 7zVA==
X-Gm-Message-State: AOAM533FTAgMooZ4HrEN1G7MBTuGBDnBv/HODZHY8urTbhe+UlfoxsUm
 YFOS3r0FEHSGpxC4BXsO4ug8x1vSNoKBtBYKkCc=
X-Google-Smtp-Source: ABdhPJyZNq1xrAvipGFgdW5r8kiEyOhvCVa/gyR4an+O0jIhyB2zLUT1YsJ8Az2YV0nTqAsUWb36vOIWiCLooMQeszw=
X-Received: by 2002:a25:bc6:0:b0:633:b8aa:dc48 with SMTP id
 189-20020a250bc6000000b00633b8aadc48mr17913906ybl.587.1649013246875; Sun, 03
 Apr 2022 12:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220330224521.4142504-1-james.hilliard1@gmail.com>
 <20220403083318.GE1811301@scaer>
In-Reply-To: <20220403083318.GE1811301@scaer>
From: Emile Cormier <emile.cormier.jr@gmail.com>
Date: Sun, 3 Apr 2022 16:13:56 -0300
Message-ID: <CAM70yxA=P=JGW0vay=FiOLwvBduyZJzLmu7B-FY1CT9Zj9AqpQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/pkg-python.mk: fix PEP517
 paths
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============7530666911810199912=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7530666911810199912==
Content-Type: multipart/alternative; boundary="000000000000cf5c8505dbc4d0e5"

--000000000000cf5c8505dbc4d0e5
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 3, 2022 at 5:33 AM Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Applied to master, thanks.
>
> Regards,
> Yann E. MORIN.
>

I confirm that the PasswordHasher test works for me with the latest master.
Thanks Yann and James!

--000000000000cf5c8505dbc4d0e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sun, Apr 3, 2022 at 5:33 AM Yann E. MORIN &lt;<a href=3D"mailto:y=
ann.morin.1998@free.fr">yann.morin.1998@free.fr</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
Applied to master, thanks.<br>
<br>
Regards,<br>
Yann E. MORIN.<br></blockquote><div><br></div><div>I confirm that the Passw=
ordHasher test works for me with the latest master. Thanks Yann and James!<=
br></div></div></div>

--000000000000cf5c8505dbc4d0e5--

--===============7530666911810199912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7530666911810199912==--
