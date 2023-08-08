Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F61BC001DB
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 18:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D6638209C;
	Tue,  8 Aug 2023 18:02:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D6638209C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U1vg26sNGVBl; Tue,  8 Aug 2023 18:02:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 597F68209D;
	Tue,  8 Aug 2023 18:02:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 597F68209D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD0741BF59C
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85FC461186
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:02:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85FC461186
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZFeRjbBNsGuh for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 18:02:10 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E4D966119A
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 18:02:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4D966119A
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7690:354b:c655:f7b2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 7829678036C;
 Tue,  8 Aug 2023 20:02:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 08 Aug 2023 20:02:00 +0200
Date: Tue, 8 Aug 2023 20:02:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20230808180200.GB421096@scaer>
References: <20230808090407.558957-1-thomas@devoogdt.com>
 <20230808112016.226ac8be@windsurf>
 <CACXRmJhaDgbsEhKC+m60ifiv0bPd8rC10OmAN8pqi=RBs_vtJw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACXRmJhaDgbsEhKC+m60ifiv0bPd8rC10OmAN8pqi=RBs_vtJw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691517724;
 bh=5raD32BfHDnMA6y4+cykA7kWeSIrKGprXzeG6RGilDE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o4ovKUR7/1wBE4W7nQDZ95TjcS0USX5YTZvB7vQf13g3Us6UlzX8hj9hxSbKjn+23
 bCCNOLhJr6rodbL+wuTqF1H+MzWkDnUks92T7uKSmu+dgkndQY9RFKwHo0bU67kdAm
 Bga2C0mEn4dALcf08qyYYFhI5MVMkhLPdrEsof+e697nrZ1N+iVaV6++CxsdpHbyvG
 AOIjQWdPD7zwbIpODLfYg6Yu4/dqoC/a8RqISyMA6ubzNupMC/EebUH6Gz2t6XOWp8
 OfRmLq6NjwtM3oC1MM/uTqeRT4CClZZxSFlG2A6Om3LKfWUFcteLtidN1djzSNM51+
 WYYfYUCme8fwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=o4ovKUR7
Subject: Re: [Buildroot] [PATCH v1,
 next] package/llvm-project/compiler-rt: fix build with Ninja
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

Thomas D., All,

On 2023-08-08 13:22 +0200, Thomas Devoogdt spake thusly:
> > Not sure to understand: the default backend for CMake is still
> > makefiles, and compiler-rt was not switched to using ninja. So?
> 
> No, ninja is not yet the default.
> Yann did some tests to find out if it makes sense to make ninja the default.
> If only a few packages break on it, then we can force them to use make.
> But if there are too many of them, then we can just keep make as the default.
> 
> Either way, see this mail:
> https://lore.kernel.org/buildroot/20230806205447.GW421096@scaer/,
> where Yann told me that compiler-rt fails on ninja, so that's the
> reason for the patch.

Yes, but as Thomas P. explains, we only need to fix compiler-rt with
ninja if it is actually switched over to using ninja, which your patch
does not do.

Presumably, the build of compiler-rt succeeds now, so if it ain't
broken, so why would we need to fix it by building out-of-source?

But if you had tested, you'd have noticed that the build *is* already
broken even with makefiles. But make is (insanely) forgiving about
circular dependencies, and just arbitrarily drops a circular dependency:

    >>> compiler-rt 15.0.3 Building
    PATH="..." /home/ymorin/dev/buildroot/O/next/per-package/compiler-rt/host/bin/cmake --build /home/ymorin/dev/buildroot/O/next/build/compiler-rt-15.0.3/ -j9 -- 
    make[4]: Circular include/sanitizer/allocator_interface.h <- include/sanitizer/allocator_interface.h dependency dropped.
    make[4]: Circular include/sanitizer/asan_interface.h <- include/sanitizer/asan_interface.h dependency dropped.
    make[4]: Circular include/sanitizer/common_interface_defs.h <- include/sanitizer/common_interface_defs.h dependency dropped.
    make[4]: Circular include/sanitizer/coverage_interface.h <- include/sanitizer/coverage_interface.h dependency dropped.
    make[4]: Circular include/sanitizer/dfsan_interface.h <- include/sanitizer/dfsan_interface.h dependency dropped.
    make[4]: Circular include/sanitizer/hwasan_interface.h <- include/sanitizer/hwasan_interface.h dependency dropped.
    make[4]: Circular include/sanitizer/linux_syscall_hooks.h <- include/sanitizer/linux_syscall_hooks.h dependency dropped.
    make[4]: Circular include/sanitizer/lsan_interface.h <- include/sanitizer/lsan_interface.h dependency dropped.
    make[4]: Circular include/sanitizer/msan_interface.h <- include/sanitizer/msan_interface.h dependency dropped.
    make[4]: Circular include/sanitizer/netbsd_syscall_hooks.h <- include/sanitizer/netbsd_syscall_hooks.h dependency dropped.
    make[4]: Circular include/sanitizer/scudo_interface.h <- include/sanitizer/scudo_interface.h dependency dropped.
    make[4]: Circular include/sanitizer/tsan_interface.h <- include/sanitizer/tsan_interface.h dependency dropped.
    make[4]: Circular include/sanitizer/tsan_interface_atomic.h <- include/sanitizer/tsan_interface_atomic.h dependency dropped.
    make[4]: Circular include/sanitizer/ubsan_interface.h <- include/sanitizer/ubsan_interface.h dependency dropped.
    make[4]: Circular include/fuzzer/FuzzedDataProvider.h <- include/fuzzer/FuzzedDataProvider.h dependency dropped.
    make[4]: Circular include/sanitizer/memprof_interface.h <- include/sanitizer/memprof_interface.h dependency dropped.
    make[4]: Circular include/profile/MemProfData.inc <- include/profile/MemProfData.inc dependency dropped.
    make[4]: Circular include/xray/xray_interface.h <- include/xray/xray_interface.h dependency dropped.
    make[4]: Circular include/xray/xray_log_interface.h <- include/xray/xray_log_interface.h dependency dropped.
    make[4]: Circular include/xray/xray_records.h <- include/xray/xray_records.h dependency dropped.
    make[4]: Circular include/orc/c_api.h <- include/orc/c_api.h dependency dropped.
    make[4]: Circular include/profile/InstrProfData.inc <- include/profile/InstrProfData.inc dependency dropped.

In this case, this is OK because the file depends on itself, so breaking
the circular dependency actually removes the spurious dependency.

However, this is not correct, and thus we do need to build compiler-rt
with out-of-source, even with makefile, because it *is* broken.

So, the rationale is wrong: it is not broken because of ninja. It is
broken despite ninja, but ninja exposes the breakage.

Really, when we have a patch that fixes something, what is broken and
why it is broken, is of the utmost most importance; the explanations for
the technical fix is important too, but it only comes second, with the
code actually being the less interesting thing.

Can you please resubmit the patch, but with a corrected commit log that
summarises the above explanations, please?

Regards,
Yann E. MORIN.

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
