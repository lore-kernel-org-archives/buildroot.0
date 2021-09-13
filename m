Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A7F6C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 18:16:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D42A3610F9
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 18:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D42A3610F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0E2380E82;
	Tue, 14 Sep 2021 18:16:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KlW8VyyaQcyz; Tue, 14 Sep 2021 18:16:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C67180F92;
	Tue, 14 Sep 2021 18:16:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D9A7C1BF990
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 18:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E7B0400DA
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 18:09:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HBvS_zMaBOT1 for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 18:09:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D7C0403A7
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 18:09:54 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id E8D9320002
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 18:09:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1mQCsQ-0007Rw-DY
 for buildroot@buildroot.org; Tue, 14 Sep 2021 20:09:50 +0200
Resent-To: buildroot@buildroot.org
Resent-From: Peter Korsgaard <peter@korsgaard.com>
Resent-Date: Tue, 14 Sep 2021 20:09:50 +0200
Resent-Message-ID: <87h7enyqoh.fsf@dell.be.48ers.dk>
X-From-Line: nobody Mon Sep 13 19:39:41 2021
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210908164536.474998-1-fontaine.fabrice@gmail.com>
Date: Mon, 13 Sep 2021 19:39:41 +0200
In-Reply-To: <20210908164536.474998-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 8 Sep 2021 18:45:36 +0200")
Message-ID: <87o88wxtlu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/uboot-tools: fix MKIMAGE_ARCH handling
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix MKIMAGE_ARCH handling to avoid the following build failure:
 > /home/buildroot/autobuild/instance-0/output-1/build/host-uboot-tools-2021.07/tools/mkimage -C none -A openrisc -T script -d /home/buildroot/autobuild/instance-0/output-1/boot_script.txt /home/buildroot/autobuild/instance-0/output-1/build/host-uboot-tools-2021.07/tools/boot.scr

 > Invalid architecture, supported are:
 > 	alpha            Alpha
 > 	arc              ARC
 > 	arm              ARM
 > 	arm64            AArch64
 > 	avr32            AVR32
 > 	blackfin         Blackfin
 > 	ia64             IA64
 > 	invalid          Invalid ARCH
 > 	m68k             M68K
 > 	microblaze       MicroBlaze
 > 	mips             MIPS
 > 	mips64           MIPS 64 Bit
 > 	nds32            NDS32
 > 	nios2            NIOS II
 > 	or1k             OpenRISC 1000
 > 	powerpc          PowerPC
 > 	riscv            RISC-V
 > 	s390             IBM S390
 > 	sandbox          Sandbox
 > 	sh               SuperH
 > 	sparc            SPARC
 > 	sparc64          SPARC 64 Bit
 > 	x86              Intel x86
 > 	x86_64           AMD x86_64
 > 	xtensa           Xtensa

 > Strangely enough, we only have autobuilder failures since July 2021 even
 > if or1k must be used since the addition of openriscv support in 2012:
 > https://github.com/u-boot/u-boot/commit/3ddcaccda3824e1c7f7266d543e4c0eb3ea9851c

 > Fixes:
 >  - http://autobuild.buildroot.org/results/c3f0f2a3fb87d74bfdaccf9b94c66f0b5bae7520

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2:
 >  - Fix commit message to specify that autobuilder failures are raised
 >    since July 2021

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
