Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9F4C433FE
	for <buildroot@archiver.kernel.org>; Sun,  2 Oct 2022 10:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFCA7828B3;
	Sun,  2 Oct 2022 10:06:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFCA7828B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jrG8HyqsVNdE; Sun,  2 Oct 2022 10:06:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A46A82893;
	Sun,  2 Oct 2022 10:06:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A46A82893
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E13721BF3FD
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 10:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A358341061
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 10:06:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A358341061
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pyWVSaauVbfv for <buildroot@lists.busybox.net>;
 Sun,  2 Oct 2022 10:06:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1ECB840A01
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1ECB840A01
 for <buildroot@buildroot.org>; Sun,  2 Oct 2022 10:06:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F0BB740005;
 Sun,  2 Oct 2022 10:06:18 +0000 (UTC)
Date: Sun, 2 Oct 2022 12:06:18 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20221002120618.70631fe4@windsurf>
In-Reply-To: <20221001213928.6B43A86743@busybox.osuosl.org>
References: <20221001213928.6B43A86743@busybox.osuosl.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664705179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K+XKVutmw/nIvoBuzJcYPcWOzj8dktVk6KyEJMYpVHI=;
 b=SXKvWyTxiOOQrIsEu4SIjaBFetPT1Vg4JGIWEzpeqMA5kYXr1qWHyFXxqetQxLY0fyC9lk
 uSXI8Cgxh3Y5DdRRwgWMyS5n7HxlQoDTInA3GV58nd0JHIxcaiFDngWqSyf6YWogKhJT1F
 MJildZaF7Nl0krDgvaVWQ8P5jFk5SwySr+3+EcNbWr0hKEYxzZ9gokjROY4iyh00C02013
 FNURrKl8ygX5yAGpUX2ld0wah7c00v2Yq1J/f5bL0g2Chcpu/FHkDtPtD/FDLhyXBeX7nM
 mMJOBtaK8daF0jF0ZHFMAlPwZFrpOEFjklgk6t6fn48GS4NeFK5Mnk8//7/Hug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SXKvWyTx
Subject: Re: [Buildroot] [git commit] package/volk: fix licensing information
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

On Sat, 1 Oct 2022 23:35:46 +0200
Yann E. MORIN <yann.morin.1998@free.fr> wrote:

> +VOLK_LICENSE = GPL-3.0+ LGPL-3.0+

License list should be comma-separated, not space-separated.

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
