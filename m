Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120DAC433FE
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 14:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8694040576;
	Sun, 13 Nov 2022 14:18:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8694040576
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OoGIsFeY7pxi; Sun, 13 Nov 2022 14:18:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B123140575;
	Sun, 13 Nov 2022 14:18:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B123140575
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 84AC61BF2CE
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 14:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60A1840496
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 14:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60A1840496
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JWPPRPdhpT5O for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 14:18:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F8C540165
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F8C540165
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 14:18:14 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 593FE24000B;
 Sun, 13 Nov 2022 14:18:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ouDoH-005LTT-6c; Sun, 13 Nov 2022 15:18:09 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20221026183427.3933387-1-thomas.petazzoni@bootlin.com>
 <20221026183427.3933387-2-thomas.petazzoni@bootlin.com>
Date: Sun, 13 Nov 2022 15:18:09 +0100
In-Reply-To: <20221026183427.3933387-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Wed, 26 Oct 2022 20:34:27
 +0200")
Message-ID: <87iljjq6ou.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/glibc: headers >= 5.4 needed on
 RISC-V 32-bit
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Since glibc 2.33 (upstream commit
 > 7a55dd3fb6d2c307a002a16776be84310b9c8989), headers >= 5.4.0 are needed
 > to build glibc for RISC-V 32-bit. Indeed
 > sysdeps/unix/sysv/linux/riscv/configure.ac contains:

 > if test $libc_cv_riscv_int_abi = ilp32; then
 >   arch_minimum_kernel=5.4.0
 > fi

 > In order to take into account this dependency, we add the appropriate
 > logic in package/glibc/Config.in and
 > toolchain/toolchain-buildroot/Config.in.

 > This change means that if headers < 5.4.0 are selected, then no C
 > library at all will be available for RISC-V 32-bit, as glibc is the
 > only C library supporting RISC-V 32-bit currently. However, thanks to
 > the recent addition of BR2_TOOLCHAIN_BUILDROOT_NONE, the
 > choice...endchoice for the C library selection will not be empty,
 > allowing the user to see the Config.in comment explaining why glibc
 > can't be selected.

 > Therefore, technically this commit does prevent from creating a
 > configuration with RISC-V 32-bit and headers < 5.4.0, but it will have
 > BR2_TOOLCHAIN_BUILDROOT_NONE=y, which is catched by
 > package/Makefile.in, which aborts the build early on pointing out that
 > the configuration is invalid.

 > Fixes:

 >   http://autobuild.buildroot.net/results/5ca49b2732f68eccb5276e7112f7f496dcc514ee/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2022.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
