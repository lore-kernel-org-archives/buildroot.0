Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F291C05027
	for <buildroot@archiver.kernel.org>; Thu,  2 Feb 2023 08:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66018402E0;
	Thu,  2 Feb 2023 08:21:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66018402E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yigx3NmmBmGG; Thu,  2 Feb 2023 08:21:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AC01402E2;
	Thu,  2 Feb 2023 08:21:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AC01402E2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 63E9B1BF386
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 08:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39B8C402E0
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 08:21:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39B8C402E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2UKXmgA3VGQI for <buildroot@lists.busybox.net>;
 Thu,  2 Feb 2023 08:21:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D7B4402DC
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D7B4402DC
 for <buildroot@buildroot.org>; Thu,  2 Feb 2023 08:21:27 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 14402C000C;
 Thu,  2 Feb 2023 08:21:21 +0000 (UTC)
Date: Thu, 2 Feb 2023 09:21:20 +0100
To: Graeme Smecher <gsmecher@threespeedlogic.com>
Message-ID: <20230202092120.319d6b00@booty>
In-Reply-To: <a8bf6373-ac4c-1872-3943-8fa9c6594ca5@threespeedlogic.com>
References: <20230201195956.1758827-1-gsmecher@threespeedlogic.com>
 <20230201225237.0fb5dacb@booty>
 <a8bf6373-ac4c-1872-3943-8fa9c6594ca5@threespeedlogic.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675326082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wN4XXLsgI0qEAuBwL8DD1w5Gxt0DDvG0CpUg6tWnQFQ=;
 b=liTI5brYriNeE0KMDwkYbzHewwuBIk6917pZPD8gLqQ7M/cAoq+ejN0gnuQUGoTvir/zw6
 Yyn/goI9mAGOlNxe34za1bW3Ef8NGrteOR0xVrd1fS/tMJAxwkTWHpmyM/J6IFVx4cYJL6
 9uMkXAcyYQBUjOpvgcBfPbem/sfcvltmmozAOx+kUFhPURxFlcKeSxvA7R9nOGGugWY9NE
 fr35F2e4LKHxec5pfeD1GSSfrl9guxnQe3PVOHinAclR4Ck230oleuuyE4yILsIK6BABPD
 KBhdISz1lYKeui4aW9t2Ven0/dDHb+7juE3qYGpA5hQAO3gbGes0ZsDYQ9+Qww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=liTI5brY
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Graeme,

On Wed, 1 Feb 2023 14:16:47 -0800
Graeme Smecher <gsmecher@threespeedlogic.com> wrote:

> Hi Luca,
> 
> On 2023-02-01 13:52, Luca Ceresoli wrote:
> > Hi Graeme,
> > 
> > On Wed,  1 Feb 2023 11:59:56 -0800
> > Graeme Smecher <gsmecher@threespeedlogic.com> wrote:
> >   
> >> If using BR2_LINUX_KERNEL_CUSTOM_DTS_PATH to copy .dts files from
> >> buildroot into the linux tree, these .dts files are copied to
> >> arch/arm64/boot. Unfortunately, the post-image.sh script expects to find
> >> them in arch/arm64/boot/xilinx.
> >>
> >> This patch does not require the xilinx/ prefix to be present when
> >> symlinking the device-tree to system.dtb where u-boot expects to find
> >> it.
> >>
> >> Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>
> >> ---
> >>   board/zynqmp/post-image.sh | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/board/zynqmp/post-image.sh b/board/zynqmp/post-image.sh
> >> index ed6dbe188c..c5de2db820 100755
> >> --- a/board/zynqmp/post-image.sh
> >> +++ b/board/zynqmp/post-image.sh
> >> @@ -5,7 +5,7 @@
> >>   # devicetree listed in the config.
> >>   
> >>   FIRST_DT=$(sed -nr \
> >> -               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/([-_/[:alnum:]\\.]*).*"$|\1|p' \
> >> +               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \  
> > 
> > I think the following simpler change would also work. Can you check
> > that please?
> > 
> > -               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/([-_/[:alnum:]\\.]*).*"$|\1|p' \
> > +               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="([-_/[:alnum:]\\.]*).*"$|\2|p' \  
> 
> Assuming you intended \1, not \2 here - this suggestion breaks behaviour for a couple of defconfigs in the tree. If I run the ZCU106 defconfig through this regexp, I get:
> 
> 	$ cat configs/zynqmp_zcu106_defconfig | sed -nr -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="([-_/[:alnum:]\\.]*).*"$|\1|p'
> 	xilinx/zynqmp-zcu106-revA
> 
> ...this creates a dangling symlink in output/images (system.dtb -> xilinx/zynqmp-zcu106-revA.dtb).

Right.

> The right behaviour is to strip any prefixes that exist, without requiring any. Something like:
> 
> -               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/([-_/[:alnum:]\\.]*).*"$|\1|p' \
> +               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(.*/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \
> 
> This is less Xilinx-specific, although it seems a tad greedy.

Yes, better keeping the xilinx prefix as this is a xilinx-specific
script anyway.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
