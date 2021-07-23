Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3124EC4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 13:35:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0AD760EB4
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 13:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B0AD760EB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62EF080FF8;
	Fri, 23 Jul 2021 13:35:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8hE0cRjmplh0; Fri, 23 Jul 2021 13:35:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6894E81011;
	Fri, 23 Jul 2021 13:35:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF0711BF20B
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 13:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99E4783AAA
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 13:35:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lwNaADXy9xuI for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 13:35:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C9B283AAB
 for <buildroot@busybox.net>; Fri, 23 Jul 2021 13:35:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C3D4C18287E
 for <buildroot@busybox.net>; Fri, 23 Jul 2021 15:35:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1627047304; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=QBisGOsm+f3513+KGm/MdkQyId7MTJPkShLBZznVG6I=;
 b=uTNgDPlNpO1PX1XSGSoPYuDIsY2f238/2L5wSWZExZGZHKgLPx8w8P7GJ9Ssd1DpYTy74b
 NinpW6t1EKzM8ofjTaT9SJOpZ8+KZnyTLwyaFgJJAtEW+WrzoxD2ztJHW/GQmaL2rYR5wF
 BHwqu5s3StVAAf2LKtt29V+n3SGDdww=
To: buildroot@busybox.net
References: <20210723132648.30775-1-buildroot@heine.tech>
Message-ID: <e514e91e-3944-de6b-04da-ce5972d91700@heine.tech>
Date: Fri, 23 Jul 2021 15:34:58 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210723132648.30775-1-buildroot@heine.tech>
Content-Language: en-US
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/bluez5_utils: fix mesh build
 with musl
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@busybox.net>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On 23.07.21 15:26, Michael Nosthoff via buildroot wrote:
> when compiling with mesh support and musl toolchain the build fails
> due to a missing include of limits.h for PATH_MAX in mesh-cfgtest.c.
>
> Patch submitted upstream:
> https://lore.kernel.org/linux-bluetooth/20210723081039.30396-1-bluez@heine.tech
>
> Fixes:
> http://autobuild.buildroot.net/results/20cc47f54de0b0d4bdf108c3715c590ae8ab476f/
> http://autobuild.buildroot.net/results/003968b25906579dbcf5a95d1e43fec0ab504ef5/
>
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---

Forgot to add a changelog.

v2 just has an updated description (patch and commit) because I mixed up 
PATH_MAX and MAX_PATH...

Regards,
Michael

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
