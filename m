Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87EFC71153
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 19:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DCBE81E81;
	Mon, 11 Sep 2023 19:44:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DCBE81E81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2qOFOSm73TGA; Mon, 11 Sep 2023 19:44:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4B8D81ABA;
	Mon, 11 Sep 2023 19:44:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4B8D81ABA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A85711BF2BB
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FBD44030E
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:44:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FBD44030E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fsjIsOggv6mm for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 19:44:22 +0000 (UTC)
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E8E8402EF
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 19:44:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E8E8402EF
Received: from [192.168.50.162] ([146.241.108.254])
 by Aruba Outgoing Smtp  with ESMTPSA
 id fmpVqfbxHQSEzfmpVqqslV; Mon, 11 Sep 2023 21:44:18 +0200
Message-ID: <ccd9ae2f-3c57-3f02-13a1-2e6d480717f9@benettiengineering.com>
Date: Mon, 11 Sep 2023 21:44:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
To: buildroot@buildroot.org
References: <20230819211825.60854-1-giulio.benetti@benettiengineering.com>
 <20230819211825.60854-2-giulio.benetti@benettiengineering.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230819211825.60854-2-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfOmkSm4TzWT3Jvyc/eWE4U6e6ZN4nCYZCg9kFBFuWEchjCK77/DkVMj7nM5ELuLo1snjqKy7EYTG5FQqaH5R3tXZZ77NwZFakS0eYMCWRpW1NNxie/6H
 Ue3URzxDn74y3aP1ZQAm+OrUpZaNFm0WebyOZZA5z/gMDjuVt74oUZWQq4XAsDRYjF8vbDxQPLMnFmygiwTDKyl38bCqXThA/tVkoXjxYcELL72keH4gSty+
 ykpQcjC70y3Yx1ofmajXQz6MPCCv1pA4MmajazJVq8b2yfZiRoRkdCgMDTice4H5TOa1rF/0VGn6PFTUInnDKA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1694461458; bh=3AIfa1RZNqcLzIcHoZ3El1twVcRIDpkeQi7K2ha2ywo=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=QbMRd58HnXTeEPDuOaZs7y4KiohldCFahGAvTCYUNljLuo+aLSOz64fsi3kYPYqX5
 KwMYWiu+TKUPlRlNbp/Fa+CwHpOswiQuXIbjnZJ+Nznwr2cXRSMr7oU4IqDwjT10ZF
 plPZIzUdfx1EakgzFgkN4FLiLYaCwBtQokulkEvf8oxYancd151XprXmZBGTQJhj6/
 NI5vDP1PfssT8E4o/ofIP/OTWh6nT+JBJeUYYLkZfcMQcMhf0bouRCr8lzAAGE+km2
 KNkhpEKUhhQ17F5kMkH2AB2JUYihCFyA4rGtNPIOl53ZTZ9F3IF4KyxBoCoKzK+fRi
 BmphLpob7qQYg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=QbMRd58H
Subject: Re: [Buildroot] [PATCH 1/1] docs/manual: add Sponsored-by tag
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All,

On 19/08/23 23:18, Giulio Benetti wrote:
> Sometimes it happens that a Company or a Physical Person sponsors the
> creation and/or the upstreaming process of a patch, but at the moment
> there is no way to give credits to it. In Linux there are some commit that
> include a sort of tag "Sponsored by" without the dash to avoid
> scripts/checkpatch.pl to complain but a real standard has not been defined.
> With this patch let's try to define a method to give credits consistently.
> The goal is to improve contributions from companies or physical persons
> that this way should gain visibility in Buildroot and so they should be
> more prone to let the work done for them for to be upstreamed.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   docs/manual/contribute.txt | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
> index 94f1c64496..384fdb08c1 100644
> --- a/docs/manual/contribute.txt
> +++ b/docs/manual/contribute.txt
> @@ -118,6 +118,11 @@ Acked-by:: Indicates that you code-reviewed the patch and you are
>     Reviewed-by is thus mainly that you are prepared to take the blame on
>     Acked patches, but not on Reviewed ones.
>   
> +Sponsored-by:: Indicates that someone sponsored the creation and/or the
> +  upstreaming process of the patch. Sponsored-by can contain a company
> +  name or a physical person name plus its e-mail the same way it's done
> +  for the other tags listed above.
> +
>   If you reviewed a patch and have comments on it, you should simply reply
>   to the patch stating these comments, without providing a Reviewed-by or
>   Acked-by tag. These tags should only be provided if you judge the patch
> @@ -128,7 +133,7 @@ that testing has been performed. To indicate that you both reviewed and
>   tested the patch, provide two separate tags (Reviewed/Acked-by and
>   Tested-by).
>   
> -Note also that _any developer_ can provide Tested/Reviewed/Acked-by
> +Note also that _any developer_ can provide Tested/Reviewed/Acked-by/Sponsored-by
>   tags, without exception, and we encourage everyone to do this. Buildroot
>   does not have a defined group of _core_ developers, it just so happens
>   that some developers are more active than others. The maintainer will

after sending the same proposal to Linux Kernel Mailing List I've found
that there already are 2 possible ways to give credits to the sponsor:
Name Surname (Sponsor) <name.surname@mail.com>
or
Name Surname <name.surname+sponsor@mail.com>

The latter is the most used at the moment so I send a V2 of this patch
describing it.

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
