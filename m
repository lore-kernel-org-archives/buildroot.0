Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51073CE7A88
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 11:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC7A76117D;
	Sat, 23 Sep 2023 11:07:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC7A76117D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p16dOkhGfdte; Sat, 23 Sep 2023 11:07:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6BFD61197;
	Sat, 23 Sep 2023 11:07:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6BFD61197
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1653B1BF5E9
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 11:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F12F540137
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 11:07:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F12F540137
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zREFbfcNC6B2 for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 11:07:22 +0000 (UTC)
Received: from mail.light-speed.de (mail.light-speed.de [85.214.38.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D12474011F
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 11:07:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D12474011F
Received: from smtpclient.apple (unknown
 [IPv6:2a02:810a:8280:47aa:bdd5:92a0:f93c:e7d8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.light-speed.de (Postfix) with ESMTPSA id 0ACF33D42A65;
 Sat, 23 Sep 2023 13:07:19 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
In-Reply-To: <20230923100909.GC1469982@scaer>
Date: Sat, 23 Sep 2023 13:07:08 +0200
Message-Id: <F16E06C3-7DA0-468C-88A2-80B109908D69@jens-maus.de>
References: <20230923093901.1372593-1-mail@jens-maus.de>
 <20230923100909.GC1469982@scaer>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailer: Apple Mail (2.3731.700.6)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jens-maus.de; s=mail; t=1695467239;
 bh=WJuYsuJjpXZ4x3ZZ+W8JXwi5HSuHt46maLOAkZKTiOg=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=pCDg+lOCIEYLqSjb311rjwrdfMeGE8ub11ECNrr+DQ230rjX3NsNPyRBLM+V4fyE6
 13EykI7XGrqlEWM5j4j/ij9k9ucvQMP1xrOePyhTVfg7bs8hMUBkCaf80Mex5tVjBT
 2S9K+gIUS+SU9tzytdZ8ciV/a+xAJM/CXwzjBYXM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=jens-maus.de header.i=@jens-maus.de
 header.a=rsa-sha256 header.s=mail header.b=pCDg+lOC
Subject: Re: [Buildroot] [PATCH] package/nodejs: fix parallel build
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
From: Jens Maus via buildroot <buildroot@buildroot.org>
Reply-To: Jens Maus <mail@jens-maus.de>
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

> Am 23.09.2023 um 12:09 schrieb Yann E. MORIN <yann.morin.1998@free.fr>:
> 
> On 2023-09-23 11:39 +0200, Jens Maus via buildroot spake thusly:
>> In ninja-based nodejs builds performing parallel builds using "make -jX"
>> is not working during buildroot initiated builds because the JOBS
>> variable is set in the MAKE_OPTS variables in nodejs.mk. This commit
>> remedies the issue by setting JOBS to BR2_JLEVEL and also by fixing the
>> top-level Makefile of nodejs due to an incorrect tab-based indentation
>> being used. Furthermore, it is important to also set LD_LIBRARY_PATH in
>> v8-qemu-wrapper.in to our staging libdirs as otherwise execution of
>> build tools fail due to host OS libraries being preferred.
> 
> That are two different changes, so they should be two different patches.
> 
> The commit log is thus misleading, becausee you are not "just" fixing
> the parallel build issue.

You are right. I really forgot about the already submitted v8-qemu-wrapper bug report completely for some reason. Will of course split this into two parts now.

> See below for more comments.
> 
>> Signed-off-by: Jens Maus <mail@jens-maus.de>
>> ---
>> ...-fixing-Makefile-for-parallel-builds.patch | 37 +++++++++++++++++++
>> package/nodejs/nodejs.mk                      |  6 ++-
>> package/nodejs/v8-qemu-wrapper.in             |  1 +
>> 3 files changed, 42 insertions(+), 2 deletions(-)
>> create mode 100644 package/nodejs/0005-fixing-Makefile-for-parallel-builds.patch
>> 
>> diff --git a/package/nodejs/0005-fixing-Makefile-for-parallel-builds.patch b/package/nodejs/0005-fixing-Makefile-for-parallel-builds.patch
>> new file mode 100644
>> index 0000000000..73db129979
>> --- /dev/null
>> +++ b/package/nodejs/0005-fixing-Makefile-for-parallel-builds.patch
>> @@ -0,0 +1,37 @@
>> +From 1c4582c7dd7c80fbac89031d8fa8cf418249d01e Mon Sep 17 00:00:00 2001
>> +From: Jens Maus <mail@jens-maus.de>
>> +Date: Sat, 23 Sep 2023 11:09:50 +0200
>> +Subject: [PATCH] fixing Makefile for parallel builds
>> +
>> +This change fixing incorrect GNU makefile indentation in the top-level
>> +Makefile which causes issues with parallel "make -jXX" builds.
>> +
>> +Upstream: N/A (specific to buildroot builds)
> 
> If the indentation is causing issues, then that's surely a fix that
> *must* be sent upstream.
> 
> Also, please explain what the actual error is.

Ok, will do so as soon as I get this reproduced again. This patch had been long time into my buildroot patch folder and I really had to fix that indentation to get things going. Will try to resubmit that patch again with some more details error message/explaination. And then I can see if I will have to sent the Makefile patch upstream or not while I am still, however, not sure if/when it will be accepted there.

> [--SNIP--]
>> diff --git a/package/nodejs/v8-qemu-wrapper.in b/package/nodejs/v8-qemu-wrapper.in
>> index e1083f47f7..48222d089b 100644
>> --- a/package/nodejs/v8-qemu-wrapper.in
>> +++ b/package/nodejs/v8-qemu-wrapper.in
>> @@ -5,5 +5,6 @@
>> exec @QEMU_USER@ -r @TOOLCHAIN_HEADERS_VERSION@ \
>>     @QEMU_USERMODE_ARGS@ \
>>    -L "${STAGING_DIR}/" \
>> +   -E LD_LIBRARY_PATH="${STAGING_DIR}/lib:${STAGING_DIR}/usr/lib/" \
>>     "$@"
> 
> We've already had hints about doing something like that, but this is
> going to require a much more detailed commit log than you provided.
> Ah, I see you were part of:
> 
>    https://bugs.busybox.net/show_bug.cgi?id=14366
> 
> Also, Thomas did quite some in-depth analysis of the qemu issue (you
> even were in Cc of that mail):
> 
>    https://lore.kernel.org/buildroot/20221031213926.50d3c778@windsurf/
> 
> As you see, just stating "it is important to also set LD_LIBRARY_PATH in
> v8-qemu-wrapper.in to our staging libdirs as otherwise execution of
> build tools fail due to host OS libraries being preferred" is not
> enough. We really need an actual explanation.
> 
> So, please, canyou split this patch into two:
>  - fix the parallel build issue,
>  - fix the qemu wrapper with a synthesis of Thomas' extensive analysis
> 
> And in that second patch, please add a reference to the bug you close.

Ok, I just submitted a new patch just for fixing v8-qemu-wapper.in <http://v8-qemu-wapper.in/>. The other issue with the parallel build I will resubmit as soon as I have the error at hand again and can explain it in more detail.

Best Regards,

Jens
-- 
Jens Maus, Dresden/Germany
http://jens-maus.de/

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
