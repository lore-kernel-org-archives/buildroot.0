Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A365DC25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 13:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D54940434;
	Mon,  3 Jun 2024 13:39:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w6rl8jzGkfKe; Mon,  3 Jun 2024 13:39:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6717840918
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6717840918;
	Mon,  3 Jun 2024 13:39:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0889D1BF3DE
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 13:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9ABA40918
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 13:39:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4l8S93c_QclW for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 13:39:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ACBA040434
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACBA040434
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ACBA040434
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 13:39:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id EB2CE13F8E1;
 Mon,  3 Jun 2024 15:39:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 03 Jun 2024 15:39:47 +0200
Date: Mon, 3 Jun 2024 15:39:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michel Alex <Alex.Michel@wiedemann-group.com>
Message-ID: <Zl3Ho5PE1PVMushc@landeda>
References: <AS1P250MB0608C9F89F3830573FAD7932A9FF2@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AS1P250MB0608C9F89F3830573FAD7932A9FF2@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717421990;
 bh=yiTISgfAKhKD5wjtojyby0Xi1X+4ilLIhZzGFFA4Q+s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C2cUsxAR1ROe82scwqipLFtwxb78XschMD0zi0IL51WCAh8HHEAwNPQsS09MDLSOL
 4eD6pv6M2hSvtsSKkXnZdLnwS51Sacx7JZQbdwzQem6mb6e9WHi0uLtYadnLrfaGXq
 eustEwzjhcBQaBM21JC5Jc0+590OxFZeZ7HMgLDQ8Nbet2jEZ4mxDNLiKLCSLwCSJz
 AIAhkVuMoB+PjhDtcabCbBvNc+j9LXbM8bhZfewn2ShAkNgQQieZ31yxxpAWEyXo0u
 RDbnQlHMVH38Ugk/S9d94Kr7OGTxXPUTB+2CLMv+IdMkMEMdKAfnqcsW5mVN4PBwnF
 YFnln11c51zkA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=C2cUsxAR
Subject: Re: [Buildroot] need help for fixing some build problems
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Michel, All,

Thanks for helping fix build failures ! :-)

On 2024-06-03 13:26 +0000, Michel Alex spake thusly:
> I have a question about libzenoh-c package, which currently can not be build by the autobuilder for following architectures:
> http://autobuild.buildroot.net/results/680f25769526e5eef43d254a10a525b165846c75/
> http://autobuild.buildroot.net/results/31ed69cb2ffe8e9bc13a27c3fda16c27e9855b56/
> http://autobuild.buildroot.net/results/fdc74b8a42388b51cc4197c38b552559b97cbb8c/
> http://autobuild.buildroot.net/results/6e7ad53d44b417f6aa62acd8b2396720f5a14e82/
> 
> The zenoh-c help page says that "zenoh-c only have support for
> following targets: aarch64-unknown-linux-gnu, x86_64-unknown-linux-gnu,
> arm-unknown-linux-gnueabi".
> 
> What is the correct way to add a dependency to Config.in file which
> enables the libzenoh-c only if above targets are selected?

Se the manual for how to do that:

    https://buildroot.org/downloads/manual/manual.html#_config_files

Basically, you'd introduce a blind option (elided for brevity):

    config BR2_PACKAGE_LIBZENOH_C_ARCH_SUPPORTS
        bool
        depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
        default y if BR2_aarch64
        default y if BR2_arm
        default y if BR2_x86_64

    config BR2_PACKAGE_LIBZENOH_C_ARCH_SUPPORTS
        bool "zenoh-c"
        depends on BR2_PACKAGE_LIBZENOH_C_ARCH_SUPPORTS
        depends on BR2_TOOLCHAIN_USES_GLIBC

    comment "zenoh-c needs a glibc toolchain"
        depends on BR2_PACKAGE_LIBZENOH_C_ARCH_SUPPORTS
        depends on !BR2_TOOLCHAIN_USES_GLIBC

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
