Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACDFEB64D9
	for <buildroot@archiver.kernel.org>; Thu, 15 Jun 2023 06:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF995418DC;
	Thu, 15 Jun 2023 06:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF995418DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5OPhLeDFF6BE; Thu, 15 Jun 2023 06:52:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31D0841728;
	Thu, 15 Jun 2023 06:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31D0841728
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 545C51BF48C
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 06:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D9A141728
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 06:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D9A141728
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bKxOhveVTOB9 for <buildroot@lists.busybox.net>;
 Thu, 15 Jun 2023 06:52:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 012C6405E3
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 012C6405E3
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 06:52:48 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F6EC4000E;
 Thu, 15 Jun 2023 06:52:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q9gqa-00A7NA-QD; Thu, 15 Jun 2023 08:52:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@smile.fr>
References: <20230614143519.18669-1-romain.naour@smile.fr>
Date: Thu, 15 Jun 2023 08:52:44 +0200
In-Reply-To: <20230614143519.18669-1-romain.naour@smile.fr> (Romain Naour's
 message of "Wed, 14 Jun 2023 16:35:19 +0200")
Message-ID: <87v8fpkyir.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/qemu: qemu systems emulation needs
 fdt when building for all targets
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
Cc: Carlos Santos <unixmania@gmail.com>, "Yann E
 . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > defconfig fragment to reproduce the issue:
 > BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET=y
 > BR2_PACKAGE_QEMU=y
 > BR2_PACKAGE_QEMU_SYSTEM=y

 > ERROR: Problem encountered: fdt not available but required by targets
 >        aarch64-softmmu, arm-softmmu, i386-softmmu, loongarch64-softmmu,
 >        microblaze-softmmu, microblazeel-softmmu, mips64el-softmmu,
 >        nios2-softmmu, or1k-softmmu, ppc-softmmu, ppc64-softmmu,
 >        riscv32-softmmu, riscv64-softmmu, rx-softmmu, x86_64-softmmu

 > Commit [1] select BR2_PACKAGE_QEMU_FDT for each individual emulator targets
 > but forgot to select is when BR2_PACKAGE_QEMU_CHOOSE_TARGETS is not set
 > (building for all targets).

 > Fixes:
 > http://autobuild.buildroot.org/results/e44/e444a02b899d325a9d99daed96b8cb96108383e7

 > [1] 44be514b21fd94096702b80c62d46c31d72f15a5

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > Cc: Carlos Santos <unixmania@gmail.com>
 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
