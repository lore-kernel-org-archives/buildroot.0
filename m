Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74E1C433FE
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 01:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A4C640469;
	Mon, 14 Feb 2022 01:11:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rW8ocM9nEQZU; Mon, 14 Feb 2022 01:11:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A3B240139;
	Mon, 14 Feb 2022 01:11:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C8151BF3C3
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 01:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4071940139
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 01:11:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Jt8hkwUArsA for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 01:11:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E65D1400F1
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 01:11:41 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 u25-20020a4ad0d9000000b002e8d4370689so17617163oor.12
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 17:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9dAADAf74a+pbCigcl9Sc5IXoxs2Ely7CRjVGjkzZxI=;
 b=bYN+ZGklCr3+/FotokTk6JimP9GbcfYpXmHKEQde1ox/ZvTWzPm47lC2j5rBP/kthu
 Nx6FocKLrKAfsC7b3AA4BB76cb4E3lyvHBjYsibv1vUtuOFcLq6Pl8eH0UWQvWYOu8EM
 UetzenvVILgE2MFdy/LTdvkgOtKCaYLBbUZBEUzQ8d4dRwezdAq9fWZnQhJRLr/gXK8v
 tNniT4yp/LzsqMLUSXQJViKBFLqUIMHEBG2Ktm88EGu/GM3nMZU9WHFFwgeN4jIpxoR9
 L3Jq0fKsZT5cYT9x0FEe6h5XptwgDhaFim+4UejFRY6p3NR7DOHqoEiHr5d6XB+232xd
 1GMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9dAADAf74a+pbCigcl9Sc5IXoxs2Ely7CRjVGjkzZxI=;
 b=k1Dqyaecjmq2TthW3cyVOs0Lvr+L727PHbYyo3J07BOEl3gGCnGoAZD1eC0hFmvIIb
 gmIK98c27eO+Sx5FM53n4zGEhUXOpe5SKFxFz8Tn8zbqOBPlzVqMjn+APxcp82yHgglx
 l3WPUdgvTEjQLuqWPuAYzs8Rn+DNrMd7D4Ch4G1SosdRlvGpB3INty2XiaBjdCZ1yn2e
 NTq5iAClI/c8p5P/iT6yxO4qIFwfygex2zvAoRRlQVpO21sf6reABrvVj3KGNYX5CB+Y
 SIb+CBupfmfTVRiL5dCdezTxwCL1MPL1pUABDvpMzea2jExDxt9p/K/qkbz+PXA+ZPlW
 45jA==
X-Gm-Message-State: AOAM532fMHzj8Uzpau6JpcORmMWY7CjJ/Wy0IQW1I5B0XY7Fi/HGs7dH
 yPS2xYmsiNdRh7tdDLTQUFD3XJVJDJe93/jJcbgavHqcfGY=
X-Google-Smtp-Source: ABdhPJzoHVtAd7CMqvFhMPufzQ4Icauevsuv/E98Zqs5pSKxTn//TNfKOFDKmgm/tGn8TDwqsb8FJiZZBemVBb5egIk=
X-Received: by 2002:a05:6870:6327:: with SMTP id
 s39mr3177905oao.251.1644801100875; 
 Sun, 13 Feb 2022 17:11:40 -0800 (PST)
MIME-Version: 1.0
References: <20220205201837.3324085-1-james.hilliard1@gmail.com>
 <20220205201837.3324085-6-james.hilliard1@gmail.com>
 <20220213165001.GA38097@scaer>
In-Reply-To: <20220213165001.GA38097@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Feb 2022 18:11:29 -0700
Message-ID: <CADvTj4rTrPwt4DXwcbOiiX-ASKE1jMwfE2MWmQYDZHBnn6W4kA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH v6 6/8] package/qt5/qt5webengine-chromium:
 new package
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
Cc: Daniel Price <daniel.price@gmail.com>,
 Gilles Talis <gilles.talis@gmail.com>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>, Martin Bark <martin@barkynet.com>,
 =?UTF-8?B?R2HDq2wgUG9ydGF5?= <gael.portay@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Feb 13, 2022 at 9:50 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2022-02-05 13:18 -0700, James Hilliard spake thusly:
> > We need to add a separate package for the chromium submodule so that
> > we can apply patches for python3 support to it and replace catapult
> > with a python3 compatible version.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/qt5/Config.in                         |    1 +
> >  .../0001-Add-python3-build-support.patch      | 1858 +++++++++++++++++
>
> This is a very big patch...
>
> The commit you are using here, 0ad2814370799a2161057d92231fe3ee00e2fe98,
> is on the '87-based' branch, which is supposedly not a recent branch,
> even if the commit itself is not so old (a bit over two months).
>
> However, there are more recent branches that already have python3
> support, starting from '90-based' onward.
>
> Why can't we use those branches, instead of carrying such a beast of a
> patch?

I'm using the commit that matches v5.15.8-lts, I think others aren't compatible:
https://invent.kde.org/qt/qt/qtwebengine/-/tree/v5.15.8-lts/src

>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
