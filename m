Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E198C77B71
	for <buildroot@archiver.kernel.org>; Fri, 14 Apr 2023 18:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FCA18441B;
	Fri, 14 Apr 2023 18:31:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FCA18441B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x34hrGJdxF4B; Fri, 14 Apr 2023 18:31:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C244E84405;
	Fri, 14 Apr 2023 18:31:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C244E84405
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C37FE1C3E9E
 for <buildroot@lists.busybox.net>; Fri, 14 Apr 2023 18:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9CAD84405
 for <buildroot@lists.busybox.net>; Fri, 14 Apr 2023 18:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9CAD84405
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hsE8xchFAwFS for <buildroot@lists.busybox.net>;
 Fri, 14 Apr 2023 18:31:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B201184404
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B201184404
 for <buildroot@buildroot.org>; Fri, 14 Apr 2023 18:31:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 122395FF95;
 Fri, 14 Apr 2023 20:31:24 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 14 Apr 2023 20:31:23 +0200
Date: Fri, 14 Apr 2023 20:31:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20230414183123.GX2819@scaer>
References: <20230413170435.18131-1-aduskett@gmail.com>
 <20230413170435.18131-2-aduskett@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230413170435.18131-2-aduskett@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681497086;
 bh=eVzfbiC+Smb7j5Q3OJJBM7JPIuKo9ZIxObWKpJmuQok=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kLKJzVCCDLtf/6/nplv34D+/E8Bxqn3pezXwcMPayZzL1kXRNzR8jwx9UiBq/qPbx
 mjI6zTwUTfN2Up8W/r/1sC0w20Vi6SJy+Yqr+2aCAgiQ48hW0Os6ON1r/PZDfZP89Z
 xZEwf7yghea54flTKPG2WPKZ7LZkzyU8saA08dAjUv9DrHlsSeZ5FPBq658lMpBBin
 wIQQRmByDy1Jp3WH+DB68WLOVNJ7UxDr70ccDQrsr/YilHrpA+ZJC1WLIweZwi7mHP
 UcR1hb1cvQthTD5y3PmE7PQs76rt2FHJ9mveit12iLzMso49q+wzq197qs6oWYBeRl
 X+EPtl53AI/EA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kLKJzVCC
Subject: Re: [Buildroot] [PATCH 2/2] board/pc/linux.config: Add framebuffer
 and pci support
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2023-04-13 10:04 -0700, Adam Duskett spake thusly:
> These small options allow the pc defconfigs to boot using default
> virtual machine manager KVM options.

These new options are not specific to running in a VM; they also apply
to running on reald hardware (and that's arguably where they are more
interesting, in fact).

> Let's use a more modern kernel with a broader range of hardware support
> for PCs.

I dropped this sentence (it was part of the previous commit!), and I
replaced it with an explanation why we choose to enable each of these
options.

> Signed-off-by: Adam Duskett <aduskett@gmail.com>

Applied to master, thanks.

> ---
>  board/pc/linux.config | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/board/pc/linux.config b/board/pc/linux.config
> index f86352e1ea..c26c2a9d00 100644
> --- a/board/pc/linux.config
> +++ b/board/pc/linux.config
> @@ -15,6 +15,7 @@ CONFIG_IP_NF_FILTER=y
>  CONFIG_CFG80211=m
>  CONFIG_CFG80211_WEXT=y
>  CONFIG_MAC80211=m
> +CONFIG_PCI=y
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
>  CONFIG_VIRTIO_BLK=y
> @@ -63,7 +64,11 @@ CONFIG_DRM_I915=y
>  CONFIG_DRM_QXL=y
>  CONFIG_DRM_BOCHS=y
>  CONFIG_DRM_VIRTIO_GPU=y
> +CONFIG_FB=y
> +CONFIG_FIRMWARE_EDID=y
>  CONFIG_FB_VESA=y
> +CONFIG_FB_EFI=y
> +CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER=y
>  CONFIG_SOUND=y
>  CONFIG_SND=y
>  CONFIG_SND_HDA_INTEL=y
> -- 
> 2.40.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
