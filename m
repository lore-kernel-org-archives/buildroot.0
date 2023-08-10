Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CECDC001B0
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 21:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0380417CD;
	Thu, 10 Aug 2023 21:02:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0380417CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eqbHr0xGEURT; Thu, 10 Aug 2023 21:02:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28F26409E6;
	Thu, 10 Aug 2023 21:02:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28F26409E6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3AFC51BF30D
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 21:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE63C41E0B
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 21:02:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE63C41E0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vI2Qy5lL20xy for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 21:02:35 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8A46F41E0D
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 21:02:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A46F41E0D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4393960004;
 Thu, 10 Aug 2023 21:02:32 +0000 (UTC)
Date: Thu, 10 Aug 2023 23:02:31 +0200
To: Bin Meng <bmeng.cn@gmail.com>
Message-ID: <20230810230231.50d0a36a@windsurf>
In-Reply-To: <20230209172002.1442869-1-bmeng.cn@gmail.com>
References: <20230209172002.1442869-1-bmeng.cn@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691701353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jh+Qt0k7/Pq3oQtztvxQgMONlK7B3I1hT9muzXd+KiQ=;
 b=D5YgNFCfbivQV8KzS4vgSwqKfs619f/g8xydIPZRXaOZl1J8cyJVvNmkDfpOP9l7XQ7kBc
 +eOm45Ubn1BIhzQstBJM58bko7JGL0JHxID7aU4zrsqZwtBGxJRsWpHV204O33HVXyc3nz
 lh42P6XLqtIilSywmEGnbb1It47oDnl7aCWB+T+D+M9XbwIFSSLNewLPBpSKcpHxyxbWY4
 EnF01df0B2klD0jTzWxPY7d1VlsCDNOfJ6EVSG0EnNiBdXbDKMgnrtlBEfW/evOoD5uIVR
 wNG8SRhIpkw2+GAAyS+BQOk6j9znIHGVzQGUAB8gcopHGyBuhWyt9/lWfp5eNg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=D5YgNFCf
Subject: Re: [Buildroot] [PATCH] board/intel: galileo: Enable Linux kernel
 root file system on NFS
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
Cc: Bin Meng <bmeng@tinylab.org>, Nicholas Sielicki <sielicki@yandex.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 10 Feb 2023 01:20:02 +0800
Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bmeng@tinylab.org>
> 
> Update linux-3.14.config for Galileo to enable Linux kernel root
> file system on NFS.
> 
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---

Thanks, I have applied to our next branch. However, the
galileo_defconfig is really old, still using a 3.14 kernel. Any chance
to update this to something reasonably modern?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
