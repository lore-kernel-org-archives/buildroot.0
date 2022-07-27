Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1B9C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 16:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73BDB60E5C;
	Wed, 27 Jul 2022 16:20:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73BDB60E5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2__GHkAGaucf; Wed, 27 Jul 2022 16:20:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 920BD60E4F;
	Wed, 27 Jul 2022 16:20:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 920BD60E4F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 495BC1BF422
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 16:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2511F40608
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 16:20:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2511F40608
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D02sV5-UUtIH for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 16:20:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2246840136
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2246840136
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 16:20:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:2464:a3b6:9580:87a1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 54E8DB0071D;
 Wed, 27 Jul 2022 18:20:40 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 27 Jul 2022 18:20:40 +0200
Date: Wed, 27 Jul 2022 18:20:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20220727162040.GE1134587@scaer>
References: <20220727150230.2529065-1-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220727150230.2529065-1-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658938842;
 bh=sgPb8WbGDfkfxBitry3S6LJAZHacZb2XRJglAEAF4DM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VA619qn4TilkfSMzSGQrvuBNYrwWocQbXHZ7iPzUHWCxXEGV36r6qY0s4X+z6BEFh
 G3KzIh1bB1xzNYX35J10yVOg/JG+lEKFL99dFZp0lFiiIny67OCNNeXk0xnWZcrXeg
 af6bmzsIQ91iGA8rT4r5oNLswI+IyqW8Lzm/3bt5/1qD9b6Uqnb84orBVgYzF1d/wc
 8aZ+jx2RqN9ddvvU8tRMwVEuoRHL3w1MTsC+G1B7dGzPEBFSZhGLW7JDeFSyhUeB5Z
 pt0sf4meWksC3irWxmSKzg0XOfP5YJxJP61ij9rm7ZbP4FRu+3M1j/hhamgUTVNYbc
 wiBmzjgKatPnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VA619qn4
Subject: Re: [Buildroot] [PATCH] support/testing/run-tests: fix --testcases
 option
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2022-07-27 17:02 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> The --testcases option of run-tests says how many test cases to build in
> parallel. It automatically derives a jlevel from it by dividing the
> number of cores + 1 by the number of parallel testcases. However, this
> will typically result in a fractional number. Make doesn't like
> fractional numbers as argument to -j.
> 
> Convert the number to integer (rounding up).
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  support/testing/run-tests | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/run-tests b/support/testing/run-tests
> index 022209b414..f9c0bebc48 100755
> --- a/support/testing/run-tests
> +++ b/support/testing/run-tests
> @@ -87,7 +87,7 @@ def main():
>              return 1
>          # same default BR2_JLEVEL as package/Makefile.in
>          br2_jlevel = 1 + multiprocessing.cpu_count()
> -        each_testcase = br2_jlevel / args.testcases
> +        each_testcase = int((br2_jlevel + args.testcases - 1) / args.testcases)

* br2_jlevel is an int, as multiprocessing.cpu_count() is an int, so it
  will be always >=2  (cpu_count() raises an error if it can't determine
  the number of CPU, so it will always return at least 1);

* args.testcases is an int, and is checked to be >=1

So, with the following, we're guaranteed to have an int that is >=1:

    int((br2_jlevel + args.testcases) / args.testcases)

Because br2_jlevel + args.testcases is guaranteed to always be bigger
than or equal to args.testcases.

>          if each_testcase < 1:
>              each_testcase = 1

So that test can be dropped now.

I've amended your change with the above. Please yell if my maths are
wrong... ;-)

Regards,
Yann E. MORIN.

>          BRConfigTest.jlevel = each_testcase
> -- 
> 2.35.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
