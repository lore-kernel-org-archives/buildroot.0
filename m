Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URI_HEX,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83DF0C43214
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 13:25:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D70F610D1
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 13:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D70F610D1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CF1A80FA6;
	Thu, 26 Aug 2021 13:25:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MAgHGCWwnjTY; Thu, 26 Aug 2021 13:25:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48E4580FDE;
	Thu, 26 Aug 2021 13:25:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D12A1BF391
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 13:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A7D880FDE
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 13:25:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VbDwITQkG6zs for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 13:25:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B54680FA6
 for <buildroot@busybox.net>; Thu, 26 Aug 2021 13:25:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 484A41814BD; Thu, 26 Aug 2021 15:25:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1629984334; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=5kS+Vt9sajIF1zEQZ5YVG9HjcTPQ+65mgYuZDOkJ6z0=;
 b=Uvq8GmCkOci9XpSiLpOTQoDrxQs0Hde0DB3QrAFXfUgDrlP9RMBX3eTSqBtoHHdKZyWvGe
 NW5ikyF33b1in49EEoddogKWfuIWlDCw76IwIHM6X9vzX13clrI77N/sKqLC1qJrHKbA6V
 A8SiG85mzSwMYVM5F+Csr7hjtfIVON8=
To: Arnout Vandecappelle <arnout@mind.be>, bryce.schober@gmail.com
References: <54f5-61242d00-3-3eaf8580@172892221>
 <6254d9c8-21c4-259e-9358-b24dd187e1c1@mind.be>
Message-ID: <7f697d85-7d18-6b69-2cdd-8be5a69f9051@heine.tech>
Date: Thu, 26 Aug 2021 15:25:32 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6254d9c8-21c4-259e-9358-b24dd187e1c1@mind.be>
Content-Language: en-US
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] Buildroot mailing list archives search
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
Cc: buildroot <buildroot@busybox.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi,

On 24.08.21 10:26, Arnout Vandecappelle wrote:
>
> On 24/08/2021 01:19, Michael Nosthoff via buildroot wrote:
>> Hi,
>>
>> On Monday, August 23, 2021 23:55 CEST, bryce.schober@gmail.com wrote:
>>   
>>> I've found that the "Search the List Archives" tool at
>>> https://buildroot.org/support.html seems to be broken. It seems that
>>> there's a DNS problem with buildroot-busybox.2317881.n4.nabble.com.
>>>
>> This search dialog should better point to lore I guess.
>   The website resides in docs/website/support.html in the main buildroot repo -
> feel free to send a patch!


I know but didn't have a pc at hand at the time.
I just submitted a patch.

Regards,
Michael


>
>   Regards,
>   Arnout
>
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
