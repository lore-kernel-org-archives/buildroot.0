Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0005FC001DF
	for <buildroot@archiver.kernel.org>; Sun, 22 Oct 2023 11:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89C368504F;
	Sun, 22 Oct 2023 11:30:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89C368504F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rFdqglFcleDY; Sun, 22 Oct 2023 11:30:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5C8D84F88;
	Sun, 22 Oct 2023 11:30:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5C8D84F88
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 32A6A1BF5AD
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 11:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 180E14EF67
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 11:30:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 180E14EF67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cC-F8SoaJLUu for <buildroot@lists.busybox.net>;
 Sun, 22 Oct 2023 11:30:37 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7DDEA4AC55
 for <buildroot@buildroot.org>; Sun, 22 Oct 2023 11:30:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DDEA4AC55
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 9617019F5A7;
 Sun, 22 Oct 2023 13:30:31 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:46070])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Oct 2023 13:30:31 +0200
MIME-Version: 1.0
Date: Sun, 22 Oct 2023 13:30:31 +0200
From: Julien Olivain <ju.o@free.fr>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
In-Reply-To: <ZTPtYruqfAvaqHCj@gmail.com>
References: <20231020060236.3725194-1-marcus.folkesson@gmail.com>
 <7a3a5533d8fc664535be030d5d1242f1@free.fr> <ZTPtYruqfAvaqHCj@gmail.com>
User-Agent: Webmail Free/1.6.4
Message-ID: <b9762c5aeabb8feb81d5ba7549037b75@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1697974233;
 bh=QAJXhTcDYbCLQpS8uKI3/jbNW2bLAAcDMbNb85GsF4I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rl0T+EE00yDPRxBwRpvVg44pj8tBr6QuNU80eeZx03zGpTLvIP+93cG4vajZn/Hc8
 btO656KUQzVkB7+uF9UBw1nFLDRtjZX/EAy0/rLM2X+p/oTsn9diHvy+q088CCCDsb
 ANOvmT1RLi1u9H7YHyQM8TU9L/XoEH812FY9420uxa6u71zJYa25DOvidvqOd3O2CP
 9pzCZn1AX8i2x8pTNJCmI8YlUpEbvSOxQqFsaK2dH8XVYb1+BeloJDrhkIiRP+bqkp
 /XvzXwbqknyR7ECMMYOcfYqePPwuwY90R1MA42PXWLEAtmtTJJy5zJLTT4bU9AVYzg
 tlYz5hBoX+UCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rl0T+EE0
Subject: Re: [Buildroot] [PATCH v4] package/criu: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Marcus,

On 21/10/2023 17:25, Marcus Folkesson wrote:
> Hi Julien,
> 
> Thank you for your solid review!
> 
> I will apply all changes you suggested.
> 
> On Sat, Oct 21, 2023 at 01:15:10PM +0200, Julien Olivain wrote:
>> Hi Marcus,
>> 
>> Thanks for the updated patch!
>> 
> 
> [...]
>>            bootlin-x86-64-uclibc [26/45]: FAILED
>> 
>> Build fails with output:
>> 
>>     criu/fsnotify.c:18:10: fatal error: aio.h: No such file or 
>> directory
>>        18 | #include <aio.h>
>>           |          ^~~~~~~
> 
> Not sure that to do about this. It already depends on libaio.

There is something strange here, in the criu code:

libaio (Linux AIO) normally provides the "libaio.h" header file. See:
https://pagure.io/libaio/blob/master/f/src/libaio.h

This header file is used exactly once in a criu test, here:
https://github.com/checkpoint-restore/criu/blob/v3.18/test/zdtm/static/aio00.c#L1

The rest of the code uses "aio.h" and <aio.h> (Posix AIO).

criu code also includes its own "aio.h" file:
https://github.com/checkpoint-restore/criu/blob/v3.18/criu/include/aio.h

The <aio.h> header file is normally provided by the libc, if
implemented. See glibc for example:
https://sourceware.org/git/?p=glibc.git;a=blob;f=include/aio.h

musl does also provide aio.h, see for example:
https://git.musl-libc.org/cgit/musl/tree/include/aio.h?h=v1.2.4

uclibc-ng does not currently provide aio.h.

So maybe this means criu requires a libc with aio.h?
In that case, that would mean this packages need a dependency on:

     depends on !BR2_TOOLCHAIN_USES_UCLIBC # no aio.h

Were you ever able to do a successful build with uclibc?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
