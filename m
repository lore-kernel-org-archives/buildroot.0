Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7C6C636CC
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 12:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA2A880F92;
	Sun,  5 Feb 2023 12:21:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA2A880F92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sAdBxBt-50Zg; Sun,  5 Feb 2023 12:21:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40D3480E4F;
	Sun,  5 Feb 2023 12:21:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40D3480E4F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 65DC51BF364
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C95380DB6
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:20:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C95380DB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z99edeo2Jbqj for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 12:20:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B4B480DA5
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B4B480DA5
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 12:20:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BB47660002;
 Sun,  5 Feb 2023 12:20:54 +0000 (UTC)
Date: Sun, 5 Feb 2023 13:20:53 +0100
To: Graeme Smecher <gsmecher@threespeedlogic.com>
Message-ID: <20230205132053.740a7efe@windsurf>
In-Reply-To: <20230201195956.1758827-1-gsmecher@threespeedlogic.com>
References: <20230201195956.1758827-1-gsmecher@threespeedlogic.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675599655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g5cCbKKxumBqDpghlrq5exnmKilYuueUIoCE7nqUVSc=;
 b=RyZvznLqm71Z8e50G2OtGma+mM+/PV6PEhJhSN+GRawXgzf0ETSUnr97QS8Hize4vpIJUh
 4GGWJjdyD9WIHWL4doWu6wIrRAu6KPhCzg1nehiytOElN8lFQdCJd6e9Z5e9NQ0/lPb+PU
 5FlUNmqS8ckoaJXyHoLeMeUsWX9+IRN+oQl4gtid9twPIwJLG4BkBBdCeqBY7AJ6JoYALS
 oA9CspECZ/VVtdEVJ7QMVCOXAngl1sfa1yjbKpdp4tW0OWabGWqlIPTxqS0F6w+4saEnzU
 paG9RgZ2mleRW4u31BBiLberxx4uydHpkuxYBbj2swXpcq8UaPUCmRJuJgz4nA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RyZvznLq
Subject: Re: [Buildroot] [PATCH 1/1] board/zynqmp/post-image.sh: Don't
 insist on a xilinx/ prefix for .dts files.
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
Cc: Neal Frager <neal.frager@amd.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  1 Feb 2023 11:59:56 -0800
Graeme Smecher <gsmecher@threespeedlogic.com> wrote:

> If using BR2_LINUX_KERNEL_CUSTOM_DTS_PATH to copy .dts files from
> buildroot into the linux tree, these .dts files are copied to
> arch/arm64/boot. Unfortunately, the post-image.sh script expects to find
> them in arch/arm64/boot/xilinx.
> 
> This patch does not require the xilinx/ prefix to be present when
> symlinking the device-tree to system.dtb where u-boot expects to find
> it.
> 
> Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>
> ---
>  board/zynqmp/post-image.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
