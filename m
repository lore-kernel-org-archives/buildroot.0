Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6CEC47422
	for <buildroot@archiver.kernel.org>; Mon, 29 Jan 2024 14:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B54CD60FAE;
	Mon, 29 Jan 2024 14:31:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B54CD60FAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y-BR-odXUVHP; Mon, 29 Jan 2024 14:31:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 271B360F6B;
	Mon, 29 Jan 2024 14:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 271B360F6B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC5C51BF473
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 14:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92D7D60F6B
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 14:31:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92D7D60F6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nX_uJyJQn9_d for <buildroot@lists.busybox.net>;
 Mon, 29 Jan 2024 14:31:25 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8825760D78
 for <buildroot@buildroot.org>; Mon, 29 Jan 2024 14:31:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8825760D78
Received: from pendragon.ideasonboard.com
 (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C5E81F73
 for <buildroot@buildroot.org>; Mon, 29 Jan 2024 15:30:05 +0100 (CET)
MIME-Version: 1.0
In-Reply-To: <20240129142845.416975-1-kieran.bingham@ideasonboard.com>
References: <20240129142845.416975-1-kieran.bingham@ideasonboard.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: 
To: buildroot@buildroot.org
Date: Mon, 29 Jan 2024 14:31:20 +0000
Message-ID: <170653868054.2407440.5176453559304270738@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1706538606;
 bh=qlCtWOPriy4tU82Pzt2dmld4TSP5y4Sue5qDxpimrKA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=i9r0YnOGKqc32k2vMYdVrAg+MF+bllcN8FtHwWeGRgXL4Rw5jjfVeLHp38nmyOcDk
 k4qnwkp9SzfCEWC8nBn/tjz9zsli80xjR5mhzLkGyOEI8mxsv2FSo71zEhHqQXG0a3
 JaDS4dKzA2oSS9WfqJPvLRzFmFoP/RHWfKdKQjTs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=i9r0YnOG
Subject: Re: [Buildroot] [PATCH] package/libcamera: bump to version 0.2.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quoting Kieran Bingham (2024-01-29 14:28:45)
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  package/libcamera/libcamera.hash | 2 +-
>  package/libcamera/libcamera.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
> index c25a737809ec..5fe95cf09373 100644
> --- a/package/libcamera/libcamera.hash
> +++ b/package/libcamera/libcamera.hash
> @@ -1,4 +1,4 @@
> -sha256  f38b42fa849d4d1d5a4dd4ca3013b4b297861cba53970e665e295d3e57de58e6  libcamera-v0.1.0-br1.tar.gz
> +sha256 7f26568147f4f2acc795da7f26de63a5a15d544d87fb1531a1a1ef2c34c75030  libcamera-v0.2.0-br1.tar.gz

Looks like ^ was spaces not a tab. I'll correct that.

--
Kieran


>  
>  # license files
>  sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index c9af90f35fff..eecbaa44b91e 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
> -LIBCAMERA_VERSION = v0.1.0
> +LIBCAMERA_VERSION = v0.2.0
>  LIBCAMERA_SITE_METHOD = git
>  LIBCAMERA_DEPENDENCIES = \
>         host-openssl \
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
