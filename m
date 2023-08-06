Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E232C0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 15:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3C2F80D18;
	Sun,  6 Aug 2023 15:13:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3C2F80D18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1oA1USkMYrwO; Sun,  6 Aug 2023 15:13:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38E8D80BEC;
	Sun,  6 Aug 2023 15:13:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38E8D80BEC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F11E71BF5DA
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 15:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0980740142
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 15:13:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0980740142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6hhAib-Vsw4A for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 15:13:08 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B0F240461
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 15:13:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B0F240461
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A45C1BF203;
 Sun,  6 Aug 2023 15:13:05 +0000 (UTC)
Date: Sun, 6 Aug 2023 17:13:03 +0200
To: carrier.nicolas0@gmail.com
Message-ID: <20230806171303.2d9589c3@windsurf>
In-Reply-To: <20230802062239.2152501-1-carrier.nicolas0@gmail.com>
References: <20230802062239.2152501-1-carrier.nicolas0@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691334785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FPPtUx7G521T66LXhIWDE9lCqRVwfZY1G96GmFBK21A=;
 b=OG+qhEZo33hnzs4HYA8QaUP42Ge2CzvzlI/BKyMox5XtcACWsNgkplXVqlhzhAw8d5Q0Ox
 Nsn6vjBZBpXX30/Y3JsBPPWZ1NdwpLyx1L/0WiRFnzC5tyz9QSJ0ZNGJFrw/OZLeFnVuWT
 m7l+n+5ERNZz474aZ4DmnhFh/g06RBbvRz1csaFikFTyL6V0LIO28FtVVuGPZwOJNq0RLb
 Mau/hbSgb+Rs1bQjAtx2KPMnSNcge1F6sANakXMkMJvWsJxnFOX+qa6H+6DWg9NH7RYwbH
 DRb1bD8fHm/ZQzMZ/c3KgQrzqhw+OHlbGMLKUpIZEILz2DTcfs43MwfeVylCqQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OG+qhEZo
Subject: Re: [Buildroot] [PATCH v2] less: install the lessecho command
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
Cc: Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Nicolas,

On Wed,  2 Aug 2023 08:22:39 +0200
carrier.nicolas0@gmail.com wrote:

> From: Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>
> 
> it is required by, for example the s command, internal to less, which
> allows to write the less input to a file
> 
> Signed-off-by: Nicolas Carrier <carrier.nicolas0@gmail.com>
> 
> ---

I've improved the commit log and applied to master:

  https://gitlab.com/buildroot.org/buildroot/-/commit/8b1bc64d924e386466d715637a4a09228322beef

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
