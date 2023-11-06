Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD42FC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78B69401FF;
	Mon,  6 Nov 2023 22:14:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78B69401FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VfXH0J6Mm3uT; Mon,  6 Nov 2023 22:14:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBE97401DE;
	Mon,  6 Nov 2023 22:14:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBE97401DE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B4821BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F08D415BD
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:14:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F08D415BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vDOljoFwfbU8 for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:14:52 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DBAA8414BD
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:14:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBAA8414BD
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id F2A3EB8109B;
 Mon,  6 Nov 2023 22:14:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E4BFC433C8;
 Mon,  6 Nov 2023 22:14:47 +0000 (UTC)
Message-ID: <e85161b0-0913-4fd5-ac91-f19d200e6d22@kernel.org>
Date: Tue, 7 Nov 2023 07:14:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20231030002748.280144-1-dlemoal@kernel.org>
 <5761b87d-4843-4669-bc65-f6e1351e12b7@kernel.org>
 <20231106084314.2458b0c3@windsurf>
 <0f681e5b-2522-462e-9f09-f86694a2d3dc@mind.be>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <0f681e5b-2522-462e-9f09-f86694a2d3dc@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1699308888;
 bh=Rjp86ACR3fOA5NrrXjDTrs8O1m5Ybx/gWFTpZEvAKto=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ImqqeqB7wrvOOH/PeMcY1zTZuF+m39JjCgd033xovtOWsDh5oJAh+u9eI+tUzWHEp
 XHpiNPhw9P1EuDpTRXwV1VIvEaHoCIAu6dqPmROWCrIzg+uDS8t0vLb8jpB0UbacPN
 22N/m20JJ9IvellCBw/T1vxkYcNX/+GoV8TvOqHrAzPf2MYutXbeSo47YTF38QpmvQ
 EcSLnktW8n4oqbJD2osjgdWXH6g2DkzNDMHCi+1saI4BhTa5Y9T+XCeX/AJXIj1+0R
 ytD6Gy9yDqtdFj0INR0JaWAlCj2AzxF/l7RsVw20+5gbvU9dZnaw0+mKfsBX6R/6y8
 FmanJ2JJfgjDg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=ImqqeqB7
Subject: Re: [Buildroot] [PATCH] package/gcc: Fix gcc finale library
 installation
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 11/7/23 05:18, Arnout Vandecappelle wrote:
> 
> 
> On 06/11/2023 08:43, Thomas Petazzoni via buildroot wrote:
>> On Mon, 6 Nov 2023 11:17:41 +0900
>> Damien Le Moal <dlemoal@kernel.org> wrote:
>>
>>> I received a build failure report (again) for the RISC-V Canaan & Sipeed boards
>>> configs. This patch fixes these build failures.
>>
>> I need to dig deeper into this. We looked into this issue with Romain,
>> and I believe our conclusion is that it was unfortunately more complex
>> than this, because in fact BR2_TOOLCHAIN_HAS_LIBATOMIC is not a fully
>> accurate representation of whether gcc has libatomic or not.
> 
>   Even so, we could apply this already as a first step that fixes many 
> configurations, and improve the fix later? Currently there are quite a lot of 
> configurations for which we simply can't build a toolchain...
> 
>   BTW, Damien, you forgot the Fixes line:
> 
> Fixes: 
> http://autobuild.buildroot.net/results/98f/98fedf4969c260f73a01b937b9625e66dcd86b3c

Thomas, can you add this if you apply the patch ? I can send a v2 of the patch
as well if you prefer that.

> 
> (there are about 10 failures per day on various architectures, I don't think we 
> need to enumerate them all.)
> 
>   Regards,
>   Arnout
> 

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
