Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD80E748E6
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 20:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 190AA60FC6;
	Sat, 30 Sep 2023 20:12:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 190AA60FC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ECFmirn2u1xV; Sat, 30 Sep 2023 20:12:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71BA760EE5;
	Sat, 30 Sep 2023 20:12:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71BA760EE5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 749A71BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 20:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2091160EE5
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 20:12:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2091160EE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4txYHTKflyMO for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 20:12:22 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A573E6058D
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 20:12:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A573E6058D
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB9A9FF803;
 Sat, 30 Sep 2023 20:12:18 +0000 (UTC)
Date: Sat, 30 Sep 2023 22:12:18 +0200
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Message-ID: <20230930221218.023aa2c5@windsurf>
In-Reply-To: <20220819151734.926106-1-Ben.Wolsieffer@hefring.com>
References: <20220819151734.926106-1-Ben.Wolsieffer@hefring.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696104740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9dM4rONxiP4yNqUgsoId8qFHHeE8CDwxZ+KQrBmaEmQ=;
 b=MpfLgkMzNlGfmQaOe8+yU97u7geKSOidIUOcd5+1nVFF2LiOXaFeE2vajyHJ9FSgn+BOFd
 hKz2ze9rPNqCQAyPt6/dZxIAJWunhgGYMRVrstypC4uq5D1ohBGcE/LvdaaRNaH/Xeykio
 VATqR68GNU7ew+qSFhbdqYXe6b0kT4Il0GgpUvDsRzqukftGnWqst3UhrPNdItq8LFx0EF
 DGgTwOTLt4wbCNa+Fk+8hUPxAjXECO4iLrWm7B0y7flWiwK8VRKwR/Fs8kws1IKPRGSJCG
 1lQKtLzKJlQ12FnBpqPOn95eBTmYNpVciE3dzZ6tElvWvUA6te33O7k0/LXypg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MpfLgkMz
Subject: Re: [Buildroot] [PATCH v3 0/8] Add support for FDPIC binaries on ARM
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
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Ben,

On Fri, 19 Aug 2022 11:17:25 -0400
Ben Wolsieffer <ben.wolsieffer@hefring.com> wrote:

> Ben Wolsieffer (8):
>   Revert "arch: drop now useless support for FDPIC"
>   arch: don't enable FDPIC binaries by default
>   arch: make FDPIC dependent on toolchain support
>   arch/arm: add support for FDPIC
>   boot/uboot: pass -mno-fdpic if FDPIC is enabled
>   linux: pass -mno-fdpic if FDPIC is enabled
>   package/uclibc: enable NPTL on no-MMU ARM w/ FDPIC
>   package/pkg-autotools: patch libtool to support ARM FDPIC

Thanks for submitting this, and as Yann said already many months ago,
sorry for the delay.

To be honest, we're not entirely sure we want to merge this without a
really active user of it. The changes are not too complicated, but it's
another fairly special use-case to support, and we would really like to
have someone using it "for real" before we merge this.

Also, Waldemar pointed out a number of small issues he encountered
while testing this. There's not been activity on this topic for a year,
so we're not sure how committed you are to pushing this and more
importantly maintaining this.

Could you provide more details on whether you're actually using this in
a project/product? Or is anyone else using this, or going to use it?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
