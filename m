Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847F4C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 10:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08E2381D5F;
	Mon, 15 Aug 2022 10:58:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08E2381D5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fSYi_Jn5WUip; Mon, 15 Aug 2022 10:58:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D28081DCA;
	Mon, 15 Aug 2022 10:58:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D28081DCA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 24C701BF3C4
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 10:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B01AD408CC
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 10:58:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B01AD408CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bDDMWWT8pWn5 for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 10:58:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B26F408B3
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B26F408B3
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 10:58:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D80DD60003;
 Mon, 15 Aug 2022 10:58:16 +0000 (UTC)
Date: Mon, 15 Aug 2022 12:58:15 +0200
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Message-ID: <20220815125815.2a11d116@windsurf>
In-Reply-To: <20220808080910.14164-1-gwenj@trabucayre.com>
References: <20220808080910.14164-1-gwenj@trabucayre.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660561097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0wy13nYNbuAIfaSNzxM6cmeXMh9YWd7r/TPmrg4+dsE=;
 b=bZKs+I6sfxwFMjztv6b+jot+vvoIZk9/LIHpFpdfSQEM5/UOxfj6wvDiuFvPntXd9HVH2i
 0N2qSHTqjoECFKiZhBQz44L5cmfqDob9kcg83+AQcc/C1pBCN5yza7bAROzqfHLITI7FpM
 Rlghy8aNgjy10RcNz4QkyPjnxA5QxBwCGQrd/+Lkt6dEC47XzEFgDS5MoMis1+KNUPw/Ao
 30W2G7QEBgQZM45WstrCqiIe2vdFpd6vL2+PphtzjUrwG32Z8GFIHeq6lYS7GeSSm6C5dD
 OyeJGA8seZOnmPKq9r87uE2KVz+0ANqdqSOJDaySJz8xmwCdJ9tzga/pK7zoLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bZKs+I6s
Subject: Re: [Buildroot] [PATCH] package/gnuradio: bump version to 3.10.3.0
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon,  8 Aug 2022 10:09:10 +0200
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> - remove all no more required patches
> - add dependency to SPDLOG
> - add pybind dependency where python is set
> 
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Thanks for this version bump. A few questions below.

>  	select BR2_PACKAGE_PYTHON_NUMPY # runtime
> +	select BR2_PACKAGE_PYTHON_PYBIND # runtime

So here you're saying that python-numpy and python-pybind are runtime
dependencies.

>  ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
> -GNURADIO_DEPENDENCIES += python3
> +GNURADIO_DEPENDENCIES += python3 python-numpy python-pybind \

But you have them as build-time dependencies here. Could you check this?

> +	host-python-mako host-python-numpy host-python-packaging

Are these host-python-* really needed? Why would gnuradio needs numpy
at build time? Or are they just here to satisfy some broken build
system that verifies NumPy is installed on the build machine, even
though really they are needed only on the target?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
