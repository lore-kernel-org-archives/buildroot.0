Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A577C001DC
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 08:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6B8A82281;
	Sat, 29 Jul 2023 08:55:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6B8A82281
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0hsyZHy1erBO; Sat, 29 Jul 2023 08:55:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5FDD82B21;
	Sat, 29 Jul 2023 08:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5FDD82B21
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 948321BF3FC
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 08:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D9C560B5C
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 08:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D9C560B5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N5kDtUMZ8NPB for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 08:55:17 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E729C608F5
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 08:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E729C608F5
Received: by mail.gandi.net (Postfix) with ESMTPSA id D0EEAFF802;
 Sat, 29 Jul 2023 08:55:13 +0000 (UTC)
Date: Sat, 29 Jul 2023 10:55:12 +0200
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Message-ID: <20230729105512.080a5ba1@windsurf>
In-Reply-To: <20230728212952.3890970-1-brandon.maier@collins.com>
References: <20230728212952.3890970-1-brandon.maier@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690620914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QK3r6EGM7W3HuUTUQ2IeORdztFdj02LRg0AZoihFWmQ=;
 b=JyZiGKCXpDWydY/EvhOzAedqfow5O8tRa7/IWJA9qDJp8n7CmsfJn7HUqCbH5xN7xg9/z4
 5yoI9FgGwnB4OsDeTJJIIqSFZ3MC1ok5fhJaQy8w14POqMEuzh5yixOtRguJppdBUJJEgs
 Z5UBpHK36fK7emNa9WGqHfG7arai6Y7stvx8SVwLLCjxZPMihS7J0nSkGPacBQxqKjEtV7
 yxHdkkWW7mKCEXPbW7ZHTaMXRYzudhlwQW2pjRZrBgXBsM3CIJqW05awrbq4JhOKDfZzB2
 JwnAFaTFHYmSLMoDLZ5GyoKYD9wUoZJ8dvk7/tDq6pG9v9/bxs1n+IV0vQP5QQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JyZiGKCX
Subject: Re: [Buildroot] [PATCH 1/1] package/libubootenv: backport fix for
 NOR flashes
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 28 Jul 2023 21:29:52 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> Fixes a bug present since v0.3.3 that causes extremely slow writes to
> NOR flashes.
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
>  ...-fix-bug-when-SPI-flash-write-size-s.patch | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 package/libubootenv/0002-Revert-fw_setenv-fix-bug-when-SPI-flash-write-size-s.patch

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
