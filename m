Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704C9C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 15:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A40340C29;
	Mon, 25 Jul 2022 15:31:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A40340C29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mxHAodWjSdUa; Mon, 25 Jul 2022 15:31:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AE54408BC;
	Mon, 25 Jul 2022 15:31:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AE54408BC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 223881BF2BD
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 15:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFF9C408BC
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 15:31:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFF9C408BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TH7LiLsSx9Y9 for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 15:31:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71850400AB
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71850400AB
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 15:31:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6F13F6000F;
 Mon, 25 Jul 2022 15:31:36 +0000 (UTC)
Date: Mon, 25 Jul 2022 17:31:35 +0200
To: Hanspeter Portner <dev@open-music-kontrollers.ch>
Message-ID: <20220725173135.54be590b@windsurf>
In-Reply-To: <20210610105739.488491-1-dev@open-music-kontrollers.ch>
References: <20210610105739.488491-1-dev@open-music-kontrollers.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658763096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nhGCg/EhUuPDgZ8hP+X2P6gl9QJMA69PsKMfYYoJWzc=;
 b=nXzOeuP7+FoiAUSBBuhkiptIfem8RKHN07EPE8imht7Nrzb7y2N9XjN7J84nn0elXogBT7
 VmTf5uQAhTr5ucrQ5dzRPql5JxEMVdEN9HK6m6dkLsxRW54ikHRnQ2b9vCq+uMYeDzruqu
 yl2ANzDWjTqj24YelE5Zk/KVaQYt9ZccDDFFFWPJhcCjo9y0WVtnkCuMsKmvcdp9I9sF6n
 Z2bcKVe3tRUmGF2BVaeMir6KxaebDjDLANet+qeXkZtEQcFrKcWbrTv4CFutZB5jIPz1R+
 +KJfCudl9glqKj9op4nNuhvjATk/X4CSXi1WFOz95G0DwE7FELx9mhN1iWBGXA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nXzOeuP7
Subject: Re: [Buildroot] [PATCH 1/1] configs/toradex_colibri_imx6: initial
 commit
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

Hello Hanspeter,

On Thu, 10 Jun 2021 12:57:39 +0200
Hanspeter Portner <dev@open-music-kontrollers.ch> wrote:

> Based on configs/toradex_apalis_imx6 with Toradex' mainline linux/uboot
> branches.
> 
> Tested on:
>   Module:    'Toradex Col IMX6DL 512MB V1.0A'
>   Evalboard: 'Toradex Col Evaluation V3.2A'
> 
> Signed-off-by: Hanspeter Portner <dev@open-music-kontrollers.ch>
> ---
>  board/toradex/colibri-imx6/genimage.cfg  | 15 +++++++
>  board/toradex/colibri-imx6/post-image.sh | 20 +++++++++
>  board/toradex/colibri-imx6/readme.txt    | 53 ++++++++++++++++++++++++
>  board/toradex/colibri-imx6/uEnv.txt      |  7 ++++
>  configs/toradex_colibri_imx6_defconfig   | 25 +++++++++++
>  5 files changed, 120 insertions(+)
>  create mode 100644 board/toradex/colibri-imx6/genimage.cfg
>  create mode 100755 board/toradex/colibri-imx6/post-image.sh
>  create mode 100644 board/toradex/colibri-imx6/readme.txt
>  create mode 100644 board/toradex/colibri-imx6/uEnv.txt
>  create mode 100644 configs/toradex_colibri_imx6_defconfig

Thanks for your contribution. However, you got some feedback in January
2022, which requested some changes/improvements, but unless we missed
it, we did not receive an updated version of your patch.

I will now mark your patch as "Changes Requested" in our patch tracking
system.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
