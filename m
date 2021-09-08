Return-Path: <SRS0=AA6u=N6=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E33BFC433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 21:46:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6803960698
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 21:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6803960698
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E819400AE;
	Wed,  8 Sep 2021 21:46:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3qNY-whfYuDJ; Wed,  8 Sep 2021 21:45:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AB7D40146;
	Wed,  8 Sep 2021 21:45:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B08D61BF427
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 21:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC69740146
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 21:45:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nqEQ6GNPuD1m for <buildroot@lists.busybox.net>;
 Wed,  8 Sep 2021 21:45:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71877400AE
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 21:45:55 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.179.121])
 by Aruba Outgoing Smtp  with ESMTPSA
 id O5ODmREbZKBZzO5OEmXPdt; Wed, 08 Sep 2021 23:45:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1631137554; bh=cdQago2FOQWA0Egtm0eKYFYVir3u7CzPI1NllKeAuNw=;
 h=Subject:From:To:Date:MIME-Version:Content-Type;
 b=SkAy/H7n1MuTjW9V9VoIdayVqfUf3RyO6YxRJIIf5Ks1TmhptGooBk+0/lPzgq5xW
 StqAJ7qWRH0LL3gwPPpwIycgQMdzfYaNi6m/PFLMCwhXs2e4sa49ygUWEDRqCdW4/Z
 3Bcu6exvtP+7fTNo2OqjcnEdP3LshhZVVX9wWFnVQRZSYNcSud7xXc3cjlW4gK8lqw
 N4HyErHyfwLCwqCw7DHu9AqADfnDknNIlwTDO+PszvU1lVC3gJIzpqeUNK9LDpQYXf
 NfjHzQ2gj9Vi4DoZxHvPUU0c9TDxQxsntp6Ahq0JEBHIPzm8rPsoHyx6G9/Wh3tEeU
 d5Ub+oJrcI8Qw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
References: <e465a48d-f2eb-6822-415b-06468a375fce@benettiengineering.com>
Message-ID: <86f8d9f9-14c7-6c76-6b6b-96a99282ce2c@benettiengineering.com>
Date: Wed, 8 Sep 2021 23:45:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e465a48d-f2eb-6822-415b-06468a375fce@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfGwTiqn/ETN7qWU0GdfuOSMpuCpI8wdRltEvV9nzxlCZ+KZkLrnoJHvjhW78Os9hFWT6HzqbHS2Lh5UJ/jNfF20k3XXAfa1epfIzYcl8FOaVZBx2JB6u
 gckfaRkuzMf5P1QS0bXUVKzBfe2kIzra2kE4fNKySV+M6Ms8XRIt6G/2+etieybnH5WPfq6QuSJJ+t88IifSYkUUHRm9LdyQLhGwK1n+MJOWFQg/KJtqDF4m
 QwLfoISDh/6Y7PEg+v6leaLZ7wZMWvZTR4EfPK/kf9rK577Ij9LI8+kKjODU5oYm
Subject: Re: [Buildroot] Arc and C-Sky toolchains
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

On 9/8/21 11:29 PM, Giulio Benetti wrote:
> Hello Romain, Thomas, All,
> 
> I can't understand the reason why Arc and C-Sky provide a special
> toolchain(i.e. synopsis gcc10) instead of treating them like external
> toolchains. Can you help me in understanding this?

Is it because differently from the external ones they are provided as 
sources instead of binaries? If yes, then ok. But I would extend their 
description in package/gcc/Config.in.host like:
- bool "gcc arc (10.x)"
+ bool "synopsys's designware gcc arc (10.x)"

and
- bool "gcc csky"
+ bool "official gcc csky"

What about it?

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
