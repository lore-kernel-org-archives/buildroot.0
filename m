Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CA4C433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 21:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0159A60E8A;
	Sun, 30 Jan 2022 21:59:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qp7MuMUDmsrT; Sun, 30 Jan 2022 21:59:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35FE160E89;
	Sun, 30 Jan 2022 21:59:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 067181BF20B
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 21:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02069409B3
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 21:59:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Qz0EKT2FiVz for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 21:59:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0254340922
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 21:59:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EEC9D1BF205;
 Sun, 30 Jan 2022 21:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643579964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QWZSHp5sxB66ingmkObKfsobYvAaY13mgyiu2WiCsU8=;
 b=gRrkXEE58dgvjfX+OweAb9IvvMaGR3sY0lJ9aeLoWBwBGmYUXv0Gzmxw9oXVEVzEuREW8e
 1oc8M/vn5GE+L+KhyIXb4vwABChytQ7EzU/F+GqKuQhQanNkztJ8q48bm++/ZWfYrmUxzd
 sw3XZnimpa/Nqi6Ucoe8eK29/1BB5wg/FOny5TXsQ/sutDUkfKc6Cts50tX85vxqSF3nxl
 WxUqk98nslR5MAlBRlJ6B4AQ4YoEcVfJRjqjIE6AGia/+R5eo8uRWTUuGS/bvO06LfxfP+
 pU07QP+MzYd0vgJV7TvzAlZdyl/YzpYKJx7fwMvk9ltZUzkJ5fJXWru4LJ7hUw==
Date: Sun, 30 Jan 2022 22:59:22 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220130225922.066b338f@windsurf>
In-Reply-To: <20220128110542.1101197-3-giulio.benetti@benettiengineering.com>
References: <20220128110542.1101197-1-giulio.benetti@benettiengineering.com>
 <20220128110542.1101197-3-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/pistache: disable package if
 affected by BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Pierre Ducroquet <pinaraf@pinaraf.info>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 28 Jan 2022 12:05:42 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Package pistache is affected by binutils bug 27597(Nios II), so let's
> disable it when BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597=y. Let'a also indent
> the comment dependencies.
> 
> Fixes:
> http://autobuild.buildroot.net/results/0e7b74c5a07ced2bbae1a0a8c7d7ba26dfa04031/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/pistache/Config.in | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

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
