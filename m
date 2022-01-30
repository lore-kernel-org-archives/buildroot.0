Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F66C433EF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 14:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6D7F8318C;
	Sun, 30 Jan 2022 14:17:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X2vsXoHW-NCy; Sun, 30 Jan 2022 14:17:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BC468315C;
	Sun, 30 Jan 2022 14:17:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CAC1D1BF425
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2D3E8317B
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:17:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k_3Q6gGcXLyL for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 14:17:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B7209829FE
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 14:17:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 95AFD1C0004;
 Sun, 30 Jan 2022 14:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643552264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GmvUvoMXb9pMrJ9KKyN1d58AHx/JZ+zhqsoP9cxW0gc=;
 b=RDuKHENB/SjBzibqJ9Fa6AF0AzvgXIfwoM784NHQonhKkx9Pb0d+aNO8/TZVdSZYGZX5I+
 WZQgLnneO3Ez0dnMOFFzI83BN7cdcPasapQIgvOFhdCx247GWtuL5IGt2yCl7h4V8lg5m8
 LgpjyXubwgilLgMkfVm1vETW1wSngPngYgcZARDC+6XikWPCVopzxQDGnzntpi50g6gnFL
 JQnCr4eGDSIqfYCeTRT/1xf6v0KhsbDF2noIKLyf3D6i+oZRtZeqZi6+4lZh6INl5L2kPf
 Cs6etfe/qX63DMIwMDGshvEPUYyylOK1U8rU2KcKoJE0KR0c21QzRp0Uo/aKYg==
Date: Sun, 30 Jan 2022 15:17:43 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220130151743.1dc28539@windsurf>
In-Reply-To: <20220129203438.3855797-1-james.hilliard1@gmail.com>
References: <20220129203438.3855797-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/{rust,
 rust-bin}: bump to version 1.58.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 29 Jan 2022 13:34:38 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/rust-bin/rust-bin.hash | 198 ++++++++++++++++-----------------
>  package/rust-bin/rust-bin.mk   |   2 +-
>  package/rust/rust.hash         |   6 +-
>  package/rust/rust.mk           |   2 +-
>  4 files changed, 104 insertions(+), 104 deletions(-)

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
