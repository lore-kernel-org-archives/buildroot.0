Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9042C433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 13:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AB0840242;
	Wed, 23 Nov 2022 13:31:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AB0840242
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uM-9Quz0BkGP; Wed, 23 Nov 2022 13:31:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A09CF400DB;
	Wed, 23 Nov 2022 13:31:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A09CF400DB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 47EE01BF95D
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 13:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BEBA81EA2
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 13:31:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BEBA81EA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GdPt5N_eFiW3 for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 13:31:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDC5481E9F
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EDC5481E9F
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 13:31:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 14CBD60007;
 Wed, 23 Nov 2022 13:31:41 +0000 (UTC)
Date: Wed, 23 Nov 2022 14:31:40 +0100
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20221123143140.004746c3@windsurf>
In-Reply-To: <CH2PR12MB500483D91AC77B29445F4B1EF00C9@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221122053611.44757-1-neal.frager@amd.com>
 <20221122100124.3a441eb7@booty>
 <CH2PR12MB5004DF92B82E671197A06306F00D9@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20221122171315.7a749d61@windsurf> <20221122190743.2610e8e9@booty>
 <20221122214713.1359fcac@windsurf> <20221122223125.33045c23@booty>
 <CH2PR12MB500483D91AC77B29445F4B1EF00C9@CH2PR12MB5004.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669210303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DRTjIrPvzS1WHwMkeEkSwC7wqcxRzo6JNAETRZEdgC8=;
 b=a74mqbOlHJqqg5F7RQ9KW1YtTJYTLJGPVatEaSmTG6wXajt9/aBRh512p4p0/gsiBltmLH
 9EwB+y4Xb/YWrspBHATqh7jkeJjhK+UB+v466huqDxRUlabMgTvggoK1SSIOUUdoxjNsQN
 QlqRcDSGsVmcTlwoJtmfKwio4278L9Sw6WDG8l1oWEASJeCO8b2saob0QmmN9Himb7xVvh
 2FAnqFQrxDEETEHIg3N4PgwjFyC/TCxrF0anLm23VYVs5ycNroH5mjGM6Wb49K1K63GX0u
 4GV4UkhnPVYJHfq4YdtZAMimo+m/ikZnfjAS6+qmauwsewxpXpXPC03G1Cwncg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=a74mqbOl
Subject: Re: [Buildroot] [PATCH v2 1/1] boot/uboot/uboot.mk: add stripped
 u-boot.elf support
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, "Frager,
 Neal via buildroot" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Wed, 23 Nov 2022 00:09:39 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> I am not sure creating a separate BR2 config is the right solution.
> Both the u-boot and u-boot.elf file are in fact elf formatted files.
> One just has all the debug symbols and one does not.

I don't understand why you think having a separate option is a problem.
We already have separate options for each file that can be installed by
U-Boot. Adding another option for another file is completely logical,
and actually much more logical than having a weird option that
magically installs 2 files - sometimes.

> What do you think of this solution?  Basically, we check that the
> file exists before copying.  It is probably good to have this check
> anyway.

Checks like this are actually not great, because you expect something
to happen, there is no error, but the thing you were expecting did not
happen. Clearly confusing for the user.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
