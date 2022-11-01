Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C73C4332F
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 20:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F393D60E28;
	Tue,  1 Nov 2022 20:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F393D60E28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AE02YaRKsWBc; Tue,  1 Nov 2022 20:29:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AA0960AA7;
	Tue,  1 Nov 2022 20:29:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AA0960AA7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 432B21BF834
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EC4880CDE
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:29:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EC4880CDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GdaX3-6i-0AD for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 20:29:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D911C80C89
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D911C80C89
 for <buildroot@busybox.net>; Tue,  1 Nov 2022 20:29:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6882040008;
 Tue,  1 Nov 2022 20:29:18 +0000 (UTC)
Date: Tue, 1 Nov 2022 21:29:17 +0100
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Message-ID: <20221101212917.19567f3f@windsurf>
In-Reply-To: <996e9db6fa29e5b1c59d7ecf3e84da781bace4ee.1667288516.git.baruch@tkos.co.il>
References: <996e9db6fa29e5b1c59d7ecf3e84da781bace4ee.1667288516.git.baruch@tkos.co.il>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667334560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rBzUi8xzFNop67foUmL96gDmbaR6lIMaE5S+VrgMIac=;
 b=Yv8BiOIl/5l6P3XpYzzQZbSNeY7jnoTjo+2uzyoXAXABWELnll3QfGukWy+I91i5cUkgy6
 oL9fOzWwPp3Cs1xEFhvDFYf84Rq6AL9O522IQJQI3q3oFkyRu5wRzZzuqerj4XIeHDbObV
 8NAqkj+51vROluhuG3BiGzQP3bPiQjX6lKi89SuaOFK0WWM6FL6IBSGUztOMKW/lzZWHAD
 AgM/ueiJqBTTvqqySwwaIdnGeJdPatcf2Rq/WL/N0zYreXgb5QYiBeXXRzgXGlm/hZMLyn
 LEUimpOVYY5qnQNADYP7IxdqnK0izRXhxJ+obqdJ1ZDIyV7pZii+ieHTgqbGqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Yv8BiOIl
Subject: Re: [Buildroot] [PATCH 1/3] package/socat: fix printf feature
 detection
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  1 Nov 2022 09:41:54 +0200
Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

> socal configure uses AC_TRY_RUN to detect printf features. This does not
> work for cross compilation.
> 
> All C libraries we use support C99 snprintf. Only glibc and uClibc
> support the deprecated Z modifier.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/socat/socat.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)

How did you notice this issue? I see no autobuilder failure. If it
wasn't working for cross-compilation, we should have build failures, no?

Or are bad results of these ./configure tests only causing runtime
issues? Could you elaborate a bit?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
