Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B4CC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 20:15:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA279613C8
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 20:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA279613C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 884D06086C;
	Mon,  4 Oct 2021 20:15:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sB1x9Kfi-J-M; Mon,  4 Oct 2021 20:15:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C223B60870;
	Mon,  4 Oct 2021 20:15:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DFECD1BF97D
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 20:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFCA140552
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 20:14:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tthK5RpXfQLZ for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 20:14:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89FEA40553
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 20:14:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id A314020003;
 Mon,  4 Oct 2021 20:14:12 +0000 (UTC)
Date: Mon, 4 Oct 2021 22:14:11 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20211004221411.1626f3a4@windsurf>
In-Reply-To: <YVs/ojRTzGIi7ix9@pevik>
References: <20210930190035.25090-1-petr.vorel@gmail.com>
 <20211003222323.001b6200@windsurf> <YVs/ojRTzGIi7ix9@pevik>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] package/ltp-testsuite: bump version
 to 20210927
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

Hello Petr,

On Mon, 4 Oct 2021 19:53:38 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> Kernel headers in all musl versions
> $ grep LINUX_VERSION_CODE br-test-pkg/*musl*/host/*/sysroot/usr/include/linux/version.h
> 
> * bootlin-x86-64-musl [1/4]: FAILED
> * bootlin-armv7-musl [2/4]: FAILED
> br-test-pkg/bootlin-armv7-musl/host/arm-buildroot-linux-musleabihf/sysroot/usr/include/linux/version.h:#define LINUX_VERSION_CODE 264682
> br-test-pkg/bootlin-x86-64-musl/host/x86_64-buildroot-linux-musl/sysroot/usr/include/linux/version.h:#define LINUX_VERSION_CODE 264682
> => 4.9.234  
> current stable is 4.9.284
> fix a85cbe6159ff ("uapi: move constants from <linux/kernel.h> to <linux/const.h>")
> was backported as 834d8b96cd85 in v4.9.250.
> 
> * bootlin-riscv64-musl [3/4]: FAILED
> br-test-pkg/bootlin-riscv64-musl/host/riscv64-buildroot-linux-musl/sysroot/usr/include/linux/version.h:#define LINUX_VERSION_CODE 328765
> => 5.4.61  
> current stable is 5.4.150
> fix a85cbe6159ff ("uapi: move constants from <linux/kernel.h> to <linux/const.h>")
> was backported as 376c3111413c in v5.4.99
> 
> * br-i386-pentium-mmx-musl [4/4]: OK
> br-test-pkg/br-i386-pentium-mmx-musl/host/i586-buildroot-linux-musl/sysroot/usr/include/linux/version.h:#define LINUX_VERSION_CODE 264701
> => 4.9.253 => the only fixed version  

Ok, so what you need is updates of the kernel headers to the latest dot
release, within the same kernel headers series.

> > Except that you did not. So I did it when applying :-)  
> 
> Thanks! I'm sorry, I forget to amend the commit before sending.

No worries :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
