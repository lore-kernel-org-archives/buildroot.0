Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916C9C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 10:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE69C414C0;
	Mon,  8 Aug 2022 10:17:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE69C414C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Va-t_4DNygYR; Mon,  8 Aug 2022 10:17:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B72C1410E0;
	Mon,  8 Aug 2022 10:17:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B72C1410E0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3376A1BF36D
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 10:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E41C7410E0
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 10:17:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E41C7410E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7xwexL72J9Ha for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 10:17:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EF6C410D8
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2EF6C410D8
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 10:17:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5F62E240006;
 Mon,  8 Aug 2022 10:17:24 +0000 (UTC)
Date: Mon, 8 Aug 2022 12:17:23 +0200
To: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Message-ID: <20220808121723.7d0d2bcb@windsurf>
In-Reply-To: <35ea7a5d-e0b4-d98e-ca1d-716de2d25698@othermo.de>
References: <CAM6O0Zgc_jfn+m1ZhRByLQ4QDDAYpAOQv-9aDRgruSYKWV5wUA@mail.gmail.com>
 <35ea7a5d-e0b4-d98e-ca1d-716de2d25698@othermo.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659953844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/jzIKRfEWBMD9iCgISN+TMrnmHE4AwGUwo08ZWIv6k4=;
 b=EscSlrZRVhuL1UsNobLP1QJjfgzIGnUwVdWWVYbebQ3yjjR751ITHjfbHBdn5kAI3eol02
 jX2Ijkz01ca4XFy1uO+G6DvNq3TuheLrcApPQvKOqcIwe89xcjUpg1hlrcUgE4PCOljha5
 c48EdtIpGY1EWDChr6ZxQLI2B+HuZgXfNNXsZ8NJeN3rYUlycCI92uLp56CxYMguZXaOxg
 uVDQ3Df+HwVAGfZL6L25fTp3e80U3jeBhcCjmF6KvG5VOLzxmpsWlcU8i5nhfGCkFS6hz7
 pqEIeatn5Cer6Y34sy/WKZJcNGn02cRL9Td3vcoUkt/AHgCElcnLeNT867wVdQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EscSlrZR
Subject: Re: [Buildroot] Python pyc only and problem with scripts
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

Hello Marcus,

On Mon, 8 Aug 2022 12:05:54 +0200
Marcus Hoffmann <marcus.hoffmann@othermo.de> wrote:

> I've noticed a similar problem for pip's PEP517 backend as well, which 
> normally calls some internal helper script via python subprocess (and 
> uses the .py name for that). This is fixable by using the .pyc suffix 
> instead in that case though.

Do you have some details on this?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
