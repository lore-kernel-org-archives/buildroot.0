Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18C4C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 13:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABD6060B50;
	Mon,  5 Feb 2024 13:34:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABD6060B50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m3Y6tYfhMp_4; Mon,  5 Feb 2024 13:34:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 135BF61029;
	Mon,  5 Feb 2024 13:34:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 135BF61029
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 471AB1BF976
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CDCA60F0A
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:34:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CDCA60F0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zKnp3fMeOqQQ for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 13:34:09 +0000 (UTC)
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27788606E6
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 13:34:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27788606E6
Received: from [192.168.17.123] (unknown [85.119.216.19])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 04EB02C80BF9
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 14:34:06 +0100 (CET)
Message-ID: <42594955-dcd4-4161-9a84-879f096d49f7@bubu1.eu>
Date: Mon, 5 Feb 2024 14:34:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <20240111072922.3082638-1-james.hilliard1@gmail.com>
 <87sf27upph.fsf@48ers.dk>
In-Reply-To: <87sf27upph.fsf@48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707140047; bh=4IAc1rLmlRuX+LSrvn0R/w1pPoXcstxdeIR0uNmdZdI=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=VuX9oP3b+XFxVOB+dIznXD8vr0MqAgZdqxqF9BIw+qLxMMnvg+HYXXQBOMQrU+UXd
 4ygA8ExkIqVPoguTM5+yJPOm7IuOS8ZfpjKUvbNQhZhYUEAdAoaDKOetw0JHD5X0xZ
 cLG/xwNL2w3JaWcPrwapHbLIh1JJrUptBWrjwDn2NbZFj2CCfSVsBnwUbM8IlvMRp0
 4Yegru6iFv3Pje2CPsm4N39tX3A1laY9qqjdYcIJA90jjTSO07KT7b6NzmiWK5y0Ob
 3AIox40wLCAoCn8hP76ub2Xj3X2kXXichpxLRQgt/iwsSLH5cLKlh1MVt/K6cj+JVQ
 7gpm+HCkRQ42g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=VuX9oP3b
Subject: Re: [Buildroot] [PATCH 1/1] package/python-starlette: bump to
 version 0.34.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On 05.02.24 12:15, Peter Korsgaard wrote:
>>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:
> 
>   > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> 
> Committed, thanks.
> 

We currently have fastapi 0.105.0 in buildroot which depends on 
starlette < 0.28.0.

There's a pending patch by James that bumps it to 0.108.0, which 
unfortunately is also not compatible with starlette 0.34.0 [1] :-/

In fact there's no fastapi release that is compatible with starlette 
0.34.0 (newer fastapi releases require even newer starlette versions...)

I guess I'll send a series that bumps *both* again to compatible versions?

Marcus

[1] 
https://github.com/tiangolo/fastapi/blob/0.108.0/pyproject.toml#L43C27-L43C29
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
