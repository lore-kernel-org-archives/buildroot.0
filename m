Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5A3C001E0
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 15:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1BD3414FA;
	Wed,  2 Aug 2023 15:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1BD3414FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rf0mEhrYk9CJ; Wed,  2 Aug 2023 15:31:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51D47414B9;
	Wed,  2 Aug 2023 15:31:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51D47414B9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 923A71BF2E5
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 15:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80A6F81E2C
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 15:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80A6F81E2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P3T2scHDwE_B for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 15:31:27 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3263381773
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 15:31:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3263381773
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fb4146e8fcso7442845e9.0
 for <buildroot@buildroot.org>; Wed, 02 Aug 2023 08:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690990285; x=1691595085;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2SWEVuSpPqARM1ku16vI8oUU4nN7HGS7yPE1hTV1s4U=;
 b=cC9/Uxbo65vqytZm+KSKH/nH5yW0m2b+Z5dAZhx2MrIXcGzlpvlqw79tqeRv4YKRli
 O2KY+koNEDn9yrMN3kwJ0HZlTSH8hrN/4ZN4DxqWMkIS8It3bTJd776OZGWlTvdS8oVw
 mO48AnbPywIXLLHbz1Pe5WrUjBARb41gCOa1Qbgt6jGN2sgOe+r2cpfJNOY+zGPyAv1h
 n5YRRqasWM9dsMz8ypiIm9VlySiROHlj4lLH3g+3U1GwM6fzAwq0C38xhS4N3yDRQWAK
 RYgFAtbu5R2bLM1yVsUXDEmdjo6HRrKNFgLD5oHnNkgwaZ0Q0L+3ffR/XY0PMwhcuXTO
 d0FQ==
X-Gm-Message-State: ABy/qLZw4k12EE/PQchaErYQRlvZhJbhkUBjK4UdOdS9BtK2bxmxFB5D
 Kq/DteX28yNzSC15Ko67FZ8gS6+Ma78=
X-Google-Smtp-Source: APBJJlHIQTZjBv45wFihp7hxwOMzHl5VcTK2crsww4CT0panQNIJwLg4EA5WfPF8DcEnALk82MR81Q==
X-Received: by 2002:a05:600c:4f06:b0:3fa:88b4:bff3 with SMTP id
 l6-20020a05600c4f0600b003fa88b4bff3mr5516560wmq.11.1690990285147; 
 Wed, 02 Aug 2023 08:31:25 -0700 (PDT)
Received: from [10.0.0.120] (static-90-255-244-241.vodafonexdsl.co.uk.
 [90.255.244.241]) by smtp.gmail.com with ESMTPSA id
 y24-20020a1c4b18000000b003fe1fe56202sm1904111wma.33.2023.08.02.08.31.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Aug 2023 08:31:24 -0700 (PDT)
Message-ID: <8216f6a9-8249-d098-550a-21c3c591c531@gmail.com>
Date: Wed, 2 Aug 2023 16:31:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Vincent Fazio <vfazio@xes-inc.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <38cce51d-40e8-1e28-ed5a-0d2c9f8a710a@gmail.com>
 <PH1P110MB1603A41B40688C71A511E6D19F0BA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
From: Nick Betteridge <lists.nick.betteridge@gmail.com>
In-Reply-To: <PH1P110MB1603A41B40688C71A511E6D19F0BA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690990285; x=1691595085;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2SWEVuSpPqARM1ku16vI8oUU4nN7HGS7yPE1hTV1s4U=;
 b=BUeHz52f0MNbsAuZBxxHHYvZR8r+bSGcas8KRoSWcIBASdmDwzwJtXhlxVSAWpoS9/
 PxvEjxMBS4aQefXJvMgY1JLaeqKSgq1nk9yauTh8T/UgggChDhQ0lfCCM/fglMXanbJ9
 YSY3c0t/lel1XrqfGDg9pIz3yNKPVcUedG7GgIXxHScnK1Ssdhdc1JEUcQE8a0WSjNL0
 T1w4NS7Wqdb7gGb+ftivFpM+zBu4iaNSZLjalTnpQofjWMDq5ID50Tle/6l8ANP5qnXh
 83TXNgWxbACWdOb6PJh/cWukDJAHchHR90ou20NCEsKmVQfi1qLbhmp1/qYRtFxMWPsW
 NGqg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=BUeHz52f
Subject: Re: [Buildroot] [External] - Arm cortex-a55 problem when building
 busybox
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

Hi Vincent,

> Without a defconfig with which to reproduce, it's hard to say for sure, but it seems like
> your compiler does not support `-mcpu=cortex-a55` which was added in GCC 8. There
> is a check in the Kconfig menu for this when building a BR toolchain. Are you using a
> custom toolchain perhaps?

Yes, I'm using gcc-linaro-7.3.1-2018.05-x86_64_aarch64-linux-gnu - so 
it's less than gcc 8! Excellent, thank you for pointing this out! I'll 
try using something more recent.

Best,

Nick

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
