Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0462AC43334
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 18:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95DC784550;
	Sat,  4 Jun 2022 18:50:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C0FgVcKrxK7m; Sat,  4 Jun 2022 18:50:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1E1B84542;
	Sat,  4 Jun 2022 18:50:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C53D1BF4E4
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 18:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38CD860B52
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 18:50:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id te2QqWaqQgZK for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 18:50:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10101.aruba.it (smtpcmd10101.aruba.it [62.149.156.101])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0D81606EC
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 18:50:51 +0000 (UTC)
Received: from [192.168.50.225] ([146.241.66.179])
 by Aruba Outgoing Smtp  with ESMTPSA
 id xYrInISFzcKJdxYrInHgAS; Sat, 04 Jun 2022 20:50:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1654368649; bh=exBgYSYRtjfxFqF7J4xu5KkpJLrywCH3DD2+sa01x08=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=JxwcT22OpitprEZN/VDRXyCiP6+yupTVNTVQuQjlJJLjEjc86f4hPH/Qba+wXSej4
 mq3/sYfPI0t6rL0bKriQ1KSWIgZEsJYVE8DXGsqC32tEuoBsrjb78Aco+o5gVYh6g0
 dRDUFeEFKaN9DmeGarfpc5uoexEya+QwSODZhsbKNkmqirT9LXs4SiAktQbHhqI4RX
 GyLeNkSH+ECV1PUfn/6DD1GfQDT+lj0rYJnqMji2yIukYGeCnkY6SL82IUZeD/qR/s
 U000ea9CouSY+6WIfDI3C8d302KIltX/vuocUP+uY18A7kpbpjGxcekbcm5veBLA2B
 mGDgkbbevMbDg==
Message-ID: <a3dd0f33-eff0-8649-c33e-248482e6296b@benettiengineering.com>
Date: Sat, 4 Jun 2022 20:50:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Arnout Vandecappelle <arnout@mind.be>
References: <e123582d-c613-f81a-ac0d-b23bc4d3e74a@cartal.fr>
 <6478648f-ffb3-cda2-66ad-3758ead25319@mind.be>
 <20220604081933.GD427639@scaer>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220604081933.GD427639@scaer>
X-CMAE-Envelope: MS4xfGRHMGPtzseBWB/MoG8fqzBl4DKKfuodMQxBcyda6LX32r9t4yyNsv4lmBldU4fg+XEVixhyvDNkMrpNUajfYt02P4jqmH7NKTCxHlFXbT0yuP8LiP/t
 61ANFNDmS9TPI4KtpAQGatTi0YNmTu4ED12a6+eS0rI9xSl92BysDT9Ovu6HMPxx/gtF9k9wyvODEAqssRmIBkMSvyAeKxxUGiTj8BnCJp8l6zNbUj6c4jkY
 UAYQeqvSj940tL2eqFHB/JyFhYzLbUytt2uaZLajf4ViqO9pmx+z0phIe+qjvANPyePV4EssSrwzXxFs8sGLRA==
Subject: Re: [Buildroot] Make 4.3 and printvars
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
Cc: Jean-Pierre Cartal <jean-pierre@cartal.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On 04/06/22 10:19, Yann E. MORIN wrote:
> All,
> 
> On 2022-06-03 16:05 +0200, Arnout Vandecappelle spake thusly:
>>   Sending this in name of Jean-Pierre, who is not on the list.
>>> A quick mail to let you know that I also faced the make 4.3 printvars issue you mentioned in Buildroot mailing list.
>>> On my side increasing the stack size limit as follow:
>>> ulimit -s 16000
>>> solved this issue.
>>   I tested it myself and indeed, it works!
> 
> Unfortunately, it does not:
> 
>      $ make defconfig
>      $ make allyespackageconfig
> 
>      $ ulimit -s
>      8192
>      $ make show-vars >/dev/null
>      Segmentation fault (core dumped)
> 
>      $ ulimit -s 16000
>      $ ulimit -s
>      16000
>      $ make show-vars >/dev/null
>      [...]
>      Segmentation fault (core dumped)
> 
> I guess it works by chance on "small-enough" configurations, but this is
> still not guaranteed that it works all the times.

this is reason why it worked on my up-to-date Ubuntu-22.04 while only
building libnss.

-- 
Giulio Benetti
CTO/CEO@Benetti Engineering sas

> I'd rather have no workaround, than one that is half-functional.
> 
> Yes, the above *is* extreme, and a completely degenerate case, yet it
> means the issue it still present for "big-enough" configurations (I
> haven't tried to find how many packages must be enabled before we reach
> the tripping point, but that's not the point).
> 
> Regards,
> Yann E. MORIN.
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
