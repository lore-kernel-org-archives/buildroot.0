Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBECEC46CA2
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 07:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54AC940591;
	Mon, 18 Dec 2023 07:44:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54AC940591
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IOE9p6v2ZBpT; Mon, 18 Dec 2023 07:44:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2D274058F;
	Mon, 18 Dec 2023 07:44:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2D274058F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C01BB1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 07:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 974924058F
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 07:44:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 974924058F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5oNxGNtPlG_l for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 07:44:44 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 574C2404B5
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 07:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 574C2404B5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A0341C0004;
 Mon, 18 Dec 2023 07:44:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rF8Ir-00G0YS-1v;
 Mon, 18 Dec 2023 08:44:41 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
References: <20231217171821.1893522-1-bernd@kuhls.net>
Date: Mon, 18 Dec 2023 08:44:41 +0100
In-Reply-To: <20231217171821.1893522-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 17 Dec 2023 18:18:20 +0100")
Message-ID: <875y0w9cpi.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] package/linux-headers: drop 6.5.x option
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > The 6.5.x series is now EOL upstream, so drop the linux-headers option
 > and add legacy handling for it.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 >  Config.in.legacy                     | 7 +++++++
 >  linux/linux.hash                     | 1 -
 >  package/linux-headers/Config.in.host | 1 -
 >  3 files changed, 7 insertions(+), 2 deletions(-)

 > diff --git a/Config.in.legacy b/Config.in.legacy
 > index 312d53943c..4689226290 100644
 > --- a/Config.in.legacy
 > +++ b/Config.in.legacy
 > @@ -146,6 +146,13 @@ endif
 
 >  comment "Legacy options removed in 2023.11"
 
 > +config BR2_KERNEL_HEADERS_6_5
 > +	bool "kernel headers version 6.5.x are no longer supported"
 > +	select BR2_LEGACY
 > +	help
 > +	  Version 6.5.x of the Linux kernel headers are no longer
 > +	  maintained upstream and are now removed.
 > +
 >  config BR2_PACKAGE_PYTHON_PYXB
 >  	bool "python-pyxb removed"
 >  	select BR2_LEGACY
 > diff --git a/linux/linux.hash b/linux/linux.hash
 > index ed9c6143db..9572acda2d 100644
 > --- a/linux/linux.hash
 > +++ b/linux/linux.hash
 > @@ -1,6 +1,5 @@
 >  # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 >  sha256  28edfc3d4f90cd738f2a20f5a2d68510268176d6111f6278d8f495edfd9495a7  linux-6.6.3.tar.xz
 > -sha256  78fbd43822f4c56bc16e89e8874767f592532e1a0ffcd1af4dd279559b5fcbb5  linux-6.5.13.tar.xz
 >  sha256  629daa38f3ea67f29610bfbd53f9f38f46834d3654451e9474100490c66dc7e7  linux-6.1.64.tar.xz
 >  # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 >  sha256  be2bee8b346f3ccb35879f16c80a323edda571e36190403805c14a9ea24e4a47  linux-5.15.140.tar.xz
 > diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
 > index 344acc9cde..ab923cbb95 100644
 > --- a/package/linux-headers/Config.in.host
 > +++ b/package/linux-headers/Config.in.host
 > @@ -418,7 +418,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 >  	default "5.10.202"	if BR2_KERNEL_HEADERS_5_10
 >  	default "5.15.140"	if BR2_KERNEL_HEADERS_5_15
 >  	default "6.1.64"	if BR2_KERNEL_HEADERS_6_1
 > -	default "6.5.13"	if BR2_KERNEL_HEADERS_6_5

You forgot to remove the BR2_KERNEL_HEADERS_6_5 option higher up in the
file. Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
