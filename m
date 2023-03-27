Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20122C7619A
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 12:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FF3E414D1;
	Mon, 27 Mar 2023 12:57:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FF3E414D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cXunfkG_PeIb; Mon, 27 Mar 2023 12:57:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90BDA410A7;
	Mon, 27 Mar 2023 12:57:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90BDA410A7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 825371BF34A
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 12:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FC9661025
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 12:57:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FC9661025
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 29_2JhVCzQ1c for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 12:57:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAFD360A9E
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AAFD360A9E
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 12:57:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 056191BF212;
 Mon, 27 Mar 2023 12:57:40 +0000 (UTC)
Date: Mon, 27 Mar 2023 14:57:40 +0200
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20230327145740.3888d7d5@windsurf>
In-Reply-To: <CH2PR12MB5004F4F2E8E3C96893712B8DF08B9@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20230326140949.11262-1-neal.frager@amd.com>
 <20230326220543.057f381d@windsurf>
 <CH2PR12MB50044744141F901308BAAF8AF08B9@CH2PR12MB5004.namprd12.prod.outlook.com>
 <MN0PR12MB60041E824606160DF5277406A08B9@MN0PR12MB6004.namprd12.prod.outlook.com>
 <CH2PR12MB5004F4F2E8E3C96893712B8DF08B9@CH2PR12MB5004.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679921861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=De/1HwYKxXEWj9u2D0A7sPMFfxq42R7BGYm0N8RvXhE=;
 b=f2AFoebg7OTSFP/5dmzdJumVNC58dcEbLWWZi5arFq7WXmW7OXvXMW4yDDdx7/T/Yiqbyx
 5h51uEIH7H09ZRGjkmt5Q7lH6p6FImlZGmROD22phq3I0kgT517RLsKAq1sMoXl5rmd1xD
 CuCffRYyS+cpheiUSUIz3UQlqfHpuglke+0cTFOnGitloGB2nwbTiQKmSpjHGxjOpHmS0Z
 pBEOdGRN85sL8uf5GY0RE3s2fuVB0YpccKED7H9wdT3O6JNJDMpLfQFZQl2Q/iwZV1Ekks
 5jGZzspK605srhcVLNAEyjfgE/t6NXymFmAafi+Cqc0TiALXXNiP68xrUzWlNw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=f2AFoebg
Subject: Re: [Buildroot] [PATCH v1 1/2] package/zynqmp-firmware: new package
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
Cc: "Simek, Michal" <michal.simek@amd.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 27 Mar 2023 12:47:47 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> It fails just with replacing "make" with "$(MAKE)".  Do you have an idea already about what would need to be fixed?

Use $(MAKE1) instead of $(MAKE) then. It smells like Xilinx Makefiles
do not handle well parallel build.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
