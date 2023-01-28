Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D6FC636CB
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 21:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB86D81E56;
	Sat, 28 Jan 2023 21:40:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB86D81E56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l2MNfnf0GUq7; Sat, 28 Jan 2023 21:40:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1277B81E52;
	Sat, 28 Jan 2023 21:40:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1277B81E52
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A981A1BF3C0
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 21:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 763B781E52
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 21:40:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 763B781E52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8H7TtAPWDlpM for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 21:40:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44E3181E4D
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44E3181E4D
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 21:40:50 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 56CEC40002;
 Sat, 28 Jan 2023 21:40:47 +0000 (UTC)
Date: Sat, 28 Jan 2023 22:40:46 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230128224046.7b3165dd@windsurf>
In-Reply-To: <20230127050613.793962-1-james.hilliard1@gmail.com>
References: <20230127050613.793962-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1674942047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VlWFKI8YvL1z05f0LyDeaLHkomePJ1kSqtRxMKK5fPQ=;
 b=M5tpm7YXyrZ01SmjIKfDnhUpJ1QMXYsWAeBUXS+UBQfHGbAYQgWzq4YeOc40XA5mJ2vMBI
 uj3FyVJJsAtnqJQdagoXkNprKtldKCeqT6rJE0UYB/ujeE9n6kzPyUkmaTDDIcFAwV+WAQ
 HwYHMgyhJnI8eM6Lbsjcpcv3O736ELUVxQ/bSJPBeyetOohoixG2qbdVej/CCBgtpsQgFP
 T0y5Cy9oZ1dLuMvOgKOThgeCELXf22Matc7bvucFzEB5vp3Bon9+MG4Lpmmhw5G4Uy8qVa
 J3CeI9OM2vVFy4kfT/EYpqcIg7gzUwKZEW2RoV09H2jaF5EH0vUUptSGktp0aQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=M5tpm7YX
Subject: Re: [Buildroot] [PATCH 1/1] package/python-greenlet: add missing
 C++ dependency
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 26 Jan 2023 22:06:13 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.net/results/529/5291fe0fac1d5c7b6587e4a566991a764a2632fb
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-greenlet/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-greenlet/Config.in b/package/python-greenlet/Config.in
> index 9f66ebe119..32ccdaae27 100644
> --- a/package/python-greenlet/Config.in
> +++ b/package/python-greenlet/Config.in
> @@ -12,6 +12,7 @@ config BR2_PACKAGE_PYTHON_GREENLET_ARCH_SUPPORTS
>  config BR2_PACKAGE_PYTHON_GREENLET
>  	bool "python-greenlet"
>  	depends on BR2_PACKAGE_PYTHON_GREENLET_ARCH_SUPPORTS
> +	depends on BR2_INSTALL_LIBSTDCPP

When a toolchain dependency like this is added a Config.in comment is
needed. I've added it and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
