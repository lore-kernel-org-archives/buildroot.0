Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2150C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 584C042183;
	Mon,  6 Nov 2023 22:27:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 584C042183
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SbESiXcua7dV; Mon,  6 Nov 2023 22:27:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B846C42191;
	Mon,  6 Nov 2023 22:27:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B846C42191
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D8C181BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3519415C3
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3519415C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RcF9wBUzm1Yi for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:25:48 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 698FD414BD
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:25:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 698FD414BD
Received: by mail.gandi.net (Postfix) with ESMTPSA id A715660007;
 Mon,  6 Nov 2023 22:25:46 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:25:19 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106232519.57bdd400@windsurf>
In-Reply-To: <20231105043508.2812013-1-james.hilliard1@gmail.com>
References: <20231105043508.2812013-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699309547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GZ+cFEJnJcgADa8bWlNHxItzpgyfInqZ7qWAfjdCcpw=;
 b=i0PHeyyaBtCELM6Bs+yzjDzQsgawJBNJaH6tgapQqZwqTtSJPl17wtzQ2iBnO4QbS313lN
 P8U2mzX/Ul3jCGNvgvvGPnQ9LSZmIL3tcWX+mPVmNtoAAmQob2A/8OJGOpeByvV2sE/BwQ
 ZK3f039EpXEsxU0kl04ewLLoGR/TxmNUbFoY9LpJ7q4E1oYfJyEQkqwyKRBCVRgz89EMOj
 0tx6bv6frGw8UdQ89C4ga0Iu3peoysDcuMnAj2KsYLi9KHFOGoe4F1y8ITnXw2klY/TsLu
 3Bqua//0tgPwsP9RXMvviu8rD+f9fGCAjFCJ2Bp+fv9KSIeNl/nsoP3pbjzUvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=i0PHeyya
Subject: Re: [Buildroot] [PATCH 1/1] package/python-daemon: bump to version
 3.0.1
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
Cc: David Bachelart <david.bachelart@bbright.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  4 Nov 2023 22:35:08 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-daemon/python-daemon.hash | 6 +++---
>  package/python-daemon/python-daemon.mk   | 4 ++--
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
