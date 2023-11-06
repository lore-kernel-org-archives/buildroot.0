Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FFAC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DFEE421F3;
	Mon,  6 Nov 2023 22:31:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DFEE421F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HPlA-Rovo3yL; Mon,  6 Nov 2023 22:31:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71124421BC;
	Mon,  6 Nov 2023 22:31:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71124421BC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A6D351BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4CD6612CA
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:25:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4CD6612CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o_nKN0xr1Vbu for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:25:59 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C95DE612C6
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:25:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C95DE612C6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 395CD60007;
 Mon,  6 Nov 2023 22:25:57 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:23:27 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106232327.47c2d4ad@windsurf>
In-Reply-To: <20231105080534.2895735-1-james.hilliard1@gmail.com>
References: <20231105080534.2895735-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699309557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zSdnNKMSgBtw8BpAyedhU1HssHWF5cEoe33CzE0ktQg=;
 b=G7xjQkSKfmgWMeykFuFTFNL0HcCnVfEm8GNvm1DWME6GiPe1VnhUUF6Amtk+osVFxND8CL
 6FwvqCuDwZGg+iq+4hAg5onmccy6wM/GxQlvwuEwKx4t+e7H3rN0r+VRYPcyU9eHvWGfzI
 MGYInsKlN/CMlP6T4tIkZV8aXqtDTlNrwU/lDdU12AUhAFktKz/xGzPHYVm2T44ttVexOg
 qT4JSpk5Wz9JxIEGrSTl+ggEMLAeDe+1fmmpelzpyO5PDjIdK10eQxfYGidNH4XfpWe7JL
 b7MpYcYfbz7bJpdu6KlUTWgsLPIjrzTBzh1btS2VoY7FKRboabQ5+7E5chGlYw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=G7xjQkSK
Subject: Re: [Buildroot] [PATCH 1/1] package/python-jaraco-classes: bump to
 version 3.3.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  5 Nov 2023 01:05:34 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop no longer required python-six runtime dependency.
> 
> Add new python-more-itertools runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-jaraco-classes/Config.in                  | 2 +-
>  package/python-jaraco-classes/python-jaraco-classes.hash | 6 +++---
>  package/python-jaraco-classes/python-jaraco-classes.mk   | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)

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
