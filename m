Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845AFC54EE9
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 08:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E98D160E06;
	Tue, 20 Sep 2022 08:35:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E98D160E06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nlGrWAyjsV0A; Tue, 20 Sep 2022 08:35:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A65F60BF7;
	Tue, 20 Sep 2022 08:35:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A65F60BF7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7F3841BF30C
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 08:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 538BE4026E
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 08:35:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 538BE4026E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cKDtE3CG1jXG for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 08:35:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 828BE40104
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 828BE40104
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 08:35:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 685801BF20F;
 Tue, 20 Sep 2022 08:35:25 +0000 (UTC)
Date: Tue, 20 Sep 2022 10:35:24 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: <yann.morin@orange.com>
Message-ID: <20220920103524.41ad225a@windsurf>
In-Reply-To: <20330_1663659985_63296FD1_20330_21_1_20220920074624.GC3551@tl-lnx-nyma7486>
References: <20220920064550.520645-1-thomas.petazzoni@bootlin.com>
 <20330_1663659985_63296FD1_20330_21_1_20220920074624.GC3551@tl-lnx-nyma7486>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663662925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5WWDI4s2mYie4q/XMwaGiN9lQIYBcPRboQyGl3VTtC8=;
 b=jlkaeyGItljKP6jszqJt+3GxeKurWwlyC7r+PD7EaK9I8rIlXyqEucFwflfC8tXTBYXXDu
 p8kY/qtQmjtiHdqt2rKuol6g8xW0lU6v6O0s6jET7gevlMwcbeTiF5rVvxBWPg770yC8GP
 brSoLsJQGVv5vH0UizwfpKQ48iej6agtjI8vdpodweALZ6EzfSgS9cmpp0Xm+RTPip1g6I
 4DQK5yPGFcs3T5huh/67hHdyBMr4Qpusx9nV01VrcuXX+v1jEszzhB1t4jEIM3TvCKTcZu
 o9nZ/LuWm7Albuu8+vs8QdspmdntQYfnSigM1eyjM4g+T8GRzwzlmHIjQ3Iynw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jlkaeyGI
Subject: Re: [Buildroot] [PATCH] support/scripts/check-host-libs: add new
 check on host binaries/libs
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

Hello,

Thanks for the quick feedback!

On Tue, 20 Sep 2022 09:46:24 +0200
<yann.morin@orange.com> wrote:


> I'm afraid this is going to be too big a hammer, at least if that's a
> hard error.
> 
> Indeed, when the build environment is reproducible (like, it is a
> container image), and there are no package in Buildroot, and the host
> directory will not be distributed (i.e. one does not care about doing an
> SDK), then it is usually good-enough to use the system-installed
> libraries, rather than add a Buildroot package.

True.

> > The script includes an allowlist of libraries provided by the C
> > library. It is potentially possible that this list might need to be
> > extended to cover all systems/distributions/C libraries, but only
> > wider testing of this script will help detect such cases.  
> 
> There are at least missing entries already:
>     librt.so.1
>     libutil.so.1
>     libresolv.so.2

Thanks, I'll add them.

> Also, there are error messages for some go stuff:
>     ==> HOST_DIR/lib/go/src/debug/elf/testdata/go-relocation-test-gcc930-ranges-no-rela-x86-64  
>     readelf: Error: no .dynamic section in the dynamic segment
> 
>     ==> HOST_DIR/lib/go/src/debug/elf/testdata/go-relocation-test-gcc930-ranges-with-rela-x86-64  
>     readelf: Error: no .dynamic section in the dynamic segment

I guess this can be resolved by simplying sending the readelf error
output to oblivion.

> Finally, this script takes more than a minute to run on our build, about
> a 10% increase from ~12min. This is not nice at all.
> 
>     $ find host/*bin host/lib* -type f |wc -l
>     16186
> 
>     $ find host/*bin host/lib* -type f |(keep just libs + execs) |wc -l
>     339
> 
> That last command, though, is what takes time: there is a huge ton of go
> junk installed in HOST_DIR, and this takes ages to filter-out.

Wow, 1 extra minute, this seems a lot. However, I don't understand what
you mean by "That last command". What exactly takes time? The fact that
we run "file" on zillion of files to filter out files that are not
executable/shared libraries? Or the readelf on the filtered files?

> So, although I understand the rationale, this should probably be opt-in.
> 
> Or it should only be ran when doing an SDK?

I am fine with this being opt-in, but I would not tie it to the SDK,
but rather to CI in the autobuilders. Indeed, while locally for your
own projects where you might control the build environment (using
containers, as you mentioned), in the general situation, Buildroot
tries to not use system libraries other than the C library. So having
this in the autobuilders would not impose the extra time on users, but
would allow us to detect a number of undetected spurious host
dependencies.

So, it would be a Config.in option, disabled by default. Autobuilders
would enable it, and users who are interested by the extra checks could
also enable it.

Thoughts?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
