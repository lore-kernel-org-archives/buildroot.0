Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B1EC4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 21:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FA7381F0C;
	Wed,  8 Nov 2023 21:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FA7381F0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bYjhSI6J2TrX; Wed,  8 Nov 2023 21:42:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F4CE81F96;
	Wed,  8 Nov 2023 21:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F4CE81F96
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 222EF1BF4DD
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 21:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE8F340140
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 21:42:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE8F340140
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mXmA6j2oiN3B for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 21:42:11 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D80B40114
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 21:42:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D80B40114
Received: by mail.gandi.net (Postfix) with ESMTPSA id 20331FF803;
 Wed,  8 Nov 2023 21:42:08 +0000 (UTC)
Date: Wed, 8 Nov 2023 22:42:08 +0100
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20231108224208.61f43d89@windsurf>
In-Reply-To: <20230901192719.102415-2-dalang@gmx.at>
References: <20230901192719.102415-1-dalang@gmx.at>
 <20230901192719.102415-2-dalang@gmx.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699479729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CyI8njP0lJwjXjOrV34egKr3AxoHjyUdmOuFQZcVzLY=;
 b=b3Bja6KITNAi2bqjnSUuDZafSMnZ4I4BgvncwajfW1cFMrVrriVGoTZK4/SfTPz9BZmdRx
 McoxiTnvBRrhOuHMddUJQKPGKn/WhgPrUrBOAmAAxkl/pEdr6/eswCCFUYagj0omDRpT6D
 n6/nzDrC6NTeG96R/uCSSxGAbSLuOFQ/trmZ4jhZAx72YRcdtDFVHf2KzmkP7AmRKnjdbX
 zdQnGPK6KHvdgHYbsdtOXTc5kE59SfhfzTaC78lmGGqziVe6XP3L1kyk7CHV9zHp/dRv9Q
 a9cv9u2d/dRJToo9b63Lv6DRWaRHAtXNhulvMXFFwtzVHdaiOJvP67AksBVPJA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b3Bja6KI
Subject: Re: [Buildroot] [PATCH v4 2/6] support/scripts/pkg-stats: check all
 files for warnings
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
Cc: Sen Hastings <sen@phobosdpl.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  1 Sep 2023 21:27:10 +0200
Daniel Lang <dalang@gmx.at> wrote:

> Instead of only checking .mk and Config.in{,.host}, check
> all files in a package directory.
> .checkpackageignore isn't considered here, therefore the shown number
> includes ignored warnings as well.
> Add another css class to signal some warning, compared to a lot (>5),
> similar to patches.
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>
> ---
> v3 -> v4:
> - use yellowish bachground for "some" warnings
> v2 -> v3:
> - new patch

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
