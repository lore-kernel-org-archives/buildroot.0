Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1737C433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 22:37:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F2FD6101A
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 22:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F2FD6101A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2857B400BF;
	Fri,  3 Sep 2021 22:37:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DBjkpBcxAQqV; Fri,  3 Sep 2021 22:37:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26E7D400F4;
	Fri,  3 Sep 2021 22:37:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5AB631BF366
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 22:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49CD46066B
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 22:37:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sTyC-ejfsnBm for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 22:37:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B7406064B
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 22:37:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 1F0CF1C0003;
 Fri,  3 Sep 2021 22:37:10 +0000 (UTC)
Date: Sat, 4 Sep 2021 00:37:09 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20210904003709.7254b102@windsurf>
In-Reply-To: <20210903162027.1935040-7-aduskett@gmail.com>
References: <20210903162027.1935040-1-aduskett@gmail.com>
 <20210903162027.1935040-7-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH/master 6/7] package/qemu: add
 BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS string
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>, Anisse Astier <anisse@astier.eu>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hello Adam,

On Fri,  3 Sep 2021 09:20:26 -0700
Adam Duskett <aduskett@gmail.com> wrote:

> For specific architectures, running qemu in user mode without any additional
> options may fail if the host processor does not have the necessary instructions
> to properly run qemu in user mode, which results in the following error:
> "qemu: uncaught target signal 4 (Illegal instruction) - core dumped"
> 
> CoreI7 is one such architecture that has had consistent auto-build failures.
> 
> Add a new string in qemu/Config.in.host: BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS.
> The default for the Corei7 architecture is directly from the OpenEmbedded
> project found in meta/conf/machine/include/x86/tune-corei7.inc:
> "-cpu Nehalem,check=false." Other architectures may be added to this string at
> a later date if other failures occure.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

So on the principle, I'm obviously OK as this is something I have
suggested. However, what bothers me here is that we are handling only
the Core i7 case, because it caused some issue in the autobuilder.

What is qemu doing when no -cpu is provided? Does it emulate the host
CPU in this case? If so, then it is going to be wrong in a lot of other
cases than Core i7, no?

Or put differently, shouldn't we essentially have a value for
BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS for pretty much all CPU
architectures that we want to support for this use-case ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
