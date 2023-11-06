Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BE3C4167B
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 13:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54AD6409FC;
	Mon,  6 Nov 2023 13:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54AD6409FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gSPzkcRmyh0z; Mon,  6 Nov 2023 13:30:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C1DD404CA;
	Mon,  6 Nov 2023 13:30:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C1DD404CA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C82E51BF2EA
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 13:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1A32404BF
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 13:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1A32404BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zd2qvLAHFHSM for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 13:30:18 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 053034033D
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 13:30:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 053034033D
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5023:65e3:22e2:e1cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id A691F19F57B;
 Mon,  6 Nov 2023 14:30:12 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 06 Nov 2023 14:30:12 +0100
Date: Mon, 6 Nov 2023 14:30:12 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Maciej Grela <enki@fsck.pl>
Message-ID: <20231106133012.GB2625@scaer>
References: <20231106130835.116844-1-enki@fsck.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231106130835.116844-1-enki@fsck.pl>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1699277414;
 bh=Qb//c0zet2yE91UpL7QZ5tTh766E1ga12Y3n85Nzm3Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ut/XIQwEhfTF47XoaN8qm7YIn6hNhhbYMAAwfqsJ2Sk+mRKVim4dp1yKT4MW/E6mT
 Zkb5nkAD5Skg+IGmYuIkGjAOCQ07GAGSShboxIGcEerFk2pq63pCC5r0La1FZBuvnf
 KQfGlOTZkBXpMk6bEmUomLqmnCtwun5akZ8k3EmYX/gractTyeHZdKuEBwL4+GkVVf
 nd7wcIeMeT2YpHap7sjJPA1PHCkuYIG8pnRsuzFnyx6ODuXy61b59lVHeIGSZCH4Af
 ox5Tf3tM+dzGqGJJmVjH9PWsgv9iEUsF2DIKnXB92GTjmAZhQmTy8jvzoyFJKsnDeb
 5agAlSw9pSZkA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ut/XIQwE
Subject: Re: [Buildroot] [PATCH v4 1/1] package/spirv-tools: fix build issue
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

Maciej, All,

On 2023-11-06 14:08 +0100, Maciej Grela spake thusly:
> spirv-tools requires a toolchain w/ shared libs, add flag dependency and comment.
> 
> Fixes: http://autobuild.buildroot.net/results/a1f615d2410bffb6fdacc8586761c9def05aafa9
> Fixes: http://autobuild.buildroot.net/results/294ade8c9aa3d650fa5ab6cc34701c4176bc197f

Sorry, but I still don't understansd how those two build failures relate
to static builds.

Both failed build logs are about a broken C++ compiler:

    -- Detecting CXX compiler ABI info
    -- Detecting CXX compiler ABI info - failed
    -- Check for working CXX compiler: /usr/bin/clang++
    -- Check for working CXX compiler: /usr/bin/clang++ - broken

And indeed, it is not surprising that the host C++ compiler be broken
when doing cross-compilation, as it is used to tentatively build taget
code:

    /usr/bin/clang++ --sysroot=/home/thomas/autobuild/instance-1/output-1/host/armeb-buildroot-linux-uclibcgnueabi/sysroot -O3 -DNDEBUG -static  CMakeFiles/cmTC_faefe.dir/testCXXCompiler.cxx.o -o cmTC_faefe
    /usr/bin/ld: /home/thomas/autobuild/instance-1/output-1/host/armeb-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/crt1.o: relocations in generic ELF (EM: 40)
    /usr/bin/ld: /home/thomas/autobuild/instance-1/output-1/host/armeb-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/crt1.o: error adding symbols: file in wrong format
    clang: error: linker command failed with exit code 1 (use -v to see invocation)

So, if it really is about a static linking issue, we need more
details...

Regards,
Yann E. MORIN.

> Signed-off-by: Maciej Grela <enki@fsck.pl>
> ---
>  package/spirv-tools/Config.in | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/package/spirv-tools/Config.in b/package/spirv-tools/Config.in
> index 39fdb80b86..c1d3a4f9bc 100644
> --- a/package/spirv-tools/Config.in
> +++ b/package/spirv-tools/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_SPIRV_TOOLS
>  	bool "spirv-tools"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
> +	depends on !BR2_STATIC_LIBS
>  	select BR2_PACKAGE_SPIRV_HEADERS
>  	help
>  	  The SPIR-V Tools project provides an API and commands for
> @@ -9,6 +10,8 @@ config BR2_PACKAGE_SPIRV_TOOLS
>  
>  	  https://github.com/KhronosGroup/SPIRV-Tools
>  
> -comment "spirv-tools needs a toolchain w/ C++, gcc >= 7"
> +comment "spirv-tools needs a toolchain w/ C++, gcc >= 7, dynamic library"
>  	depends on !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
> +		BR2_STATIC_LIBS
> +
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
