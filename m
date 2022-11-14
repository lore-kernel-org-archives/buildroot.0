Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9C2C433FE
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 21:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB64C402B1;
	Mon, 14 Nov 2022 21:14:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB64C402B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZeGLQpJKvN3Y; Mon, 14 Nov 2022 21:14:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E165A4031E;
	Mon, 14 Nov 2022 21:14:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E165A4031E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E275B1BF296
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 21:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD4FE402B1
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 21:14:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD4FE402B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aM0_o6mt9t6X for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 21:14:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1B20400F8
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1B20400F8
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 21:14:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BE685E0006;
 Mon, 14 Nov 2022 21:14:43 +0000 (UTC)
Date: Mon, 14 Nov 2022 22:14:42 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221114221442.35b5f019@windsurf>
In-Reply-To: <20221012183907.1651460-1-james.hilliard1@gmail.com>
References: <20221012183907.1651460-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668460484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wXUu0TVlfZ9KP7oWAWSPLbyAIkRq4HeL5PgHTrWYN1k=;
 b=lhJ6sCHGmfr8D0ZwGML4Tu7Bvt33ywfoLfyte+bQCL0qM5o9h4dQHMzjtrVh/kBnS/wNY5
 qABXqIaPvP8slrRci3FhtTofMMH36QRzA6WSnYXULVoVAIjiPx+BIg2PaCWKEIFeesB4XZ
 xDZ088fdMd8AT/rzWmDeovtpSFHMdMp/gGKYxU/V9NZNfrEAkCZtYnN3V7ve30B1z30wTj
 X2AcVeDnnrOxK1gwYiFQgqbiizKuiIFubVSAaQ30kQq1L9S1R1/NMOftosmPO98EgJcTNx
 dRZd/8IVSSkG3EZHyBkl74orVZ3Uvud25Kmg8RALLl1qJ5HU8lOB6gDa00Y3hg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lhJ6sCHG
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: bump to version
 20221012
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 12 Oct 2022 12:39:07 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Update brcmfmac4356-sdio.vamrs,rock960.txt filename to
> brcmfmac4356-sdio.AP6356S.txt due to rename:
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/brcm?id=4ffcf980a535c1f26aa994ecf64a1b9d1ed6216e
> 
> Update WHENCE file hash due to date/firmware file updates.
> 
> Add missing LICENSE.ice_enhanced and LICENCE.moxa hashes.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/linux-firmware/linux-firmware.hash | 6 ++++--
>  package/linux-firmware/linux-firmware.mk   | 4 ++--
>  2 files changed, 6 insertions(+), 4 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
