Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C667CDB482
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 07:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 002FF4010D;
	Thu, 19 Oct 2023 07:43:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 002FF4010D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uJsHsTu-NBnh; Thu, 19 Oct 2023 07:43:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F02AD40166;
	Thu, 19 Oct 2023 07:43:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F02AD40166
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5EC631BF45A
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 07:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37B0F4270B
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 07:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37B0F4270B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id exYATZa_EEwC for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 07:43:05 +0000 (UTC)
X-Greylist: delayed 498 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 19 Oct 2023 07:43:03 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDE0242707
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDE0242707
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 07:43:03 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 107ABC0CDC
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 09:34:39 +0200 (CEST)
Message-ID: <bede2a82-ee1f-4f8a-97f8-c6e2b54b2b84@grenoble.cnrs.fr>
Date: Thu, 19 Oct 2023 09:34:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20231017143424.430007-1-anaumann@ultratronik.de>
 <PH1P110MB1603AE1FC3925D2A2D33EEED9FD6A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <38dd6e9a-7fea-e3fb-21a1-5a381a36c8cf@mind.be>
Content-Language: en-US
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <38dd6e9a-7fea-e3fb-21a1-5a381a36c8cf@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1697700880;
 bh=Gcq5XGKnAyWVsgbf/X72nfNhT7Q+dykLVZwK8+ppNWc=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=Pg9Shw8moL8az6OUoBGJJaCTi1FHChN1vOBs/wzNzteERy/D9YLHvs8LK/wFJXeeA
 N9c4L8XV+yj/kihgojg9tLoQVd3nU/sDBdJO6h6n9F0mNXshfOqQIFiRLKZB/QlrFN
 CBHyI8yTGln4zud9nZMmn1R8Fk3zYLcGUyhzNVqO4bnBbOFtIAhBbPvgIwB5l6KQbd
 RErQaQF5KsuBiSPiXdsGx9UB2f7WqOCBNtZ948IP+xGtalIEIPVh0j7cZauJ7FpsPr
 J1tz5U40G7STcpttvgs5E0Xc5r76zdXcq2+CL0CKO8MZ7Ab3u0EckEFBnVUozS3h/j
 Kn1uRWCP7HMNA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=Pg9Shw8m
Subject: Re: [Buildroot] [External] - [PATCH 0/1] libgpiod v2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello!

On 2023-10-18, about whether the API-breaking libgpiod v2 should be an
upgrade or a new package, Arnout Vandecappelle wrote:
> If it's like "mostly it will still work, but there are a few functions
> that you need to replace with a new variant", then the proper approach
> is indeed to fix the packages that fail to build. [...]
>
> For bigger API changes [...] we indeed need a new package libgpiod2.

I've watched a talk by Bartosz Golaszewski about the new libgpiod,[1]
then started looking at the documentation of this new API.[2] My feeling
is that this is a quite extensive rewrite. A program wanting to support
both the v1 and the v2 APIs would need quite a bit of conditional
compilation.

Besides, I could not find in the header a macro designed to explicitly
tell the API version, although some macros, that are defined only in v1,
could be used for this purpose. E.g.:

    #ifdef GPIOD_LINE_BULK_MAX_LINES
    # define USE_GPIOD_API_V1
    #else
    # define USE_GPIOD_API_V2
    #endif

Regards,

Edgar.

[1] https://lpc.events/event/16/contributions/1247/
[2] https://libgpiod.readthedocs.io/en/latest/modules.html
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
