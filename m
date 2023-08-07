Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20B3C001B0
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 20:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AD9681E6C;
	Mon,  7 Aug 2023 20:21:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AD9681E6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b_X8ks59PinH; Mon,  7 Aug 2023 20:21:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E72A981E1D;
	Mon,  7 Aug 2023 20:21:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E72A981E1D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 655B81BF287
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 20:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F23C4049E
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 20:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F23C4049E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RQUShnNQRMwD for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 20:21:49 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C37840122
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 20:21:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C37840122
Received: by mail.gandi.net (Postfix) with ESMTPSA id 56C2960003;
 Mon,  7 Aug 2023 20:21:47 +0000 (UTC)
Date: Mon, 7 Aug 2023 22:21:46 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230807222146.6e6ea019@windsurf>
In-Reply-To: <20230806220255.4099091-1-james.hilliard1@gmail.com>
References: <20230806220255.4099091-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691439707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hpGPPzZnw8dMIXdKYrmbYaeqy3m5wL7oJuavu2elNns=;
 b=haWBQR0Ba66PK7aaRXHZpH61HyqgflsbfugQLt53sWGUrVg/IOpbllLR10GIJCuT5MIwak
 9zAnAtT5Iz32/X9TktqCTNUaK8rdc2vhUEmTAUtfg+Ba5s992ROBd0MSKuK+Sxp7egu0kq
 WUg8WpTT4ba1pIzPN8b1fgjVnkTL/evUKGl6K/FUKb9+4pKI41LvDgrXEHFeLQ8+sSXnAV
 1SYioibtSsVxOqdxePnI22bjnUDrKHyi7ywgsCXfzva/qY+qCDwoH4yOvKcVgcPhdODKOr
 uO0txn460zWq3f9xnvqXIZCpPDNbZCW/ebmcHM6PWPQ5Ss5A2XikqhfUG3MCBw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=haWBQR0B
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python-botocore: bump to
 version 1.31.20
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
Cc: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  6 Aug 2023 16:02:55 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> When we bumped urllib3 in 074bc42971181ee71d8ff5bd57641b7b7eb7580f
> we broke compatibility with python-botocore.
> 
> This compatibility error was fixed upstream in botocore 1.29.122:
> https://github.com/boto/botocore/commit/0a6d8e3c6325da395a04227599cfa292190d6841
> 
> Fixes:
>  - https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561482
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>   - add fixes info
> ---
>  package/python-botocore/python-botocore.hash | 4 ++--
>  package/python-botocore/python-botocore.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
