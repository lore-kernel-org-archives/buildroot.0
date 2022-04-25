Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9044C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 19:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DC7360BF2;
	Mon, 25 Apr 2022 19:34:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RXuX2kSLmxm1; Mon, 25 Apr 2022 19:34:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B29A060B43;
	Mon, 25 Apr 2022 19:34:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 88F621BF2CD
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 760C8415FB
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:34:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hxhjCxVEqJbO for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 19:34:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44C8541545
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 19:34:34 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id l18so5006752ejc.7
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 12:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=LeQeEVzC0QLq0hYJuyS/tXhOhv5zZccO63UGSPcWl0c=;
 b=g8N5qqlwjsrBMPSnCfNlHLaukyzCnwiC2uKBqfaC2n1tVMGbzd3huy0+dgbQQ96JqD
 iLn2XcctzM588BFgvnxQ7UHWzBnEkbOKLo7e5P77ICgqjT/xvap0jmi+UY8joKQqvPv2
 BQsQaesrjHEyYwWiJ+aEERbjCXvdQ7JVO8g6p54i2Y7EsSNi56/dZfXPLB9VvtnrXXEA
 AfM/GlJbb6zEkGEZByZ+HPQmSr4yPqbrBWKTe9l+Q1hf3o3P0oxRRNzptDCMY8o9wD0v
 VbFEj0Fl0i9wsWaD1hnhsDvIzIkOMfHa9Ux2tVf3T53LIzfx3YUgNh6dM7YdaP8SeGYn
 S/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=LeQeEVzC0QLq0hYJuyS/tXhOhv5zZccO63UGSPcWl0c=;
 b=3co4YwYo9uPecJyc884+xOxnRqsT8HCbQe7fOTwajOpxn8/JHOmDYUQHJbGmvApqwa
 JPUN9yGE9wfgcln4W8/57MwfgJQopRE0/666iB2l1f4WUIAHhWpCbvOWoQdvrcD/MBMb
 NogHsV625ZjqlC3IykHMW91dyLUm3yZ+P+yboLmHu7ESIdEyP63I/aWgPcbXIXgiCvrI
 4sR2UtftMFqmMSSRrzuhwAsZaly4ILkAZZxHW4Lp4s7VEXFgDJOSrLBCFPflNO1S0yVa
 gAVqAZppM7EVdKQRsaCK2yUEB7SWWpL8e1OwwdTiv+X34vI2k37CMgjK3m00jp7j5IAv
 IO2A==
X-Gm-Message-State: AOAM5324C/0ujZZChwDQiskwkMDtOOizmoT/chtGwAuRwoN5EFP/fuct
 759j6EUR5nH83agrJq+HpW42D/n2ls1NbA==
X-Google-Smtp-Source: ABdhPJxm8Drf4TIDX6b9KWVI5nKWWCIj92OwHhoVWL/fGqJaA80Np7KWRXujc4FTlfc/SFUR6YoOqQ==
X-Received: by 2002:a17:907:168a:b0:6e8:d125:1d24 with SMTP id
 hc10-20020a170907168a00b006e8d1251d24mr17478383ejc.508.1650915272434; 
 Mon, 25 Apr 2022 12:34:32 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 wh24-20020a170906fd1800b006f3a0a8efd0sm810872ejb.110.2022.04.25.12.34.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 12:34:32 -0700 (PDT)
Message-ID: <ddb2ea53-d41b-69fa-503d-a7130b1e9520@mind.be>
Date: Mon, 25 Apr 2022 21:34:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
References: <20220422214919.367067-1-aperez@igalia.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220422214919.367067-1-aperez@igalia.com>
Subject: Re: [Buildroot] [PATCH 0/3] Update wlroots to the latest release
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/04/2022 23:49, Adrian Perez de Castro wrote:
> Hi,
> 
> This is a small patch set which brings wlroots library to its most recent
> version, fixing the cage compositor with a backported patch (as there is
> no newer release yet). I am adding one additional patch that enables the
> new Vulkan renderer when any of Mesa's Vulkan drivers is selected, too.
> 
> I don't expect the two first patches of the set to be controversial, but
> dunno about the Vulkan one. If there are doubts, I suppose the first two
> could be merged anyway, leaving the other out for further discussion.
> 
> One more thing: With wlroots 0.15.x it is finally possible to disable building
> the accelerated renderers (GLESv2, Vulkan) and have only the software based
> one (Pixman) built into wlroots. Currently I do not have the need for such a
> configuration, and therefore I am not planning to send a patch to allow that
> for now. On the other hand, if anyone wanted to try writing the patch, I would
> be more than happy to review it :-)
> 
> Cheers,
> -Adrian
> 
> 
> Adrian Perez de Castro (3):
>    package/wlroots: bump to version 0.15.1
>    package/cage: add upstream patch for wlroots 0.15.x
>    package/wlroots: enable vulkan renderer if possible

  Series applied to master, thanks.

  Regards,
  Arnout

> 
>   .../cage/0001-Upgrade-to-wlroots-0.15.patch   | 312 ++++++++++++++++++
>   package/wlroots/Config.in                     |   2 +-
>   package/wlroots/wlroots.hash                  |   4 +-
>   package/wlroots/wlroots.mk                    |  29 +-
>   4 files changed, 332 insertions(+), 15 deletions(-)
>   create mode 100644 package/cage/0001-Upgrade-to-wlroots-0.15.patch
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
