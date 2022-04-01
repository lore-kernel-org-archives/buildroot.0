Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297D2C433F5
	for <buildroot@archiver.kernel.org>; Fri,  1 Apr 2022 09:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6E1F4060E;
	Fri,  1 Apr 2022 09:23:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DoY5L90_sL4q; Fri,  1 Apr 2022 09:23:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D75E5405BE;
	Fri,  1 Apr 2022 09:23:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C1D0A1BF376
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 09:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE9E060BB1
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 09:23:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=zx2c4.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a8NOPE1LT-wN for <buildroot@lists.busybox.net>;
 Fri,  1 Apr 2022 09:23:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 65B7460B86
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 09:23:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 38B2461501
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 09:22:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1CA6C34113
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 09:22:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="UouWAqNY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1648804974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fvf/SCctUMzldtumT6B+z4aHh+sUUivz7Vh0EidXFTM=;
 b=UouWAqNYuEEdW1b0UVZR71TjDDYN15rx6en61YhjO15GJ0R9+SWNxf7Bote3AyGc5Yhizh
 0BOreDKvo9PL6oi74UdvZC3YyH1uwt8MkNUkZyOs+JR/K1o7HUZY2Nv2AGbrsawuQlYEkt
 OE3PER7tjAkxX3VuRkr4jc6leAhucEo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id eab10d3a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <buildroot@buildroot.org>; Fri, 1 Apr 2022 09:22:54 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id y142so3894566ybe.11
 for <buildroot@buildroot.org>; Fri, 01 Apr 2022 02:22:54 -0700 (PDT)
X-Gm-Message-State: AOAM531NgzMl2Zu6GNJgIC7KLj40MbO83qBlJLQQF4ZVPgGQgbNkXAUj
 tYDSrjzvIiz9oinrtXjXORYYCklZ+D9ln34a2fA=
X-Google-Smtp-Source: ABdhPJz56/sUfYzX0pCzuiG2+Eb7WACM+JthSKOnz2aaqhyF17XYDnRVarbV2tj+dI0WQu001j8plHWkhsWzLN/6dLE=
X-Received: by 2002:a5b:cd1:0:b0:633:6f7d:ef98 with SMTP id
 e17-20020a5b0cd1000000b006336f7def98mr7619255ybr.267.1648804973089; Fri, 01
 Apr 2022 02:22:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7110:4707:b0:171:cd8f:b3d2 with HTTP; Fri, 1 Apr 2022
 02:22:52 -0700 (PDT)
In-Reply-To: <2949fa8776db4c96800e1df8e39a8ec2@AcuMS.aculab.com>
References: <20220327202415.1248312-1-Jason@zx2c4.com>
 <20220329050401.110856-1-Jason@zx2c4.com>
 <871qyj8kpk.fsf@dell.be.48ers.dk>
 <CAHmME9oRxF66kB9U93zTXC9EQq4xYTABPrZ9y2dPfhReAZdTpQ@mail.gmail.com>
 <87bkxm2gix.fsf@dell.be.48ers.dk>
 <2949fa8776db4c96800e1df8e39a8ec2@AcuMS.aculab.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 1 Apr 2022 11:22:52 +0200
X-Gmail-Original-Message-ID: <CAHmME9rQOtfhKCOD8AAmpnY6yjNZTUi0H6_Jmd5vYtu68TxaGg@mail.gmail.com>
Message-ID: <CAHmME9rQOtfhKCOD8AAmpnY6yjNZTUi0H6_Jmd5vYtu68TxaGg@mail.gmail.com>
To: David Laight <David.Laight@aculab.com>
Subject: Re: [Buildroot] [PATCH v3] package/urandom-scripts: actually credit
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
Cc: buildroot <buildroot@buildroot.org>,
 James Hilliard <james.hilliard1@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 4/1/22, David Laight <David.Laight@aculab.com> wrote:
> I used the following small program instead of dd to credit the entropy.

Not a safe idea; will lead to problems and footguns. Doesn't handle
safe fsync'd deletion of used seeds and safe sequencing. Doesn't
handle hashing old seed with new seed. Ignores much of the discussion
that lead to seedrng's design.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
