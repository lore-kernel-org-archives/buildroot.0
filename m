Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF195EC875E
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 23:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F2C760BCC;
	Thu,  7 Sep 2023 23:23:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F2C760BCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7eGkIM_da_mY; Thu,  7 Sep 2023 23:23:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A12060C13;
	Thu,  7 Sep 2023 23:23:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A12060C13
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7C4E61BF3EC
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 23:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E7D040168
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 23:23:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E7D040168
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GgqxkcU_AhnT for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 23:23:11 +0000 (UTC)
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EEA9740144
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 23:23:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEA9740144
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 3D8BC5C1730;
 Fri,  8 Sep 2023 01:23:07 +0200 (CEST)
MIME-Version: 1.0
Date: Fri, 08 Sep 2023 01:23:06 +0200
From: Stefan Agner <stefan@agner.ch>
To: Christian Stewart <christian@aperture.us>
In-Reply-To: <20230727232235.449788-1-christian@aperture.us>
References: <20230727232235.449788-1-christian@aperture.us>
Message-ID: <b73fb293249bcf48f42ebaed0f78f1c1@agner.ch>
X-Sender: stefan@agner.ch
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1694128987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ih5FM/QtEtqxKoz2LCbKnsJlDB9aDWDso954Igz/xr4=;
 b=hUSttDlO8qzKGZi4Q8oJYqcWVPkgJNlJK7LwJwHsYIqiilTy8BoaH1d463nvUaVyNcqBVw
 BC8c8MJEQsmlXokRLsN2amnZ3eMuuRGPDznpZIB14KY5St72LFMsNIwYBTh8jqCLss6HRq
 +vjI4W5XAJU1plF/gARMI2omcu+7im4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=hUSttDlO
Subject: Re: [Buildroot] [PATCH v1 1/1] package/containerd: bump version to
 v1.6.22
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Christian,

It seems that this version hangs at startup, at least when built with
Buildroot 2023.02.4.

Typically my systemd services just timeout. When I manually start
containerd it just doesn't reach the message "containerd successfully
booted in", which older version did.

I've tested v1.6.23 as well, it shows the same behavior. For now I
reverted to v1.6.21.

Have you seen this behavior?

Btw, on master, where we use Docker 24.0.x, shouldn't containerd be
upgraded to the 1.7.x series?

--
Stefan


On 2023-07-28 01:22, Christian Stewart via buildroot wrote:
> Bugfixes and updates.
> 
> https://github.com/containerd/containerd/releases/tag/v1.6.22
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  package/containerd/containerd.hash | 2 +-
>  package/containerd/containerd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/containerd/containerd.hash
> b/package/containerd/containerd.hash
> index 345a7b16ff..8404675e30 100644
> --- a/package/containerd/containerd.hash
> +++ b/package/containerd/containerd.hash
> @@ -1,3 +1,3 @@
>  # Computed locally
> -sha256 
> 9452e95455d03a00d78ae0587595d0c18555bae7912068269efa25a724efe713 
> containerd-1.6.21.tar.gz
> +sha256 
> b109aceacc814d7a637ed94ba5ade829cd2642841d03e06971ef124fa3b86899 
> containerd-1.6.22.tar.gz
>  sha256 
> 4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4 
> LICENSE
> diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
> index 83489a3abf..c4a6d854c3 100644
> --- a/package/containerd/containerd.mk
> +++ b/package/containerd/containerd.mk
> @@ -4,7 +4,7 @@
>  #
>
> ################################################################################
>  
> -CONTAINERD_VERSION = 1.6.21
> +CONTAINERD_VERSION = 1.6.22
>  CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
>  CONTAINERD_LICENSE = Apache-2.0
>  CONTAINERD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
