Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F1AC38142
	for <buildroot@archiver.kernel.org>; Tue, 24 Jan 2023 08:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07F3F4012D;
	Tue, 24 Jan 2023 08:19:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07F3F4012D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XIMn7jGNYci1; Tue, 24 Jan 2023 08:19:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FEE640BAE;
	Tue, 24 Jan 2023 08:19:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FEE640BAE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C9F0E1BF2C9
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 08:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9608F81A47
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 08:18:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9608F81A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NIQBzOW3-6IN for <buildroot@lists.busybox.net>;
 Tue, 24 Jan 2023 08:18:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CDFE81A34
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CDFE81A34
 for <buildroot@buildroot.org>; Tue, 24 Jan 2023 08:18:56 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B0BA5240017;
 Tue, 24 Jan 2023 08:18:51 +0000 (UTC)
Date: Tue, 24 Jan 2023 09:18:50 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20230124091850.0cabaa3e@booty>
In-Reply-To: <20221215111831.11956-1-neal.frager@amd.com>
References: <20221215111831.11956-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1674548332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S82uXIyOrNyqDgQur9zh3L4KjLGQxi53WNFylPqdf/U=;
 b=LYA7mS7fOtJGgWwit6Xal23NU5Ey2U2YD+hfz89UjH1nHD/gnFTDvesSp7mAzC7qiBUiOS
 3NXv79I934DzPvIkM5fgtBbm4u4J34K4fsV/taYQIDm09HK5VaHYCUi7JpPBRx5QGK6SMs
 Bhr5I6eyaTpbUE0oBn6Oz8dYvjfrafmXOvtqv88YmWiWZAizlDGN+njRtsSYGENnQBSRmP
 D2tEcRzTrGT2uVi9FrzkU5c0SDRvQ9qsW76m4eeZG5V1M5dQcY0TOlTC+0cNBs7sXmJwK/
 UBPAsdYkVuY1TH5MGxDlBSDfuDv7kiLl6y5jfeeNuwgjDbcl0Jznzfkrq1ASmw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LYA7mS7f
Subject: Re: [Buildroot] [PATCH v2 1/1] board/zynqmp/kria/uboot.fragment:
 remove unnecessary configs
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: michal.simek@amd.com, thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On Thu, 15 Dec 2022 11:18:31 +0000
Neal Frager <neal.frager@amd.com> wrote:

> Reduce the configs in the kria/uboot.fragment to only what is necessary.
> 
> This patch has been build and run tested on a kria kv260 starter kit.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Apologies for the delay. I was hoping to test this patch, but I'm not
yet there, so for the moment I have a question below.

> ---
> V1->V2:
>   - CONFIG_DTB_RESELECT is no longer removed
> ---
>  board/zynqmp/kria/uboot.fragment | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/board/zynqmp/kria/uboot.fragment b/board/zynqmp/kria/uboot.fragment
> index 9e32edfb36..a6a262a562 100644
> --- a/board/zynqmp/kria/uboot.fragment
> +++ b/board/zynqmp/kria/uboot.fragment
> @@ -6,9 +6,5 @@ CONFIG_PHY=y
>  CONFIG_PHY_XILINX_ZYNQMP=y
>  CONFIG_PINCTRL=y
>  CONFIG_PINCONF=y
> -CONFIG_POWER_DOMAIN=y
> -CONFIG_ZYNQMP_POWER_DOMAIN=y
> -CONFIG_DM_RESET=y
> -CONFIG_RESET_ZYNQMP=y

Does this prevent the 'reset' command in U-Boot from working?

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
