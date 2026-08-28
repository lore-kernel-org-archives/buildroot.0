Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED96C61DCB
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 21:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEA9080E52;
	Fri, 28 Aug 2026 21:39:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ILjdWRcgrVQe; Fri, 28 Aug 2026 21:39:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787953153;
	bh=RaD6EsTA9bAhddR+oO5fj4A5DztgiLsKoGyJqtkySSI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LNUN2nefp2N8Cr1TpNC9eFFql3bvC9JtoaU+zwYKOULcFcrZY6LrvHnvjULRkPBPJ
	 rL61Rxpo+tyDrUPoQKgY52X36IH1gzD+0rwMPy6ojbhT1UsjOQHrwOnJfyOy4h6SJ0
	 mLaKMAypv76rEjQs0/FbgXHfB5RNCi56X/IVet4WZquMuCj48+kuQ/2/ToG+Pz4yb4
	 2MUwm7qattbe/U3qkLHvzl9JUsQ2ezw5xIN8ndFhf8sUVECU5Sp+JUqckKw3aagFSR
	 fQfCiEhnhUbZCmPhLEZg80y6t84hS9Lwd9HRbeA+ccvCYHCDZQ4pwXazLwDrQv0PfJ
	 YALvGvjttbn4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C93B780E7B;
	Fri, 28 Aug 2026 21:39:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A63D4118
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 21:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BE4C60652
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 21:39:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5qX5nTi0G01R for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 21:39:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B7706062A
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 21:39:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 2DDB01A17C2
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 21:39:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E7B2C60537;
 Fri, 28 Aug 2026 21:39:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 20B6811C78131; 
 Fri, 28 Aug 2026 23:38:59 +0200 (CEST)
Date: Fri, 28 Aug 2026 23:38:59 +0200
To: Alessandro Rubini <rubini@gnudd.com>
Cc: buildroot@buildroot.org
Message-ID: <apH_yDN9-7Md4ttl@windsurf>
References: <aohHBg5JtecHVORq@windsurf> <amaDQ/RxzLn24+me@arcana.i.gnudd.com>
 <aoglkraRzHufPBHQ@windsurf> <aognldAvgHC81hyu@windsurf>
 <apHpVO5XvrAs52H1@arcana.i.gnudd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <apHpVO5XvrAs52H1@arcana.i.gnudd.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/opencv: fix a webp dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Thanks for this new iteration!

On Fri, Aug 28, 2026 at 10:02:28PM +0200, Alessandro Rubini wrote:
> When BR2_PACKAGE_OPENCV4_WITH_WEBP=y we need to enable mux and demux
> too, otherwise build fails as follows:
> 
>     CMake Error: The following variables are used in this project,
>          but they are set to NOTFOUND.
>     Please set them or make sure they are set and tested correctly
>          in the CMake files:
>     WEBP_DEMUX_LIBRARY
>     linked by target "opencv_imgcodecs"
>          in directory [...]/build/opencv4-4.13.0/modules/imgcodecs
>     WEBP_MUX_LIBRARY
>     linked by target "opencv_imgcodecs"
>          in directory [...]/build/opencv4-4.13.0/modules/imgcodecs
> 
> The issue already exists in 2025.02.x (thanks Thomas for checking),
> but not in 2023.08.x whence my defconfig originated.

The mention of 2023.08.x and your defconfig here is not very useful.

> 
> Signed-off-by: Alessandro Rubini <rubini@gnudd.com>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
