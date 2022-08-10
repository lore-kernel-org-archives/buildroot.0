Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED516C00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 23:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22E4281BCB;
	Wed, 10 Aug 2022 23:46:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22E4281BCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oVoOgNk215Z2; Wed, 10 Aug 2022 23:46:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A7C181414;
	Wed, 10 Aug 2022 23:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A7C181414
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2936D1BF9B9
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 23:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5A9440425
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 23:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5A9440425
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1O-RPZKnrnxa for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 23:46:46 +0000 (UTC)
X-Greylist: delayed 00:08:09 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1413C40469
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1413C40469
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 23:46:46 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id D949E31E071F; Thu, 11 Aug 2022 01:38:33 +0200 (CEST)
Date: Thu, 11 Aug 2022 01:38:33 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Niklas Cassel <niklas.cassel@wdc.com>
Message-ID: <YvRBefZJhyhGU5ie@waldemar-brodkorb.de>
References: <20220810100959.3160670-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220810100959.3160670-1-niklas.cassel@wdc.com>
X-Operating-System: Linux 5.10.0-10-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1660174714; bh=tIYqcZSwvtdDfIW0znW9irN8vYntJDI3eZp/EfPJ/GI=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=mhXuIj4KSMLbbWJG6QogjsO4NcPbi5moH3LA7nxEhwLMUwEstyR56Bq5NDUBGZh8t
 //tNQPSBSzEOzMCMnaUc0MmccZzlYqPTOE4dhcsNfHeamS+t4fZE2lb7NqecQ3/D+B
 KfFFGm/HE00GTpUFpLpeoMWAA5Xo2oLYYU1BYKySXFcS270PTp3C7rKnQZzFXU3yuW
 gsP2vKTd0CerZOQY7itzP7slduUah63TGjccPbnCTyEQl6yBu24FMpr5wBbq9IAEcs
 qWBYo2JannS7aKLwM11pKjsBCaouXGvCVQJHnYCkJZ8AbrEO1WvV9SAvd0BFzhQcBf
 bwXlDzZL4azEQ==
Subject: Re: [Buildroot] [PATCH 0/2] fix elf2flt on m68k
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
Reply-To: Waldemar Brodkorb <mail@waldemar-brodkorb.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Niklas,

it still fails for qemu_xtensa_lx60_nommu_defconfig with:
/home/wbx/buildroot/output/host/xtensa-buildroot-uclinux-uclibc/bin/elf2flt:
ERROR: text=0x69904 overlaps data=0x569a0 ?

best regards
 Waldemar

Niklas Cassel via buildroot wrote,

> Hello buildroot folks,
> 
> This series fixes a segfault at link time on m68k.
> 
> With this series, we have bootable m68k and riscv64.
> 
> (riscv64 was booting with the previous patch, but we
> were simply lucky that we didn't observe the same
> segfault there as well.)
> 
> 
> Kind regards,
> Niklas
> 
> Niklas Cassel (2):
>   package/elf2flt: remove broken patch
>   package/elf2flt: add another .eh_frame section handling patch
> 
>  ...3-elf2flt-add-riscv-64-bits-support.patch} |  0
>  ...f2flt-fix-.eh_frame-section-handling.patch | 73 ------------------
>  ...2flt-create-a-common-helper-function.patch | 76 +++++++++++++++++++
>  ...l-error-regression-on-m68k-and-riscv.patch | 72 ++++++++++++++++++
>  4 files changed, 148 insertions(+), 73 deletions(-)
>  rename package/elf2flt/{0004-elf2flt-add-riscv-64-bits-support.patch => 0003-elf2flt-add-riscv-64-bits-support.patch} (100%)
>  delete mode 100644 package/elf2flt/0003-elf2flt-fix-.eh_frame-section-handling.patch
>  create mode 100644 package/elf2flt/0004-elf2flt-create-a-common-helper-function.patch
>  create mode 100644 package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-and-riscv.patch
> 
> -- 
> 2.37.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
