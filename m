Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2440CC433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 00:49:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 011B060E93
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 00:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 011B060E93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F2DD402AC;
	Sun,  7 Nov 2021 00:49:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z35fhwBJc5nI; Sun,  7 Nov 2021 00:49:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D226C40272;
	Sun,  7 Nov 2021 00:49:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DDAF51BF2B1
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 00:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA6CD6060D
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 00:49:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ewtoy4alaTzc for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 00:49:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1DCB605F5
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 00:49:28 +0000 (UTC)
Received: from [192.168.153.129] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jWNBmtoGgFf01jWNBmq1kw; Sun, 07 Nov 2021 01:49:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636246166; bh=XH9whgF4QQkLq/2O+W6klTHWx7KSnizN+SY6ecZE94Y=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=EOzsNKUrr9csdLIxAiK4YxWTzz7xdrpqUkWQ9vJE9bk7R1xLhm8+inikQOyTHhUV9
 LNUTS2kPeF2lwf0PrMYp9CtS+HbbGc3Qw9awYXdf5RLDrRh1zJw0bEwgd1ZIuiH8KT
 MEZqv2G55gA+BabW5rFbR0qHVpZDHqbnaig5bzKafW5s3HPrW+amhxi4rUeHlYLaP9
 js6RPS9nDXCoAGOkbA3hOMQlF4gTtLXDmQ2drVAo/WLSzKCQowqqlEWVMf6QBnrWbU
 wqNbfv64ctxnIqUaB/SC1GgaxpJw2LgOHG8kMFEc6035H58XCnY3mj4gZ+EvKciDRO
 Di+Ivjg1DfpPQ==
To: Peter Korsgaard <peter@korsgaard.com>
References: <20211105123848.6356-2-peter@korsgaard.com>
 <9DC7B415-F1A7-4D59-968C-EDD367DD2C16@benettiengineering.com>
 <87lf22iv3c.fsf@dell.be.48ers.dk>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <782af019-787a-be7e-23fb-e836ff71f958@benettiengineering.com>
Date: Sun, 7 Nov 2021 01:49:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87lf22iv3c.fsf@dell.be.48ers.dk>
Content-Language: en-US
X-CMAE-Envelope: MS4wfNN5Cn03sG3jH+wIQUv5id7yNfnKaUv58HkaYioKRqGxsT8FwuvlfmAwbVc2VVooJvgT0oBOo2ZGfhRG6GwrekPwTnEORm8pL/Rxr6+0HsCt93JRE8XY
 dR4hvfEtW84yn/M+cRbv424SmKfaJ/6gTrLLVJSC2chsXIyNVR7WMhf8qB8SbeWaHpxfPh4iK+gs/RARaSiV5YhmvlePaVxZiKzYHnVHKYD8IpQeMTJIzpPj
 n6nsb11/bHygFjDdTNdPzbCSq7EjtaZDu0O1u2muuWU=
Subject: Re: [Buildroot] [PATCH 2/2] configs/nezha_defconfig: new defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org, samuel@sholland.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On 11/5/21 2:35 PM, Peter Korsgaard wrote:
>>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:
> 
> Hi,
> 
>   >> +image sdcard.img {
>   >> +    hdimage {
>   >> +    }
>   >> +
>   >> +    partition boot0-1 {
>   >> +        in-partition-table = "no"
>   >> +        image = "boot0_sdcard_sun20iw1p1.bin"
>   >> +        offset = 8192
> 
>   > Can you please use 8K here ^^^
> 
>   >> +    }
>   >> +
>   >> +    partition boot0-2 {
>   >> +        in-partition-table = "no"
>   >> +        image = "boot0_sdcard_sun20iw1p1.bin"
>   >> +        offset = 131072
> 
>   > 128K here etc.
> 
>   > I find it to be easier to read.
> 
> Ok. The "documentation" actually lists this in 512b sectors, but I don't
> think genimage has something nice to handle this:

For curiosity I've checked genimage documentation:
https://github.com/pengutronix/genimage/blob/master/README.rst

And I've found that in master branch there is also the 's suffix that is 
used exactly for sector size of 512. BUT it will be available on V15 and 
we have instead V14 and V15 is still not released :-/
Anyway it can be useful in the near future.

It's been introduced on 26 March with this commit:
https://github.com/pengutronix/genimage/commit/bcd7fa662d0fdfb7b15a340ff42721cacc29bec9

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> https://linux-sunxi.org/Allwinner_Nezha
> 
> 
>   > I would go for changing every .cfg file in Buildroot and submit a
>   > patchset for this to improve readibility. What do you all think about
>   > this?
> 
> Fine by me.
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
