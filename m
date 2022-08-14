Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEEDC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 10:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DFD740283;
	Sun, 14 Aug 2022 10:06:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DFD740283
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xH4AZWZFmukP; Sun, 14 Aug 2022 10:06:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40ED94019B;
	Sun, 14 Aug 2022 10:06:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40ED94019B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A2241BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 358154019B
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 358154019B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c8IL4tEQyKnj for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 10:06:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E723400D8
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E723400D8
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 10:06:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 324711BF204;
 Sun, 14 Aug 2022 10:06:16 +0000 (UTC)
Date: Sun, 14 Aug 2022 12:06:15 +0200
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Message-ID: <20220814120615.24bfbaaa@windsurf>
In-Reply-To: <20220812145652.24342-1-nicolas.cavallari@green-communications.fr>
References: <20220812145652.24342-1-nicolas.cavallari@green-communications.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660471576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VaVccWkq2tSVbz+k0UdSh/AKOPW5lj1/3VmBb01mPeM=;
 b=GIFVgsqkUxaIo2AwQRMY1gggGZlJ6aQzADJ1vDVAk9uduVwNtVvod/fHj9FeaAygoDfjwe
 mz3mzyvGsHRtDdcXvx0lyLANsoqvXbm7S125k7IzFRMPLVYPY/pfSv8q9VTTVtyGETDPbA
 nZ7iRWfyipqpzJFffZLRfr9nr0gcqvU5BBDqNJAseLAvd6Xe3s8kvV9Et2mGA8MFd7qcC+
 RuaHkvpLQyIZByjxWMbpVPUAW8grzEx4xm9b94w/7F1ERgT0b0ftuYU8PsLC3TXipi0HeL
 9CChDK5JJCKfSc2/D3I8ttLTYTe6FVO6YEWREPCdz2YWKQK8RwMURUmnJZyeDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GIFVgsqk
Subject: Re: [Buildroot] [PATCH v3 1/2] package/libgit2: link with -latomic
 if needed
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

On Fri, 12 Aug 2022 16:56:51 +0200
Nicolas Cavallari <nicolas.cavallari@green-communications.fr> wrote:

> libgit2 is currently a library without any reverse dependencies so the
> missing atomic symbols do not cause build failures yet.
> 
> libgit2 uses the atomics intrinsics on gcc >= 4.7 and the sync
> intrinsics on previous gcc versions.  Since gcc 4.9 is the new
> minimum, ignore the sync intrinsics requirements.
> 
> The next version of libgit2 will also build a binary, which will
> expose the problem.
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> 
> ---
> v3: first series with this patch
> ---
>  package/libgit2/libgit2.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks. I will also cherry-pick in next.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
