Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA5BC433FE
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 21:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D1E541C07;
	Thu, 28 Apr 2022 21:11:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NTtfkdqMVfbs; Thu, 28 Apr 2022 21:11:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 466D341C09;
	Thu, 28 Apr 2022 21:11:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 132EC1C115D
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F34CE400E3
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q4gcqhG2GJ1j for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 21:10:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0FFFE4048A
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 21:10:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 748D2E0004;
 Thu, 28 Apr 2022 21:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651180206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eh9M2M7Pe4+5gCGIrKsI39Vb3NkCkibYmpXlZKAXGGU=;
 b=HlTEhVVGER++f7v2snyV7H1u9pae22JZfxF8EuCRgN8RdywieUtL4sQhdOVaZ4uqOxi7DG
 AaBHaFV4yoLNojjH6I7vfSSvgDMKO+oacF/k/7m+CMpRhajtQZQjzGa5UG57zswsPmQjZv
 68Nzs1SxXoce3fc6iD4IFmXA4PotZYxHMyvN2NNNYrRMPi3EDro8WEhqjXRoMpLncFHzss
 kpG7yEoeQLROV6FMA4xCiWyh/D/vdtrzTAHSlCI369i5nliVanhzEzqcCl1NkWg0+2vErM
 5CHRnYrfdnlf9ZOBmhqoTehbSrlTN+oKVgJNOAsnHY6HMyRNcNHH3g944feZoA==
Date: Thu, 28 Apr 2022 23:09:44 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220428230944.1dcb7f6d@windsurf>
In-Reply-To: <20220428194545.776652-1-james.hilliard1@gmail.com>
References: <20220428194545.776652-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-simplejson: bump to
 version 3.17.6
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 28 Apr 2022 13:45:45 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-simplejson/python-simplejson.hash | 4 ++--
>  package/python-simplejson/python-simplejson.mk   | 4 ++--
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
