Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9389AC61DA4
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 23:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE15340A59;
	Tue, 14 Feb 2023 23:20:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE15340A59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hjs8B-65J27f; Tue, 14 Feb 2023 23:20:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43B6C403C4;
	Tue, 14 Feb 2023 23:20:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43B6C403C4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E6461BF232
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 23:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3541E8198D
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 23:20:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3541E8198D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0vV7mN-3KxgA for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 23:20:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6D3781448
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6D3781448
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 23:20:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.243.54])
 by smtp4-g21.free.fr (Postfix) with ESMTP id 385E419F593;
 Wed, 15 Feb 2023 00:20:08 +0100 (CET)
Received: from [37.170.153.8]
	by webmail.free.fr
MIME-Version: 1.0
Date: Wed, 15 Feb 2023 00:20:08 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20230213232050.5fe67607@windsurf>
References: <20221124220552.2836398-1-ju.o@free.fr>
 <20230213232050.5fe67607@windsurf>
Message-ID: <f255f9b172b09c9e7c8ad2c52e685a4d@free.fr>
X-Sender: ju.o@free.fr
User-Agent: Webmail Free/1.3.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676416808;
 bh=yLmYpdlNCZdn5F0Wz97d5RtWE7nwTgLl73fpEM/+TIg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Y8wYF8eAm2CkwSjuBc65yVgrmsL4zL8U/urKUTccbKGfO7nHji6C3xPUXOESR/bKr
 sL9UEWfYjxM7mdmBv/mzccJj4MqktauUmvfRmjbBMbUeBNH5ji+NeMLdJZVRkJ/tDF
 eQcKnTz/OZbPF0abALrqQpDo1pEmnVK518iTAthWGUBlrN4u23SNip4Kw7AaKFty0U
 BVEXX95a+QnxdW8SrxthRSHQux6kx8SfBZDeSTustO6kTZ7olGHYJmFW5rExy36qfs
 4ILZetimk+2/g17oWOY16iavpb4SqDhhlXmMn6Hc8zj70/o8nXraK+HZmDeF/A88Xr
 4hHjjToqiJ7qw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Y8wYF8eA
Subject: Re: [Buildroot] [PATCH next v2 1/2] package/highway: new package
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 13/02/2023 23:20, Thomas Petazzoni wrote:
> On Thu, 24 Nov 2022 23:05:51 +0100
> Julien Olivain <ju.o@free.fr> wrote:
> 
>> Highway is a C++ library that provides portable SIMD/vector 
>> intrinsics.
>> 
>> https://github.com/google/highway
>> 
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
> 
> Thanks! I've applied, with some small changes, see below.

Thanks for the improvements!

[...]
>> +This patch adds a check for <sys/auxv.h> and include it only if 
>> present.
>> +
>> +Signed-off-by: Julien Olivain <ju.o@free.fr>
> 
> Has this patch been submitted upstream?

Yes! A slightly reworked version was accepted upstream and is already in 
the
latest 1.0.3 version tag. See:
https://github.com/google/highway/commit/1cab22047a6ef750ef2bc38ad47d6e765d6d376a

I'm currently reworking this 1.0.3 and I'll send a version bump when 
ready.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
