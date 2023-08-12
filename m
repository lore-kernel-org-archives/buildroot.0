Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C360FC0015E
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 12:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43980608B7;
	Sat, 12 Aug 2023 12:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43980608B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qHKKXOh0UihI; Sat, 12 Aug 2023 12:18:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 886E9606C0;
	Sat, 12 Aug 2023 12:18:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 886E9606C0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B98631BF3B5
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 12:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 744E0812B6
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 12:18:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 744E0812B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hX4RpfG5u8UR for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 12:18:35 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0220D80C16
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 12:18:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0220D80C16
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA5A5240008;
 Sat, 12 Aug 2023 12:18:31 +0000 (UTC)
Date: Sat, 12 Aug 2023 14:18:30 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230812141830.25306570@windsurf>
In-Reply-To: <ZNYCuqvdnyJ1p2CB@waldemar-brodkorb.de>
References: <ZNYCuqvdnyJ1p2CB@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691842712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mZ/e4QTAKPcOkHmpEXdGQUA9iecv1ezMNh8aF65XZR8=;
 b=CjGF3emDJzkjNUIqNvMbX4DJoiGGkIhw2Xx1nMggxGvgA2ou+0Q4f7Kmeyz9ENSkawHi5D
 niHIeMRMIyyOH1OpMmxOtWpKnN4QYt6aIsmz4Ep3Adu/+4xBESDNjau4wOly2dVa4+JwHN
 uykkci1P+LvGuVNGIEKqAAUaCvwgCYZPi6H52hEVb8aUfD4WapyqBgGQbyj2xgLI8I0C6p
 vH7oyOkr2AEyyNMN8XLwbQ2w1TAPjGviMEH3vBMdek/VUdu6RxcZ0R85n6sMwvfQ0uQSJl
 FA4WQb9hURd7pu8hr4b+wD9XRGBgKqNMSS9y2uobqJ1kyuebWXSoYGnssUx8kQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CjGF3emD
Subject: Re: [Buildroot] [PATCH 2/2] package/xfsprogs: fix linking error
 when -O0 is used
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Waldemar,

On Fri, 11 Aug 2023 11:43:22 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Urcu does not like -O0 it needs gcc optimizations.
> Force -O1 in this case. Inspired by package fwts.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/3bd/3bd7de784953ab1fa70bf5572eccd7b10e4a0e17
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Thanks a lot for looking into this.

However, I'm wondering why is this patch 2/2 ? If it's already
happening in the autobuilders, I guess it means it should come *before*
the version bump, to fix an already existing issue, independent of the
version bump ?

Also, since when is this error happening? As explained in my reply to
your libedit patch, we need to understand since when issues are
happening, so we know which commit introduced the regression.

Very good tools to help in this investigation are:

 - Look at http://autobuild.buildroot.net/?reason=xfsprogs% and see in
   the history of build failures when it started happening

 - Obviously, look at the Git history for the package, and how that
   sometimes translates (in terms of commit dates) with build errors
   starting to happen, as reported by the autobuilders

At http://autobuild.buildroot.net/?reason=xfsprogs%&step=50&start=100
it seems like we started seeing the issue when it was bumped from 5.8.0
to 5.14.2, or it might be due to us starting to test -O0 builds (which
was not the case before).

So here, the issue got introduced in commit
2f8f69012e0eee7f3e98212fb3da118c211f3c0b: before this commit, xfsprogs
builds fine at -O0, after this commit, it fails to build at -O0. As
this commit went into 2022.02, the fix needs to be backported to stable
branches.

Could you resend this patch series, swapping patches 1/2 and 2/2, as
well as extending the justification for the fix?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
