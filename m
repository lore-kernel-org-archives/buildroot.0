Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94D0EE57DF
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 19:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70A6081F0F;
	Mon, 11 Sep 2023 19:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70A6081F0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RdyHQEpIexRZ; Mon, 11 Sep 2023 19:52:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D007081EE4;
	Mon, 11 Sep 2023 19:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D007081EE4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A3BE41BF2BB
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8951960EFE
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8951960EFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xeE2G7Wl7f-F for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 19:51:59 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3424560672
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 19:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3424560672
Received: by mail.gandi.net (Postfix) with ESMTPSA id 29DAFFF80F;
 Mon, 11 Sep 2023 19:51:27 +0000 (UTC)
Date: Mon, 11 Sep 2023 21:51:26 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230911215126.426414a3@windsurf>
In-Reply-To: <20230911130402.3010064-1-james.hilliard1@gmail.com>
References: <20230911130402.3010064-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694461917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8ma6x1nz1luK6yedqy0owkEueDsrtCqc+ExbdhuihBA=;
 b=NHntQ1G/1Tcq1xWVwADiPPXMFUZmh8eV5ukELbUmzUJ6EqVf3fGNSAZBffpsA5faXnNgdB
 pa0duWm7pK8GyksAB9Prdpek6yMLxH0UzdtssEKiJyhg1QYogGmVaLuNK9344UAWsDs77+
 kFRXOLI+ew5O+ZLXj5bpn2jRpTbDXCkdqA8NPouy8idlIo+8tqWT9I9NWNZB5/qI2pLSET
 vUgS/KJVaN0Z75ZhDMf5bkA58jt9KvRszPHf8iYpaVYsZ1ACfSfSX+1bupbbB9Xoia6E8M
 xlBeiX1IXuNCDBx3fw8eQ0+E6qa8PIahXMqvSwSfUjp4CYw37Q9tUQZTF699VQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NHntQ1G/
Subject: Re: [Buildroot] [PATCH 1/1] package/freescale-imx/imx-kobs: bump to
 version ff13a99a22aa73cca0e09a33c2ebb6a94ad698da
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 11 Sep 2023 07:04:02 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Update github organization name to nxp-imx which is being
> redirected to.
> 
> Rename COPYING TO LICENSE.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/freescale-imx/imx-kobs/imx-kobs.hash | 4 ++--
>  package/freescale-imx/imx-kobs/imx-kobs.mk   | 6 +++---
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
