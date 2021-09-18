Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7941FC433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 08:19:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2B6C61244
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 08:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C2B6C61244
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=grenoble.cnrs.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93B5F84206;
	Sat, 18 Sep 2021 08:19:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AmeeXDJnVChT; Sat, 18 Sep 2021 08:19:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8DBB8419F;
	Sat, 18 Sep 2021 08:19:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 46D321BF365
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 08:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36E2A8419F
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 08:19:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xlB5_frF9_39 for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 08:19:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B3AC84094
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 08:19:49 +0000 (UTC)
Received: from [IPv6:2a01:e0a:947:6e20:2933:2c09:eec5:98c] (unknown
 [IPv6:2a01:e0a:947:6e20:2933:2c09:eec5:98c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 86052BFAD4
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 10:19:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grenoble.cnrs.fr;
 s=202106-grenoble.cnrs.fr; t=1631953187;
 bh=9zevBqgnyZ2aJa7+hCZ9bE77FJPK6BA0UgRj7Pj5tIE=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=fw5EuoKOeqUBH20KEBmuwf5ei5ahtCqHF/wh9juK7/EtuR8zqU6Q0q3wNxr59lmiY
 Igg7GlCzgTeiPxSn9lnyh2ODhw6/lEJhfG9M/ZS/IAazZJusu7ht2g4F4LQQ0++n6K
 LKnS+XlXm+YrbjNawRsF8i+U2FuzdSi3vwZxY0srmLX6G0S2VfTiBHjrHkvoN2gCUd
 gZSa4Jlyj9ptctHQlYEYq9vm8a8j7E9Wu/2qsbzjg4pl6PUl6vV/phs4DvS8EkW6jU
 Hd8JSZahTri9WDVfiCoKRaUi2WNNnFn5Fdb4axAhzHI3RX7G0qvXZbNft/Oo4Tx5ha
 HR7kLHZHzqjyA==
To: buildroot@buildroot.org
References: <20210918070214.2527F8436A@smtp1.osuosl.org>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <9dfa4af2-1f2c-4ead-1bdb-04282dd59e43@grenoble.cnrs.fr>
Date: Sat, 18 Sep 2021 10:19:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210918070214.2527F8436A@smtp1.osuosl.org>
Content-Language: en-US
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2021-09-17
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hello!

The autobuilder wrote:
> Detail of defconfig failures for master
> ---------------------------------------
>
>                         defconfig |                        link to the job                        | orph?
> ----------------------------------+---------------------------------------------------------------+------
>                       aarch64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1597248798  |      
>        acmesystems_acqua_a5_512mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1597248800  |      
> [...]

There may be a problem on the autobuilder. Most of those links point to
build logs that are truncated, and do not show any error message.

I just tried one of the failed defconfigs (acmesystems_acqua_a5_512mb)
using the exact same Buildroot commit as the autobuilder did
(c483318d09). It all went out smoothly.

Regards,

Edgar Bonet.
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
