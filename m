Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F42C32793
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 21:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45BD140A97;
	Tue, 23 Aug 2022 21:53:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45BD140A97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id li9Bm6DOUtyV; Tue, 23 Aug 2022 21:53:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AEDF40A04;
	Tue, 23 Aug 2022 21:53:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AEDF40A04
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E77E1BF3D7
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 21:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D262813D4
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 21:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D262813D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P4EEK-Ybr5Dr for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 21:53:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80E3C813CF
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80E3C813CF
 for <buildroot@busybox.net>; Tue, 23 Aug 2022 21:53:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4D36E60005;
 Tue, 23 Aug 2022 21:53:17 +0000 (UTC)
Date: Tue, 23 Aug 2022 23:53:16 +0200
To: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Message-ID: <20220823235316.6fa50911@windsurf>
In-Reply-To: <20220815171744.105903-1-abrodkin@synopsys.com>
References: <20220815171744.105903-1-abrodkin@synopsys.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661291598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UoBHdrPiPPTfyCoHJrQleltqsm1DaKsOfDYXfghBBPE=;
 b=jue3p9YYJK6gS2CfWSOwO4X2HuGo/+2jUjleneIc0BBv3iykKyW1Gti2bbDdbkqIzT36Tw
 8/H77RdXslNjjhRmnhAVTe1W50NNh/4lv8CYkOH9BtYDCPj8PXZoBeASEmDdbCXgNLExf9
 P2NmktaclE+4VmsYO35r8pjKga7IAGXwmZWqztsENNyVx3z0LfmGGKHubyZ7KTOZbyJcIN
 J4NcM9ZXlsekOFpfB484ybITH3GvWTx1AAK0j3QqUvYA9DZMbKtRszbRpw2nIAltEzfMxt
 gxoKidK5aZkPfc8iWQA49C9Z9X3l3W+B6KKAF9U2HH8jXV+11UzfHqGTAEPKtw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jue3p9YY
Subject: Re: [Buildroot] [PATCH] arch: Set common-page-size explicitly
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@busybox.net, Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 l.stelmach@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 15 Aug 2022 10:17:44 -0700
Alexey Brodkin via buildroot <buildroot@buildroot.org> wrote:

> On some CPU architecures it's possible to use MMU pages of different
> sizes. Those are for example are ARC & ARM. And while for use-space
> applications page size is supposed to be transparent, there's still
> some use of that extra information. In particular it's possible to
> align data structures or code/data sections on page boundary, etc.
> 
> For these tricks to become possible tools which pack data (think of
> the linker, like GNU "ld") need to be informed of the page size to
> be considered.
> 
> Obviously, there're some sane defaults which are being used most of
> the time, so we even think about that peculiarity, but when non-default
> value needs to be used, GNU "ld" accepts 2 properties related to page
> size:
> 
>  -z common-page-size=XXX
>  -z max-page-size=YYY
> 
> And while in thery those might be different (but always "common" <= "max"),
> and that might make sense if we build for some unknown platfrom,
> in case of Buildroot when we build entire target's filesystem and so
> know exactly the configuration we're targeting to, we may safely assume
> "common-page-size"="max-page-size".
> 
> See a lengthly discussions in this thread [1].
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/c8b2f331c98453670cd982558144c4fd84674a3d/ (uclibc)
>   http://autobuild.buildroot.net/results/3a22f7aac38145b26c549254b819f87329e7a77e/ (glibc)
> 
> And while at it, recover use of "XX-page-size" for ARC, as with [2]
> moving page size selection in the generic code we've got unexpected
> override for ARC (note "=", but not "+="):
> --------------------->8--------------------  
> ARCH_TOOLCHAIN_WRAPPER_OPTS = -matomic
> --------------------->8--------------------  

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
