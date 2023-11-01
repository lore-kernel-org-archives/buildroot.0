Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8074C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 13:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A5B384B22;
	Wed,  1 Nov 2023 13:42:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A5B384B22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0IeAXvoqQkEQ; Wed,  1 Nov 2023 13:42:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A71D8489B;
	Wed,  1 Nov 2023 13:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A71D8489B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B595C1BF841
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 13:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F2488489B
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 13:42:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F2488489B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7bPPJnG2HLNt for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 13:42:15 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 844F184897
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 13:42:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 844F184897
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:67d2:c63c:7c2a:c31])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 8188819F57B;
 Wed,  1 Nov 2023 14:42:05 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 01 Nov 2023 14:42:05 +0100
Date: Wed, 1 Nov 2023 14:42:05 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20231101134205.GC114892@scaer>
References: <20231020114236.4129636-1-neal.frager@amd.com>
 <20231020114236.4129636-3-neal.frager@amd.com>
 <20231031134317.4ce2349e@windsurf>
 <CH2PR12MB5004C8F27820E2EC98FC5232F0A7A@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20231101125048.01553f76@windsurf>
 <CH2PR12MB50049049609F6BE2EF07D89FF0A7A@CH2PR12MB5004.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CH2PR12MB50049049609F6BE2EF07D89FF0A7A@CH2PR12MB5004.namprd12.prod.outlook.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698846131;
 bh=xfGGBA7a+ySNwQVTLnUltogYDnHxmI83FwTQd9et0D0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X7Oq6aMRmvkasbLcoc/vMWz+Zhv07i0pwZ4kp5PE0S5hSyydQGK64kADtkDVAirkJ
 XcuVo0bLGQYVkh5GfBl1sTANMj0Wq0XJrTrB9YhtIlWPsM/mwGLdyYaWOnK4DNfNmm
 5Z3hCNb31PVFrskoDWCePSIvP9M8hkpYkHiLysWvrIP11Wr+0RMfpp0tgadU1YFq58
 op/CynRlLDQXLAKmbWjTEmSVJq5HIlK73tftm2e52R2qQyA/n7xQ7+mMC8zFovv33s
 pg/VfHPqcBh288yHCY9rovmSYByVlRcADbJ6FfbcoWh0VKEAYBrggGu0Jp+1QW7A/6
 Ffi5ocNxJRBkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=X7Oq6aMR
Subject: Re: [Buildroot] [PATCH v6 03/10] package/newlib-bare-metal: new
 package
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
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>, "Simek,
 Michal" <michal.simek@amd.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Neal, All,

On 2023-11-01 13:23 +0000, Frager, Neal via buildroot spake thusly:
[--SNIP--]
> Unfortunately, by making newlib a target package instead of host, the buildroot
> infrastructure does not seem to like that newlib was built for Xilinx MicroBlaze
> and not the expected AArch64 target architecture.
> 
> Below is an example of the error message:
> ERROR: architecture for "/usr/microblazeel-xilinx-elf/lib/libc.a" is "Xilinx MicroBlaze", should be "AArch64"
> 
> Is there a way around this, or do we need to keep newlib-bare-metal as a "host" package
> to avoid this issue?z

You can use _BIN_ARCH_EXCLUDE, see the manual:
    https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_packages_with_specific_build_systems

However (but I haven't read all the previous reviews), why would that
file end up in target to beging with?

It is a static library, and from what I understand about this bare-metal
toolchain, the goal is to build firmwares for co-processors, and those
are alwys going to be statically linked, right?

Furthermore, newlib is always going to be a static library, never a
shared one, right?

As such, it should only need to be installed in staging/, not in
target/, and thus:
    NEWLIB_BARE_METAL_INSTALL_STAGING = YES
    NEWLIB_BARE_METAL_INSTALL_TARGET = NO

And then, the check-bin-arch would not find that file, because it would
not be in target/ anymore (and thus _BIN_ARCH_EXCLUDE would not be
needed either).

And then, thinking yet a bit more: it not not even need to be in
staging/ either, as staging/ is for stuff that actually runs on the
target's CPU, not co-procs.

So, I think the gcc-bare-metal package should be configured with a
special sysroot, and newlib-bare-metal installed in that sysroot, e.g.
somethig like:

    HOST_GCC_BARE_METAL_SYSROOT = $(HOST_DIR)/$(GCC_BARE_METAL_ARCH)-elf/sysroot

    HOST_GCC_BARE_METAL_CONF_OPTS = \
        [...]
        --with-sysroot=$(HOST_GCC_BARE_METAL_SYSROOT)

and then:

    NEWLIB_BARE_METAL_INSTALL_OPTS = DESTDIR=$(HOST_GCC_BARE_METAL_SYSROOT)

Totally untested, but this should give some hints as to where to install
stuff.

Thomas, what do you think?

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
