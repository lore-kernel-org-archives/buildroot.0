Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9B2C4167D
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 16:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 677CE4172D;
	Wed,  1 Nov 2023 16:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 677CE4172D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 826F2RlkC3jj; Wed,  1 Nov 2023 16:56:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1DF5B41768;
	Wed,  1 Nov 2023 16:56:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DF5B41768
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D069D1BF2F1
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0F2E415E0
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:56:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0F2E415E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NeeOzG7_MRaB for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 16:56:17 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09D8B40980
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 16:56:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09D8B40980
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3388EFF803;
 Wed,  1 Nov 2023 16:56:14 +0000 (UTC)
Date: Wed, 1 Nov 2023 17:56:12 +0100
To: Hmaied Ben Abdellatif <hmaied.benabdellatif@etictelecom.com>
Message-ID: <20231101175612.7de6373b@windsurf>
In-Reply-To: <d51a0da8-ce5f-4edc-9467-084b1d94728d@etictelecom.com>
References: <d51a0da8-ce5f-4edc-9467-084b1d94728d@etictelecom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698857774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fCyWAWCZGDaAvGAY2gYRCdhOHRhFrqHPMFLQPkDcncE=;
 b=e1YVRy4gkS7OXWKyxCrjP6WAsHOXsJkJpSGgeA7C2j2YkQ08Pc0ic/om6eONZ+fOwt7Acm
 AynxoU1GOP9HWPCD9iVqS7L09GWX06tCq9GojYz6wNodQt4Zcq+s5MAoaJGyHAGx3WVMT3
 yTZ3wQIhR3h9xAOe0gyGhX5QFDFNMXw3u5KHD90yJOP9t4eKPMvlDs9+KD2RNNN+BXsHRH
 EHuSS4wcIezwLpN4tQDmXRa1DTfNOwJod1KNWoDc93+vZOQS/0dbo/D23on9zX6iawUmEG
 bdmr31TCV9vrYNzpXD97pB0SqpNchKVIwLC/jnKuqCkvBatyfwHPP3ZsPhQ7FQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=e1YVRy4g
Subject: Re: [Buildroot] [PATCH] package/openldap: bump version to 2.5.16
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

Hello Hmaied

On Mon, 23 Oct 2023 17:32:29 +0200
Hmaied Ben Abdellatif <hmaied.benabdellatif@etictelecom.com> wrote:

>  From 45fa861afacd95367e716e21f3987dbbe865cf74 Mon Sep 17 00:00:00 2001
> From: Hmaied Ben Abdellatif <hmaied.benabdellatif@etictelecom.com>
> Date: Mon, 23 Oct 2023 16:53:01 +0200
> Subject: [PATCH] package/openldap: bump version to 2.5.16
> 
> Signed-off-by: Hmaied Ben Abdellatif <hmaied.benabdellatif@etictelecom.com>

Thanks for your patch. However, it looks like you have done "git
format-patch", and then send the contents of that file with your
regular e-mail client (Thunderbird). Due to this, the patch is badly
line-wrapped, and it cannot be applied.

Could you instead follow the instructions at
https://buildroot.org/downloads/manual/manual.html#submitting-patches
and use "git send-email" to submit your patch? This will ensure it
arrives properly formatted on the mailing list.

> +Initially-Signed by "Yann E. MORIN" <yann.morin.1998@free.fr> fixed for
> +openldap-2.5.16

Don't do this. Instead, keep the Signed-off-by from Yann E. Morin, and
add yours below Yann's Signed-off-by. Of course, this only makes sense
if you did some substantial changes to this patch. If you did only some
minor updates to ensure it applies against the new version of openldap,
adding your Signed-off-by within this patch is not even needed.

Could you fix those two issues and submitted an updated patch?

Thanks a lot!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
