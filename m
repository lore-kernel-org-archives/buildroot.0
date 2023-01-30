Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4DEC636CD
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 21:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C85D41C67;
	Mon, 30 Jan 2023 21:17:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C85D41C67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6vvAmT1eIDLv; Mon, 30 Jan 2023 21:17:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0967C41CD3;
	Mon, 30 Jan 2023 21:17:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0967C41CD3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C61241BF44A
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FF3E81F0A
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:16:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FF3E81F0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XNAuDURbaELr for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 21:16:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AECF81EA4
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4AECF81EA4
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 21:16:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 414B1240004;
 Mon, 30 Jan 2023 21:16:38 +0000 (UTC)
Date: Mon, 30 Jan 2023 22:16:37 +0100
To: Jerry Kooyman via buildroot <buildroot@buildroot.org>
Message-ID: <20230130221637.3077e249@windsurf>
In-Reply-To: <20230130150613.829127-1-jerry.kooyman@entrust.com>
References: <20230130150613.829127-1-jerry.kooyman@entrust.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675113398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zxQx1NJ4yhKC+J99DZM/zRXGUZkVI8E7iHjEa9vKkX4=;
 b=Jqj5suX2Lt2oLuhTd8xsL5hl6YVzARnCxPnFCZv18e5v4iylDVx8He2a/tlVIoN+Itb1YD
 Epj7LUg+HSn7GPIYpGF6Ro9uSFW8TBQjm6ZY5nwnCl0ccv8HPmaBeG+KjY/jfdvD0Gr2ej
 XOSoZc6RLLyeIaGEcbYmb/UCN6sPOAsjzkgrnljEH128qmweQQy9OVfaUshtO0bpLRq53T
 QyIkpCQJMnZEnUEe6Dd3bV9dEHbWctwR792XMtcvd/rMrnZX965ELjSkeTYrStDvC61ygW
 Ore4oN1h40mrpEOf3ZURYYgomNqGUFgD5EM96wGQytmIzxgjWkvO9eeXEHEFxA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Jqj5suX2
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot: add
 BR2_TARGET_UBOOT_NEEDS_XXD option
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
Cc: jerry.kooyman@entrust.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 30 Jan 2023 09:06:13 -0600
Jerry Kooyman via buildroot <buildroot@buildroot.org> wrote:

> From: Jerry Kooyman <jerry.kooyman@entrust.com>
> 
> A host dependency to xxd is required if the U-Boot board
> configuration has CONFIG_USE_DEFAULT_ENV_FILE enabled. So
> introduce a new BR U-Boot config option BR2_TARGET_UBOOT_NEEDS_XXD
> to solve this problem. xxd is provided by host-vim.
> 
> Signed-off-by: Jerry Kooyman <jerry.kooyman@entrust.com>
> ---
>  boot/uboot/Config.in | 8 ++++++++
>  boot/uboot/uboot.mk  | 4 ++++
>  2 files changed, 12 insertions(+)

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
