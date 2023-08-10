Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F10C001DE
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 20:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 309F240A70;
	Thu, 10 Aug 2023 20:46:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 309F240A70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NiVR6GGDT8E0; Thu, 10 Aug 2023 20:45:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72EBF408D4;
	Thu, 10 Aug 2023 20:45:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72EBF408D4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DE40B1BF97F
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 20:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7EDA839CD
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 20:45:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7EDA839CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i4Tmp1EsxoYv for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 20:45:56 +0000 (UTC)
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67D668397F
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 20:45:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67D668397F
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-63fc0b9e219so6831896d6.2
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 13:45:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691700355; x=1692305155;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mXtqUnywgU7NoY7p1giZwaoIzoYMYPmxIdGWd6c/oDI=;
 b=LbdoMOwje++T0o2+2g67T4WUe/oVdp5rcB4EP9Iw5ixEj/zxPGBF9kQ6oa6+BPpRB1
 QWdP5g9g6eOWYCbETtwDEfUnCXEG4MCYXGMRHcbfL0cfnHC5TOw+nnLnXZhMN9oGnmZC
 YZvpcj7L1vOcoANvnVfQMp0H9ZcwiXtsjL3i8D1nbAk4ohMwYVtFJH5V2muXAbh1YfRA
 sNjRK0QU+o0xGu0SxQ/pSKIbMXoxxRx2YZabwqi9Sc74LiWIN8S0zJo2JqlOMKP+Sehm
 oINygWT8/TlFhZVt2dYq3yKwzt6ty7pONZp84osu5msk1Zpb9VLwYsDbOXnBJ5CbcdE0
 WYhA==
X-Gm-Message-State: AOJu0YzZ15qBvnXnvF9Qaq1Xs8XBEML4OfD05CWVJEKZOVdooaZGa/3A
 OZLcX//yl1LC094bEkZqyTaozreeHXAghqD5RVY=
X-Google-Smtp-Source: AGHT+IE4BnGc2w5TLu7Xg2atCR8J5QZi+KsTfzR6DEU3bdJS5lyBVdHySU+NK611XxIP93k+s8Bd1D22TJpuyhRYdpw=
X-Received: by 2002:a0c:ca92:0:b0:636:afa1:3448 with SMTP id
 a18-20020a0cca92000000b00636afa13448mr3064002qvk.13.1691700355200; Thu, 10
 Aug 2023 13:45:55 -0700 (PDT)
MIME-Version: 1.0
References: <2691942.mvXUDI8C0e@kilian-aisec>
 <845846062.0ifERbkFSE@kilian-aisec>
 <CAOCHtYgFMQMYvubF7nU53dgZwB4zF=hycJkX4WjyvjbFfs+iwA@mail.gmail.com>
 <3249536.44csPzL39Z@kilian-aisec>
In-Reply-To: <3249536.44csPzL39Z@kilian-aisec>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Thu, 10 Aug 2023 15:45:29 -0500
Message-ID: <CAOCHtYhLi5cdJBYc_umDvNbdwLTyE6+X3c2fMDvvrN+_q65bEQ@mail.gmail.com>
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691700355; x=1692305155;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mXtqUnywgU7NoY7p1giZwaoIzoYMYPmxIdGWd6c/oDI=;
 b=gwIuS96LESRgGDw2+TfOHfJw3c1oMSssf/mjgz7bL+WQ7dX+PgDDP6xqjgBHp33fxj
 NmscDqHmRw4r/XlnFx0/CdMsIz8ddTBJ94Mw6oCNstrV1owPVz9LjxbSvHM7OQsVB+Z9
 vKnuZGgYGuHHMaRGQ+Ok5CU9BjLvNZGSyuPrU+LiKRBRtbqXxdtEG+q/TN+0P2zqTHL9
 /Y+FOJrt9SQ+r3cfdaQwxvyw4DSXxHTPmk5hX5bPP3xzOJrKGK+kDO6FoTkrJBzXWmkk
 GRC6jE5ILRzivnQUu5fbAzGYwFoSVBWl89fyRe5vwdFnyqH2RS7GIht21AeYdNqn7tBi
 9W1w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=gwIuS96L
Subject: Re: [Buildroot] Interested in board support for BeagleV-Ahead
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> > Side-note-extra credit.. We are working on distro extlinux support to
> > just boot off microSD using the eMMC's parttion1/2 as a generic
> > 'bootloader'..  We did have one user on our forum, get the "microSD"
> > boto to actually work... once...  Vendor refused to share how to do
> > that, i was amazed user got it to work, but since then it's not
> > booting..  I think we are just going to asume eMMC will be the generic
> > bootloader going forward..
>
> Yeah, that "Kilian" on the BeagleBoard forum is actually me :D
> I am super sorry: I cannot reproduce what I did myself and I also don't know
> so much what is going on. The boot log I posted is really true. I still have
> that exact SD card and today it still booted. I however could not reproduce it
> with another SD card, which is of the same type. Tbh. I have no clue ...

Oh Sweet!

Yeah, your one boot 'showing' it actually worked 'once' is still way
more info than we ever got from the vendor on requesting info on our
goal of booting from external microSD!

I was at the office for my job that day, and didn't have the board in
my grab bag.

Regards.

-- 
Robert Nelson
https://rcn-ee.com/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
