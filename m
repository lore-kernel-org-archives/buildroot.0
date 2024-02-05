Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5290BC48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E701417F7;
	Mon,  5 Feb 2024 10:37:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E701417F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ccCog4EIBLuw; Mon,  5 Feb 2024 10:37:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40027417A1;
	Mon,  5 Feb 2024 10:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40027417A1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 177DA1BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE84540AEE
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:37:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE84540AEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vHUzXGliXeYZ for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:37:40 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 250F840ADD
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:37:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 250F840ADD
Received: by mail.gandi.net (Postfix) with ESMTPSA id F3EA6C0003;
 Mon,  5 Feb 2024 10:37:36 +0000 (UTC)
Date: Mon, 5 Feb 2024 11:37:36 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240205113736.249927a6@windsurf>
In-Reply-To: <20240130110504.559989-1-giulio.benetti@benettiengineering.com>
References: <20240130110504.559989-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707129457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pVQFAWGvnUQ8kcDv2hdYs0oGiu+aa5KY0Z6rb+1IgG8=;
 b=aepQA/yW2K14mFRAkbDQuLjJNoqx9GrOdGGcWlqFlD9hcb5o56X4IKdaJLUXe0G5+ox/5L
 1b/Lt9ADzecPJrlX9JmuR9BHm07H/owKHCCNMkY84eyGtnNRiWqg+am+svm8wOTCgT7Vxx
 C/R244MSSMjqdp0gwiIcmstu80Z1BtNrjQpMFoD3CRxMYx/a3gKEGms1+WAWaQpJqnet5p
 wzj1HnqPkS/cOHYMdvBzv0uhkPybPBv+EzZO7CqoHG265HLlYxtUqvYooqeBKMLHQT6H77
 FJuQX8kZl7ZGE3xdSPJLo2yfiZfv0ykrii4OVpKfsS4fgop+zMF+23BGHf6XCQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aepQA/yW
Subject: Re: [Buildroot] [PATCH v2] package/esp-hosted: bump version to
 2024-01-30
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

On Tue, 30 Jan 2024 12:05:04 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> * support Linux 6.8
> * support ESP32 and ESP32C6 Targets
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * drop local patches since they have been upstreamed
> * update commit log since Linux 6.8 is supported
> ---
>  package/esp-hosted/Config.in       | 14 ++++++++++++++
>  package/esp-hosted/esp-hosted.hash |  2 +-
>  package/esp-hosted/esp-hosted.mk   |  8 +++++++-
>  3 files changed, 22 insertions(+), 2 deletions(-)

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
