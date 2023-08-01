Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B11C00528
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 21:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA0F760F03;
	Tue,  1 Aug 2023 21:18:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA0F760F03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2dBfAfdjT2-c; Tue,  1 Aug 2023 21:18:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1158A60A61;
	Tue,  1 Aug 2023 21:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1158A60A61
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DCAD41BF408
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B66CC60743
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:18:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B66CC60743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S1l0fEqYqdCl for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 21:18:42 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C72A260DFF
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 21:18:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C72A260DFF
Received: by mail.gandi.net (Postfix) with ESMTPSA id B914420004;
 Tue,  1 Aug 2023 21:18:38 +0000 (UTC)
Date: Tue, 1 Aug 2023 23:18:37 +0200
To: Vincent Fazio <vfazio@gmail.com>
Message-ID: <20230801231837.25545d7c@windsurf>
In-Reply-To: <20230801171012.1652426-1-vfazio@gmail.com>
References: <20230731224703.2923-1-vfazio@gmail.com>
 <20230801171012.1652426-1-vfazio@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690924719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AqwV+28BcwHDr4W6i4X+TKNaed+sHuzHcGWTQnoLarg=;
 b=CBsDV8VLh/FdYUeMZu4BUFLJN0A12lidshuc/Ljv+Bau//PIvhM3pD18UqXBgtXwYw3uLj
 8UR/rsL3SG20tU8zqLTkD2XTqZOTK+eYgY4bXUQjubEsNmm3Of/vJJSzheE1oVgNtYP6Hm
 9Z7/EU4l55ykDutdjQDl/GoXl603uhCWp/ghkCvMHWs/DzuTelHoFkANDQuDsES2pvx0xJ
 wKhileslWSRPUdKv/uUObfr5ycz3nXekjzgwkTL3DJ+FIwJMNcGNpZx2qMJTRow6TSLCXg
 QFso7nTMW5Tq8nJpK13MUaStPkCLulWaufLwY6JTf83NxrVkmoRhRKhJFndj8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CBsDV8VL
Subject: Re: [Buildroot] [PATCH v2 1/1] arch/Config.in.x86: consolidate
 Geode CPU targets
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

On Tue,  1 Aug 2023 12:10:12 -0500
Vincent Fazio <vfazio@gmail.com> wrote:

> Since its introduction in 7d8a59b40, the BR2_x86_geode CPU target has
> pointed to GCC -march=geode which targets AMD Geode processors [0].
> 
> This arch tuning enables MMX and 3DNow! extensions in GCC but these are
> not currently reflected in the selected flags by BR2_x86_geode.
> 
> This is likely due to the confusing naming and history of "Geode".
> 
> The AMD Geode can trace its origins back to the Cyrix MediaGXm [1] and
> then to the NSC Geode GXm/GXLV/GX1/GX2 [2]. All of these processors have
> MMX instruction support listed in their datasheets. The NSC GX2 was the
> first in the series to enable 3DNow!.
> 
> When 7fed07d3a4a introduced BR2_X86_CPU_HAS_MMX, Geode was skipped
> presumably because it wasn't clear that the target is AMD Geode and
> because the Wikipedia documentation for Geode is incomplete [2] with
> regards to supported instructions as they all support MMX.
> 
> When f6cd56b9ce3 introduced BR2_X86_CPU_HAS_3DNOW, Geode was skipped
> presumably for similar reasons.
> 
> Note: the in-tree olpc_xo1_defconfig uses BR2_x86_geode which is fine
> as this hardware uses the AMD Geode [3].
> 
> Make it more clear that the target is AMD Geode by renaming the Kconfig
> menu option and add both MMX and 3DNow! flags to BR2_x86_geode.
> 
> [0]: https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/i386/geode.md;;hb=HEAD
> [1]: https://en.wikipedia.org/wiki/MediaGX#MediaGXm
> [2]: https://en.wikipedia.org/wiki/Geode_%28processor%29
> [3]: https://wiki.laptop.org/go/Hardware_specification
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---
> Changes v1 -> v2:
>   - Reword the commit message
> ---
>  arch/Config.in.x86 | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)

I have further extended the commit log to explain that
BR2_x86_geode_mmx is removed, and that we don't need legacy handling
for this removal, as this option has never been part of a released
version of Buildroot.

Applied with this tweak. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
