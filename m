Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058D0CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 16:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2FEC406C4;
	Sat, 10 Oct 2026 16:26:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n7n93y5Rr_Th; Sat, 10 Oct 2026 16:26:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A087040759
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791649612;
	b=T4k+nDkN0Rc8bq1Z3Add191YbLfL6qz3VXeWmg+BcKDqBgwasCCZlSuosUVNZ5ohZO04
	 0Wllyg05aTnn0WpvNo2Aw4E+/WMLkvvStHnxNEa78gpm7ujWiqrrDYl3sPdsTh+5lJ3TF
	 1RGefJszA1/CEJ0ZKvc8QG/Wb6C2dLUg/h+37LhNebnnpWadz3fnTaM6hDpuQiQ8mL4i4
	 /SWWMIe2NXxSp1kmeMLq4B9r50sV07sG+/3qMdLzj0xBy5BGJPK5snJnneScR5mzRnWg9
	 HhTZQ+pQLrgbKixiS9EIFOXdQFfjMA9TLECavXgDwLwq8/Ihx10jFSd2cWr01n9dGZg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791649612;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Transfer-Encoding:
	 Content-Type:Errors-To:Sender;
	bh=8E6Jabq0XJaMRI/yWpQfI3bJc7zjM9Ar+vF9Yx3wiB4=;
	b=pxPuyRherawNDHDfZlUVKya/lV6FsUiP1SXbST31T7KZCm+/HEHxsZkf5B6jEG84FgJQ
	 r8ToKW6oZpsaQ68kbNyQ1w4Jblw5dWWErq8nttsuNNN2I+GT82jXnl6mIEHVs8E/KDaOS
	 E3cHwZ4MWn7OHBEovwICQ5vAabCd24ovNvz4/BM5R/yvCoVITc0rU8jWZQMwFon7X6Peb
	 N1FNtOV51NXVeb6j9n9YT3VRmmvo7ZhHTRORMpUYXTpPhnTQhQFvj6si0U34BSfDXBeDp
	 WppS7ghP2Fu13Cxg6hwYn+6uaTC8a8DBZa0uS4QbljZqEXD7CyC77e4AKF6qf7aWnsA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791649612;
	bh=8E6Jabq0XJaMRI/yWpQfI3bJc7zjM9Ar+vF9Yx3wiB4=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=U1xdDpNm81fZKnHomsNZevJ8CniJy+Bp39Wn0sFuxAVkYsaAYWabZunS8zNJ8GHp2
	 SBJlvVJdJoo0xWDwryNDpfYno9ZeCgfHilpzlagF5yDDmEIfynOgY5yCeMn4kSORKZ
	 QWHCwk2tfd1ShY76RRboPa7vShSOPU98/Ztymrqb+T3bxnoFO6kpM89AONH9EN/5p6
	 mVhqmxskw+97+3yohvZ7VsPSqrHIUtZPsFxch3r5gKvWjdQ8KM+AfE265dkCH0srAN
	 1wrKho4IOFrxU+cDlMR9Azz53D0H5lEFriawYTRSEHZtTPFinVjD6at77Vlcd+C7cP
	 QAHR+56LZwLfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A087040759;
	Sat, 10 Oct 2026 16:26:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 12C22105
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 045494005E
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:26:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6T3GajQ0sC4b for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 16:26:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A656340004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791649610;
 b=D+sUqWhz6o/yfT0ori7drZRAATxLMDV572gYQ20FFQiVJn9XQ+iGYSJoUOl6MrlQic9+
 4V+uqPoAwGfR8G7lyHUE3jZO4gEKzRZEDP56MPuw86r68RPHIuAO0yO1GmVIsga4TdsTU
 rhdjvGwSmMC5seE3uQEVUqSjRh2B7ca7ZQXQaskQI3FT9+nS9C6jatoqTkBqgdN2vRJtb
 entm7ExFi9kDm0P9TG0Xh1evH905FPLUJ4GIktmbeSPPcEaFpT0N8S91YNtGqDcmbg0M0
 4OQ344IqLGS/iU2aGLUrznU0BNnqGPqdKp2iqdfRaPkbT4HsbMZdXP+rdSrF8ty52aw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791649610;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=eeY/rgIkCck/F3mr+8SHOeuJDkzQcHAJxouaVIcVNXM=;
 b=rUrH04uncE9XjsDz9SHLMcebFWWDvn+NbpIkVCfFmU/nd2R+VDiYLZxfHRPHAuONQ5f4
 NZz4boPUpywSRKKUja1Gg8jK7ur68YMd3yr+rrkH+hzLUVdnFTkeQYdWDL/eNOQ78AIwe
 Opq0n8C+Mrzyun7qhYgF7C9mY6MkpTy9ib+/XK8NmISMFtgIseyky3Hlgtp98BsYI8QfO
 KRmOiysn622KFO7FBPPGA6spsxstvjBnSWV1Vuw1taYySdqipZpTmNnuGwlTvc+pG30DA
 qLcZIV0qP7cEpaJnOsZbU8clup9GkL4KndJkq0pnbiAUN9PlBVa/WRaNWyF1b/DOZ7A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="n/3a50zl"; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A656340004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:26:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 951945FFAF;
 Sat, 10 Oct 2026 18:26:41 +0200 (CEST)
