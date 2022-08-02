Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1C3C00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 21:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFCF681364;
	Tue,  2 Aug 2022 21:18:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFCF681364
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D-uIGRki6o21; Tue,  2 Aug 2022 21:18:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 091CB80EE1;
	Tue,  2 Aug 2022 21:18:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 091CB80EE1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B3FA51BF28F
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 21:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72B80606E6
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 21:18:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72B80606E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tRt7KbVjI_M7 for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 21:18:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 013BF606DC
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 013BF606DC
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 21:18:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C123F1BF203;
 Tue,  2 Aug 2022 21:18:30 +0000 (UTC)
Date: Tue, 2 Aug 2022 23:18:29 +0200
To: Sen Hastings <sen@phobosdpl.com>
Message-ID: <20220802231829.06c57479@windsurf>
In-Reply-To: <8083b9ea-a0e4-6682-b43f-65a5ad0d2737@phobosdpl.com>
References: <76c8fcd6-d477-7cbe-dcc5-b382d65f3498@phobosdpl.com>
 <8083b9ea-a0e4-6682-b43f-65a5ad0d2737@phobosdpl.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659475111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JjwtVVU4lYbaJeR4BilAUe/JOy31XAZdqc4oO3r/ZGY=;
 b=UrrZtomi5PWxw4G1YNdoZzW24PqXhrsMeydFOh11N9VLiYvJtk3pMjIn4Td0LPlKSxWTMS
 QeL8lGqDth1BTbVwU++W/6uxbQWv2ajTdbKhZa34MFehKtdp3qj0AugrAn6N+ZrWuIi/wV
 46HNXO13dezwn2rIKURBtsZCjLjL8aNQDsBIlL26co4cQs8BFhvViSHeBc8gE5Uwo1IfW/
 UAG8fLOg8Hjm3Bv9tcgXfBRe6VrHs65e+cAvmaio2oW5iv2GheZcxIhSF7SdNV8IdY3KqV
 SNhD4SFezCeGuwub/7pGcoouW5t5i5tONcMeS0zI/Ara5PCSrPzaasXiNw8Rgw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UrrZtomi
Subject: Re: [Buildroot] [PATCH 2/3] support/scripts/pkg-stats: adjust
 column widths
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

On Tue, 2 Aug 2022 14:47:08 -0500
Sen Hastings <sen@phobosdpl.com> wrote:

> Yeah, I noticed that even with the older sortable based versions of
> pkg-stats.html. It appears to be caused by the extremely long formatted
> string binding WFN for ssdp-responder:
> 
> "cpe:2.3:a:simple_service_discovery_protocol_responder_project:simple_service_discovery_protocol_responder:1.8:*:*:*:*:*:*:*"
> 
> In order to get that cell narrower we would need to either do line
> wrapping or horizontal scrolling. As an example for line wrapping,
> the <wbr> element could be inserted between vendor and product.
> 
> something like:
> <code>cpe:2.3:part:vendor<wbr>product:version:update:edition:language:sw_edition:target_sw:target_hw:other</code>
> 
> The good news is that this does not actually introduce any new
> characters (newline or otherwise) into the rendered text.

Wow, I didn't know about <wbr>. Seems like the right thing to do,
indeed!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
