Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5D1C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 06:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B983E40915;
	Wed, 27 Jul 2022 06:27:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B983E40915
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hgCtltOlcGDw; Wed, 27 Jul 2022 06:27:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAE4C4090D;
	Wed, 27 Jul 2022 06:27:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAE4C4090D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5870F1BF3A8
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 06:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18F50817B5
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 06:27:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18F50817B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SBUfX6c2pO5B for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 06:27:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1AD6817A3
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1AD6817A3
 for <buildroot@busybox.net>; Wed, 27 Jul 2022 06:27:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 521EF20000A;
 Wed, 27 Jul 2022 06:27:37 +0000 (UTC)
Date: Wed, 27 Jul 2022 08:27:36 +0200
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Message-ID: <20220727082736.53aa7bb2@windsurf>
In-Reply-To: <20220219182224.3397-1-guillaume.bressaix@gmail.com>
References: <20220219182224.3397-1-guillaume.bressaix@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658903257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jw6aIjSRqkDwpy1FfcElue1HcWjMmIk/eRzf6j9daTE=;
 b=LYnk2fwdgpJ50m9sK2PavdDrmsznEGXdXOFUQ5pqJYh2CuzHgWM9DQELprQNL8oAs/aZny
 UJvGUdKCoVogBFXTtDay2IAIe4SSsos68oFOvncYUFfE5OR+llrFfNEECB791bzRR2OjEa
 L3q5B7FdGlgUY77ILuxEuebfuqspfYbQRsI88b64QRh5tvnAU6EiGbirBv+d0+dz5AmpcG
 WuFyjOog28pHoVtNU/H61oVwSl6g+U+2ZB4PUaHLb0bAEGaCHuo8w+CCbF0mAgy42JEeEF
 AHjnnO6xzVOJywR4KR9KJDDU5yW+qRynjEPtbtH8YQHfe7pxqihdRPt6vGj4fg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LYnk2fwd
Subject: Re: [Buildroot] [PATCH] package/python-threadpoolctl: new host-only
 package
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

Hello Guillaume,

On Sat, 19 Feb 2022 19:22:24 +0100
"Guillaume W. Bres" <guillaume.bressaix@gmail.com> wrote:

> Tool to limit the number of threads used in the threadpool-backed
> of common native libraries used for scientific computing (e.g. BLAS and OpenMP).
> 
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> 
> ---
> host-python-threadpoolctl is a requirement for python-scikitlearn,
> which first requires the current python-scipy work to be merged
> 
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

I have the same comment as for python-joblib: could you resend this
patch as part of a patch series that includes python-scikitlearn. This
is to avoid having orphan host packages in Buildroot, which are not
used by anything, and therefore not buildable.

> +PYTHON_THREADPOOLCTL_VERSION = 3.1.0
> +PYTHON_THREADPOOLCTL_SITE = $(call github,joblib,threadpoolctl,$(PYTHON_THREADPOOLCTL_VERSION),$(PYTHON_THREADPOOLCTL_VERSION).tar.gz)

The github macro only takes 3 arguments, not 4.

> +PYTHON_THREADPOOLCTL_LICENSE = BSD-3-Clause
> +PYTHON_THREADPOOLCTL_LICENSE_FILES = LICENSE
> +
> +# threadpoolctl is originally built using 'flit' which
> +# simply symlinks $(@)/threadpoolctl.py to site-packages

We now have flit support in Buildroot. Could you have a look if this
help in making this package a bit better?

Thanks !

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
