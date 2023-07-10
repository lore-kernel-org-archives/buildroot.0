Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F6DEB64DA
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 17:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B82A08203F;
	Mon, 10 Jul 2023 17:30:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B82A08203F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 82GgYA51-ueq; Mon, 10 Jul 2023 17:30:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BCBF8203B;
	Mon, 10 Jul 2023 17:29:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BCBF8203B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9F9531BF3D4
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83EE1409A3
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:29:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83EE1409A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dqK0o1w20ZoE for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 17:29:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DD9840023
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1DD9840023
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 17:29:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B8BC1FF806;
 Mon, 10 Jul 2023 17:29:50 +0000 (UTC)
Date: Mon, 10 Jul 2023 19:29:49 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230710192949.1dac4ce4@windsurf>
In-Reply-To: <20230703202020.1340395-1-giulio.benetti@benettiengineering.com>
References: <20230703202020.1340395-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689010191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t7iEwvhhsXy0FIYfGltErwHpbHRB5QKvIRexvkLpWLI=;
 b=JMeM7PwERhSRMGK6pRjSF899+cPG7viN6NfomoatkBW/W4MmnksJFnTMTGwuKKOE79Un/E
 k/+I1QLS0ZVXgLu8pkVeeSJ7FjBOLSE+BhjoJb9G1rPFQ2z5XlTEV2eGmmDXsnUx3ouA/O
 CBv5+XqLs1RiYbWkvW5d9xaAzfsegb583h24YyYtDph94v2Yy3EskqlE1iOEDzbVvUj2Mb
 4beDBbwA1x1oNtspMMrzjVgFO1sXHj25qVgsdlx92RAMWBAX8xlXB6LbWcA9WePHeMl72h
 8T9El0ftSIH8HOJhpdJL8+6tZ3lEMONjH+1bMvznU8EtCBf9H1hs62iK+GZ6+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JMeM7PwE
Subject: Re: [Buildroot] [PATCH v2] package/rtl8192eu: bump to version
 2023-06-23 on branch 5.11.2.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  3 Jul 2023 22:20:20 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Drop local patch that has been upstreamed.
> It now supports building with Linux version > 6.1
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * merge pending patch with this one since this one is not applicable alone
> ---
>  ...02-Fix-conflicting-get_ra-on-PowerPC.patch | 124 ------------------
>  package/rtl8192eu/rtl8192eu.hash              |   2 +-
>  package/rtl8192eu/rtl8192eu.mk                |   2 +-
>  3 files changed, 2 insertions(+), 126 deletions(-)
>  delete mode 100644 package/rtl8192eu/0002-Fix-conflicting-get_ra-on-PowerPC.patch

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
