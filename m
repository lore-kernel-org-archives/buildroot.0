Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F121AC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 16:27:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68D7961158
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 16:27:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 68D7961158
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A6EE6065D;
	Thu,  5 Aug 2021 16:27:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9UJYpv8a3tgR; Thu,  5 Aug 2021 16:27:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 960E760ADB;
	Thu,  5 Aug 2021 16:27:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 77A3C1BF574
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 16:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63F3660ADB
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 16:27:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EDvnxl-eoPOG for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 16:27:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 523D36065D
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 16:27:46 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id go31so10557248ejc.6
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 09:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5XDnv47JwD1mr8mEBQuFezZVpm4u1N2Kc+4xm+KITIM=;
 b=QsnyZuhXWP+O7SW4dK050jCU8MuIIe5yLS7e1gklAGWOz+oSG3dHrBwUM/ulfwnqom
 GvYvvaY1f4e8l7pgHD8P+OjipJ1sXc3dVV10f5hRpzh3glKSTigLz8y+J0DKaumxhaBc
 YugpSomr3HvCFnf5n7UpqHPhiiL6Du74oIzhk84NTe5C9ruOXuNhzK0LEe9TE5Rf37bT
 u4+h1CZN7hgwGm9RLLEbbUu3eYEEQeFQdy5ttO52tuNrU0YBFmj4Vxd0uEz7ekowvpwd
 naFqDNkTZ/0ZyJRViJM3zgb5Cw5tWuUYhrDvZfTVsLTLJdv4fXQPvJUllG/niqfKz0Ie
 KnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=5XDnv47JwD1mr8mEBQuFezZVpm4u1N2Kc+4xm+KITIM=;
 b=VBvKEQg8BV5Rs1ct3PCXPqX3GWNgreCVka7QkxAEpGtrFFDl/yM/roU7ckHlNZozX8
 JzZpy/oznbzSdL39dS/CklWL9o4dpq84QOcD//yH3+Tu2AlidKrqc8EWiV6R9Ez7jKwe
 qhdk8pON2QsYhFkCWHlIWC+ayN1g2o7+a84YatwZ/uB4y7O0TWoVFAapYeG9UXR2lhMe
 xe6e/c04IMhd8X3i17bAJ1wTfDYU7tLNGmtuTlL38yUFX8Ammh00yR5P5j0NOdJkycs6
 R6EvxtN6a1cVv+/2dpvfJ71zk6mWhaZ6lnaBRgwiyyWhTxItYS1MeKN70NPcbTpp4Qmw
 uytA==
X-Gm-Message-State: AOAM531j65B/xQffPWi/3rMrz5Y9Ko4IavG/zc0ZmxoynKtOwIS1upRm
 Y72e06vOJAhyXZrVMMJrzj8KysnsW7ercQRO8ZM=
X-Google-Smtp-Source: ABdhPJzQ/1YLcGysHEK5Oiw7AnqIDBhb9QtJ4jBkzYMwlsVIj6vfethRN1R9W7SNWoLrlhK2f6/C8w==
X-Received: by 2002:a17:906:ecf7:: with SMTP id
 qt23mr5709387ejb.64.1628180864398; 
 Thu, 05 Aug 2021 09:27:44 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id c28sm1869046ejc.102.2021.08.05.09.27.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 09:27:43 -0700 (PDT)
To: Pascal de Bruijn <p.debruijn@unilogic.nl>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210805085353.3457-1-p.debruijn@unilogic.nl>
 <20210805085353.3457-3-p.debruijn@unilogic.nl>
 <20210805153149.3b72eb3f@windsurf>
 <AM0PR07MB39874E7C25C042D0F51C8BC09DF29@AM0PR07MB3987.eurprd07.prod.outlook.com>
 <20210805160140.4fcc15ce@windsurf>
 <AM0PR07MB39876E0E73FD0E7059D1D5CB9DF29@AM0PR07MB3987.eurprd07.prod.outlook.com>
 <20210805161020.5fde871c@windsurf>
 <AM0PR07MB39879D2B6747974F28FAA7579DF29@AM0PR07MB3987.eurprd07.prod.outlook.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <1dab04a3-644c-d583-049d-2a1a3f3f8f6f@mind.be>
Date: Thu, 5 Aug 2021 18:27:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <AM0PR07MB39879D2B6747974F28FAA7579DF29@AM0PR07MB3987.eurprd07.prod.outlook.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 3/3] package/php: enable opcache jit
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
Cc: "aduskett@gmail.com" <aduskett@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 05/08/2021 16:47, Pascal de Bruijn wrote:
> Hey,
> 
>>     > In ed355dec (PATCH 2/3) the following line is what makes opcache actually
>>     work:
>> 
>>     What is ed355dec ? I don't have any commit with that reference in
>>     Buildroot. If it's the reference of the commit of PATCH 2/3 in your
>>     Buildroot Git repository, then it doesn't make sense to reference it,
>>     as this commit won't have the same hash when we'll apply your patch,
>>     i.e ed355dec means nothing expect just to you locally.
> 
> I know, which is why I referenced both. So I'm referencing the second of three
> patches in my recently submitted series regarding package/php.
> 
>>     > PHP_CHECK_LIBRARY(rt, shm_unlink,
>>     [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED_LIBADD)])
>> 
>>     And what is this doing ? Again shm_unlink() is no longer in librt, it's
>>     in libc since glibc 2.17 (if I remember correctly).
> 
> PHP_CHECK_LIBRARY(rt, shm_unlink, [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED_LIBADD)])
> is executed for non-cross-compiles, and with my patch also executes for
> cross-compiles.
> 
> Though I haven't looked deeply into the PHP specific autotools macros...
> https://github.com/php/php-src/blob/PHP-8.0.9/build/php.m4#L1507

 This bit is indeed useless with modern glibc, but all libc still install an
(empty?) librt for backward compatibility, so it doesn't hurt either.

 Regards,
 Arnout

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
