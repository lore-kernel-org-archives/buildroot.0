Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E17C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 22:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B96F840A66;
	Tue,  2 Jan 2024 22:11:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B96F840A66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tRVd9TkgM_nV; Tue,  2 Jan 2024 22:11:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C284A40A76;
	Tue,  2 Jan 2024 22:11:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C284A40A76
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 403BB1BF276
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17BA740A5E
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:10:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17BA740A5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kW94yCK1Eae7 for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 22:10:34 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F27E4404C1
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 22:10:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F27E4404C1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5697240003;
 Tue,  2 Jan 2024 22:10:31 +0000 (UTC)
Date: Tue, 2 Jan 2024 23:10:30 +0100
To: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Message-ID: <20240102231030.5569546d@windsurf>
In-Reply-To: <20240102093427.1189491-1-fido_max@inbox.ru>
References: <20240102093427.1189491-1-fido_max@inbox.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704233431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iDfJ0c7jT5XbB6XVQLKVrhTXoVMEToCHwVIrjViuAVo=;
 b=QBwziIhEGkVvA5F45CJAsui3PCjqIdRPA5+rZhYZOVPUZW6WDUrJ2LX6v72aOmqf0u37hl
 K5a0mQlYbYdm9PIRWk1Y/pHNv3vmqgf2to4kR/w6PYXE1juvjrFxogC2LGL+s24Mwhh1Wr
 Gi2ayV5ZcsMCK82SfJTIFoZ3xGfhGEjUZMANggliIg/RtoY0uGfuCcaI0djtx2YfoO6WNV
 /SjfciEWopdvhzjRDeL1kyvG3XBJ7ngrvF84QOvEsktUE0wrDXeoKrOeW37czZGHyWlzj5
 vsZfcMgds+iaSNrnI+4v6IGVx6+y7n6HBAKsD/MHcf8wtylY7BOb2hXqxNGitg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QBwziIhE
Subject: Re: [Buildroot] [PATCH v2 1/2] package/postgresql: add ICU support
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  2 Jan 2024 12:34:26 +0300
Maxim Kochetkov via buildroot <buildroot@buildroot.org> wrote:

> PostgreSQL has optional ICU support. So enable it if library are available.
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/postgresql/postgresql.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Both applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
