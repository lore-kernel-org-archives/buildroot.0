Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CEAFEE49A4
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 21:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0466A4050C;
	Sun, 10 Sep 2023 21:33:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0466A4050C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1He30QCJLOnF; Sun, 10 Sep 2023 21:33:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4220740453;
	Sun, 10 Sep 2023 21:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4220740453
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F06D51BF340
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 21:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C93A740453
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 21:33:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C93A740453
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yiWC-msotDOS for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 21:33:15 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF18F40278
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 21:33:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF18F40278
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB99240007;
 Sun, 10 Sep 2023 21:33:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qfS3L-00CtYs-WB; Sun, 10 Sep 2023 23:33:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20230726202838.1931660-1-christian@aperture.us>
 <20230726202838.1931660-3-christian@aperture.us>
 <20230806133452.6d1e78cd@windsurf>
Date: Sun, 10 Sep 2023 23:33:11 +0200
In-Reply-To: <20230806133452.6d1e78cd@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sun, 6 Aug 2023 13:34:52 +0200")
Message-ID: <87sf7lemso.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 3/3] boot/uboot: add host-python-pylibfdt
 dependency if needed
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
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Wed, 26 Jul 2023 13:28:38 -0700
 > Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

 >> If BR2_TARGET_UBOOT_NEEDS_PYLIBFDT is set, add a dependency on
 >> host-python-pylibfdt.
 >> 
 >> Fixes a build failure with uboot 2023.07:
 >> 
 >> $ make uboot
 >> error: pylibfdt does not seem to be available with python3
 >> 
 >> Signed-off-by: Christian Stewart <christian@aperture.us>

 > I've completely reworded the commit log to really explain what's going
 > and since when the problem is occurring.

 >> ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYLIBFDT),y)
 >> -UBOOT_DEPENDENCIES += host-swig
 >> +UBOOT_DEPENDENCIES += host-swig host-python-pylibfdt

 > I dropped host-swig from here. Indeed, it was previously needed to
 > allow U-Boot to build its own pylibfdt copy. Now that we build our own
 > host-python-pylibfdt, host-swig is no longer needed as a dependency of
 > U-Boot: it's needed as a dependency of host-python-pylibfdt (which it
 > already is).

 > Applied with those changes, thanks!

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
