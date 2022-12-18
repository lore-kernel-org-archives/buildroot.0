Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F07C4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 13:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 804218141C;
	Sun, 18 Dec 2022 13:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 804218141C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R4xhP9YCbFII; Sun, 18 Dec 2022 13:39:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3A7F81293;
	Sun, 18 Dec 2022 13:39:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3A7F81293
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 805211BF5A7
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 13:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67D1040174
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 13:39:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67D1040174
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 51T93jMjftqC for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 13:39:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2816040113
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2816040113
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 13:39:38 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 25D2B60003;
 Sun, 18 Dec 2022 13:39:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p6tt9-003rav-8h; Sun, 18 Dec 2022 14:39:35 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: John Lemonovich <lemonoje@gmail.com>
References: <CABBCHidJG84Y_tpnSAE7t2qksEj4izv_TRMRLxfNcbADDUw05A@mail.gmail.com>
Date: Sun, 18 Dec 2022 14:39:35 +0100
In-Reply-To: <CABBCHidJG84Y_tpnSAE7t2qksEj4izv_TRMRLxfNcbADDUw05A@mail.gmail.com>
 (John Lemonovich's message of "Mon, 12 Dec 2022 11:50:10 -0500")
Message-ID: <87sfhcomp4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] error - machine `ARM-buildroot' not recognized for
 libpcap
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

>>>>> "John" == John Lemonovich <lemonoje@gmail.com> writes:

Hello,

 > I am trying to build a rootfs for an Intel SOC FPGA (Arria 10) using
 > buildroot.  I've had success in the past but am now trying to build a newer
 > version FS (Buildroot 2019.11.3 Configuration) and I get stuck at this
 > error.  Does anyone know how to fix/address the error?  I am adding IPv6
 > support, and I believe this is required for one or more of the networking
 > applications I'm including.  I have tried various external toolchains all
 > with the same result, and this output is from the setting  "Toolchain to be
 > downloaded and installed".

2019.11.3 is EOL, please move to 2022.02.x or 2022.11.x.

With that said, you somehow seem to have changed ARCH to upper case
ARM. Do you have any local modifications?

The host build system type comes from:

package/pkg-autotools.mk:
                --host=$$(GNU_TARGET_NAME) \

Where GNU_TARGET_NAME is defined as:

package/Makefile.in:
# Compute GNU_TARGET_NAME
GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)

And where ARCH comes from:

Makefile: ARCH := $(call qstrip,$(BR2_ARCH))

Which for your A9 system gets set in arch/Config.in.arm

config BR2_ARCH
        default "arm"           if BR2_arm
        default "armeb"         if BR2_armeb
        default "aarch64"       if BR2_aarch64
        default "aarch64_be"    if BR2_aarch64_be

So I am not sure how you end up with an upper case 'ARM'?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
