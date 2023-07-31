Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3234BC001DF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 22:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B662740BBF;
	Mon, 31 Jul 2023 22:11:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B662740BBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ea8RReQSTZ2Q; Mon, 31 Jul 2023 22:11:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C1BF40C11;
	Mon, 31 Jul 2023 22:11:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C1BF40C11
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 42B5B1BF369
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 22:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3569E40C04
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 22:11:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3569E40C04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xbjZ8WPJlhQW for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 22:11:34 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 25B5840514
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 22:11:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25B5840514
Received: by mail.gandi.net (Postfix) with ESMTPSA id 638E7C0003;
 Mon, 31 Jul 2023 22:11:31 +0000 (UTC)
Date: Tue, 1 Aug 2023 00:11:30 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230801001130.11395a1f@windsurf>
In-Reply-To: <20230731183731.2978383-1-bernd@kuhls.net>
References: <20230731183731.2978383-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690841492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yB40uHZU67TZAiz1XqkTpvCygL9efFbNUd7NIY6qJIo=;
 b=j99rt5ERz3vUW3vppkdjxtG2obzQVLBmtaiKCzluvWP2TIARtRmMzU3W9l4cAxp07gdAkD
 H3sWThHZsiY8kJgbZazy76KStqnqPjFoiwWtd0g4chs0dqLzt5I+/9H0ifBBVsmJV3fxSN
 yVEu7UvwYz6RF8i49L5diLVt8qFwC2Dx7pRA2bRD5hXw/Uq5kE+6THEWtRKAX1+boyZ0mr
 0B1nlbo/n54d2CfJZZoirVSkDYHQJK+39t0LhuLiggyrEikwdkVbfZpqrmN0pV8rJ/fCht
 VXGbM7SrUYhn2Z5+ll9n0E6Gh9Sx/Fye19oEr6/0s1QhRcDpkRPrgqipm/1lnQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j99rt5ER
Subject: Re: [Buildroot] [PATCH v2 1/2] package/binutils: install libsframe
 to staging
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 31 Jul 2023 20:37:30 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> binutils 2.40 added libsframe:
> https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=19e559f1c91bfaedbd2f91d85ee161f3f03fda3c
> 
> Quoting release notes:
> https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob_plain;f=binutils/NEWS;hb=refs/heads/binutils-2_40-branch
> * readelf and objdump now have a newly added option --sframe which dumps
>   the SFrame section.
> 
> Install libsframe to staging when available to avoid build errors, for
> example with lightning:
> libsframe.so.0, needed by output/per-package/lightning/host/arm-
>   buildroot-linux-gnueabi/sysroot/usr/lib/libopcodes.so, not found
> 
> Fixes:
> http://autobuild.buildroot.net/results/1d1/1d1480dc0c3fb0a88490e3fae85abb2aa76bdade/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v2: no changes

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
