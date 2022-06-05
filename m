Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9644CC43334
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 21:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CAC4843BE;
	Sun,  5 Jun 2022 21:18:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JqfQLqhMQhiR; Sun,  5 Jun 2022 21:18:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DEC3843B2;
	Sun,  5 Jun 2022 21:18:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9FD2C1BF290
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 21:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DF3F4176A
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 21:18:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0UK2YcaG2EbY for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 21:18:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4AB83415F2
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 21:18:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D84EFC0003;
 Sun,  5 Jun 2022 21:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654463880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2eA8Q2Y0/A6MfuTp/UMNDOpOCu4U4UI/iIX/L2FMpFE=;
 b=kRC7hnUIAAnVZ3PSm8t+p1chqbcWZsybFIZDXM0aQT1UjAgSxEDWH57dh/7E4aQljrpFoM
 ntGaZ75jE+hfH/lmQ6F5bVEffuzgRlWWe6JmrSOLIXR/xULkwPT9A7Ht+eCiJcoBnxQtyc
 NBLEPCzbrHqkHNMufVAsMxawMYcJj6QO9HC0zKVVUDlbRA4mAxlrRcr0+XAOTVXlD5itMv
 AlA3URDJ4xojD682KJj96PToKPyF80waQefvoNybEA8Ummwjbcs7f8Te4DldAaFA3K9N2h
 6VnhcZ0Hdco1Nir+lx648fu24rhDsSE1S1AHGIrNEaAD0lN7zC0/x9QmFzjnSA==
Date: Sun, 5 Jun 2022 23:17:58 +0200
To: Grzegorz Blach <grzegorz@blach.pl>
Message-ID: <20220605231758.7438250e@windsurf>
In-Reply-To: <20220529223248.51556-2-grzegorz@blach.pl>
References: <20220529223248.51556-1-grzegorz@blach.pl>
 <20220529223248.51556-2-grzegorz@blach.pl>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/5] package/python-pyjwt: Bump to version
 2.4.0
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

On Mon, 30 May 2022 00:32:44 +0200
Grzegorz Blach <grzegorz@blach.pl> wrote:

> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> ---
>  package/python-pyjwt/python-pyjwt.hash | 4 ++--
>  package/python-pyjwt/python-pyjwt.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

You forgot to check legal-info after this version bump, and the license
file has changed, and therefore the hash of that license file need to
be fixed. I fixed that up, and explained in the commit log why it was
changed.

Applied to next with that fix. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
