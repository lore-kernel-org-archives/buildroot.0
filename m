Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D1FC46CD2
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 22:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34C9641C61;
	Wed, 27 Dec 2023 22:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34C9641C61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6kpNGNTXZCCx; Wed, 27 Dec 2023 22:31:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A9D741C36;
	Wed, 27 Dec 2023 22:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A9D741C36
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A9D451BF3E3
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 22:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81A2841A14
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 22:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81A2841A14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TSKClyd4xwAx for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 22:31:10 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 30BA440124
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 22:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30BA440124
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 58BE6B00548;
 Wed, 27 Dec 2023 23:31:04 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 27 Dec 2023 23:31:04 +0100
Date: Wed, 27 Dec 2023 23:31:04 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <ZYylqNlJBI4-Uouq@landeda>
References: <20231109212901.5596-1-ps.report@gmx.net>
 <20231109212901.5596-4-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231109212901.5596-4-ps.report@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703716268;
 bh=QalrgyUFAwG86Wbn3yP0qLnG6c0vQE8VGhiuajUskr4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f0mCf83b7hVO49uMa0yxhhVAwljb4i9IiRo53PeU73TkqDZno8qDH6V9YdFZVjGSk
 1+WQNTgAJ+STZTSU4duESVJJeJtAXbacOLrn0lMSZISbEQpuwLGL9UrHHk+xDffTsv
 D86g+BKqE+sEZys45YaP4rutEtyGVjIFbGUX0FgPhS1vzaP6aoNWt2w5AZrYbmoUc/
 0d3ngNH7kJSFzgqBc+VScvbHVIwJ2y2kVPhUvfkLVIlwVumjGKfZKC2AmvmHMUZMdN
 gwki+gx3tr2WQZCc6fgw8LbGbkAr9gycM0kb/05s8ZRuw7IpZ1H+cm1dcX189slI80
 Dhm2sYaLCfwtg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=f0mCf83b
Subject: Re: [Buildroot] [PATCH v1 4/4] package/libcamera: add i.MX8 ISI
 pipeline option
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2023-11-09 22:29 +0100, Peter Seiderer spake thusly:
> Add i.MX8 ISI pipeline option (introduced with upstream commit [1] (since
> version v0.0.1).
> 
> [1] https://git.libcamera.org/libcamera/libcamera.git/commit/?id=0ec982d210861cc6aaebb5d6e8f1a755a16c9792
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libcamera/Config.in    | 7 +++++++
>  package/libcamera/libcamera.mk | 1 +
>  2 files changed, 8 insertions(+)
> 
> diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
> index 65d5fb37f8..ccb5281b4b 100644
> --- a/package/libcamera/Config.in
> +++ b/package/libcamera/Config.in
> @@ -33,6 +33,13 @@ config BR2_PACKAGE_LIBCAMERA_V4L2
>  config BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
>  	bool
>  
> +config BR2_PACKAGE_LIBCAMERA_PIPELINE_IMX8_ISI
> +	bool "imx8-isi pipeline"
> +	depends on BR2_arm || BR2_aarch64
> +	select BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
> +	help
> +	  Pipeline for i.MX8 SoC ISI capture interface.
> +
>  config BR2_PACKAGE_LIBCAMERA_PIPELINE_IPU3
>  	bool "ipu3 pipeline"
>  	depends on BR2_i386 || BR2_x86_64
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index dd31d90e98..c9af90f35f 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -51,6 +51,7 @@ else
>  LIBCAMERA_CONF_OPTS += -Dv4l2=false
>  endif
>  
> +LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_IMX8_ISI) += imx8-isi
>  LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_IPU3) += ipu3
>  LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_RKISP1) += rkisp1
>  ifeq ($(BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI_VC4),y)
> -- 
> 2.42.1
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
