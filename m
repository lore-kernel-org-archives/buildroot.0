Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBF3C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 20:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6D5180DD1;
	Sun, 27 Mar 2022 20:08:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uFeqTEK8FTSE; Sun, 27 Mar 2022 20:08:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F28E680CB3;
	Sun, 27 Mar 2022 20:08:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4BEB21BF3EF
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 20:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3676340949
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 20:08:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=zx2c4.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E2GH8BXugLlu for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 20:08:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1521740111
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 20:08:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 94D1060C1A
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 20:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 336AEC340EC
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 20:08:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="k+CxEtg/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1648411708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7hQji69F+L4jHMgHFsh5PgDDUrD3KCe61NPYOf16A8A=;
 b=k+CxEtg//j3XL2dqrJSh0a7sPQkM5js8J2goEJeyGYx8wInfSwxUfx6o4RIjyqNmZYpjyB
 k4+QldxsOncGDeCXEFJSFvyU/cj5kt2VynD32bcRmLV1CpYByK/ExL381Xku9QddaAnXG1
 EmGg1OAPH6Z8Y45JuprB34P9tT5yJpo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ba449f6d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 20:08:28 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id j2so22812292ybu.0
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 13:08:28 -0700 (PDT)
X-Gm-Message-State: AOAM5306+EUNLnO2vieXRZUcAeYSgcsE6Nk5OukvDf03qVlka5X2Xwok
 8wsJFasfE0FqFuiNfDS5rcU0UgHczVDbIF6r0/M=
X-Google-Smtp-Source: ABdhPJwZruDfiAOlwv1aHoZH8yVnfAUJmb1vn2soUkUGMLl/9tiHhhna6piqiXrGGS5poPQIfZVff673hMWNgSHApEw=
X-Received: by 2002:a5b:cd1:0:b0:633:6f7d:ef98 with SMTP id
 e17-20020a5b0cd1000000b006336f7def98mr19904284ybr.267.1648411707602; Sun, 27
 Mar 2022 13:08:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220327054814.942198-1-Jason@zx2c4.com>
 <CADvTj4rJcC8NQnG4A70VgF6uqzj-xGDxg2nOyRB=jxj4wSLpqg@mail.gmail.com>
 <8fa95711-9442-c1b9-5ddc-9e1c7859f802@mind.be>
 <CADvTj4rETStakpHukCJL4R=wu0fejgdiyjj=Kue9YN=5Bh-YBQ@mail.gmail.com>
In-Reply-To: <CADvTj4rETStakpHukCJL4R=wu0fejgdiyjj=Kue9YN=5Bh-YBQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 27 Mar 2022 16:08:16 -0400
X-Gmail-Original-Message-ID: <CAHmME9rXhz48x1HE1+ocMeFm9eponoB=u0WsE6tE2a8Hg6DiwA@mail.gmail.com>
Message-ID: <CAHmME9rXhz48x1HE1+ocMeFm9eponoB=u0WsE6tE2a8Hg6DiwA@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/urandom-scripts: actually credit
 seed files via seedrng
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James, Arnout,

On Sun, Mar 27, 2022 at 3:58 PM James Hilliard
<james.hilliard1@gmail.com> wrote:
> I'm mostly just thinking that due to this needing to run super early
> it may be useful
> to be able to override in case say the seed needs to be stored in a non-standard
> mount location like the ESP along the lines of systemd:
> https://www.freedesktop.org/software/systemd/man/bootctl.html#random-seed

If you want to reengineer other things about this, please feel free to
do so after with follow-up commits. This keeps the same path location
root as the code that it replaces. Let's do one thing at a time. If we
do all these things at once, it'll be hard to fix regressions or
understand what's happened. This commit here improves one dimension of
things. Future ones from you can add additional features or tweaks or
whatever else.

Jason
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
