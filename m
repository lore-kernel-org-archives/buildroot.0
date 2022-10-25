Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B8CFA373E
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 21:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53B6C81094;
	Tue, 25 Oct 2022 21:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53B6C81094
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T3iebSSksLBx; Tue, 25 Oct 2022 21:11:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41C4F81091;
	Tue, 25 Oct 2022 21:11:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41C4F81091
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A98F31BF3AE
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 21:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9108640264
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 21:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9108640264
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h3qIDig1Urmm for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 21:11:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32D3E4025F
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32D3E4025F
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 21:11:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5DC63100005;
 Tue, 25 Oct 2022 21:11:23 +0000 (UTC)
Date: Tue, 25 Oct 2022 23:11:22 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20221025231122.40aa1f4c@windsurf>
In-Reply-To: <20220921143328.186633-1-romain.naour@gmail.com>
References: <20220921143328.186633-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666732283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wGIdKbWg0L687jOW4sWUVuEqPLV3uN1LED+TEL4R93g=;
 b=f+05UGpBKw1CdLzniB+uQl96Y8Oet1aS6p4r5ZAfn0NeEqaFML1WNg3R3SqS8MhjSOn7/E
 AiOs6i0lZ4pQkm9NCrbY1GB0WH5i+yLiAppsE4yYmhfN6xMocO71TP/3DwBAdkhT2OfUE3
 2pP/SuMcxQreN1xAn9scCVXZcb9CVYYtDK1Xu/6sTNmhsx3BK9ojETbJmdTqzeb5JHxTLs
 v9hW2hQYFPZjtmnAFHCSk/7WP/6xKCfIFcMR+/Pj5lrr4tiRbdGL39TDh/ok39t+3yQYqx
 YmxpudaigQ9FSfCcuRWHmVRaQtji83IcIy7UdQDzR9N69QrV7OeQ8UvI6ryvIA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=f+05UGpB
Subject: Re: [Buildroot] [PATCH] package/gdb: gdb 12.1: enable host-gdb and
 gdbserver support for or1k
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
Cc: Stafford Horne <shorne@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 21 Sep 2022 16:33:28 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> The gdbserver support for or1k is available since 12.1 release, since
> commit [1]. Restrict the gdb version choice for or1k to 12.1 for
> simplicity. Also enable host-gdb to connect to the gdbserver on the
> target.
> 
> [1] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=4933265c3f71b9134363d0c05f09542d5cc677f4
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Stafford Horne <shorne@gmail.com>
> ---
>  package/gdb/Config.in      | 3 ---
>  package/gdb/Config.in.host | 9 ++++++---
>  2 files changed, 6 insertions(+), 6 deletions(-)

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
