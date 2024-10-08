Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A802CEF152
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 11:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1271640A9E;
	Tue,  8 Oct 2024 11:40:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6RHbXnMmj6bJ; Tue,  8 Oct 2024 11:40:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2557C40AC9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2557C40AC9;
	Tue,  8 Oct 2024 11:40:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 36BF21BF3EB
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 11:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 256FD40AC9
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 11:40:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p0BxI2MtRKvK for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 11:40:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.167.242.64;
 helo=perceval.ideasonboard.com; envelope-from=kieran.bingham@ideasonboard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C801540A9E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C801540A9E
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C801540A9E
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 11:40:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95CD010B6;
 Tue,  8 Oct 2024 13:33:03 +0200 (CEST)
MIME-Version: 1.0
In-Reply-To: <20241007192950.448350-1-ju.o@free.fr>
References: <20241007192950.448350-1-ju.o@free.fr>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Date: Tue, 08 Oct 2024 12:34:37 +0100
Message-ID: <172838727715.532453.9966379310142996785@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1728387183;
 bh=MDnUCtlBtaEwlWe0up3iie+x3x+Zmtzbp6w9LAa0YXE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=oYdqegJkWqDrxX/qZonXwG+pDlfYt6DzMrBztVLxEaKLGHvpu8K+Zu+O2QtsQUL+G
 5vqC/mwz2+z96YN5P4ojESOWuvlD3XzkXQeqFoLCOxcVkvn07EtHpxMmi4FQDMJ0tF
 hWZ2eDs+kO3UpjzkTLtxGE29fDy9isNpRDxgrFu8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=ideasonboard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=oYdqegJk
Subject: Re: [Buildroot] [PATCH 1/1] package/libcamera: bump to version 0.3.2
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
 Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quoting Julien Olivain (2024-10-07 20:29:50)
> For change log since 0.3.0, see:
> https://git.libcamera.org/libcamera/libcamera.git/tag/?h=v0.3.2
> https://git.libcamera.org/libcamera/libcamera.git/tag/?h=v0.3.1
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/8014299351
> ---
>  package/libcamera/libcamera.hash | 2 +-
>  package/libcamera/libcamera.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
> index 1566356b99..d4554af190 100644
> --- a/package/libcamera/libcamera.hash
> +++ b/package/libcamera/libcamera.hash
> @@ -1,4 +1,4 @@
> -sha256  1e0a3feff93577a30bcd4e67aa4c1969aecabcd90f78f540a637bb77553c5a7d  libcamera-v0.3.0-git4.tar.gz
> +sha256  d396bebe49aa7f605403594be3a9e970173d4c98061033c75f816946ff907eb8  libcamera-v0.3.2-git4.tar.gz
>  
>  # license files
>  sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index dfcd340b75..0273cd2b17 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
> -LIBCAMERA_VERSION = v0.3.0
> +LIBCAMERA_VERSION = v0.3.2
>  LIBCAMERA_SITE_METHOD = git
>  LIBCAMERA_DEPENDENCIES = \
>         host-openssl \
> -- 
> 2.46.2
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
