Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4EAC636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 11:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD51760E53;
	Tue,  7 Feb 2023 11:08:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD51760E53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eZHZKOHzNe4L; Tue,  7 Feb 2023 11:08:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFF1360E66;
	Tue,  7 Feb 2023 11:08:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFF1360E66
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9E2311BF2AF
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 11:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75F264173F
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 11:08:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75F264173F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KuWzjR7tVO_V for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 11:08:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECCF240893
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ECCF240893
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 11:08:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 21C6F40002;
 Tue,  7 Feb 2023 11:07:58 +0000 (UTC)
Date: Tue, 7 Feb 2023 12:07:57 +0100
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20230207120757.21504741@windsurf>
In-Reply-To: <CH2PR12MB50049CCA64BBFA96DE2553F9F0DB9@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20230127105305.25877-1-neal.frager@amd.com>
 <20230207114321.2b5c2df6@windsurf>
 <CH2PR12MB50049CCA64BBFA96DE2553F9F0DB9@CH2PR12MB5004.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675768078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iqCaE219jv5V3Ir4JhZYJj2vGljtmVKKjdsw5KiFy8E=;
 b=nGyl+ePO59TSFJExVNN+8pwA8qO5cT6ys05Emc3toaPoHj14EHONcM+zy/cHYNRu1eSIJW
 ZF5WjdaPJpGCRlBP28r70HQD6zRTJX+V5fy8Bbh3TyjytNuinhNPeClj+bPov12+tWq+ec
 r+KBdZULpoN9eXuT+Grkl+Sdi4pWZQEhZpsGUoJAF3g4ZAZn6tG+xqFL2SDjzHJos1bVAJ
 7MdcLBSs/AslbLtxARX6BkAuU2KGHm2IVDj2xr757WdtTWmDODhsdyCGrurAPbsa42pMgj
 YgXeS3m9aHGncxMCp7P3IgMN/03VWeFqOy8oor7luTj6xannoajM1t1GnqZacA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nGyl+ePO
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/versal_vck190_defconfig: use
 Xilinx github for versal-firmware
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
Cc: "Simek, Michal" <michal.simek@amd.com>, "Chaplin,
 Kris" <Kris.Chaplin@amd.com>, "O'Neal, Terry" <terry.oneal@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, 7 Feb 2023 10:48:53 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> Yes, I fully agree with you.  We will have a proper firmware repo
> agnostic to ubuntu starting with our 2023.1 release.
> 
> In the meantime, Terry O'Neal implemented this solution as a
> temporary one for 2022.2, so that we could get off of using my
> private github.
> 
> I am confident that our 2023.1 solution will clean this up.

Sounds like a good plan, thanks for the details!

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
