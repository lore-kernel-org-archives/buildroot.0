Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E86CD3A667
	for <buildroot@archiver.kernel.org>; Wed, 30 Oct 2024 09:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C13CA40612;
	Wed, 30 Oct 2024 09:14:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N6GTTFFjwaq2; Wed, 30 Oct 2024 09:14:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A356A404D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A356A404D7;
	Wed, 30 Oct 2024 09:14:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EB45A5E50
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 09:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5E19404D7
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 09:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k46nnyX7-Sxj for <buildroot@buildroot.org>;
 Wed, 30 Oct 2024 09:14:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ADB7C403DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADB7C403DC
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ADB7C403DC
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 09:14:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32294E0004;
 Wed, 30 Oct 2024 09:14:35 +0000 (UTC)
Date: Wed, 30 Oct 2024 10:14:34 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com, Colin
 Percival <cperciva@freebsd.org>
Message-ID: <20241030101434.04cac1a4@windsurf>
In-Reply-To: <CABGWkvoeja1ZA_iha5TeOK0vfQ5JiqKWHjk5pEn+=Ky2Ku7oTw@mail.gmail.com>
References: <20241004215451.1198861-1-dario.binacchi@amarulasolutions.com>
 <20241004215451.1198861-2-dario.binacchi@amarulasolutions.com>
 <20241024223133.1069cd60@windsurf>
 <CABGWkvoeja1ZA_iha5TeOK0vfQ5JiqKWHjk5pEn+=Ky2Ku7oTw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730279676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rhY2FhjQPYX8357qKiQ8ioqj2OQ9C7lX1Dag6Xb0zZI=;
 b=EH85y5skGr4BjgSJi0kwTLu0gA6vJb2AMkfx52BAwjlwSt1aqwkf9UIXsC+DKvRzG7EATf
 jTFPOCBFAdJrOzYQugMBHgAuHnlk8XOfNTIG0IfCdX+TusF41+E3LVVM/ZMdmnh2LlqadZ
 2xU9EDVkPo1oi9ztjX5tYHHWktAaW9SOLs7JbU/abN1/ij2ASXuPbh3WjiJEo2Mh0/vN8H
 hEwDs66QuI9+Je5aDq/qQXl0PuEEwMzIGaocCfBF61QA+J7Gr5crVJo/7nXAkQhRPnbRC5
 iCX0IV6G5SgXmv6FEkVNmSNBfPHjk8Z47tGtBXhtW0LlihVmF/vlCDCk3cfXfw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EH85y5sk
Subject: Re: [Buildroot] [PATCH 2/3] package/bsdiff: switch upstream
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 30 Oct 2024 10:06:42 +0100
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Otherwise, would it be better to remove the package from buildroot?

Yes, that was the feedback also from Arnout yesterday: let's remove
bsdiff entirely. It has no upstream, it's no longer maintained, so
let's drop it.

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
