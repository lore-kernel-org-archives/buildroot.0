Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9288C00140
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 07:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C87E410CC;
	Thu, 18 Aug 2022 07:00:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C87E410CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VX69uZSa3Jxb; Thu, 18 Aug 2022 07:00:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 717FB408C0;
	Thu, 18 Aug 2022 06:59:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 717FB408C0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 839451BF2BB
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C2B641B8B
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C2B641B8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vr2ieUnfyVgH for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 06:59:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09AD741947
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09AD741947
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 06:59:55 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 781782000E;
 Thu, 18 Aug 2022 06:59:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oOZVP-00CgtU-JG; Thu, 18 Aug 2022 08:59:51 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220726131249.2009383-1-thomas.petazzoni@bootlin.com>
 <20220726131249.2009383-2-thomas.petazzoni@bootlin.com>
Date: Thu, 18 Aug 2022 08:59:51 +0200
In-Reply-To: <20220726131249.2009383-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Tue, 26 Jul 2022 15:12:47
 +0200")
Message-ID: <87sflu6nq0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/uclibc: define
 BR2_UCLIBC_TARGET_ARCH for ARM64
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
Cc: =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>, "Yann E.
 MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > So far, BR2_UCLIBC_TARGET_ARCH had a value for all
 > architectures... except for ARM64. Its value is passed as ARCH= when
 > building uClibc... which is currently empty:

 > /usr/bin/make -j33 -C .../build/uclibc-1.0.41 ARCH="" CROSS_COMPILE=".../host/bin/aarch64-buildroot-linux-uclibc-"

 > And also in uclibc.mk, when we inject the architecture in uClibc's
 > .config:

 >         $(call KCONFIG_ENABLE_OPT,TARGET_$(UCLIBC_TARGET_ARCH))
 >         $(call KCONFIG_SET_OPT,TARGET_ARCH,"$(UCLIBC_TARGET_ARCH)")

 > We enable TARGET_ (which doesn't exist) and set TARGET_ARCH to the
 > empty string.

 > Nobody noticed so far, and it happens to work because aarch64 is the
 > first architecture in the choice of architectures in
 > extra/Configs/Config.in in the uClibc code. So, when the architecture
 > is not specified, aarch64 is used.

 > As we are about to add some logic in uclibc.mk that will use
 > BR2_UCLIBC_TARGET_ARCH, we noticed this missing definition.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
