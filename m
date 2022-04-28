Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF16C433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 21:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C85F783F28;
	Thu, 28 Apr 2022 21:40:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4AcGcdEdJWU2; Thu, 28 Apr 2022 21:40:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E153983F25;
	Thu, 28 Apr 2022 21:40:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 797761BF2E4
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76209400E3
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:38:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZA0bVrSjl_rC for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 21:38:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7BCC640004
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 21:38:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4F9DAC0002;
 Thu, 28 Apr 2022 21:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651181920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+FCNtTCK7MOhdsP1GHP+mA6eDhEgD8tWB7m3ffvxV1g=;
 b=PuJlpQ3MMMHWZ4ENOAakaijZKhcRDWagygGBLc3TIx6if+3pB67EG0KPAX/234s6tUMdIM
 QmTiBcwyYhftnXGZS3fNEA2eBgmeyzClFxvY9hbypccCzhX6euIbnpAXECHHi3lYC3WNJc
 B/NvUUjlk5ViYRe4zeMNYqUnPaLoUtq/joeTALInZAHI5zLHDjQEJDWuyXimHuK2Ix60VL
 j6cNbQl30qfYHq842JpJQhUFghjxkEJmEnFVFr03GlnpJpOUw5QIxnRpfGsbss9UXYU8J8
 izaBfXU7BxNwL6zv79oryUBkGqhTzyHigMW6jrE4Eka/2YmK6yVun+ns05bMIA==
Date: Thu, 28 Apr 2022 23:38:39 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220428233839.1c12dfb4@windsurf>
In-Reply-To: <20220428202416.3560203-1-bernd.kuhls@t-online.de>
References: <20220428202416.3560203-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.15.7
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

On Thu, 28 Apr 2022 22:24:16 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes: https://www.samba.org/samba/history/samba-4.15.7.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/samba4/samba4.hash | 4 ++--
>  package/samba4/samba4.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
