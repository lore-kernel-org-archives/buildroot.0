Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA947C77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 16:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5940A42833;
	Sat,  6 May 2023 16:14:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5940A42833
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id owwZvd-jjn7i; Sat,  6 May 2023 16:14:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACD4841F8B;
	Sat,  6 May 2023 16:14:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACD4841F8B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 588E81BF36A
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 16:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EC20610C9
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 16:11:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EC20610C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m8jJ-f8sP-yO for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 16:11:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35C2D60F3B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 35C2D60F3B
 for <buildroot@buildroot.org>; Sat,  6 May 2023 16:11:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:ae89:1f5e:7283:231f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 77F1FB00576;
 Sat,  6 May 2023 18:11:05 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 May 2023 18:11:05 +0200
Date: Sat, 6 May 2023 18:11:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@aperture.us>
Message-ID: <20230506161105.GS252090@scaer>
References: <20230504071546.3435096-1-christian@aperture.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230504071546.3435096-1-christian@aperture.us>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683389468;
 bh=UiMZR/+Toa5JPo2URMLqhzBC/q4oY3UrkkczmWF2ZCk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=epfHKif/xvty6mlL+vTDRffpcrOy9ZwtHNoY4s0VbENxK5FwkkIPedOJar7wU2Xvj
 iHoaCGPItVloT7h2rl18Djjwic8jqng6D8kZwal9dq/Qde8Jolog8BRjwSZRjb+DFI
 acV7016C9H+S1/YSk1dndiNSdn+73RKOK3y+uKHHUMJBy29yHSu/zK3J8elofTG2VB
 Z5TPus5IGzifocX3P0BTS/LbfEbDUOM46rp9PickbZHtCxMjfTIp0HhpnBDopHqtbX
 JZoalYYL6Xj2HbUUiKimLad+ANQSCBydRQiXV6+Pe4X6RxlAMrK9MnRid2CEqFiJ1U
 IwNyK2oXL/TVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=epfHKif/
Subject: Re: [Buildroot] [PATCH v2 1/1] package/fuse-overlayfs: bump version
 to 1.11
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2023-05-04 00:15 -0700, Christian Stewart via buildroot spake thusly:
> https://github.com/containers/fuse-overlayfs/releases/tag/v1.11
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> 
> v1 -> v2:
> 
>  - fix filename mistake in hash file
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  package/fuse-overlayfs/fuse-overlayfs.hash | 2 +-
>  package/fuse-overlayfs/fuse-overlayfs.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/fuse-overlayfs/fuse-overlayfs.hash b/package/fuse-overlayfs/fuse-overlayfs.hash
> index aa5438755e..0386687e6f 100644
> --- a/package/fuse-overlayfs/fuse-overlayfs.hash
> +++ b/package/fuse-overlayfs/fuse-overlayfs.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  4351eaed7cf26a5012c14c6e0fc883ef65a7b5dcc95ba129ce485904106c25a9  fuse-overlayfs-1.10.tar.gz
> +sha256  d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed  fuse-overlayfs-1.11.tar.gz
>  # Locally computed
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/fuse-overlayfs/fuse-overlayfs.mk b/package/fuse-overlayfs/fuse-overlayfs.mk
> index 1633d3bd41..4db2ccd7d5 100644
> --- a/package/fuse-overlayfs/fuse-overlayfs.mk
> +++ b/package/fuse-overlayfs/fuse-overlayfs.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FUSE_OVERLAYFS_VERSION = 1.10
> +FUSE_OVERLAYFS_VERSION = 1.11
>  FUSE_OVERLAYFS_SITE = $(call github,containers,fuse-overlayfs,v$(FUSE_OVERLAYFS_VERSION))
>  FUSE_OVERLAYFS_LICENSE = GPL-3.0
>  FUSE_OVERLAYFS_LICENSE_FILES = COPYING
> -- 
> 2.40.1
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
