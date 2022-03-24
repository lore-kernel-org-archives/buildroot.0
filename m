Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AAA6C433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 02:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9052960AA7;
	Thu, 24 Mar 2022 02:42:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wtwPWOojO4RQ; Thu, 24 Mar 2022 02:42:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0E3060AA0;
	Thu, 24 Mar 2022 02:42:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DCA371BF401
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 02:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA936400C6
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 02:42:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=zx2c4.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dLMTnln06nCV for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 02:42:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5AB8400C1
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 02:42:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 43933B81E59
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 02:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFFB1C340E9
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 02:41:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="SrMQW/47"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1648089716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UvtRh+FNQ/iBI0zEW683fTUuFMjJ9UiH8P3ICi6tJZM=;
 b=SrMQW/47Q9fnq1A+KDRm/hdO2Xzo/iVq4HQkSwPCq3b7H/VjtjWBTNpHuxP+p+/vkYTE+c
 b5a/7BQknF1QS8LQ/G/Uym26zLgeHj2hk9bJwyZ0iwfd7ZWUvodHZ8uLf4diUtBk3kg6xD
 5snGVqdBHeqF5gKfeXcnvFRjZWeyec0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 220e43e3
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 02:41:56 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id z8so6117181ybh.7
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 19:41:56 -0700 (PDT)
X-Gm-Message-State: AOAM532t3C8h2BSMSjlmXLrMrxQVSq0od7g7+UnJd4aSa8Y9nea2UBPH
 O/sizQajIm/LEUT1nMNaBpa79V6Fwp4CKcUjq7o=
X-Google-Smtp-Source: ABdhPJxLWihrYSGbm3wvQguAjutD7thiQgGGO9JOnumsHBeNbaBQxHu3EOR7iNWkszCIQDyTHUPV8UzJTjXp8hJdxks=
X-Received: by 2002:a5b:6cf:0:b0:61e:1371:3cda with SMTP id
 r15-20020a5b06cf000000b0061e13713cdamr2702420ybq.235.1648089715556; Wed, 23
 Mar 2022 19:41:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220323035233.140997-1-Jason@zx2c4.com>
 <20220323091336.GL1566358@scaer>
 <CAHmME9oUAXNpjWF266m3mH5HvEvVWCthy64RHFye+mOktMegzg@mail.gmail.com>
In-Reply-To: <CAHmME9oUAXNpjWF266m3mH5HvEvVWCthy64RHFye+mOktMegzg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 23 Mar 2022 20:41:44 -0600
X-Gmail-Original-Message-ID: <CAHmME9ph-j+6OZXbt6CUy-AmVCO408eh_DEpkuSbo2W6h+0ijw@mail.gmail.com>
Message-ID: <CAHmME9ph-j+6OZXbt6CUy-AmVCO408eh_DEpkuSbo2W6h+0ijw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH] package/urandom-scripts: hash old seed with
 new seed when saving
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
Cc: buildroot@buildroot.org, =?UTF-8?Q?Christoph_M=C3=BCllner?=
 <christoph.muellner@theobroma-systems.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On Wed, Mar 23, 2022 at 2:06 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > > As a final note, while this commit improves upon the status quo by
> > > removing a vulnerability, this shell script still does not actually
> > > initialize the RNG like it says it does. For initialization via a seed
> > > file, the RNDADDENTROPY ioctl must be used.
> >
> > Is there a way to do that within a shell script? If so, would you be
> > kind enough to send a followup patch, please?
>
> No, there isn't, at all. But I'm writing some code now that I hope to
> release as a standalone utility, and upstream into busybox/util-linux
> that should make it accessible. When that happens, I'll keep this
> mailing list informed, and we can move forward then.

Initial draft is here:

https://git.zx2c4.com/seedrng/about/
https://git.zx2c4.com/seedrng/tree/seedrng.c

I'll probably play with that for a few more days to make sure it's
solid. Probably the long term solution here is putting something like
that into busybox, and having scripts call that instead.

Jason
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
