Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD42C5AC75
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 03:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F6324157E;
	Wed, 26 Jan 2022 03:02:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7zr6DSx5TSAk; Wed, 26 Jan 2022 03:02:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7037C41514;
	Wed, 26 Jan 2022 03:02:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E2911BF2C6
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 03:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEABE82CDD
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 03:02:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0l0TtQqjR-uK for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 03:02:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com
 [IPv6:2607:f8b0:4864:20::a34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A437D82CB7
 for <buildroot@busybox.net>; Wed, 26 Jan 2022 03:02:04 +0000 (UTC)
Received: by mail-vk1-xa34.google.com with SMTP id d189so13659322vkg.3
 for <buildroot@busybox.net>; Tue, 25 Jan 2022 19:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=IueTBK/QTxfdUZwGUoOS/HZ2Eb00t2ob2YKaMBu8OGE=;
 b=jampE3k9F8OGuFRRaeycKuOmIldpn7tCRfJ8NQfjV9fXXFXVOVK/DBjLAExiLxsp23
 IoX3hcgQxeIkKSnpDWUWYpKJCqH7dnssOC1LXilFVqYbAEl7DmekGs7XMl8Eij2Yz4Lu
 SowygBuGhXuqQaDcSiNxhhDw157SHcqQLp0+Gz1bW0vR2A1CCJKLK02bRIfO88lbZIJG
 91lLl5VSF0IyxgL3BUs6/XqEr/aKFxvbO1kHZmNdwhTmSkPXA+jdFKH7o4Bszvg1f5gL
 MO7EcHp9eIkWujL38Krvy8zq7rPIHV+rzzOdPjrhAFbBbr9Nl5tIM8pPRXxOEQsH5Wxu
 SSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=IueTBK/QTxfdUZwGUoOS/HZ2Eb00t2ob2YKaMBu8OGE=;
 b=L/ROBA6nwJ0/ZydPBVrgXK6vFweDtwV9DRlWbaz3CkixMs6IALULQKSOgCK6g1yWyz
 BRbrmjOOUco3oKJYoQtFpypXI5ucts+Resjct3tPTnGxzxterIDMx4vXZHwIUbyJ9+T2
 F3O0nxTYbWhul9E27aNad2vKC0O0KZkRjVuUPR/nns7vglvsEB4xHYZLkxfu9RBDnP5b
 9F6siWu+Usy9j3373/WNm2WoasVx2I+YR2lMr1Qd/PXY2rheAaJY8wGFEaS7D2dlF+P3
 4i/pBvKeRHA7Z0h9ManoGMh6Es/y0rYCgHzc1+a7s0jfVonH5GSIEZvf1iXP66al5JvU
 kXaA==
X-Gm-Message-State: AOAM531BtnVirLyeVqF8Lx0hErmgmY9Y9Nr9iP4MNmnRDHC1aR8oveJ5
 i2Ay9YIiJPuixOM+MGrmGbsV/7+Sq7WM7HZGUX/mJLl+
X-Google-Smtp-Source: ABdhPJzpOgTGgVBEGme4oEykPUnGGmyQuFbMVjPEJ8rfcw9mFRZTacrHagBy5oYHRWFBiQoGmn4b4Pg+Opou5M2r3AE=
X-Received: by 2002:a05:6122:d0b:: with SMTP id
 az11mr3894595vkb.41.1643166123292; 
 Tue, 25 Jan 2022 19:02:03 -0800 (PST)
MIME-Version: 1.0
From: Vitaliy Lotorev <lotorev@gmail.com>
Date: Wed, 26 Jan 2022 06:01:51 +0300
Message-ID: <CALi-Fui_Nx5u7xfKRp6Oqt7aQ02PyWfUt-pp0ddHBMQSsgmdHw@mail.gmail.com>
To: buildroot@busybox.net
Subject: [Buildroot] Buildroot check-package packaged as pre-commit.com hook
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
Content-Type: multipart/mixed; boundary="===============8287521513506120872=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8287521513506120872==
Content-Type: multipart/alternative; boundary="00000000000015fc3305d6736dda"

--00000000000015fc3305d6736dda
Content-Type: text/plain; charset="UTF-8"

Hi,

To unify Buildroot linting experience on CI and in devs environment I
developed a python wrapper package [1] that installs check-package
Buildroot linter and dependencies.

On the top of that there is a .pre-commit-hooks.yaml that allows to install
and run check-package as pre-commit hook (https://pre-commit.com).

Hope someone finds it useful :)

[1] https://github.com/vlotorev/buildroot-utils

--00000000000015fc3305d6736dda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto" style=3D"">Hi,</div><div dir=3D"auto" s=
tyle=3D""><br></div><div dir=3D"auto" style=3D"">To unify Buildroot linting=
 experience on CI and in devs environment I developed a python wrapper pack=
age [1] that installs check-package Buildroot linter and dependencies.</div=
><div dir=3D"auto" style=3D""><br></div><div dir=3D"auto" style=3D"">On the=
 top of that there is a .pre-commit-hooks.yaml that allows to install and r=
un check-package as pre-commit hook (<a href=3D"https://pre-commit.com/" st=
yle=3D"" target=3D"_blank" rel=3D"noreferrer">https://pre-commit.com</a>).<=
/div><div dir=3D"auto" style=3D""><br></div><div dir=3D"auto" style=3D"">Ho=
pe someone finds it useful :)</div><div dir=3D"auto" style=3D""><br></div><=
div dir=3D"auto" style=3D"">[1]=C2=A0<a href=3D"https://github.com/vlotorev=
/buildroot-utils" style=3D"" target=3D"_blank" rel=3D"noreferrer">https://g=
ithub.com/vlotorev/buildroot-utils</a></div></div>

--00000000000015fc3305d6736dda--

--===============8287521513506120872==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8287521513506120872==--
