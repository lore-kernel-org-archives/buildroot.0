Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F69C4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 20:18:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3F7C61056
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 20:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B3F7C61056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 743D28101B;
	Wed, 18 Aug 2021 20:18:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rmvZnqQ4wDAN; Wed, 18 Aug 2021 20:18:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85D098101C;
	Wed, 18 Aug 2021 20:18:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A9E331BF344
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 20:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9997960746
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 20:18:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kQNk3DMjiyJr for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 20:18:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C5A760692
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 20:18:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 45500240005;
 Wed, 18 Aug 2021 20:18:43 +0000 (UTC)
Date: Wed, 18 Aug 2021 22:18:42 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20210818221842.5926641d@windsurf>
In-Reply-To: <20210818110558.GY27036@scaer>
References: <20210818065730.330904074D@smtp4.osuosl.org>
 <20210818122511.005d6a5c@windsurf> <20210818110558.GY27036@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2021-08-17
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello,

On Wed, 18 Aug 2021 13:05:58 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Not sure the exact reason, but notice that the failures occur at install
> time, not build time.

I did try with "make host-libcap", which includes the installation
step, and I even tried to do a full build of one of the failing
defconfigs. The build failed, but much much later, on a completely
unrelated package. And manually checking the RPATH of the host-libcap
binaries: they are correct.

> And even then, the Makefile is still trying to
> compile some stuff.
> 
> libcap is a generic package, and I noticed that the build and install
> commands do not use the same environment:
> 
>     define HOST_LIBCAP_BUILD_CMDS
>         $(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
>             $(HOST_LIBCAP_MAKE_FLAGS)
>     endef
> 
>     define HOST_LIBCAP_INSTALL_CMDS
>         $(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_LIBCAP_MAKE_FLAGS) install
>     endef
> 
> So I wonder if, at least for sanity sake, we should not just add
> $(HOST_CONFIGURE_OPTS) in the environment for the install commands too.

I'm not sure how that could cause an issue, as I'm building on the same
machine, same defconfig.

> Also, notice spurious errors from ldconfig:
> 
>     /sbin/ldconfig
>     /sbin/ldconfig.real: Can't create temporary cache file /etc/ld.so.cache~: Permission denied
>     make[5]: [Makefile:162: install-shared-psx] Error 1 (ignored)
> 
> (ldconfig is a wrapper around ldconfig.real, specific to debian and.or
> ubuntu I guess)

Right, but the absence/presence of the RPATH should normally not be
affected by this, I believe.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
