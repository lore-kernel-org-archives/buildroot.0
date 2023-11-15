Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6C7C072A2
	for <buildroot@archiver.kernel.org>; Wed, 15 Nov 2023 18:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F9AF6080A;
	Wed, 15 Nov 2023 18:12:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F9AF6080A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qYZsi27VZwop; Wed, 15 Nov 2023 18:12:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB72E606D3;
	Wed, 15 Nov 2023 18:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB72E606D3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 680551BF951
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 18:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E4A641E9D
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 18:12:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E4A641E9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E8KKww3kfdXm for <buildroot@lists.busybox.net>;
 Wed, 15 Nov 2023 18:12:53 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F5D841E6B
 for <buildroot@buildroot.org>; Wed, 15 Nov 2023 18:12:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F5D841E6B
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4bfd:4134:b6ff:e4a7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 903D560137;
 Wed, 15 Nov 2023 19:12:43 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 15 Nov 2023 19:12:43 +0100
Date: Wed, 15 Nov 2023 19:12:43 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20231115181243.GK996011@scaer>
References: <20231020114236.4129636-1-neal.frager@amd.com>
 <20231020114236.4129636-3-neal.frager@amd.com>
 <20231031134317.4ce2349e@windsurf>
 <CH2PR12MB5004C8F27820E2EC98FC5232F0A7A@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20231101125048.01553f76@windsurf>
 <CH2PR12MB50049049609F6BE2EF07D89FF0A7A@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20231101134205.GC114892@scaer>
 <CH2PR12MB50048B7684BF4AB7C79CC87DF0B2A@CH2PR12MB5004.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CH2PR12MB50048B7684BF4AB7C79CC87DF0B2A@CH2PR12MB5004.namprd12.prod.outlook.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700071969;
 bh=01GEP2c/lInviiNTKY/LT21QcTlIpG4W5S8racoM7vs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IkyqlXJcJd01XcVTUYp4zSgSt0uYECXVdKpTAPgq/H5pS3SKD+p1hlUHlGy0E2sMM
 Og+AKLMZ3PmQCjVgQwm4mqixp4OfWb/xmLAPI3DilJbnLU5zV9LlkeKsJDWlimJhGG
 kajzMzCFd+YzDUOpuc2SU62xNhWeCnYCkgq+FXw3SNs54KlrqRTM8rV8qKVPtrIYje
 Ft/bfssFcSmkt4kGPaqA6hxFV3t03KRfI2yfSS23ZyvnLnre2irj+JfZg1hw4+/Y5Q
 kUyR1niKm0iO8v2ZyEozMuk8CBk5Df0OSDUzgtZSsBvjRscOxLtZBhRZhGj7CXM4WY
 WMBT3jaT3bnwA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IkyqlXJc
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
Cc: "Simek, Michal" <michal.simek@amd.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Neal, All,

On 2023-11-14 05:47 +0000, Frager, Neal via buildroot spake thusly:
[--SNIP--]
> I finally got the time to get back on this, but there appears to be another issue.
> When I use the following for installing the newlib in the sysroot staging area:
> NEWLIB_BARE_METAL_INSTALL_STAGING_OPTS = \
> 	DESTDIR=$(HOST_GCC_BARE_METAL_SYSROOT) \
> 	Install
> I get the following error message:
> /usr/bin/install: cannot create regular file '/buildroot/output/host/microblazeel-xilinx-elf/sysroot/usr/microblazeel-xilinx-elf/lib': No such file or directory

I had a very quick glance at the newlib Makefile, and it seems it might
not be totally parallel-safe, especially for installation, so maybe:

    NEWLIB_BARE_METAL_MAKE = $(MAKE1)

Can you try that, please?

> This is because newlib tries to install libraries to this directory before the autotools runs the following command later on:
> /usr/bin/mkdir -p '/buildroot/output/host/microblazeel-xilinx-elf/sysroot/usr/microblazeel-xilinx-elf/lib'
> 
> I have a hack solution by manually doing the mkdir in advance, but this should not be needed.
> The autotools should make all the directories that are needed for the install.

The issue is that newlib is not really an autotools package: the
Makefile is generated from Makefile.in, itself generated by autogen
(https://www.gnu.org/software/autogen/) which, AFAIK, is not part of the
autotools suite.

So, newlib uses autoconf, but does not use automake, and thus uses a
custom Makefile template, which might explain why it is not
parallel-safe.

Regards,
Yann E. MORIN.

> Would you be able to look at the pkg-autotools to see if we can fix this problem at its root by creating the lib directory from the beginning of install_staging?
> 
> Thank you for your help!
> 
> Best regards,
> Neal Frager
> AMD
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
