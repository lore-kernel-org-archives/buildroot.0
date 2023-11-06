Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB52C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3E7642089;
	Mon,  6 Nov 2023 21:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3E7642089
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TcbA_XA4V2A4; Mon,  6 Nov 2023 21:36:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BB1B42076;
	Mon,  6 Nov 2023 21:36:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BB1B42076
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 526551BF3A6
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00FF581EB3
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:36:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00FF581EB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GPhSJsrNmba4 for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:36:09 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D02E181E7C
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:36:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D02E181E7C
Received: by mail.gandi.net (Postfix) with ESMTPSA id C80BE1BF207;
 Mon,  6 Nov 2023 21:36:05 +0000 (UTC)
Date: Mon, 6 Nov 2023 22:36:05 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106223605.6c6727e7@windsurf>
In-Reply-To: <20231105093155.2945661-1-james.hilliard1@gmail.com>
References: <20231105093155.2945661-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699306566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NeQfzHHBmIVPNM4N1fu0UIeiLCExcKSkQXrzPkvMzQE=;
 b=a5vNXbCTqoByztKzUVvuYPmJ6fMBFMy7u/k1VBmBw6XfHMcncuhmsGMJrhsKfX/22cfV1L
 S+BIpBtQS/TOrpXqCEIo+zAStBbiOEVsa9oNsj0ed5Fxhrb5X+AOWOsI5TOyG4jnu6MF0Q
 HeI2Z0BzuV1jDPczSdP3BAo/RyyOow+RluI7N9qi5P37s6HhaK6/9UbCr1JS5N9XemZVvF
 IpIWDwOIk1QoPHTSFcEI0PF6Bk2OAVsRQPxBcZqm5qpHadEjH0xEMMJzjCUgOKdcLaTt3G
 Q4rvGcsIRo4IUoytix9wj7CfxeNDuXxoZbULASyObaf2ubbBodP3PGc58VQ8QA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=a5vNXbCT
Subject: Re: [Buildroot] [PATCH 1/1] package/python-setuptools-rust: bump to
 version 1.8.1
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

On Sun,  5 Nov 2023 02:31:55 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop no longer required host-python-typing-extensions.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-setuptools-rust/python-setuptools-rust.hash | 4 ++--
>  package/python-setuptools-rust/python-setuptools-rust.mk   | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
