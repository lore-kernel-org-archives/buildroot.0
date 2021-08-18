Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C75C4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 20:38:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46B5C610FA
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 20:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 46B5C610FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18683405F7;
	Wed, 18 Aug 2021 20:38:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v2KKRu4P1crN; Wed, 18 Aug 2021 20:38:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 719E74075C;
	Wed, 18 Aug 2021 20:38:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2BAE11BF344
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 20:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AE62817BD
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 20:38:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yJ0HvP0cykNL for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 20:38:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4051180E16
 for <buildroot@busybox.net>; Wed, 18 Aug 2021 20:38:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 099701814BC; Wed, 18 Aug 2021 22:38:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1629319097; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=kNpL34XiuUCssJkMK17KNZIqGUE3xcGmEVkObWoD9ZA=;
 b=kniBJR8/Oj+HM62d3GnEHOrLdhPjraMPVWceyVgio7GxOf67dIYwANQ9ytKy2VH6U+q5Nk
 uJ9SvmOglA+uKuP96lrKpfov5Nzr9lU3QgqSKSdoBJTJPAwn8Y1fj4gkMi1Kvcar6GLiYR
 7ORzmEtdYEW856hyqk7tORhfaEVO+/E=
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Nosthoff via buildroot <buildroot@busybox.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210817200141.27827-1-buildroot@heine.tech>
 <20210818122324.7daa3258@windsurf>
Message-ID: <643f3f7d-7c72-810b-eb27-c639e683dd8d@heine.tech>
Date: Wed, 18 Aug 2021 22:38:15 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210818122324.7daa3258@windsurf>
Content-Language: en-US
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/boost: bump version to 1.77.0
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Thomas,

On 18.08.21 12:23, Thomas Petazzoni wrote:
> Hello Michael,
>
> On Tue, 17 Aug 2021 22:01:39 +0200
> Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:
>
>>   config BR2_PACKAGE_BOOST_FILESYSTEM
>>   	bool "boost-filesystem"
>> +	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
> Unfortunately, if you add such a dependency, you need to look at all
> the place where you have a "select BR2_PACKAGE_BOOST_FILESYSTEM" or a
> "select BR2_PACKAGE_BOOST_ATOMIC" and make sure they have a "depends on
> BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS". And recursively,
> any package selecting those packages will also need to have this
> "depends on" added.

Damn, I forgot those dependencies. Fabrice added them for atomic and 
thread before.
It's not nice but it seems to be necessary since the dependency is now 
there.

>
> For example: package/cc-tool/Config.in selects
> BR2_PACKAGE_BOOST_FILESYSTEM, so it now needs to have this depends on
> BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS.
>
> In other words, if you can get a fix for this, it would make this
> version bump a lot simpler :-)

The culprit is this commit [1]. So if c++20 is not available it always 
falls back on boost-atomic.
 From the sheer size of the commit I don't think we can "fix" this from 
buildroot in a sensible way.

Luckily no packages depend on boost-math, where I hope this dependency 
can be fixed/removed.

Regards,
Michael

[1] 
https://github.com/boostorg/filesystem/commit/2dda038306fd2953c2bbd01a15795994fbc32af2

>
> Thanks!
>
> Thomas
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
