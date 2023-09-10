Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97871EE57CD
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 13:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 075C2410A1;
	Sun, 10 Sep 2023 13:10:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 075C2410A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YS23m174rsFC; Sun, 10 Sep 2023 13:10:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D92DB410BC;
	Sun, 10 Sep 2023 13:10:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D92DB410BC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A15211BF32A
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 13:10:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 885198176E
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 13:10:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 885198176E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VmGsWV5tmUSu for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 13:10:33 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 056F88176C
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 13:10:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 056F88176C
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id CA63713F8AD;
 Sun, 10 Sep 2023 15:10:28 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:58478])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 10 Sep 2023 15:10:28 +0200
MIME-Version: 1.0
Date: Sun, 10 Sep 2023 15:10:28 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20230910140024.74a2e625@windsurf>
References: <20230909104707.491203-1-ju.o@free.fr>
 <20230909170809.4d0fb384@windsurf>
 <1214dd8573105f0075de5019938a5d37@free.fr>
 <20230910140024.74a2e625@windsurf>
User-Agent: Webmail Free/1.6.1
Message-ID: <7730963f2459b65138c0a4a07dec898c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694351429;
 bh=cImtqPnag9indO0BGlx+Z5eJOJ1O+q8V1HVlrBcFwXI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BzE+3+IQF4EubrEXexsVwRGtIJtlkXTSg0YOssfPEE5xkNVOest8ol9HHRZZ3x1IB
 TAcO7c01iYQg9H09M/xxIiRviU6JQ1pnL9o547r4Q4IFEtTPWzZUBgCgcJD8fiJhKy
 KmCrrrrkhipT4KH07K9DWsIJI778lSuv43fxwQiFO3PPPwbXzc8QULwm5Ml0G7L4zf
 y02GR74mIGCqHRV9BI1RXEGvRfD/ijI8nKcS5JXiBSs3uVxqjn5YD/aV794b/LjGOS
 IywRZG+3dKxIQdajPun92TkGEqJqxA0JhGpZsd4Yn5ladb6Tdw6pGyA3XhqYAyy/jf
 CIgeccBvdHBiA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BzE+3+IQ
Subject: Re: [Buildroot] [PATCH 1/1] package/zynaddsubfx: fix uclibc compile
 error
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

On 10/09/2023 14:00, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 09 Sep 2023 23:07:19 +0200
> Julien Olivain <ju.o@free.fr> wrote:
> 
>> This build failure is the first of its kind, according to autobuild:
>> http://autobuild.buildroot.net/?reason=zynaddsubfx-3.0.6
>> 
>> Looking at the upstream code, this header inclusion is missing, so the
>> bug has always been there. My guess is that this "stdint.h" header was
>> included indirectly from the libc internally. I did not investigated
>> further. Do you want me to?
> 
> It seems like it is related to gcc 13.x, and that the right thing would
> be to include <cstdint>. See commit
> 27dc49378071a82688d44a5cc592c0200b3991b4 for an example of something
> similar. So you could try to build (without your patch) using gcc 12.x
> and gcc 13.x and see if that's the difference that causes the build
> failure.

You are right, it _is_ this GCC 13 change. It is unrelated to uclibc nor
or1k. I reproduced the build failure from a simplified autobuild 
defconfig
from [1]. Just switching back to gcc 12 works. I also tested few other
configurations (glibc, native compilation, etc.).

It is described at:
https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes

I fixed many of those issues last year, but I apparently forgot ;)

I agree with you, the right thing to do would be to include <cstdint>,
but it seems upstream is struggling a bit to fix those in a consistent
way. See [2] and [3] for example. I'll try to propose improvements to
upstream.

In the meantime, this patch needs a v2. Do you want me to:

1. just change the commit log, while keeping the current upstream 
patches
    with <stdint.h>, or

2. redo also the upstream patches to have <cstdint> consistently
    everywhere in the code?

Best regards,

Julien.

[1] 
http://autobuild.buildroot.net/results/97b5a30c7be820ac91e745cf60f9b759e962aa5c/defconfig
[2] 
https://github.com/zynaddsubfx/zynaddsubfx/commit/70905c96fe7b9ffde19bc4bc05b0dc53a1ed1707
[3] 
https://github.com/zynaddsubfx/zynaddsubfx/commit/806674849b276a560d2996f25ba0ddbfe50838ef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
