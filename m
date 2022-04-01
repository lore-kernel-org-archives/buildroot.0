Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAEAC433F5
	for <buildroot@archiver.kernel.org>; Fri,  1 Apr 2022 10:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F07C86F63D;
	Fri,  1 Apr 2022 10:18:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3O122qSXxV13; Fri,  1 Apr 2022 10:18:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F16CC60EB1;
	Fri,  1 Apr 2022 10:18:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 560B41BF861
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 10:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 399A260EB1
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 10:18:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qrta7taSL9zg for <buildroot@lists.busybox.net>;
 Fri,  1 Apr 2022 10:18:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 531D760E00
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 10:18:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6386BB82331
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 10:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C455C34110
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 10:17:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="idlqPtjT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1648808273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rMiSnbk62LnBsamfWiH3t3q8pjKZGeIapYz3sWiiSTI=;
 b=idlqPtjTkMUdMxSanrU2fyZzy4RHcxn16vFZM4tg/UJ/U06Rt2HV781UUoGRDCNZ/+Hm6l
 bjIycAs6Xxw78Rpb+I+D4tfGbmkvNBOBGZ305EomAPeKVXyWcaq3qgdKgcS/Bnb5eTJl7b
 0g9+N4uUKQmovxRHnOYuq/QIApkFfio=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2044bf3e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <buildroot@buildroot.org>; Fri, 1 Apr 2022 10:17:53 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-2eafabbc80aso26900007b3.11
 for <buildroot@buildroot.org>; Fri, 01 Apr 2022 03:17:52 -0700 (PDT)
X-Gm-Message-State: AOAM533hPlwLPVSmaHmqRjodDFkUxEO/F2ADx+cmVEbQgKpmLd5Nt896
 GnrFemDl22dq2O7NHJmdtV0XuW4ichws4GXp+Pk=
X-Google-Smtp-Source: ABdhPJwX8pVnUTdK4XfwxoaV4Ht0hIMLnCTMBr/aVYVJenXjxOP4O7mfFB77pcE5MiG2WDNH1J0KiKpUZQdBFmjkoXU=
X-Received: by 2002:a81:4f55:0:b0:2e5:be44:f42c with SMTP id
 d82-20020a814f55000000b002e5be44f42cmr9116824ywb.485.1648808272060; Fri, 01
 Apr 2022 03:17:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7110:4707:b0:171:cd8f:b3d2 with HTTP; Fri, 1 Apr 2022
 03:17:51 -0700 (PDT)
In-Reply-To: <e76de69b227d4a66ae2f2c9fd6901476@AcuMS.aculab.com>
References: <20220327202415.1248312-1-Jason@zx2c4.com>
 <20220329050401.110856-1-Jason@zx2c4.com>
 <871qyj8kpk.fsf@dell.be.48ers.dk>
 <CAHmME9oRxF66kB9U93zTXC9EQq4xYTABPrZ9y2dPfhReAZdTpQ@mail.gmail.com>
 <87bkxm2gix.fsf@dell.be.48ers.dk>
 <2949fa8776db4c96800e1df8e39a8ec2@AcuMS.aculab.com>
 <CAHmME9rQOtfhKCOD8AAmpnY6yjNZTUi0H6_Jmd5vYtu68TxaGg@mail.gmail.com>
 <e76de69b227d4a66ae2f2c9fd6901476@AcuMS.aculab.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 1 Apr 2022 12:17:51 +0200
X-Gmail-Original-Message-ID: <CAHmME9pOZmzUW_Yu8Y6i4VZOT1gQ5A+3_U4cn+NeZjF=oCYz+Q@mail.gmail.com>
Message-ID: <CAHmME9pOZmzUW_Yu8Y6i4VZOT1gQ5A+3_U4cn+NeZjF=oCYz+Q@mail.gmail.com>
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 4/1/22, David Laight <David.Laight@aculab.com> wrote:
> But it does exactly what the old scripts thought they were doing
> and is far better that just using dd.

On the contrary, it's strictly worse, since the crediting becomes
dangerous here.

> I'm not even sure that trying to save a 'new seed' in the
> startup script is a good idea at all.
> The new seed is very likely to just be a permutation of the
> old seed - since little extra 'entropy' can have been added.
> So while it may stop complete reproducibility I'm not at
> all sure it is cryptographically sound at all.

?? You could get away with hashing the old seed together with some
constant public value and it would be sufficient here. What are you
talking about?

> If you can't rely on saving entropy at shutdown, then using
> (the equivalent of) a cron job to save every hour (or so)
> is probably useful.

Android does it every 3. And as of http://r.android.com/2050961 they
now use the SeedRNG construction.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
