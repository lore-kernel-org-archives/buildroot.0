Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B16C0C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 20:15:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 543666124B
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 20:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 543666124B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A57C407C4;
	Sun,  3 Oct 2021 20:15:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fmKLAZ6DE6HI; Sun,  3 Oct 2021 20:15:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F55A40521;
	Sun,  3 Oct 2021 20:15:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DFD9F1BF44A
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 20:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF66460B1C
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 20:15:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VYQoLriBIqum for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 20:15:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09B9B605BB
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 20:15:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1d3d:918b:43fc:aadd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 31B2913F89A;
 Sun,  3 Oct 2021 22:15:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633292136;
 bh=QViJZoPXPcvtTqlelvBOBKhJ3+zhol0LVsyJN0T2cAo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LHKAUY330kaX72VxoOCEhhDA2Ahf1+C5zDpfu1CH6SpXmsaegx33OW9buIJT30cae
 1t7sdQ7qMX3SqDbypR6vAoQgnGQhET2SeHjnLOvqJ+Jpr3Ll8m3n1rjDeLn9sJI78y
 JooHt2ovqvXEDFnKGuCyomSa9j7YqHkM0Dwu0YbH3Ro8/QJfpurYb3Gl7+/Gn4pdrm
 iv8fytJrdmDRwkvzohKC4pg3Xf1L7GplZQ1uIai4mSkXEw/PeOg6BJVR9d/bVbi+Nt
 p7mnxd8/l9/EiRP2K88F1eQGvZzcCUuveM2wbPWuuoXmkThOa/2XGp9gXXq/LQ1rXg
 S3sMfQjRoSp3Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Oct 2021 22:15:27 +0200
Date: Sun, 3 Oct 2021 22:15:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20211003201527.GX1504958@scaer>
References: <20210924124525.168298-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210924124525.168298-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: remove
 gst1-plugins-good from dependencies
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Philippe Normand <philn@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2021-09-24 06:45 -0600, James Hilliard spake thusly:
> This is only a runtime dependency not a build dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/wpewebkit/wpewebkit.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
> index 5c5e6625f8..50714b4366 100644
> --- a/package/wpewebkit/wpewebkit.mk
> +++ b/package/wpewebkit/wpewebkit.mk
> @@ -39,7 +39,7 @@ ifeq ($(BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA),y)
>  WPEWEBKIT_CONF_OPTS += \
>  	-DENABLE_VIDEO=ON \
>  	-DENABLE_WEB_AUDIO=ON
> -WPEWEBKIT_DEPENDENCIES += gstreamer1 gst1-libav gst1-plugins-base gst1-plugins-good
> +WPEWEBKIT_DEPENDENCIES += gstreamer1 gst1-libav gst1-plugins-base
>  else
>  WPEWEBKIT_CONF_OPTS += \
>  	-DENABLE_VIDEO=OFF \
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
