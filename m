Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D59BECAAD5
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 13:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F58040C85;
	Mon, 29 Aug 2022 13:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F58040C85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l1PP7OVzRlIM; Mon, 29 Aug 2022 13:46:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC11C40B6E;
	Mon, 29 Aug 2022 13:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC11C40B6E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2133C1BF309
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 13:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF24760F57
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 13:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF24760F57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uRpmR28Ndgwp for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 13:46:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 696C160F56
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 696C160F56
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 13:46:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 36E981BF20C;
 Mon, 29 Aug 2022 13:46:43 +0000 (UTC)
Date: Mon, 29 Aug 2022 15:46:42 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220829154642.60430d08@windsurf>
In-Reply-To: <20220827161431.333659-2-romain.naour@gmail.com>
References: <20220827161431.333659-1-romain.naour@gmail.com>
 <20220827161431.333659-2-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661780803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f7DguuBvvROu5SdCedCsrHDQP/YpyZ18Basm5BKxfB0=;
 b=EWQr6JeLbw7ZROk2QvBCLS65l8UePo9V9U+t/5roG2Jjwn/v6Ye21keOa91PFM1dfzOAU8
 4hC2szv4Nx4l/kzepxRQILRZR3+MA+Hz35J1Mc0dvrvm39hv/kaLLhLIIwu0K22KY6VPJS
 gyKz1gh+AZ33deRllvlMt2OyZldirZLqfnGVd+RCEEKPWQIoK0i4Pmp/st85AHxy1rnDj8
 xSj8B+AL29zTbhLLuZ1EVJRtLOJsqJ8aCKgT3CfAYJh3Q2vi7I27T3t8Ko8tlYWiSAmO5Z
 4kapC5bRQFZb6CCYIjXn/W7fI3u70LEWQGs914xv3CDsHh55fieuQvu2bbIW9Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EWQr6JeL
Subject: Re: [Buildroot] [for-master 2/2] package/gdb: prevent gdbserver
 being selected for or1k builds
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
Cc: Stafford Horne <shorne@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Romain,

On Sat, 27 Aug 2022 18:14:31 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> There is currently no version of gdbserver for or1k. Until this
> is implemented we will prevent both the direct and indirect
> selection of gdbserver for or1k builds. In practice this means
> that 'cross gdb for the host' cannot be selected and that
> 'full debugger' must be automatically selected for the gdb target
> package
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Stafford Horne <shorne@gmail.com>
> ---
> gdbserver for or1k requires gdb 12.1 [1] but this version is
> not available in Buildroot 2022.08 and only in the next branch
> (upcoming 2022.011).

But in:

commit 991b7b990ad8cd4a37564cd91d5bb0ee7e1e9f11
Author: Stafford Horne <shorne@gmail.com>
Date:   Sat Jul 30 07:07:48 2022 +0900

    package/gdb: Enable OpenRISC GDB support
    
    The OpenRiSC gdb port has supported native debugging since version 8.3
    and remote debugging since before that.  So it is now safe to enabled
    this.
    
    This patch removes the conditions blocking gdb from being built on or1k
    architecture builds.
    
    Signed-off-by: Stafford Horne <shorne@gmail.com>
    Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Stafford said that "remote debugging" works.

So, what is correct? :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
