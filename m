Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD55CC433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 18:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E092831C1;
	Tue,  1 Feb 2022 18:26:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nct761KWjpGh; Tue,  1 Feb 2022 18:26:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF58682F49;
	Tue,  1 Feb 2022 18:26:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ABEA21BF5D7
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 18:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99BDA82F49
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 18:26:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id obaTf85Nnl0M for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 18:26:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 89D0182F40
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 18:26:00 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id u18so35893990edt.6
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 10:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=+aXwDlSdPrYiqYRiGiR29esi6mI3TDnyNJ7vO9GrowI=;
 b=Xtbbhh99p98GDLdNgybjKyQOXYxO+0w5lw0bn88a9FlwZUDbMvOLij8BR0UPeE8E0t
 BgnEcWKwIxlkYYXnOaTTLOtJ1BFccMAkulPLTvm4rwFjEFPLL2T3Jb85syIKbyIy4zXt
 Dl9kmF72dUhaDyM7EQi+a2y4mBZ39DDZyM6jNihv6w3ayiVIMklIuoHv4ui6juVD4Wb/
 zqPq6u/VpBrQDf3JybEjZi97ZlsJ7Dbvjk4vLlXclTdvodMfMvQOpbmBJy6qh61ezTne
 3Yzt1NyCjHJax6zLmR0ys9rzaJhLGfTl2WuNXL5UPKj8j6r0WhUTbkangcHeJcSDfAyT
 9K5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=+aXwDlSdPrYiqYRiGiR29esi6mI3TDnyNJ7vO9GrowI=;
 b=MWKZGUyHKqOQgiqRqDggwXGUDg06P7WRYQO7fvdwnPDLSpYVSLgg7VbwjG94/MhgDx
 jzbYyDGSmOQTHZKROgbW7WBDr2Ri8nyooL0glZnK1X9OigGCVYwjEAI2Msmt+Lkb8L2f
 McJum9MbmVeqmyaJy6zcTlY9OWU5p0+I/Qi+BMsA4PA56tTKA7Yg3ziT/GkeY2Qo4pUl
 Kh+8o1iGJQYWiuKIghD2Sf8ry9XQ3mQbDUtOc18fox0P8SlphxpJXjymn5BpCAj0RxfZ
 UdPNfhWA//V0sHvWdPrHPHp4EF6rfMrhxO2fkKT/m82+x2kXuXziRh9bMXensJ6uL49w
 pc1A==
X-Gm-Message-State: AOAM532YULvpm1zFN/0D9yIes6Y0C0eZaEpmAQ1iY+iWYdzml3y/rcc4
 DI1kO4b5G2PPQ2kW1yusuAvt3abzd4gcYXWy2tk=
X-Google-Smtp-Source: ABdhPJxpKwCAbejEvtuOKX/WqqosPKIvoAMxOIdEXd4sM9SAZ5Uj0mhrqvN6hs7FVN9Lm4RrET+lNxegiUwVxrfPh30=
X-Received: by 2002:a05:6402:358e:: with SMTP id
 y14mr26662819edc.136.1643739958654; 
 Tue, 01 Feb 2022 10:25:58 -0800 (PST)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 1 Feb 2022 15:25:48 -0300
Message-ID: <CAOMZO5B55thnNGy779AxyLEznGqOPZZfzzwn2NwF=v48aHnKfQ@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: [Buildroot] kmscube: GLES3/gl3.h: No such file or directory
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
Cc: Carlos Rafael Giani <crg7475@mailbox.org>, dhobsong@igel.co.jp,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Rob,

We are getting the following kmscube build error in Buildroot:

../cube-shadertoy.c:37:10: fatal error: GLES3/gl3.h: No such file or directory
   37 | #include <GLES3/gl3.h>

Complete log:
http://autobuild.buildroot.net/results/7f559e89a96273fc019056eae13104e14161a484/build-end.log

In OpenEmbedded the following patch is used:
http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-graphics/kmscube/kmscube/0001-texturator-Use-correct-GL-extension-header.patch?h=master

What would be the appropriate fix for this issue?

Thanks,

Fabio Estevam
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
