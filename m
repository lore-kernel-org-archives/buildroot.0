Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E42C07E9D
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 21:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0910460F6B;
	Fri, 23 Sep 2022 21:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0910460F6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IaUh2jhaYABA; Fri, 23 Sep 2022 21:55:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F63F60DED;
	Fri, 23 Sep 2022 21:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F63F60DED
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE15C1BF82C
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CC7F4023B
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CC7F4023B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ucl225AhS1IH for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 21:55:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 497F84105A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 497F84105A
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 21:55:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 942B8240004;
 Fri, 23 Sep 2022 21:55:10 +0000 (UTC)
Date: Fri, 23 Sep 2022 23:55:09 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Alistair Francis via buildroot <buildroot@buildroot.org>
Message-ID: <20220923235509.29bc6faf@windsurf>
In-Reply-To: <20220831133951.905279-1-alistair.francis@wdc.com>
References: <20220831133951.905279-1-alistair.francis@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663970111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8pEcOkHlQiGS2Me7gPVfaR7VkCHH7c74DQbvD3zyGNU=;
 b=J6vCLaQdHstfWpf/crzOO6J2u0ZWOfqafH3vri9fdGo0WAb466Cj5VSUCba1yPgeQ5JgVu
 kJEpUyaYc3606FJnOCxLYn+/AvfCsiySBgNvCGoQwwYAYqDpK57ygrB3vSMq3yw7ezZ0ro
 3UHaEGbr3NiTHIPCBlkhsxw8kS/E/FACcuR2e9LnUG+jNJ4cAMgMkbKrx1SOMj7G7OQF5R
 jNRH6z+D+w0UqhlCHUxQKavr51uuZqwc+e8+Q3bmhk776fUeMcsL+6TZtTuEzE49EELxCs
 XhFCUdpDskACp2S7dtXy/Ie4j08uqRvxSBWGb+3oRfG550tp2+8evP2jUbYNGQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=J6vCLaQd
Subject: Re: [Buildroot] [PATCH] package/qemu: add support for RISC-V
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
Cc: atishp@rivosinc.com, alistair23@gmail.com,
 Romain Naour <romain.naour@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 31 Aug 2022 15:39:51 +0200
Alistair Francis via buildroot <buildroot@buildroot.org> wrote:

> QEMU is supported on both 32-bit and 64-bit RISC-V hosts, so let's
> enable support for it in buildroot.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  package/qemu/Config.in | 1 +
>  1 file changed, 1 insertion(+)

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
