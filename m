Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80AEEC32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 19:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED7B440588;
	Tue, 23 Aug 2022 19:27:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED7B440588
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZUTKq0lyx39O; Tue, 23 Aug 2022 19:27:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11F3640423;
	Tue, 23 Aug 2022 19:27:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11F3640423
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 194E01BF39D
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E89E740376
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:26:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E89E740376
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gn7dIv1X2I-K for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 19:26:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 613AE4011C
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 613AE4011C
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 19:26:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C68221BF203;
 Tue, 23 Aug 2022 19:26:53 +0000 (UTC)
Date: Tue, 23 Aug 2022 21:26:52 +0200
To: Federico Pellegrin <fede@evolware.org>
Message-ID: <20220823212652.5f41da0e@windsurf>
In-Reply-To: <20220822045149.13931-1-fede@evolware.org>
References: <20220822045149.13931-1-fede@evolware.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661282814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ywZxTTQ5PRf2Je8SWrVMta9EQiRmXBM5AwVfjTxLLQE=;
 b=Izr+5AD0jNFCP1xgha8vuBFtw15qTIIzqSy4qQ5Q6+eD447KwR62eZgRmconIBi6Mw+F1a
 fjRvRTROhST2kO4wyuxjP6q5lNuG/yyzH0VAl7TCYe4q6S7I8rIZWe6zmNZ6rd400ih3VJ
 FulBwS/BrpY+JJLfvCS2JitCUEnF9FFGiHR31VNbepNLj9BZazNU6++X/tEMTL/cPQmE0M
 ew4xtX8MhxReyPPxk+yFr0GT+OiRjg1DKa4GzC6piyF2Nusi6v3APBdBBtbV2AxW+HXSjQ
 lH6NIh2Q2IO0qXJiiJ2FMpOnRO5KK6a54VtICkriOLFNZZZFqBXwTS8FzvwmZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Izr+5AD0
Subject: Re: [Buildroot] [PATCH 1/1] package/kexec: bump to version 2.0.25
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

On Mon, 22 Aug 2022 06:51:49 +0200
Federico Pellegrin <fede@evolware.org> wrote:

> https://www.spinics.net/lists/kexec/msg29887.html
> 
> Signed-off-by: Federico Pellegrin <fede@evolware.org>
> ---
>  package/kexec/kexec.hash | 2 +-
>  package/kexec/kexec.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
