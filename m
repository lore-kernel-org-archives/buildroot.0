Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7CCC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 18:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B95E84CC5;
	Wed,  1 Nov 2023 18:15:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B95E84CC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id igFtsRA9NLLM; Wed,  1 Nov 2023 18:15:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A98B782327;
	Wed,  1 Nov 2023 18:15:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A98B782327
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 873621BF59F
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 18:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6098D84CB3
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 18:15:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6098D84CB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bJM62Emyga2f for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 18:15:29 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8C0D84C4E
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 18:15:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8C0D84C4E
Received: by mail.gandi.net (Postfix) with ESMTPSA id B5AD71BF205;
 Wed,  1 Nov 2023 18:15:26 +0000 (UTC)
Date: Wed, 1 Nov 2023 19:15:25 +0100
To: Jan Havran <havran.jan@email.cz>
Message-ID: <20231101191525.53792793@windsurf>
In-Reply-To: <ZT_92cB-gzyB56Kf@arch-zen.localdomain>
References: <ZT_92cB-gzyB56Kf@arch-zen.localdomain>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698862526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yTLgKzeBds/HMQ5osG5msqYzDhkNMY298kTIYdVX8YE=;
 b=QAnHl4ONv5CcKTlyXEEUHV0cqCPvla7tTiMkvYe0XrJ1tI29fXtg42vtxutKjXQR9W0epN
 q7SMLgwXb8cGwkNYvsSZzXuFfMr0c2IuhuJazPEBNSl305OcKNP680eLvIFrAWaVlGbWvB
 IW9Hu52oTc/PELvBJ149VafcHeVLDHFRDXMhYalXixxDgjlnmLM1cZ0fXyziW5MoK9Cl7q
 Dg8ABzzEzZgHOmkUUTtVIDei105hzITXAQfXLD7i+mqJYxD9HtjZL/qpiLsDiZEr0f0zlL
 uzEnJ3zFHNoSCEX/RsJe3oXD7olqd+Sji4uLzTex3/KbE0gOcjoU9ZgTXa6Wsg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QAnHl4ON
Subject: Re: [Buildroot] [PATCH 1/1] configs/pine64_pinecube_defconfig: bump
 to Linux 6.1.60 and U-Boot 2023.10
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

On Mon, 30 Oct 2023 20:02:49 +0100
Jan Havran <havran.jan@email.cz> wrote:

> Signed-off-by: Jan Havran <havran.jan@email.cz>
> ---
>  configs/pine64_pinecube_defconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

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
