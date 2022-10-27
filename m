Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B451C38A2D
	for <buildroot@archiver.kernel.org>; Thu, 27 Oct 2022 06:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 250A760E05;
	Thu, 27 Oct 2022 06:54:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 250A760E05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LreuTYxFUySn; Thu, 27 Oct 2022 06:54:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D5DC60E03;
	Thu, 27 Oct 2022 06:54:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D5DC60E03
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 378BB1BF47E
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 06:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 128F2408DA
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 06:54:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 128F2408DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bATiezSjhMnK for <buildroot@lists.busybox.net>;
 Thu, 27 Oct 2022 06:54:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B9C6408A2
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B9C6408A2
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 06:54:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B41CC24000B;
 Thu, 27 Oct 2022 06:54:34 +0000 (UTC)
Date: Thu, 27 Oct 2022 08:54:33 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221027085433.79abc469@windsurf>
In-Reply-To: <20221026212122.592457-1-fontaine.fabrice@gmail.com>
References: <20221026212122.592457-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666853675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MIVPumqQLlAmtUhc5ngEECfToj3lWzxY7eylWh40uNo=;
 b=Sq9ob6Y6rO29Iwt8+LXlA7ahVJmUxQlL2unpnw8qksbetV4zsxIENbnw9o0jilnSN3kkAE
 VSJPVH/sQxPhj4zvVvbP0V7Ifl0uexOqcSjIARvSdPo9bTT0C2s/9pnqwHdg1z55JuDjJP
 VJMdsy1D5gKR4uyWaqxwk/TP+hJFKCQn5ZCa4B9BNbhtXGMMbCOfR8Z0qmx3+S9EfmZCLz
 K4J9kXPCO9pb0X6Okkqg0k3EI/lnXqU0aUJT26ijEwbfNwHMcpisgyWj/PF1fhgeBGBx2V
 eaHGOrwVLIyPrJSVARH8WhmyZEIdEtHv9aXYhTrLJ86EjIwhKJuoE+0sOvf11Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Sq9ob6Y6
Subject: Re: [Buildroot] [PATCH 1/1] package/faad2: bump to version 2.10.1
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
Cc: Gilles Talis <gilles.talis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 26 Oct 2022 23:21:22 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/knik0/faad2/releases/tag/2.10.1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/faad2/faad2.hash | 2 +-
>  package/faad2/faad2.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
