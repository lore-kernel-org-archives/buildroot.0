Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8FCC61DD6
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 21:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9098940831;
	Tue,  1 Sep 2026 21:19:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VNRQedyBqY6F; Tue,  1 Sep 2026 21:18:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788297539;
	bh=tRW7T8pibxIPppt1Wlu5Rqt4oWozfCMoiEfnXtKo10s=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FmFJlrtFpCSwHenTa4vab93Watvbs0jYdXFqlsYCA1sHaI1qujQykyfKOiqeG/DbE
	 INoox9I/6UQwwcdbogMvtYEr5re25e4qrMsXqzRIF1m43Tn76x8qSwlY/FgGaVtG9D
	 KHPGyyDQYWIEQ9FemuUYG5ibpgzXrcEhiSttHa217YEg5KbyuyR67FSlo/Fj2hzK6y
	 HQVe7pKuUfeO8Qxx3HlCj5srxCISqlF0ILeJPnHS4SKbGOQGQQ7C7TA5XLp6L2kzBh
	 NLsv2PD0hp3GYPKeLFCdNlxS4+ib69GCbxnWONy8UEEYatj2X4X3h+QeUIA6by8wAU
	 hGIwda+BwHIQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DC6D40A1B;
	Tue,  1 Sep 2026 21:18:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F2C222FE
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4AFF40143
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:18:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yD4NwVvf70JQ for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 21:18:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 934104011D
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:18:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 6B59D13F86E;
 Tue,  1 Sep 2026 23:18:51 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 01 Sep 2026 23:18:51 +0200
MIME-Version: 1.0
Date: Tue, 01 Sep 2026 23:18:51 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260827212125.1988552-1-romain.naour@smile.fr>
References: <20260827212125.1988552-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.18
Message-ID: <21d24a056be82c542efc4fad639d9d5b@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] linux: disable SSP support when needed
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 27/08/2026 23:21, Romain Naour via buildroot wrote:
> x86 and x86_64 kernels >= 6.15 now requires ssp toolchain support
> when CONFIG_STACKPROTECTOR is enabled [1].
> 
> For toolchains without SSP support, make sure to disable
> CONFIG_STACKPROTECTOR to avoid link issues when building kernel
> modules.
> 
>   MODPOST Module.symvers
>   ERROR: modpost: "__stack_chk_guard" [drivers/<module>.ko] undefined!
> 
> While the SSP support is mandatory for glibc and musl based toolchains
> [2], it's still optional for uClibc-ng based toolchains and not enabled
> by default when building a new toolchain.
> 
> The Toolchain builder project enabled recently the SSP support for all
> uClibc toolchains [3] to avoid such issue.
> 
> But x86 (32bits) musl based toolchains lack of SSP support due to a
> long term gcc issue [4]. For a decade Alpine Linux, OpenWRT and Yocto
> povide additional gcc and musl patches to workaround the gcc issue [5]
> 
> We may consider in the long term removing the support for toolchains
> without SSP and doing so removing x86 (32bits) musl toolchain.
> 
> Fixes:
> https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/15832356731 
> (x86-64--uclibc--bleeding-edge_test)
> https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/15832356104 
> (x86-64--uclibc--stable_test)
> 
> https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/15832355429 
> (x86-64-core-i7--uclibc--bleeding-edge_test)
> https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/15832354341 
> (x86-64-core-i7--uclibc--stable_test)
> 
> https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/15832326525 
> (x86-64-v2--uclibc--bleeding-edge_test)
> https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/15832316220 
> (x86-64-v2--uclibc--stable_test)
> 
> https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/15819139512 
> (x86-i686--uclibc--stable_test)
> https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/15819139511 
> (x86-i686--uclibc--bleeding-edge_test)
> 
> https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/15819139510 
> (x86-i686--musl--stable_test)
> https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/15819139509 
> (x86-i686--musl--bleeding-edge_test)
> 
> https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/15819139506 
> (x86-core2--uclibc--stable_test)
> https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/15819139505 
> (x86-core2--uclibc--bleeding-edge_test)
> 
> https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/15819139504 
> (x86-core2--musl--stable_test)
> https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/15819139503 
> (x86-core2--musl--bleeding-edge_test)
> 
> [1] 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=0ee2689b9374d6fd5f43b703713a53227
> [2] e811f5154944147e4fceb8d199321aba91070587
> [3] 
> https://gitlab.com/buildroot.org/toolchains-builder/-/commit/90413f665735e1786cca2403cd1ff997920c99ae
> [4] https://www.openwall.com/lists/musl/2016/12/04/2
> [5] https://git.alpinelinux.org/aports/tree/main/musl/APKBUILD#n65
>     
> https://git.alpinelinux.org/aports/tree/main/gcc/0018-Alpine-musl-package-provides-libssp_nonshared.a.-We-.patch
>     
> https://github.com/openwrt/openwrt/blob/v25.12.5/toolchain/gcc/patches-15.x/230-musl_libssp.patch
>     
> https://github.com/openwrt/openwrt/blob/v25.12.5/toolchain/musl/patches/200-add_libssp_nonshared.patch
>     
> https://github.com/openembedded/openembedded-core/commit/77fb841f2e747dc7fb5e9234d870a7a32a74d09b
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
