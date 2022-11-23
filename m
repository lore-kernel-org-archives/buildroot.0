Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBB0C433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 14:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D353581EE4;
	Wed, 23 Nov 2022 14:17:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D353581EE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id auji8kRxvyq6; Wed, 23 Nov 2022 14:17:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EF4C81EDD;
	Wed, 23 Nov 2022 14:17:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EF4C81EDD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B66B1BF3E9
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 14:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CB8E41807
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 14:17:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CB8E41807
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1mvXBdtcmjbY for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 14:17:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C26074030B
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C26074030B
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 14:17:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3FD2110000E;
 Wed, 23 Nov 2022 14:17:15 +0000 (UTC)
Date: Wed, 23 Nov 2022 15:17:15 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20221123151715.4a454fed@windsurf>
In-Reply-To: <20221122215557.789750-1-ju.o@free.fr>
References: <20221122215557.789750-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669213037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E/wfojR84rfUn96Enr9XJsJ3OsVZT0HWGL+KQ1PE4uc=;
 b=H7wzzMLUn6jInPuj8NX4ky2bt6qFhkPkefB6tDHlzU9uXBGWMcKCDpw+NXlkhRXq61r7Ov
 DSdYHJ8VO9DQM+1B/bf6n2bpr/OC7aNjbJf8kCn+sN0M1S5Y2X020aJpZYk+WvP3Tku11C
 uToYBPB2W0I6a64GA8Wt8ugtBm2ctF7/MzjxrgEnEFSPOdDWY1YvhvnyBdXyP3woaZ2iqa
 VW8zdhQOgju3Yb+bJb/WfrYx59JLJ+qBshWcFVL1CN0kbwyHHGcjIUrY6hNGPHtHgW8PNv
 RmhLJjC/lWsKGSj9FyJdN4C8L8rU1HYq7WSbj+vHRQEUa5ohxupdfP/7gR2VGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H7wzzMLU
Subject: Re: [Buildroot] [PATCH next 1/2] package/highway: new package
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

Hello Julien,

On Tue, 22 Nov 2022 22:55:56 +0100
Julien Olivain <ju.o@free.fr> wrote:

> diff --git a/package/highway/Config.in b/package/highway/Config.in
> new file mode 100644
> index 0000000000..f9a0bc910c
> --- /dev/null
> +++ b/package/highway/Config.in
> @@ -0,0 +1,42 @@
> +config BR2_PACKAGE_HIGHWAY_ARCH_SUPPORTS
> +	bool
> +	# Supports all BR architectures by default, with few exceptions
> +	default y
> +	# Armv7 support is only with fpv4, see:
> +	# https://github.com/google/highway/blob/1.0.1/CMakeLists.txt#L221
> +	depends on !BR2_arm || BR2_ARM_FPU_VFPV4

Hm, I suppose if it works on other weird architectures, it must have a
non-optimized version, that could work on ARM platforms that do not
have a VFPv4 ?

> +ifeq ($(BR2_ARM_FPU_VFPV4),y)
> +HIGHWAY_CONF_OPTS += -DHWY_CMAKE_ARM7=ON
> +else
> +HIGHWAY_CONF_OPTS += -DHWY_CMAKE_ARM7=OFF
> +endif

So even with -DHWY_CMAKE_ARM7=OFF, it doesn't work for ARMv5, or ARMv7
without VFPv4 ?

> diff --git a/support/testing/tests/package/test_highway.py b/support/testing/tests/package/test_highway.py

Runtime tests coming together with the new package: excellent!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
