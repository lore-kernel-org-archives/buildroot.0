Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E17C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 20:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC77D4061F;
	Tue,  2 Jan 2024 20:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC77D4061F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 311fEi0C6I-J; Tue,  2 Jan 2024 20:26:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A121340A62;
	Tue,  2 Jan 2024 20:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A121340A62
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A714F1BF314
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CC3081E6C
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CC3081E6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vlc86TnpLKcH for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 20:26:18 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5405F81E66
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 20:26:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5405F81E66
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B9D46B0053E;
 Tue,  2 Jan 2024 21:26:12 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 02 Jan 2024 21:26:12 +0100
Date: Tue, 2 Jan 2024 21:26:12 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <ZZRxZPlyXJWTBeFl@landeda>
References: <ZNOMtm7TTVd12BQ3@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZNOMtm7TTVd12BQ3@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704227174;
 bh=ctBieoRGE1a/zPbx1ozHQYuyY5+0+JIOc5R7D/neCug=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kvbH/4fnOVwgyxRJCwnFwC8V+9R0vPaddejoLDpojQwEURdbW2HyPQjTIXz4lQ/2b
 LYlGhBLXs8OJX6d0dKR5su60RlTLUOBrgi4I0p4Oj5sy9Nmt4OqbfEutM3J3spTVWd
 TAR0cHQgrJrivOPFNKEGpyHj/9l6HcEyT+LTABQRTocPsb+Vv5bbP2luAJsjlhi5wd
 OrCn8VZ8SDkfn0j5ujP657sioORhZ7xGf9zkBfmLH4nviL0j1CJhlkllctFMItKa6/
 Q6CncBtlm+QHxDZHlevIPL94YW4V43tHz2IrxIWv/saBoxSYyOXWGobW8Aj4Ovvq8A
 3LXGp4Ec/RfkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kvbH/4fn
Subject: Re: [Buildroot] [PATCH] package/perl: threads support needs locales
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

Waldemar, All,

On 2023-08-09 14:55 +0200, Waldemar Brodkorb spake thusly:
> The thread support in perl needs locales enabled in the C library.
> Otherwise it fails with:
> POSIX.xs:3386:13: error: 'MBLEN_LOCK' undeclared (first use in this function); did you mean 'MUTEX_LOCK'?
> 
> This failure was introduced in commit 7c1ef8129f37200b046750c6405ecd304fd4f1bf which upgraded
> perl to 5.34.0.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/13d/13d66e281cb4778f7498f909f5f7c65d4b28bcbb/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

It's been a little while, but I can't reproduce that build failure on
the newer perl versions we have in the tree now. Besides, as Thomas
spotted, it is dubious that locales has anything to do with threads.

Myabe that was an oversight from upstream that was fixed in later
versions. Anyway, not reproducible, so I marked this patch as rejected.

Thanks, and sorry for the long delay in replying...

Regards,
Yann E. MORIN.

> ---
>  package/perl/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/perl/Config.in b/package/perl/Config.in
> index 0ead1c4a46..9eb6334b9e 100644
> --- a/package/perl/Config.in
> +++ b/package/perl/Config.in
> @@ -27,6 +27,7 @@ config BR2_PACKAGE_PERL_MODULES
>  config BR2_PACKAGE_PERL_THREADS
>  	bool "thread support"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_ENABLE_LOCALE
>  	help
>  	  Enable use of threads in Perl scripts
>  
> @@ -34,4 +35,7 @@ config BR2_PACKAGE_PERL_THREADS
>  	  is officially discouraged.
>  	  See https://perldoc.perl.org/threads.html#WARNING
>  
> +comment "Threads support needs locales"
> +	depends on !BR2_ENABLE_LOCALE
> +
>  endif
> -- 
> 2.39.2
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
