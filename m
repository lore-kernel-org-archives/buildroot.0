Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913A6EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 21:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4226F417B4;
	Tue, 18 Jul 2023 21:27:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4226F417B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id idnB1kdwYlMI; Tue, 18 Jul 2023 21:27:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40853417A9;
	Tue, 18 Jul 2023 21:27:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40853417A9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 385941BF350
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EEBB81F8D
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:27:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EEBB81F8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eDeME4B_ZZME for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 21:27:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21A9381F7F
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21A9381F7F
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 21:27:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E585FF806;
 Tue, 18 Jul 2023 21:27:23 +0000 (UTC)
Date: Tue, 18 Jul 2023 23:27:21 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230718232721.7b091086@windsurf>
In-Reply-To: <20230716085413.3684644-1-bernd@kuhls.net>
References: <20230716085413.3684644-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689715643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KXBOrtHDNzU9rD0tR2vStkHxheQk2c/P6Q4hJYVYoOI=;
 b=MKzNUsrHylu6Y8J7Wg9IoaB0oh4hYIPPeCwb9easfryxxzpdW3bmZvJjIGkiM+ifD6hOsj
 G9V6sC/lAnhlvh2HasX9rdiN2111RUOEJcFM84r1t3u/Gc/lQrWtPMAM/RuTkl5I6bsNZz
 iKjPdUAdvXZzb7pqj6t5+8n8T0b5lFuliyOpr2sbH8kTePecDkabM5d7E3reDid47OGfUQ
 fSWF0W37KVYkR26o/zkhoAiVCLgVcZzynUXtz9f2Ezg0+lfc0Gi35CJjD3EgZxdaL5+Th4
 Oe1mGIlNZ4KZnijJNJwWW3CRLj5lWCBsq8tT1vgouRFQ0FXmQlpH4IVRI2wXhw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MKzNUsrH
Subject: Re: [Buildroot] [PATCH 1/1] package/vulkan-headers: bump version to
 1.3.257
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

On Sun, 16 Jul 2023 10:54:13 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/vulkan-headers/vulkan-headers.hash | 2 +-
>  package/vulkan-headers/vulkan-headers.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
