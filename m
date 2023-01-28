Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C1EC636CB
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 23:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7702560E65;
	Sat, 28 Jan 2023 23:07:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7702560E65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cWJ6_BnBStFm; Sat, 28 Jan 2023 23:07:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDEA460E62;
	Sat, 28 Jan 2023 23:07:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDEA460E62
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5DC181BF836
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 23:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 456A740489
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 23:07:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 456A740489
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ZzUAbP6fHnd for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 23:07:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 085744046B
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 085744046B
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 23:07:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 184A9FF803;
 Sat, 28 Jan 2023 23:07:41 +0000 (UTC)
Date: Sun, 29 Jan 2023 00:07:41 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230129000741.214be8fa@windsurf>
In-Reply-To: <20230114161002.35480-1-fontaine.fabrice@gmail.com>
References: <20230114161002.35480-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1674947262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i0xtuSWaIK/63GZTPOySdoqi1yyX3RHSToMtuy02yNg=;
 b=Gyh+PgZNZMX/g801c+3nr/IjQ7KmZvxNPBOT4vNDOEGdDjlaUgCrhDACuSSsQ13kwjNxGa
 3DTLwQoEf9N+5DeOEO5ZdWE445POi+1gp91k5Xixjp18jcjOM3RDo43MfVy/vuUSDrkwyD
 8GwT9qedAGyzbaKdfEZt3djVroVED2hzz1fZeVSB++EEYYWLROpYAUIP7RSNfJBwvrOCQy
 kgediqDJ2CiLZZ1ht34DFWXiurDIGmjzhtkt3hKPQH7mhEgFdb7l2A3LLdmZsiB7ebpWsl
 nflW8bwhQTSub6jgJpZ/8FYF3j7dfPzr6BuEZO5uphLmZ7i1K4fUJ7YadEm5zA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Gyh+PgZN
Subject: Re: [Buildroot] [PATCH 1/1] package/rng-tools: bump to version 6.16
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 14 Jan 2023 17:10:02 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

>  	# pthread_setaffinity_np
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
> +	select BR2_PACKAGE_LIBCAP

You forgot to propagate the depends on BR2_USE_MMU from
BR2_PACKAGE_LIBCAP, so I've done that when applying. Thanks a lot!

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
