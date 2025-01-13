Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7213CC02180
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 21:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D62860AA8;
	Mon, 13 Jan 2025 21:22:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wgG6yS3fdq12; Mon, 13 Jan 2025 21:22:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23EB860AD2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23EB860AD2;
	Mon, 13 Jan 2025 21:22:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DBE7495D
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 21:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4701410E4
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 21:22:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qP8c2MD4UUb6 for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 21:22:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 886C7410AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 886C7410AE
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 886C7410AE
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 21:22:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 613FD240003;
 Mon, 13 Jan 2025 21:22:24 +0000 (UTC)
Date: Mon, 13 Jan 2025 22:22:23 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20250113222223.7e909bca@windsurf>
In-Reply-To: <c8ac2b3f-4652-4764-a302-c518bd0f1696@gmx.de>
References: <20250113200454.3108562-1-fiona.klute@gmx.de>
 <20250113200454.3108562-4-fiona.klute@gmx.de>
 <20250113213003.0b2ef4ec@windsurf>
 <c8ac2b3f-4652-4764-a302-c518bd0f1696@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736803345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lOdyD0j/t+JAUorT5u0dvPYwqF4dYBcoN/TTND8osyo=;
 b=RYqWBltK9/vbsUU/7sfg9fejVG+sMknxh9g+vGlZCPaChwnfcLDAwOk+uVwCcO3nxtNu4k
 rXyqdbBCE47NbawJmfEnRx8ZLvKWPXJngN1ZSTisEw/Q0jHRcd3TsRlh+aKW0mdCq+4Qgl
 WD/jI85lLfAtb8oxO4yTaMFhhIBgPpNB+qnfNCIrFtLEZDeNnLsXX77DnPlvg5sAxAGo+v
 WRw0GB4K7VBrTH659xaTyf9tmGhbtK1stGQzO/XboVijIN0B5JwBvX0BFBR+jjU++ZNuTw
 zEupbIk9UMmgx+5G2itVAe2mq92t+oF6n5dxvBDsMcMS9M99vQXAbFCnj1nf9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RYqWBltK
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

On Mon, 13 Jan 2025 21:58:49 +0100
Fiona Klute <fiona.klute@gmx.de> wrote:

> > Is this change thanks to the bump of python-gobject to 3.50.0, or
> > related to the previous patch? I'm trying to figure out if this
> > dependency change has anything to do with the version bump.  
> 
> This part is related to the previous patch. python-gobject requires GOI,
> and if that works with musl python-gobject will, too.

So the enabling of python-gobject for musl toolchains is independent
from the version bump of python-gobject?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
