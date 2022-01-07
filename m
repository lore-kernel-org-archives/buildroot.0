Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7EECC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 21:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59F4A817AF;
	Fri,  7 Jan 2022 21:56:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id paSbXjDCyJ3v; Fri,  7 Jan 2022 21:56:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCF7B817A5;
	Fri,  7 Jan 2022 21:56:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B6D8E1BF35A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A54B78177A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:56:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t2gR9Tm8SkLo for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 21:56:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC24781779
 for <buildroot@busybox.net>; Fri,  7 Jan 2022 21:56:12 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 p1-20020a1c7401000000b00345c2d068bdso6150177wmc.3
 for <buildroot@busybox.net>; Fri, 07 Jan 2022 13:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=E/a8NVCNeH4BakugSofPJfaiwcuiZVyoNQNYh2bhyq0=;
 b=b9JacokoR3u7idz/riZaQeEsQ7Do+67d0t3tBbfMagxfc++ekHdx1GJ4aykw4CPIH8
 KjP6mFmicZHGQTuUnnBt+GFIz/aKylbHwgDDDRAkt5BvcEZdzDfZu9ghAXRsQ9j0zWsD
 dCJyrjOV3RxTrBkjUt1pYzbuvKI7b5H18KSERKbH2C9LYwm/7HKkNqAogRu7BoYZhsii
 tkOGY+ibcTxHH2yBTkaJq78EJZ6Q77Y6vKiziTfK9m/GVgp2rQmdpf4OYOcZt5zXW6c0
 aH5QjF8mUROOtzSMStgsffG9AVhdM1zcaga+F/gEKNIAoVT7Gr7iwKCLKFBS2Q/p2JMk
 7jzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=E/a8NVCNeH4BakugSofPJfaiwcuiZVyoNQNYh2bhyq0=;
 b=YSYK3TMPFFmJmbNWvis3GHbcR0jTTlYh9Mbxo0iyQhPVnnqanDnb0AE88c4In23tlA
 +CpACx71TfZRfzu1P0e5GXHHWZP9EPFTzH8N05Y4JegIpxwaTiZLx09KS34A9CPH8u+3
 M8jvgTYZknQfANknKrNGcgn6X4RuQeY5voLNBQDaNtT7y+7A2O+RnMLbul5o30lCHk0r
 PxCXQtgNtDwtY5xB3mXPwidC7NsYpN19RBt6tG4oFn0jhJilTKzSOSdv+3KF9qb1TqSO
 k+faOqNcaF1BAUFD+9dLGU5PcEQLuNbdQfMvSe2iDht5kw677uLTxjtyuJxu3ilFrnnc
 K0jQ==
X-Gm-Message-State: AOAM533iR21SBx4bdZ9swRH/u7Cai5v1D7cMhaYXAi8TXhTxIrXpY/zE
 Pu2Nh6xSPLLCJ1O2L/iWCzhs5g==
X-Google-Smtp-Source: ABdhPJwDTQHoiWX4YdeqGzTYRNdlHaENnDFQMJEpfaLyjUbJUpm+8+JZ0x6DHtQbnoODabfECpzK2g==
X-Received: by 2002:a05:600c:1c90:: with SMTP id
 k16mr12578945wms.40.1641592571068; 
 Fri, 07 Jan 2022 13:56:11 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id b14sm6090103wri.112.2022.01.07.13.56.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 13:56:10 -0800 (PST)
Message-ID: <64301b2b-e9c2-91b4-1906-d9e437251618@mind.be>
Date: Fri, 7 Jan 2022 22:56:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: guillaume.bressaix@gmail.com, buildroot@busybox.net
References: <cae0c1b2-34bb-b1a9-f02a-9e98ddd9fbe5@ideasonboard.com>
 <20220104123901.23929-1-guillaume.bressaix@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220104123901.23929-1-guillaume.bressaix@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 1/3] package/python-pybind: fix upgrade
 to 2.6.1
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
Cc: tomi.valkeinen@ideasonboard.com, yann.morin.1998@free.fr
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/01/2022 13:38, guillaume.bressaix@gmail.com wrote:
> From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
> 
> Fixes
>     http://autobuild.buildroot.net/results/b89f1de64b308dffa73675f1f31ccb0b7be5a10d
>     http://autobuild.buildroot.net/results/d0287b7f64f206b0f074908c5780a3632e0cb799
>     http://autobuild.buildroot.net/results/27efb545a5a719a5581c8f746d3a3555ff4216ce
>     http://autobuild.buildroot.net/results/d2f0a0ad8f6c7178517df109e7d885dac9134c3a
>     http://autobuild.buildroot.net/results/b57e9a3279260dae4a590f9421238fcabb2f7cab
>     http://autobuild.buildroot.net/results/515e6f2fc6b5780260d98d6bb52b541ce4bf1afe
>     http://autobuild.buildroot.net/results/d89c4ecc81222d4f80c951da2232d2e393fa1c69
> 
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

  I applied a completely reworked version to master, thanks.

  Regards,
  Arnout

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
