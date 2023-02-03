Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF67BC636CC
	for <buildroot@archiver.kernel.org>; Fri,  3 Feb 2023 07:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30D6C416EF;
	Fri,  3 Feb 2023 07:47:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30D6C416EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I0xMoN1Xp0Mw; Fri,  3 Feb 2023 07:47:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCB3D416F2;
	Fri,  3 Feb 2023 07:47:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCB3D416F2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 524C91BF3A8
 for <buildroot@lists.busybox.net>; Fri,  3 Feb 2023 07:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B5CA60E60
 for <buildroot@lists.busybox.net>; Fri,  3 Feb 2023 07:47:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B5CA60E60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KEB8ez7q5L_M for <buildroot@lists.busybox.net>;
 Fri,  3 Feb 2023 07:47:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E696B60D64
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E696B60D64
 for <buildroot@buildroot.org>; Fri,  3 Feb 2023 07:47:47 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5D958E0008;
 Fri,  3 Feb 2023 07:47:44 +0000 (UTC)
Date: Fri, 3 Feb 2023 08:47:43 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20230203084743.0c49f73c@booty>
In-Reply-To: <20230202133817.56293-1-neal.frager@amd.com>
References: <20230202133817.56293-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675410465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qp0UmLCZNg9JYN5EHU4bZhJsMLCiTUBhMJWo/Zi3UgQ=;
 b=MLv5dshJovW2RIDpCdsglszo4X6EboDvnBZ0wbX4PxE7/koElGAy8fFvVLpo2cC1e5uiSd
 4kjIpCebD8vtcTH0CoXFW/GFfR5fe70NMGSgRwLanOq3fCdV0661A0/O9ROsRPQa7T87P+
 by2oVPskhKQfFrqY9V/5yjQ9BtiNi5ZVMhb9PnCpmqxt9RArh7gZrvLMdkBHv8ADFMrT8k
 +6+dzE/ag7/b+29mPAiSNA4drqAflMrHTVUNZ/YLNJcNz8GP1bFxvDba3muLZ3r9PzMoRL
 UL/LZiSq8iNggSvJwJfJGFGggp0CW+zys8HjWP5YFjqCC6zPr1QMMfB7zFEtxA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MLv5dshJ
Subject: Re: [Buildroot] [PATCH v1 1/1] board/versal/post-image.sh: do not
 require xilinx/ prefix for .dts files
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
Cc: ibai.erkiaga-elorza@amd.com, gsmecher@threespeedlogic.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On Thu, 2 Feb 2023 13:38:17 +0000
Neal Frager <neal.frager@amd.com> wrote:

> If using BR2_LINUX_KERNEL_CUSTOM_DTS_PATH to copy .dts files from
> buildroot into the linux tree, these .dts files are copied to
> arch/arm64/boot. Unfortunately, the post-image.sh script expects to find
> them in arch/arm64/boot/xilinx.
> 
> This patch does not require the xilinx/ prefix to be present when
> symlinking the device-tree to system.dtb where u-boot expects to find
> it.
> 
> It is effectively applying the below patch for zynqmp to versal as well:
> https://patchwork.ozlabs.org/project/buildroot/patch/20230201195956.1758827-1-gsmecher@threespeedlogic.com/
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  board/versal/post-image.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/versal/post-image.sh b/board/versal/post-image.sh
> index f45f29a155..92e65ed3b7 100755
> --- a/board/versal/post-image.sh
> +++ b/board/versal/post-image.sh
> @@ -5,7 +5,7 @@
>  # devicetree listed in the config.
>  
>  FIRST_DT=$(sed -nr \
> -               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/([-_/[:alnum:]\\.]*).*"$|\1|p' \
> +               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
