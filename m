Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD721C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 14:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79F5A828B5;
	Wed, 23 Feb 2022 14:51:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3tAFYPlXZcwk; Wed, 23 Feb 2022 14:51:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAEA9827A9;
	Wed, 23 Feb 2022 14:51:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 254FE1BF3DD
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 14:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1257B4039D
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 14:51:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hgP1_iwp3z6o for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 14:51:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A2F4A400CD
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 14:51:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2E75BFF80B;
 Wed, 23 Feb 2022 14:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1645627902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jegVpKc1Dt9u88VYkx3CHlurX7FL7an8mUiMQxvqhpM=;
 b=JttDgGr7g75phAOE1Skb6B1AnDBAqGpb0zGHRKveNt+cABms0YInaVDQ5EnrnhDxg6hv8O
 gebeRYgSfhYbT+tUzMG7malHF6j+3THpJ+k0FFvPnF5J6+5aDOIqNZ7Ui5gu4Zq/gesYH8
 LSXTX0aU0F34mUGRzQplOep1WBLqlqHb5kVEKsogsbr/BXJ5ca2di/uNik89zdYdEa8HFh
 l/i/HvLTvKnRHeOkB3fZMD9dRHcCYYDfKktG7CnGH6wffwW/xgePoxfjAQVY5aWWQpQmWI
 7oy6YNEdk2HPO+i0kJdDcyMt/C++Wg/6zNj9jIhaYulsWMVEtLAFG+k2pOp+jg==
Date: Wed, 23 Feb 2022 15:51:41 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220223155141.0223462b@windsurf>
In-Reply-To: <20220223142731.GA189337@scaer>
References: <20220223115506.1191031-1-john@metanate.com>
 <20220223142731.GA189337@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [RFC PATCH] package/libiberty: use the same version
 as binutils
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
Cc: John Keeping <john@metanate.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 23 Feb 2022 15:27:31 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Although this works, this is by pure chance: binutils is included before
> libiberty, so BINUTILS_VERSION is defined. But we try and avoid such a
> situation, unless we explicitly guarantee the include ordering (eg. gcc,
> fftw, util-linux, or previously, qt5).
> 
> Instead, in such a case, we prefer that the version strin is duplicated,
> and a comment added above to note that both shoujld be updated in sync.
> See for example bluez5_utils and bluez5_utils-headers, mesa3d and
> mesa3d-headers.

libiberty/binutils is different than mesa3d or bluez5_utils, as the
version is user-selectable, or even different depending on the selected
CPU architecture.

So we would have to replicate all the version selection logic (like we
admittedly do for linux vs. linux-headers).

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
