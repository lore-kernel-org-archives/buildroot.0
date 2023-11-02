Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6662C4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 09:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D310C433A0;
	Thu,  2 Nov 2023 09:38:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D310C433A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HSDKPxTkEKH3; Thu,  2 Nov 2023 09:38:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09979433BA;
	Thu,  2 Nov 2023 09:38:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09979433BA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD9C51BF591
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 09:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CD20433B9
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 09:38:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CD20433B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oOmLXz1YEV_R for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 09:38:04 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 959F443394
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 09:38:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 959F443394
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4E7054000A;
 Thu,  2 Nov 2023 09:38:00 +0000 (UTC)
Date: Thu, 2 Nov 2023 10:37:59 +0100
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20231102103759.52e59361@windsurf>
In-Reply-To: <5A1B4380-E6F8-47CD-9118-694D76488877@amd.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
 <20231020114236.4129636-3-neal.frager@amd.com>
 <20231031134317.4ce2349e@windsurf>
 <CH2PR12MB5004C8F27820E2EC98FC5232F0A7A@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20231101125048.01553f76@windsurf>
 <CH2PR12MB50049049609F6BE2EF07D89FF0A7A@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20231101134205.GC114892@scaer>
 <5A1B4380-E6F8-47CD-9118-694D76488877@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698917880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bEez5x6yIgcroWggvXe/i/KuuneS6xBNrSAJF4TCy1o=;
 b=IbSSXhdNHwL/AxTd0HyriLAP4ySsblsEK2DMS/cKfhCn4Z1csUXmma1DpEHdXg6IOmDdyM
 35rhsLnIvcqfl34pipYUsQpaucIJKaifcY7ipz8P9TXOsNM0hohVPPv182NITOdJCGzEQM
 oVCm6nxrCJj7X93mx7sdgdoLfSuCHettYCWZ+HOJCKvYP4mnx82r/LJ6E8q+5RfU6/PDy6
 NmFMiiaS5Ho3VYOfaitC/yx2dh0Ab03QtCgtwoAADZTcEBKJSJWfPL3ZbjJTAvxZ4cD4hQ
 kDNEeDeCQVLh0PNNofIsWGPyYtYFSC+KAsVbjDvw7v4O/0wOy047u3MHDib6WQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IbSSXhdN
Subject: Re: [Buildroot] [PATCH v6 03/10] package/newlib-bare-metal: new
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
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>, "Simek,
 Michal" <michal.simek@amd.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 2 Nov 2023 09:35:35 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> It would be great to get feedback from Thomas as well.

On which specific point do you need feedback from me? On the suggestion
from Yann to use a separate sysroot? Then yes: I agree with Yann.

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
