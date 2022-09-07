Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 652E1C38145
	for <buildroot@archiver.kernel.org>; Wed,  7 Sep 2022 07:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA4D1818A1;
	Wed,  7 Sep 2022 07:28:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA4D1818A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hcLbI1ZFeAk3; Wed,  7 Sep 2022 07:28:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9CB181762;
	Wed,  7 Sep 2022 07:27:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9CB181762
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1604D1BF365
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 07:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5D59402E5
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 07:27:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5D59402E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JjfYpX12geGT for <buildroot@lists.busybox.net>;
 Wed,  7 Sep 2022 07:27:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B53AC40199
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B53AC40199
 for <buildroot@buildroot.org>; Wed,  7 Sep 2022 07:27:56 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 846011BF207;
 Wed,  7 Sep 2022 07:27:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oVpTU-00E6ew-G2; Wed, 07 Sep 2022 09:27:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220906161557.2645766-1-peter@korsgaard.com>
 <20220906213513.GC1490660@scaer>
Date: Wed, 07 Sep 2022 09:27:52 +0200
In-Reply-To: <20220906213513.GC1490660@scaer> (Yann E. MORIN's message of
 "Tue, 6 Sep 2022 23:35:13 +0200")
Message-ID: <87zgfby77r.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH-next 1/2] nezha_defconfig: bump opensbi,
 u-boot and linux
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2022-09-06 18:15 +0200, Peter Korsgaard spake thusly:
 >> Opensbi is now based on 1.1, U-Boot on 2022.07-rc3 and Linux on 5.19-rc1.
 >> We don't yet support 5.19 kernel headers, so use 5.17 instead.
 >> 
 >> The incompatibility between opensbi and u-boot is now fixed, so drop
 >> 0001-arch-riscv-dts-sun20i-d1.dtsi-adjust-plic-compatible.patch.
 >> 
 >> The updated device tree in the kernel tree no longer specifies a memory node
 >> (and the board exists in 512M/1G/2G variants, so instead use the (otherwise
 >> identical) device tree provided by u-boot, where the memory node is fixed up
 >> based on the detected memory size.  Keep the kernel build configuration in
 >> place so host-{bison,flex} is built.

 > So, we've discussed this i=on IRC, but I am not sure this is still
 > needed.

 > Indeed, you said that the DTB to be used is the one from u-boot, not the
 > kernel, so there is no reason to build the allwinner/sun20i-d1-nezha
 > from the kernel.

 > u-boot relies on host-dtc, and host-dtc already depends on host-bison
 > and host-flex, so there is no need to pull those by asking the kernel to
 > build a DTB.

 > Finally, with PPD, the PPD of u-boot would not have host-flex and
 > host-bison because of the kernel anyway (it gets them from host-dtc
 > instead) as the kernel is not a dependency of u-boot.

 > So, there is no reason to keep building the allwinner/sun20i-d1-nezha
 > DTB.

 > Or did I miss something else (again)?

The issue is that the kernel will unconditionally build dtc and the dtbs
even if we install them or not. E.G. from the toplevel Makefile:

ifdef CONFIG_OF_EARLY_FLATTREE
all: dtbs
endif

Which is unconditionally enabled on riscv. From arch/riscv/Makefile:

config RISCV
       ...
       select OF_EARLY_FLATTREE

So even with those two lines removed from the defconfig I still end up
with:

find build/linux-custom -type f -a \( -name \*.dtb -o -name dtc \)

build/linux-custom/scripts/dtc/dtc
build/linux-custom/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dtb
build/linux-custom/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dtb
build/linux-custom/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dtb

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
