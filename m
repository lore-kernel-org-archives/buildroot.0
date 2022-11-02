Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC44C4167B
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 22:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07EEA81E50;
	Wed,  2 Nov 2022 22:12:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07EEA81E50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EfDlBrSiHnmx; Wed,  2 Nov 2022 22:12:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 528F881E82;
	Wed,  2 Nov 2022 22:12:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 528F881E82
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EFA701BF471
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACFA44014B
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:12:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACFA44014B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QzyoZai4Wghh for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 22:12:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FF68400D0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7FF68400D0
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 22:12:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A9814FF809;
 Wed,  2 Nov 2022 22:11:59 +0000 (UTC)
Date: Wed, 2 Nov 2022 23:11:58 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20221102231158.2ba5f486@windsurf>
In-Reply-To: <20221102215355.GB3918838@scaer>
References: <20221007235002.79221-1-vfazio@xes-inc.com>
 <20221007235002.79221-2-vfazio@xes-inc.com>
 <20221101234138.66423cf3@windsurf> <20221102215355.GB3918838@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667427120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ouk74LGwSdGJhACeqBizEEKgHNemfT5rRIaEe9BgCYA=;
 b=BUMzZULWzbNuq4AqoYqDV8u/LY3HN+A+KoFFR0k5ToUOgUxHsN6vABfayW77q5EQonN1u2
 Ew/FSCey5h8CAqNhXcjP3AGrAfroBP0GJNcqjVvCSl93EBvtrCVoTmjtHxitzdrXfIB+Ke
 D3H34trR8ZI8KYMElpiKJSXqtnP+81LKj7ogof3d4xpyDKUQvzIE0ammnrgGPn/Pg1CZy5
 GEBPF2kRXzytEkWW26U+NrYAAVmijv2Ft1seeRcTXgGH3il4eR397Oap/XJd7VnxKq82pq
 ULDmqhlv9yQ4Ytm/WyP/Icf70zTdQ8IpiXPCEK9QWAyMwUXowQMGb3SX8PXWTQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BUMzZULW
Subject: Re: [Buildroot] [PATCH 2/2] package/busybox: redirect errors to
 /dev/null
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
Cc: Vincent Fazio <vfazio@xes-inc.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 2 Nov 2022 22:53:55 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> We did look at this together with Vincent back then.
> 
> The issue is that pkg-config is called as part of BUSYBOX_CFLAGS and
> BUSYBOX_CFLAGS_busybox, which are part of BUSYBOX_MAKE_ENV, which will
> eventually be part of the environment when calling one of the kconfig
> frontends, like 'config' (when applying the configuration), or
> menuconfig et al.
> 
> At that time, only parts of the PPD have been gathered, and not the
> parts needed to configure and build, so host-pkgconf is not rsynced to
> the busybox PPD.

But perhaps we should not pass those CFLAGS during the "configurator"
step?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
