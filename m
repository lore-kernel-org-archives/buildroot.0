Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B17EB64DD
	for <buildroot@archiver.kernel.org>; Mon, 14 Aug 2023 11:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B2E640981;
	Mon, 14 Aug 2023 11:23:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B2E640981
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id non7U88A4Z0U; Mon, 14 Aug 2023 11:23:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4CDC40982;
	Mon, 14 Aug 2023 11:23:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4CDC40982
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A9BB81BF3AF
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 11:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 821BF8128A
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 11:23:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 821BF8128A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id euZDCe8MBjyT for <buildroot@lists.busybox.net>;
 Mon, 14 Aug 2023 11:23:44 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A63A8129F
 for <buildroot@buildroot.org>; Mon, 14 Aug 2023 11:23:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A63A8129F
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7642:bfa0:cf62:9177])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 44425B0037C;
 Mon, 14 Aug 2023 13:23:37 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 14 Aug 2023 13:23:36 +0200
Date: Mon, 14 Aug 2023 13:23:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20230814112336.GC421096@scaer>
References: <20230814063639.1145396-1-thomas@devoogdt.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230814063639.1145396-1-thomas@devoogdt.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692012221;
 bh=ANqbdjAzuKgEAGgpscTbpfoBHxqiQLG8GZmfxSGuzGU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d99RDllfoQrLDGZsV+sxygwkX8cBfPItNbKg1caE+ztY9mpMa2LO/mu6rGtgtRms0
 qjfU7XmVm/0QNEgDuPGRm4J9lc3ENIr7An7bFizSEcGRIM3H4kZxcCMA2EpPu8kEAn
 5BObxqXxsqeRpbOIRKmMv3MVGlFm2jjlDWiYW42ExqL4F0KTmPmcFwIlk314/HUZxe
 8UyRROa0Yj61ixl9ELoqa1KvMN2euEiKN1KKml1Sg5pOeWe2AZ9oSOVPFuH9v7YUEi
 YbYpfyYbsFyzrWNayPOYk/kLshys4LEXVA65GRjH+ONPBQWNVuDqVk9vE5SL8uqXKo
 08njhPWhvvUsA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=d99RDllf
Subject: Re: [Buildroot] [PATCH v2,
 next] package/llvm-project/compiler-rt: fix circular dependency
 warning
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
Cc: Daniel Lang <dalang@gmx.at>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-08-14 08:36 +0200, Thomas Devoogdt spake thusly:
> make[4]: Circular include/sanitizer/allocator_interface.h <- include/sanitizer/allocator_interface.h dependency dropped.
> make[4]: Circular include/sanitizer/asan_interface.h <- include/sanitizer/asan_interface.h dependency dropped.
[--SNIP--]
> It's not clear why this cycle happens,

Well, it is rather easy to understand:

  - include/CMakeLists.txt unconditionally declares dependency rules
    between header files in ${output_dir} and ${CMAKE_CURRENT_SOURCE_DIR}
    without provision for them to be the same directories;

  - this triggers the above warnings from make, hich arbitrarily breaks
    circular dependencies, which in our case happens to be OK.

See how I extended the commit log for more details.

And this is actually a fix for an issue that already happens on master.
So: applied to master, thanks.

Regards,
Yann E. MORIN.

> but compiler-rt also proposes to
> create a separate build folder on their site: https://compiler-rt.llvm.org/.
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> ---
> v2:
>   - This patch was orignally submitted to fix the ninja build, which does a hard assert on circular dependencies.
>     Make is less strict on it, and retries with arbitrary dropping dependencies. The oringal git message was wrong
>     to mention that it fixes the ninja build since ninja is not enabled by default anyway. So in v2, I just
>     changed the git message to only mention the circular dependency warning.
> 
>   - Original Ninja error:
> 
>   ninja: error: dependency cycle: include/sanitizer/allocator_interface.h -> include/sanitizer/allocator_interface.h
> 
> ---
>  package/llvm-project/compiler-rt/compiler-rt.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/llvm-project/compiler-rt/compiler-rt.mk b/package/llvm-project/compiler-rt/compiler-rt.mk
> index 03dc76eaea..5d9c3d8fa8 100644
> --- a/package/llvm-project/compiler-rt/compiler-rt.mk
> +++ b/package/llvm-project/compiler-rt/compiler-rt.mk
> @@ -11,6 +11,7 @@ COMPILER_RT_LICENSE = NCSA MIT
>  COMPILER_RT_LICENSE_FILES = LICENSE.TXT
>  COMPILER_RT_CPE_ID_VENDOR = llvm
>  COMPILER_RT_DEPENDENCIES = host-clang llvm
> +COMPILER_RT_SUPPORTS_IN_SOURCE_BUILD = NO
>  
>  COMPILER_RT_INSTALL_STAGING = YES
>  COMPILER_RT_INSTALL_TARGET = NO
> -- 
> 2.34.1
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
