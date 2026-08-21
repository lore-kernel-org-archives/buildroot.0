Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A4BC5DF87
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 10:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92DE480ED5;
	Fri, 21 Aug 2026 10:02:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vnO_xZOJheRy; Fri, 21 Aug 2026 10:02:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787306551;
	bh=iQHhpqHw4jrzIpv0rU5eQlznaFoQVv0CmDpcd5Ru3eI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DK80GUPjnvfRdIgg1uuYyd6fK3VFt9qK4IdPJRnBsHoAB+2f8DjrKioKi9YlV1cso
	 HXiZfYwQIzFhLRhAJC6yArZJDKCQD+fprf+i9ox9AmJDSoqBiIoWRNKB2pExeHklQw
	 SgqmofPbCnzoytRXEOQNNnyxTuWpFgHd30KyCfAdW081gT7nIDhail/L/FanVAmn9B
	 lOOjjM2Cud7JzoOt2fI0v7NiPao+yYOyuvz46oTb+wKmp4VAQHYoNrGNLhAP4PfCU8
	 gtExfq8B2l4v0BNICAEmVOiO52qijFvxaKQNdcicYkrSKCwWMa9LWINgAJfOUAEhaC
	 PP5Hso4z014BQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB2E780EEE;
	Fri, 21 Aug 2026 10:02:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CFBE21B8
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 10:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B93ED80EEE
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 10:02:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qdqIFEENtUN9 for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 10:02:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A5A4D80ED5
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 10:02:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 836BE4E4131B
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 10:02:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 50E3D604AA;
 Fri, 21 Aug 2026 10:02:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A21A111C76E76; 
 Fri, 21 Aug 2026 12:02:20 +0200 (CEST)
Date: Fri, 21 Aug 2026 12:02:19 +0200
To: Alessandro Rubini <rubini@gnudd.com>
Cc: buildroot@buildroot.org
Message-ID: <aoghe-d8Lvcj_qlr@windsurf>
References: <amaCxq1lFi8rsIyJ@arcana.i.gnudd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <amaCxq1lFi8rsIyJ@arcana.i.gnudd.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/jpeg-turbo: fix aarch64 build using
 an upstream patch
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

Hello Alessandro,

On Sun, Jul 26, 2026 at 11:57:26PM +0200, Alessandro Rubini wrote:
> This patch is 3.2.0-8-g0da22762 in the original jpeg-turbo package,
> where the committer claims they can't reproduce the problem. Buildroot
> is currently using version 3.2.0 of the package.
> 
> The build issue I esperience with an aarch64 build (cm4 custom baseboard)
> is the following:
> 
>    spng.c:(.text+0x4d8c): undefined reference to `__fpclassifyf'
> 
> The patch actually fixes it.
> 
> Signed-off-by: Alessandro Rubini <rubini@gnudd.com>

Thanks for your patch. I was initially not able to reproduce the
issue, but after digging into the autobuilder failures for this
problem, I found out that the key to encounter the problem is
BR2_OPTIMIZE_S=y (i.e use gcc -Os instead of our default of -O2). Do
you confirm you are using BR2_OPTIMIZE_S=y in your configuration?

Overall, I can reproduce the issue with:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_OPTIMIZE_S=y
BR2_PACKAGE_JPEG=y

but not with:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_JPEG=y

Do we understand why the issue happens with -Os but not -O2 ?

> diff --git a/package/jpeg-turbo/0001-libspng-Really-remove-gamma-correction-code.patch b/package/jpeg-turbo/0001-libspng-Really-remove-gamma-correction-code.patch
> new file mode 100644
> index 0000000000..5dcd95d0b9
> --- /dev/null
> +++ b/package/jpeg-turbo/0001-libspng-Really-remove-gamma-correction-code.patch
> @@ -0,0 +1,109 @@
> +From 0da22762971551462cfad8f0b11cfb037472a4e8 Mon Sep 17 00:00:00 2001
> +From: DRC <information@libjpeg-turbo.org>
> +Date: Thu, 16 Jul 2026 12:09:54 -0400
> +Subject: [PATCH] libspng: Really remove gamma correction code
> +
> +We really don't use it, and fpclassify() apparently introduces yet
> +another libm dependency in some cases (although I can't reproduce that.)
> +
> +Fixes #904

We require all patches added in Buildroot to have:

- An "Upstream:" tag that points to the upstream commit, PR or patch
  submission (in your case, commit)

- A "Signed-off-by:" tag from the person who introduced the patch into
  Buildroot, i.e you.

Could you adjust this, together with hopefully some explanation on why
-Os triggers the issue and not -O2?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
