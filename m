Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38452C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 15:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E186184C33;
	Wed,  1 Nov 2023 15:59:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E186184C33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vGstaJGtLsxG; Wed,  1 Nov 2023 15:59:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DA0E84C68;
	Wed,  1 Nov 2023 15:59:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DA0E84C68
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E4B401BF20D
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 15:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD0706FCCD
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 15:59:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD0706FCCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hpb_azhKHoy6 for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 15:59:25 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3FD166FC82
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 15:59:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FD166FC82
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2317A1BF203;
 Wed,  1 Nov 2023 15:59:21 +0000 (UTC)
Date: Wed, 1 Nov 2023 16:59:21 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231101165921.2908117b@windsurf>
In-Reply-To: <20231029194141.684797-1-fontaine.fabrice@gmail.com>
References: <20231029194141.684797-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698854362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LNA2a9CYT9X24Rr/gWIWjR+Bb40r/xDLnsTmj6NCp5A=;
 b=NcjMk4lHL8OoulggVfTnyRVKboCjMx+2IdmmildvLEzG/el3Cm7sBK+xNa3Z02wpreLLk4
 He3ZTPjJVPIlGQf3mMbVn7grSRwEWCN3yZLze/bwN/3IM6LogoP2PuLWft9kA6IVTubrW6
 YHQrIQk+PWF6J4+oLqTRQ0wzQFyj9uQdJf+SfDHGF5r2XRMwEztFRSttnebTgIu4qjoD9A
 YcaZloOIIDmmOmACfEdvt1Zt4BQ68RfufyUPsMUNUqSXgy1z/F8d+g+4nEI/HR52PsncYb
 hAZZ+uS+MRNhtu51Tttxdw7EfwpV/K6X9bj5/v9lBLqA1yxIdOp2vlvG8nnTvw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NcjMk4lH
Subject: Re: [Buildroot] [PATCH 1/1] package/bcm2835: bump to version 1.73
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

On Sun, 29 Oct 2023 20:41:41 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

>  1.72 Added examples/smi/smi.c showing how to use new SMI bus support,
>       courtesy Benoit Bouchez. Added support for disabling
>       documentation genetration with "./configure --with-docs=no",
>       courtesy of Christian Zuckschwerdt.
>  1.73 Fixed some inconsistent indenting in bcm2835.c that triggers
>       warnings for some people. Added Timeout checks to
>       bcm2835_i2c_write() in case of IO problems. New reason cade
>       BCM2835_I2C_REASON_ERROR_TIMEOUT added. Patch courtesy Simon
>       Peacock.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/bcm2835/bcm2835.hash | 2 +-
>  package/bcm2835/bcm2835.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
