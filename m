Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F096DC02180
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 22:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 739FB405B3;
	Mon, 13 Jan 2025 22:17:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HVa-o6AreS1V; Mon, 13 Jan 2025 22:16:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1D8C40596
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1D8C40596;
	Mon, 13 Jan 2025 22:16:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 85E6C940
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 22:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C4C680D25
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 22:16:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EHqBmGPyKZGQ for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 22:16:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D334280A82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D334280A82
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D334280A82
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 22:16:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B5F3E0002;
 Mon, 13 Jan 2025 22:16:50 +0000 (UTC)
Date: Mon, 13 Jan 2025 23:16:49 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20250113231649.5db874bd@windsurf>
In-Reply-To: <f73b2857-8857-46df-a182-697731146196@gmx.de>
References: <20250113200454.3108562-1-fiona.klute@gmx.de>
 <20250113200454.3108562-4-fiona.klute@gmx.de>
 <20250113213003.0b2ef4ec@windsurf>
 <c8ac2b3f-4652-4764-a302-c518bd0f1696@gmx.de>
 <20250113222223.7e909bca@windsurf>
 <f73b2857-8857-46df-a182-697731146196@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736806611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6K7JHAmJXrf0UYmIcdXrb4pRHt6Za7WcEpkDJzz+M68=;
 b=bTJ42LTvuw9jYSPRHo5nblBwO1gPopXum6oK4T3X38sO+aAwCHn12qmG+jkrRQMjFyANw5
 ZurstPq4A3J+CSiqnwbtUWqlYlVQ4p2t/jsGZey81kmKFzpyZSSpCzYOyA0MRqRg8wuYXB
 pSZgoGB6H7dOWPpe+3hYfPBJv31OT5l7ODmMhsNEbTLF8ZUgX619JODvcFTRbnFrVp0N9S
 PjTiyUjTP9o413MJFDUVbj3/H6ijwdFfQ8tvhYGyM4jP38hqNS8sOKWbMXtHJKE8lLWv9E
 2g2OrIy17qOvHF1fm48kyFKW+npttO2qgaQH6SsKH5BNpjebjNMVqCz/QPkZYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bTJ42LTv
Subject: Re: [Buildroot] [PATCH v7 3/5] package/python-gobject: bump to
 version 3.50.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 13 Jan 2025 22:40:00 +0100
Fiona Klute <fiona.klute@gmx.de> wrote:

> It should be, yes. Alpine hasn't had any compatibility for the currently
> packaged version (3.42.2) and newer.
> 
> Should I split the commit in that case?

I'm of course being a bit pedantic, but yes. If it's independent from
the bump, the patches should be independent as well, at least ideally.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
