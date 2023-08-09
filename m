Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43ADC001B0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 18:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7474A4190E;
	Wed,  9 Aug 2023 18:40:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7474A4190E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PH4SMs-hKVJn; Wed,  9 Aug 2023 18:40:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87BE5418FF;
	Wed,  9 Aug 2023 18:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87BE5418FF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5FD5F1BF5F8
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 18:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A2C260B1C
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 18:40:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A2C260B1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i1z9_N1-EkkZ for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 18:40:39 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2C6260AFF
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 18:40:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2C6260AFF
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F890FF807;
 Wed,  9 Aug 2023 18:40:37 +0000 (UTC)
Date: Wed, 9 Aug 2023 20:40:36 +0200
To: James Knight <james.d.knight@live.com>
Message-ID: <20230809204036.6da07ad8@windsurf>
In-Reply-To: <SN4P221MB068257366E0B70F2D1EC85B6A0689@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
References: <SN4P221MB068257366E0B70F2D1EC85B6A0689@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691606437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ff4RmTNtSiNvLSmIlLggpPcs5gUzWBgjTtZTy5UqyyE=;
 b=jD6SGcDjn2CoJ7misfjzR/POxg9KR6u9aKYtHwn6U84tvA+7ZKwsKwJcPFxbR2iec8J2az
 XnpOdm2exqPxVBXT8UXz47rTidFRCoIMd45JjCavq9T9cu/+Svdmg3eZiyVN1kIhI8HW+P
 aqknJIOZl4W78u1vmN2GzcS0ZHLWXUY9Tv54CNEfJDd/eJfXMms94F8msNicXSCV4+blMZ
 8jwv531jtLZfd5XO0CTmiVub0x7vxenV1+MdE34q6qHmZLl1LrXVYhN/kxb4cAC+aZWwcN
 XM4aCF0yywwhYwuko8TgmKVwW6R5WRGGLy+gfxRCWmB7neYnqhzTJF+IM0NBFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jD6SGcDj
Subject: Re: [Buildroot] [RFC PATCH] package/google-material-design-icons:
 drop package
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

On Sat, 29 Apr 2023 15:52:24 -0400
James Knight <james.d.knight@live.com> wrote:

> Newer versions of Google's Material Design icon package are structured
> differently, making a version bump no so trivial. While work can be done
> to support this, considering this package is using v2.2.3 and the most
> recent version is v4.0, it is most likely that this package is not being
> used. Environments which desire Material icons/fonts/etc. will most
> likely achieve better results be managing their own custom package to
> have an explicit selection/filter of design styles (e.g. standard,
> Android, etc.), variants (basic, outlined, rounds, etc.), display
> resolutions and scale selection desired.
> 
> Signed-off-by: James Knight <james.d.knight@live.com>
> ---
> This package (v2.2.3) was added sometime ago, to be a helpful for board
> builds that could easily install Material icons under `/usr/share` to
> be used by applications/web services (if configured for it). The
> original (external) project this was designed for was prototype-only,
> and is no longer used. I'm not sure that there is any value into
> maintaining this package in Buildroot since I suspect no other projects
> use it (mainly since it's two major releases behind and no one has
> requested a newer version).

Nobody complained, you originally contributed this package and no
longer willing to maintain it, so fair enough, patch applied to next. I
dropped the entry in DEVELOPERS and added the entry to Config.in.legacy.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
