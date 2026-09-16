Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABA6C982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 18:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36BFD607C1;
	Wed, 16 Sep 2026 18:43:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RpgbRxuq7bUM; Wed, 16 Sep 2026 18:43:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C04E060633
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789584182;
	b=kNqExAEYQHMorj8Km6fEWAbwp+cxQaKUBIEgnvbvCUjW3PhXWpRJz81OoMpJ0R+hLTGH
	 LCV4gRc/qc+tkWcZjPLnu/6ZvHgNpYYtCPlbWJpwII0YO0hK3YshRjBQTk54JTswfDkWt
	 6r00s2TgE/Vz5TJXTm8JoFbO55cMMmPwWZi0Ar0ZIj5FQHvC4Q/3eyap+RLtQcOW6v+PL
	 maOTdBFssiq4gnpItwAQlBMwdIJbkpiEjExUUhC6tfH1k9zKn9eQ1U0siPcfWl0emq09/
	 39NdCgE5UYA3vujhBUeqFEKRWiHkTIm716Fjlsa3X20Y+GhCf0r+dJivZfiYV3X0XYQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789584182;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=D27/bpRz6nOQnOqzDD9aKZzIYot3gtLKQHXEC4TKHRM=;
	b=CPZsnt65nX/xoxNU4ZtPpU1MGJNDEF3QyrboacOP6Dakab1V9vhNUk8rOQ0e9mV0utDu
	 87/9mKr8jndWsKgDZBzsei8o8uppsMs+PEudtIzSW3by6Z50x/bl0HZu1iF92yzc+NNB6
	 RCvPmcP1MeKDj4qrM1/Bof+LrrSTaM+BqGK9eChDcSi7PTXjnIaUV6S/wu16GPcl36gSO
	 /prOOhzicM1dgCyqR17n6r5XjC9aZest2srKw4qG+aXzy7Js+2/4uBR6Smtm9QNd+MWsS
	 +2kHUNqFvvGtrEFUARPNECzkaw+n8Mw4RlcLfvOp8508nHzds1azcs3W99OfdlvLrgw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789584182;
	bh=D27/bpRz6nOQnOqzDD9aKZzIYot3gtLKQHXEC4TKHRM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JTFUEI0x2ZyFY85UQ0exwtI1UTk7JzODAcgLyT8jUzBPhxbQxyWM9maQ89rGtPede
	 DdFiLire0XBjsFSXXX4NfDr4MoTaAnfmcwkXhWESEm21sYU7YZcwlUY9kf2daQaQYo
	 uk8JweC27MKfDCGADDt4NQAAanSsDkUghjeCbjzMlZ2pfQ+6YKX98RAPxAWCmOQn/S
	 DLnsAt9CmIewT6p/68loLAeZnSpOILtOtTpDWMiM+lX1o4pJXK2t7M85Wto/ZdkVYP
	 LYy1D08kZvBGzYec/AacB69VkOEFPbZar9TOUxsf6hYW1ENEnwUaSKbsTRG9pxGbb6
	 WYpbL41uPGjIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C04E060633;
	Wed, 16 Sep 2026 18:43:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D83224D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23148406CD
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:43:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CN_Ajeo65L9W for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 18:42:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 942B14062C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789584179;
 b=gsHOEEOvSjOtM0Nzo0tyHbK9e5aEyhyxYbiDpiYXGAc4MkzCUek5QbzDxB2r/iT6T4yj
 gX+LJu8h5Yjd8InC9+NNMccdrgCwP2hz4m2tb0YidTWSQYDzx9spYSf2bx4ARxR8jvQfA
 sHT2hHufJjFDyh1Oz90M+8AwbEqp9L7EMe6aAWzkGMmQKDE3Kzyyl/KA61akFnG85yCbd
 LFu0XFUMDsMX0jCyI6OQOFIJCfs5oZinC0jYYxRl57tt2DSn3K4TW5Zwo5dp65VU7nMn7
 JHgyLCoveim7qy4/WJjWMV8K88LO3T3RSQaRd5DN9fqReZGYBn8rdTvKKPPZSFpBpsQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789584179;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=1XAzcxgknGPLGgKsCF0s9NaAKmlVnhfC582urgrUqcI=;
 b=cFYHKHu2nwOGgVtvKPSSA7ydK2Taj/+z7worK0gVfs3kMhQpgj6yIOV6GEMJnFnyZj+G
 iC7ZN59dOhMjoNDq2MxKbcb/4JOj1rZBYnzo2ZxdRo4V6RFFRwsOKsPISZYzbFrY1VsJO
 E3EClgNwMD6EnM6+3t/5PkFATdRRysKVXGHTs2KnZc0PPRzeac0FR4pMVi7qVmG7D2aRR
 W5ampP2DkBB+qCQQAOqQ54gSXW6bveLOjeGI9CWYRMCmise6muCZVC19CzQZwe4k98xzc
 klWU5i13FAoYn9PrsbiChlppqR9IkJUi2QWeHCXRrBcEI0C1YLOXDM3sLe3qY0LAHjA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=1bg0Uetf; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 942B14062C
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:42:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 25C87C5CD5B;
 Wed, 16 Sep 2026 18:43:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EDBF160337;
 Wed, 16 Sep 2026 18:42:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 663BC11C7B04A; 
 Wed, 16 Sep 2026 20:42:50 +0200 (CEST)
Date: Wed, 16 Sep 2026 20:42:48 +0200
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>, 
 Francois Perrad <francois.perrad@gadz.org>
Message-ID: <aqrjIuu6dKqCp7uh@windsurf>
References: <20260914142449.618072-2-buildroot@heine.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260914142449.618072-2-buildroot@heine.tech>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/wpewebkit: fix kernel headers
 dependency due to seccomp select
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

On Mon, Sep 14, 2026 at 04:24:48PM +0200, Michael Nosthoff via buildroot wrote:
> In commit
> 0e2c958e053fae6e33bc7ca230ac4326a6ac5aaa ("package/libseccomp: bump to
> version 2.5.3"), the kernel headers dependency of seccomp was bumped
> from 3.12 to 3.17, but BR2_PACKAGE_WEBKITGTK_SANDBOX, which is a
> reverse dependency of BR2_PACKAGE_LIBSECCOMP was forgotten.
> 
> This commit fixes this inconsistency.
> 
> Fixes: 0e2c958e053fae6e33bc7ca230ac4326a6ac5aaa ("package/libseccomp: bump to version 2.5.3")
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
