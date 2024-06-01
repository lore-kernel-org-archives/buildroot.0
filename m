Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D27C25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 14:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 583EF846BD;
	Sat,  1 Jun 2024 14:11:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9qTOL5jSJPBf; Sat,  1 Jun 2024 14:11:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A6AE846C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A6AE846C7;
	Sat,  1 Jun 2024 14:11:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E98871BF4DD
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 14:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E390340120
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 14:11:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MHdlWoBKcBFW for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 14:11:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.167.242.64;
 helo=perceval.ideasonboard.com; envelope-from=kieran.bingham@ideasonboard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6499B40114
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6499B40114
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6499B40114
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 14:11:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 99DDE1BA;
 Sat,  1 Jun 2024 16:11:08 +0200 (CEST)
MIME-Version: 1.0
In-Reply-To: <8734pxnb2g.fsf@dell.be.48ers.dk>
References: <20240527134505.4017771-1-kieran.bingham@ideasonboard.com>
 <8734pxnb2g.fsf@dell.be.48ers.dk>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 01 Jun 2024 15:11:11 +0100
Message-ID: <171725107145.2338035.16835228869635581818@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1717251068;
 bh=bNIkUj3V1wu1os3osN+rJFIvCKXl6V2TnCstCd5XAtI=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=BRdMWlVYb6pFKCO6IbVZ9CO1f5f8nqe3xCYoC1NjRlVLlF6UNLFEAiuyxPzoE2jlL
 CGk6MqIo8ErliNp6vKY+jGnGo1d7UF3FZ6+cu7d9UIWKd0q6MybPdaPTwd4AHDWg7f
 T6qvF+ppHt5VQhQDj7yMVIwGSh0IzWVX0TRP2m3U=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=ideasonboard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=BRdMWlVY
Subject: Re: [Buildroot] [PATCH] package/libcamera: bump to version 0.3.0
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

Quoting Peter Korsgaard (2024-05-31 18:30:31)
> >>>>> "Kieran" == Kieran Bingham <kieran.bingham@ideasonboard.com> writes:
> 
>  > Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>  > ---
>  >  package/libcamera/libcamera.hash | 2 +-
>  >  package/libcamera/libcamera.mk   | 2 +-
>  >  2 files changed, 2 insertions(+), 2 deletions(-)
> 
>  > diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
>  > index 1ae74b3b18c4..1566356b9991 100644
>  > --- a/package/libcamera/libcamera.hash
>  > +++ b/package/libcamera/libcamera.hash
>  > @@ -1,4 +1,4 @@
>  > -sha256  f9c3e949f9d6a42e29322833e57a0e6e8c54655507c820636470ea597e767fd8  libcamera-v0.2.0-git4.tar.gz
>  > +sha256  1e0a3feff93577a30bcd4e67aa4c1969aecabcd90f78f540a637bb77553c5a7d  libcamera-v0.3.0-git4.tar.gz
>  
>  >  # license files
>  >  sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
>  > diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
>  > index eecbaa44b91e..dfcd340b75a0 100644
>  > --- a/package/libcamera/libcamera.mk
>  > +++ b/package/libcamera/libcamera.mk
>  > @@ -5,7 +5,7 @@
>  >  ################################################################################
>  
>  >  LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
>  > -LIBCAMERA_VERSION = v0.2.0
>  > +LIBCAMERA_VERSION = v0.3.0
> 
> Committed to next, thanks.
> 
> No new configure options for Config.in?

Good point, technically we can add a config for the Mali-C55 Pipeline
handler, but as that won't run on real hardware yet (We've developed it
on the Juno board with FPGA) - It's not urgent.

I'll aim to add a patch to add this in at the least before or with the
next release.

--
Kieran


> 
> -- 
> Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