Received: from 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f)
 via 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 10 Oct 2026 18:26:41 +0200
MIME-Version: 1.0
Date: Sat, 10 Oct 2026 18:26:41 +0200
To: Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20261010100152.490887-1-thomas.perale@mind.be>
References: <20260930211826.2349920-1-yegorslists@gmail.com>
 <20261010100152.490887-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.19
Message-ID: <5d114147eee866a0cb2806000fabf656@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/atop: fix musl build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Cc: chakrabortyshubham66@gmail.com, buildroot@buildroot.org,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 thomas.petazzoni@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On 10/10/2026 12:01, Thomas Perale via buildroot wrote:
> Hi,
> 
> Tested by modifying `support/testing/tests/package/test_atop.py` to use 
> musl
> library.
> 
> I would just add the reference to the buildroot commit that made the 
> bump: 2110131cab2a613567c99491ba540bb33440e46c

I applied this patch after adding the reference to the commit, as 
suggested.

> Tested-By: Thomas Perale <thomas.perale@mind.be>
> 
> In reply of:
>> Since the bump to version 2.13.0, atop fails to build with musl:
>> 
>> drawbar.c:2336:33: error: implicit declaration of function 'waddwstr'; 
>> did you mean 'waddstr'? [-Wimplicit-function-declaration]
>> 
>> (Before 2.13.0, the same configurations already failed earlier on
>> uClibc because _POSIX_C_SOURCE was defined without a value. Upstream
>> fixed that in 2.13.0 by giving it an explicit value, but the same
>> pattern remains for _XOPEN_SOURCE.)
>> 
>> ncurses only declares its wide-character API, including waddwstr(),
>> when NCURSES_WIDECHAR is set. If the application does not set it,
>> curses.h derives it from the feature test macros:
>> 
>>   #if defined(_XOPEN_SOURCE_EXTENDED) || \
>>       (defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE - 0 >= 500))
>> 
>> drawbar.c defines _XOPEN_SOURCE with an empty value, which makes the
>> check evaluate as 0 >= 500 and fail.
>> 
>> This only breaks with musl because of the C library's <features.h>,
>> which curses.h pulls in through <stdio.h> before doing the check.
>> glibc and uClibc both redefine _XOPEN_SOURCE to 700 and define
>> _XOPEN_SOURCE_EXTENDED whenever _GNU_SOURCE is set, which drawbar.c
>> does, so the empty definition gets fixed up. musl never modifies the
>> application's feature test macros, so the empty value reaches
>> curses.h and the wide-character prototypes are left out.
>> 
>> Add a patch that defines _XOPEN_SOURCE as 700, matching the
>> _POSIX_C_SOURCE value of 200809L that is already used.
>> 
>> Fixes:
>>  - 
>> https://autobuild.buildroot.org/results/914c1d8fa0fc8bbef64e4a64d58e5941d0077a3e
>>  - 
>> https://autobuild.buildroot.org/results/b91/b91ea0722202de0d1fdeeaeea167fd1b21b6d5d6
>> 
>> Assisted-by: Claude:claude-opus-5-5
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> 
>> ---
>>  ...xplicit-value-for-_XOPEN_SOURCE-macr.patch | 48 
>> +++++++++++++++++++
>>  1 file changed, 48 insertions(+)
>>  create mode 100644 
>> package/atop/0001-drawbar-define-explicit-value-for-_XOPEN_SOURCE-macr.patch
>> 
>> diff --git 
>> a/package/atop/0001-drawbar-define-explicit-value-for-_XOPEN_SOURCE-macr.patch 
>> b/package/atop/0001-drawbar-define-explicit-value-for-_XOPEN_SOURCE-macr.patch
>> new file mode 100644
>> index 0000000000..d526d58433
>> --- /dev/null
>> +++ 
>> b/package/atop/0001-drawbar-define-explicit-value-for-_XOPEN_SOURCE-macr.patch
>> @@ -0,0 +1,48 @@
>> +From 54799216beac63a195cd6d34b22476fc15a80295 Mon Sep 17 00:00:00 
>> 2001
>> +From: Yegor Yefremov <yegorslists@googlemail.com>
>> +Date: Wed, 30 Sep 2026 10:59:49 +0200
>> +Subject: [PATCH] drawbar: define explicit value for _XOPEN_SOURCE 
>> macro
>> +
>> +drawbar.c uses the wide-character curses function waddwstr(). ncurses
>> +only declares its wide-character API when NCURSES_WIDECHAR is set,
>> +which curses.h derives from the feature test macros:
>> +
>> +  #if defined(_XOPEN_SOURCE_EXTENDED) || \
>> +      (defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE - 0 >= 500))
>> +
>> +drawbar.c defines _XOPEN_SOURCE without a value, so _XOPEN_SOURCE - 0
>> +evaluates to 0 and the check fails.
>> +
>> +With glibc and uClibc this goes unnoticed, because their <features.h>
>> +redefines _XOPEN_SOURCE to 700 (and defines _XOPEN_SOURCE_EXTENDED)
>> +whenever _GNU_SOURCE is set. musl does not touch the application's
>> +feature test macros, so the empty definition reaches curses.h
>> +unchanged and the build fails:
>> +
>> +drawbar.c:2336:33: error: implicit declaration of function 
>> 'waddwstr'; did you mean 'waddstr'? [-Wimplicit-function-declaration]
>> +
>> +Define _XOPEN_SOURCE as 700, which matches the already explicit
>> +_POSIX_C_SOURCE value of 200809L (both refer to POSIX.1-2008).
>> +
>> +Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>> +Upstream: https://github.com/Atoptool/atop/pull/415
>> +---
>> + drawbar.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/drawbar.c b/drawbar.c
>> +index 651a81e..e4db0d6 100644
>> +--- a/drawbar.c
>> ++++ b/drawbar.c
>> +@@ -104,7 +104,7 @@
>> + // the other.
>> + 
>> /////////////////////////////////////////////////////////////////////////////
>> + #define _POSIX_C_SOURCE	200809L
>> +-#define _XOPEN_SOURCE
>> ++#define _XOPEN_SOURCE	700
>> + #define _GNU_SOURCE
>> + #define _DEFAULT_SOURCE
>> +
>> +--
>> +2.34.1
>> +
>> --
>> 2.34.1

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
