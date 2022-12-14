Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CFFC4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 18:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 778EE81F33;
	Wed, 14 Dec 2022 18:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 778EE81F33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lng8aR2UloR4; Wed, 14 Dec 2022 18:00:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D717F81F2E;
	Wed, 14 Dec 2022 18:00:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D717F81F2E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B03681BF45A
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 18:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B20160C19
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 18:00:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B20160C19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5gLl76I-xrYB for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 18:00:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BD4760A69
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2BD4760A69
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 18:00:14 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id o127so665427yba.5
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 10:00:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Nsy7JylCFCtp6nmhOUX4WMN2PCKCRGsWvdE1uCKkCls=;
 b=yzPKJcbO2nXNVI4ALhiEmGnJohdwlnMEsDKrwSer4lHllLbCinH24yZKdlcb+WHD7Z
 bI4nlPRrlHFt3FgXvVZNDH+sOSEfRv5HSqBnvo4+iErmManyMXXw8gSHwghn2MO57m7G
 fvWAP5qAaEohZ8aSrF+uZ6lXz8KO6Zp0fiplODUtmoibthGBL4RDfCl9dFOr2Q0oqtK2
 ocuSvLPaco8F8f5TVFeLmaHov0I9P6iW3jS8z1U/dFDIQn9gr2tD+8C8du9msRwWD3v3
 Jah/XT2deWYmUlmbAgaVvAMupv0kmVhzsbswP6HC4BY0ysJxaNZiH1p6z+CLyPjTz0lY
 NppQ==
X-Gm-Message-State: ANoB5pk/G972BriMPqe77Voo/NcH1t+2mAqr29CAxWPQS1bCB2kUgqM4
 bbBXc7SDOhPOkuJj2dNg49NTJYbRxBvm63Oz8g1wyQf9MhI=
X-Google-Smtp-Source: AA0mqf64p9hQ2SEgKkWzQAyuqjabp9PoUH6gHjEqa+GmO8P7qcj0/Z+YZZrkjXXzpkGJ3pGCMlgfvl5Ftql3faNnQtI=
X-Received: by 2002:a25:dccb:0:b0:713:a3c8:7baf with SMTP id
 y194-20020a25dccb000000b00713a3c87bafmr3724660ybe.641.1671040812863; Wed, 14
 Dec 2022 10:00:12 -0800 (PST)
MIME-Version: 1.0
From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Wed, 14 Dec 2022 19:00:01 +0100
Message-ID: <CAOiXNkA3_5sO2ajKtvco8G6O_Qufz0N=i1javZjFbDMj+zDf5g@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Nsy7JylCFCtp6nmhOUX4WMN2PCKCRGsWvdE1uCKkCls=;
 b=kCM2e7M9cVR832GbkEVY5dm9QK3JiPd92NpMQ5XiJgpY2cS6jQKBcGNVhGMMFUabPH
 2K2E3NnmWDSZpNagp7X6EUUWs9ogEnFd0uWIrE1Ym9NP0GMPf0gpQDG0E5SuAFn/jld9
 tKjHR4y7qgrgBXy59xWEMK/pK9M40qg+xtWpzrUkmgQyzzTWiofiteLPOgQtCfwuqAgS
 blM6zKxpxmNNA6oNwoQ8zvqU4XIUgweX8bLBkzSM3G5RPvXBhSVdCjVlHdZGqh5QtrNC
 JaFvCONrVE/MRAEGaS6zV5KoKyo4/PMq16fEqhKO4+yzR+E7DejPtTgeOdvUY+XH6Vdf
 OhLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kCM2e7M9
Subject: [Buildroot] Confusion about 2022.11 release branch
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Buildroot Folks,

I am currently trying to update to the latest stable 2022.11 release.  What
surprises me is that there is no 2022.11.x branch as I would expect.
Instead, it seems to me that the release is somehow related to the branch
2012.11.x. It could be confirmed looking at this location:
https://git.buildroot.net/buildroot/tag/?h=2022.11
It says Release 2022.11 but the branch mentioned in the combo-box in the top
right corner says it is the 2012.11.x branch.

So my question is whether it is intended like this or am I missing
something?

Thank you,
Andrey.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
