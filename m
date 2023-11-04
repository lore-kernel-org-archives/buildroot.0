Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1746DC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 19:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AAE840104;
	Sat,  4 Nov 2023 19:57:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AAE840104
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id la_X_nMMGud0; Sat,  4 Nov 2023 19:57:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 815C34010C;
	Sat,  4 Nov 2023 19:57:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 815C34010C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 69E031BF5A7
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 19:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28EF082247
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 19:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28EF082247
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HzXyQyGqU7mu for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 19:57:48 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0E3782246
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 19:57:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0E3782246
Received: by mail.gandi.net (Postfix) with ESMTPSA id B8D8560003;
 Sat,  4 Nov 2023 19:57:44 +0000 (UTC)
Date: Sat, 4 Nov 2023 20:57:43 +0100
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20231104205743.34dadaa9@windsurf>
In-Reply-To: <20231002035732.1395926-2-dalang@gmx.at>
References: <20231002035732.1395926-2-dalang@gmx.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699127865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jg1ms48aqLqEtJgyoCLlnVPorrUSbeYek8zGxaeKyFA=;
 b=MBkLbVtbqQmGG5f0/qW+h/JwKX0Z/9fJF7zzb1WX4CfemhEPacsHS1+hRY9MWQQQIO4J/J
 uGfjvUmx3PpKg3Rv0AuJir/a3CPXR7+0xryOqd8quTN18ckwpXf4xfwXPlDMDJUulfrs5N
 UoszDD4uFFxbHyKwSpHUdQAbXqC/c/NZcD0w0fvPSPlS/1yu79agkBOcWd8xyu2pxFhab3
 D0MwJ6lpEvshg+e+HkR7qNP0i4iG0ogQyF1a+8Re3WTxcNhsfHvhAl4r/iL3ib49NpzTab
 v8wYja9cU8cU+2K7P9y2SD2Ii6I/XYQj4eEHY9zqVKFup3SPkYAEuCMEc/UuWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MBkLbVtb
Subject: Re: [Buildroot] [PATCH] Makefile: drop gen-missing-cpe leftovers
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

On Mon,  2 Oct 2023 05:57:32 +0200
Daniel Lang <dalang@gmx.at> wrote:

> In 6fa3a239 the gen-missing-cpe support script was removed together with
> "make missing-cpe".
> Remove the leftover path variable and drop it from "make clean".
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>
> ---
>  Makefile | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

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
