Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F49C98305
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 21:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5474484D60;
	Fri, 16 Jan 2026 21:58:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FbrziK2pfsKn; Fri, 16 Jan 2026 21:58:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 910BD84D59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768600704;
	bh=HOUizwxZG3ckeWhjYLvcUyhIDl4vnfR2Afw4qNF0Afc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HTp+uE1MsWQ2Q+ljGgTvJVBvBhi9OJsV+zDKRRupKq0BexNaBbqi/YsaZEJAcs9Tv
	 Q8gV1htom9lo8NUm73h/I3mVhSVKw3w9D3V5eFC9lattuH/WfyBGPkyKRRx9LFT/1d
	 Yg9jsEy+kCKynmRXyYDHm1u8C74dWKRxeGaF6aezOcu55clYyONJojU4/UENDwpIbq
	 ViKLSa/qWkWvCGS0dD+fMk1zxScY3uGc3VURXZIZA/cDF3+3++W0+JvBgOhRUYft7r
	 KfvVyZQYtIryW3dYq7kf3ceoDqjXTzbCPEWCZjbIy3qjcOLaNYNJCuaeQhisxNvqcL
	 az0C+rua3LbMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 910BD84D59;
	Fri, 16 Jan 2026 21:58:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DD1652CC
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD68261570
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:58:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TMR8Sm4y_vIS for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 21:58:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EA4F96156F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA4F96156F
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA4F96156F
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:58:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 042F9C1E4AF
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:57:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AE0A4606F9;
 Fri, 16 Jan 2026 21:58:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BDA2F10B68907; Fri, 16 Jan 2026 22:58:17 +0100 (CET)
Date: Fri, 16 Jan 2026 22:58:16 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aWq0abCINh6yysuO@windsurf>
References: <20251220170623.155785-1-bernd@kuhls.net>
 <20251220170623.155785-3-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251220170623.155785-3-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1768600698; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=lSV3MqsqS6YWtWZKIjyXmbrcNt5qAUthEUzb8rNoraE=;
 b=0TMPkdc5T5j7CQUQECt9273mJaezjekd6cWRnVyXCqYakauGV+ZmEs8cLPUQlM4bQsH8Im
 Xci6ixDq+v5xKP4XvWA1zDXuSgaNiC8bctg0esDUb/Je2UZgw/XpsjhvIqtReUOTlTsSXr
 dvgig4FtfTubPdQGZKTOkY27i+cjQ6CfhoiWGTmMGNXEtC4yDqTM0zv2LpZwjHh68/31pb
 u3i5uTObAgKZbInDYJ2S4ecfkBYEtVZrb6prZszFydjtsM5X/e34DauIP4cNl//vz2+Yp5
 oBegx8ZqKpRTf6c1fnpCAPQ3DyQbQeDMFr0fD9kMq4zW9tS5t/tHXmhPV0xVRg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=0TMPkdc5
Subject: Re: [Buildroot] [PATCH 3/4] package/util-linux: add dependency to
 BR2_USE_MMU when needed
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

On Sat, Dec 20, 2025 at 06:06:22PM +0100, Bernd Kuhls wrote:
> Upstream added fork() to lib/canonicalize.c in version 2.34[1]
> https://github.com/util-linux/util-linux/commit/e101a9eb0fab6725e0a239a92f9b50822c494a3e
> 
> but the resulting build errors on non-mmu archs were most likely masked
> by previous build errors which are already fixed.
> 
> lib/canonicalize.c as part of libcommon is widely used so we need to add
> the dependency to many Config.in options.
> 
> For an overview about its usage see
> output/build/util-linux-2.41.2$ grep -r "LDADD = \$(LDADD) libcommon.la" * | grep Makemodule | cut -d ":" -f 2 | sort
> 
> Fixes:
> https://autobuild.buildroot.net/results/34b/34b1f733fdfb5c5e30e631576f875398435ad115/
> 
> [1] Added to buildroot with commit bb216ed060b16e09b2027ef242347b2f2e3c97dc
>     in 2019.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
