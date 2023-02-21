Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CA9C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 20:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CFD8405A4;
	Tue, 21 Feb 2023 20:06:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CFD8405A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o-j9szMtEYWs; Tue, 21 Feb 2023 20:06:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA7CC404E9;
	Tue, 21 Feb 2023 20:06:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA7CC404E9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 641741BF3F4
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 20:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D9D3819F3
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 20:06:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D9D3819F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B_10wYv7CE6Z for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 20:06:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C5CB81992
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C5CB81992
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 20:06:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3B1B2240006;
 Tue, 21 Feb 2023 20:06:07 +0000 (UTC)
Date: Tue, 21 Feb 2023 21:06:06 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230221210606.03e4b536@windsurf>
In-Reply-To: <20230207220941.58066-2-ju.o@free.fr>
References: <20230207220941.58066-1-ju.o@free.fr>
 <20230207220941.58066-2-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677009967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4RM5dcWOVTrvLaBwRmfiNEwvzd/bELAUsQZTugxBIDM=;
 b=fKKh45YSV2Mlkm5bPcm3kd9bP2brpa4nVeIndpwB2h10t0cX23u5Y0M42pusoY1AK4arW1
 w8XelSdLTF+SSSKTwAZ0qOtYimuSATsin9UpliNbuF+Ro1EZWLirWORyr4Tro4Hl+NNM7v
 n9heliaP8PPj0Cfj6u4PM519z/HzFbEV0+cUfoHxvGAj92gCEuVuEh+CojPQDiLQIDy5h6
 r3H02OHeTugUkZTU9JIIwgR+pA7GxhiWUmV7qiL0kPFnPdVgzkcLR5iiuaj2ZhiDSTlbUh
 kbiCqt68vcp6s/pARMgB+CO2XIXr7zRTBJcJwKjVErx5sR0P4SYK2mMNsxXTxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fKKh45YS
Subject: Re: [Buildroot] [PATCH 2/5] package/openmpi: bump to version 4.1.4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Julien,

On Tue,  7 Feb 2023 23:09:38 +0100
Julien Olivain <ju.o@free.fr> wrote:

> diff --git a/package/openmpi/Config.in b/package/openmpi/Config.in
> index 4413c55f9c..80b01a26e1 100644
> --- a/package/openmpi/Config.in
> +++ b/package/openmpi/Config.in
> @@ -8,6 +8,7 @@ config BR2_PACKAGE_OPENMPI
>  	bool "openmpi"
>  	depends on BR2_USE_MMU # fork()
>  	depends on BR2_USE_WCHAR
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC

This should affect the dependencies of the Config.in comment, so I
fixed that up and applied your patch to the next branch.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
