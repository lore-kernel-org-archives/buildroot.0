Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A5EC433FE
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 14:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA86440575;
	Sun, 13 Nov 2022 14:30:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA86440575
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WwjUdFq_xSUF; Sun, 13 Nov 2022 14:30:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B64240165;
	Sun, 13 Nov 2022 14:30:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B64240165
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F8A81BF2CE
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 14:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1B2340165
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 14:30:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1B2340165
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yBfa1q_reTFl for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 14:30:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C12DC40017
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C12DC40017
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 14:30:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 886A6240003;
 Sun, 13 Nov 2022 14:30:13 +0000 (UTC)
Date: Sun, 13 Nov 2022 15:30:11 +0100
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20221113153011.38f22043@windsurf>
In-Reply-To: <0C68589E-3CD4-45B3-9664-016BB50D510B@amd.com>
References: <20220506191229.6154E85C61@busybox.osuosl.org>
 <20221111214345.419477ef@windsurf>
 <0C68589E-3CD4-45B3-9664-016BB50D510B@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668349814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3S3qydrwkVjgsqVyhRcZQL8obY7d6SOogJqmN7PLsKg=;
 b=aNObhF7Xah9zNH0aRmzYhrrCl46zRPSQfgZXIzCSdIhK3mZ44mkJ8F90hxDwhvG+mIFIAA
 rfNYHT76+s45pi5BP44RESKfLF1LnUlq1sXdwGmHrZ2Qj17hoa8Mdh9JfmmluAcaV63G8T
 H3DKCRKbCkuWZssOGnSoUtKliWf4arN3vfATJQ8kI3tfI6ytmj7ENvw7RwI0Vg2EIZNygk
 sJ5RsWdpJ9S4+/46auN22Sv2mqkmE8sziVuO1BDqquuhhM67k66mLvEFj5ts4WgVPl88B4
 pOxgR6ApdgbsY8SrFFV7eRl3kr81uUPXx3iolkpVtxnjiUTiF371nPh/gl4cKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aNObhF7X
Subject: Re: [Buildroot] [git commit] add configs/zynqmp_kria_kv260_defconfig
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 12 Nov 2022 07:57:48 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> If not solved by then, I can look at it when I am back on Monday.

No worries, it can wait until Monday, for sure!

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
