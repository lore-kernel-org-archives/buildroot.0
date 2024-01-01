Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D26C47073
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 20:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABF6060ABF;
	Mon,  1 Jan 2024 20:05:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABF6060ABF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EUnMhzqHwXvh; Mon,  1 Jan 2024 20:05:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6EE060B0F;
	Mon,  1 Jan 2024 20:05:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6EE060B0F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DCC0A1BF37C
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 20:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C262D60ABF
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 20:05:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C262D60ABF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IUipH48Rk23n for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 20:05:20 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A42560B38
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 20:05:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A42560B38
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B1F51B0056A;
 Mon,  1 Jan 2024 21:05:09 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Jan 2024 21:05:09 +0100
Date: Mon, 1 Jan 2024 21:05:09 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Message-ID: <ZZMa9YgqUvg-w73D@landeda>
References: <20231231172538.1279608-1-wbx@openadk.org>
 <20231231172538.1279608-2-wbx@openadk.org>
 <ZZHI1pycJDszqP3I@landeda>
 <DS7PR12MB9041754BB696E49D8166F54FA162A@DS7PR12MB9041.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DS7PR12MB9041754BB696E49D8166F54FA162A@DS7PR12MB9041.namprd12.prod.outlook.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704139517;
 bh=U0QrpjimhNgRgQQvekt97T2LRPwPt7biRtm7dj66A58=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ej3WIResEERoUnSmLI1Pj0gKve3vO/yUUnN+1APq4Wv21y1a0zPaKoo3JSDrF4G8L
 VLCZNZNBb9/FEvr2/Ck0EDCR8yeLDOZgHFQyIu03QdxFdpxAa8SpkxUlcDxWF02prz
 cnnRtmXq5TiCewWAwrBTa+GZfGRaSuV+xVLb+vCnDYg5vrsmA8oG4Phpz1aT/UsUSw
 qIvlbxVTms1WemYy7db3+y5SBMZuqdU4unPsBuOW+7vLfeNYf6fden/IfsXlfQbnxy
 hTxTotxy5c6jOYhcV21JYGDRg6GvZPV5lgPqU+/BKS2d3HKzFFOSb9O4R55mkTg7Yd
 hXSUkZdU65Vbw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ej3WIRes
Subject: Re: [Buildroot] [arc-buildroot] [PATCH 1/6] package/gcc: remove
 special arc version
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
Cc: ARC Maintainers <arc-buildroot@synopsys.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Alexey, All,

Thank you for quickly jumping ship in the discussion, Alexey!

On 2024-01-01 14:43 +0000, Alexey Brodkin via buildroot spake thusly:
> > On 2023-12-31 18:25 +0100, Waldemar Brodkorb spake thusly:
> > > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> > Thanks for working on this; we discussed that with Thomas the other day,
> > and we concluded that indeed that would be a good idea to get rid of
> > that special version now.
[--SNIP--]
> So given that's a short new year break between work fires I may quickly send-out
> patches which will either:
> 1. Bump ARC tools to the latest version 2023.09 (see [6]) which will also
>    add support for ARCv3 (in fact we already have it in our fork, see [7])
> 2. Update ARC tools (GCC, Binutils/GDB & glibc) for ARCv3 only, while switching
>    ARCompact & ARCv2 to upstream components.
> 3. Given ARC seems to be the only use of non-upstream components, remove
>    ARC-specific tools/forks from buildroot and  only enable ARCv3 use via
>    external toolchains.

As you said, the ARCv2 is perfectly supported in the upstream
components. Then it makes sense to no longer have the ARC specific
versions for the ARCv2 CPUs, especially since that version (10.x) is
older than the oldest generic version we have (11.x).

Furthermore, we currently have no ARCv3 CPU support in Buildroot.

So, I think that, looking at the situation *as it is today*, Waldemar's
series (improved with the various comments I made earlier) is the best
course of action for Buildroot.

Then, when we get support for ARCv3 CPUs, we can either:

  - use your option 2 above if that comes before we remove the current
    ARC-specific version, or

  - reintroduce an ARC-specific version otherwise.

> And while (3) is the slimmest option (no need to add or rather maintain ARC-specific)
> code in package/xxx Config.in.host, xxx.mk especially with uClibc it's a bit too
> restrictive as users may want more flexibility of configuring uClibc to their needs.

I agree that option 3 is not very interesting.

Regards,
Yann E. MORIN.

> -Alexey
> 
> [1] https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/tree/arc-2023.09
> [2] https://github.com/foss-for-synopsys-dwc-arc-processors/binutils-gdb/tree/arc-2023.09
> [3] https://github.com/foss-for-synopsys-dwc-arc-processors/glibc/tree/arc-2023.09
> [4] https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=de6be7bc60f190a0d746945a3a5a143bc93a1a65
> [5] https://github.com/foss-for-synopsys-dwc-arc-processors/qemu
> [6] https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2023.09-release
> [7] https://github.com/foss-for-synopsys-dwc-arc-processors/buildroot/tree/arc-2023.09
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
