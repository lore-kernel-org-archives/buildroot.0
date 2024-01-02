Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156A5C47074
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 22:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA66B40A75;
	Tue,  2 Jan 2024 22:34:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA66B40A75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6MmgPfqZZ7FF; Tue,  2 Jan 2024 22:34:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3A5C40A84;
	Tue,  2 Jan 2024 22:34:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3A5C40A84
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD01F1BF2FB
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 787C360F3B
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:34:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 787C360F3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yxnIsB8u9q9q for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 22:34:33 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1544F60BF3
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 22:34:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1544F60BF3
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D03AE0004;
 Tue,  2 Jan 2024 22:34:29 +0000 (UTC)
Date: Tue, 2 Jan 2024 23:34:29 +0100
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20240102233429.46f668ea@windsurf>
In-Reply-To: <20231218215949.282274-1-petr.vorel@gmail.com>
References: <20231218215949.282274-1-petr.vorel@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704234870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t5Nzni68MsRp4xH3CskfCTSCnddHs5dsan16N0vDymg=;
 b=SDJLvFkRh1F9Gq8TmEzJYA9zFJoA7I15kZsFBhg5/YkAzbsVJ08QXx0frhD+M7/nzfmvKI
 XMZ74aHw51QtIQab19pbod6vrRT06D2hnoNRs2zTEvPlf5VEXKvfyBWpZBx3AJP9jKz0yg
 AaQFRdgzCaAP68yYcAfQLq+cxFUbqB/vC1dIIJialhUSvJodTCqGpC7aGTryS9cWHvvHxV
 hAtADaN9zkyGNKxUkSXrpDlYo2CN5CncVGUOGAwlQv9ssUg/RbHj15mQ86I/gxIBZMq5NV
 7OSfLlWY7nLTd8KcGGxbpgLeKr7lxziDc3I28581MdtaISvBLjWg9f8ZOSBQ2Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SDJLvFkR
Subject: Re: [Buildroot] [PATCH v4 1/1] package/nfs-utils: bump version to
 2.6.4
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 18 Dec 2023 22:59:49 +0100
Petr Vorel <petr.vorel@gmail.com> wrote:

> Remove patches backported from this release.
> Backport 2 patches from upstream ML needed for uClibc-ng on mips.
> 
> Require kernel 3.17 due getrandom() dependency.
> Add host-util-linux to HOST_NFS_UTILS_DEPENDENCIES
> (new uuid.h dependency).
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/c5fde6099a8b228a8bdc3154d1e47dfa192e94ed/
> 
> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> changes v3->v4 (all from Thomas):
> * Update dependency comment in Config.in
> * Fix whitespace in Fixes:
> * Fix Upstream: tag position (2x)

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
