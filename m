Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01EA6C4320A
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 21:32:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A50E261102
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 21:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A50E261102
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79BBE81B6D;
	Fri, 20 Aug 2021 21:32:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UfjKBzP-qImV; Fri, 20 Aug 2021 21:32:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED7FC81B84;
	Fri, 20 Aug 2021 21:32:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E0AD91BF304
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 21:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCA8D42566
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 21:32:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wgUbqPREBtQW for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 21:32:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E690E4254B
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 21:32:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id E857CC0003;
 Fri, 20 Aug 2021 21:32:27 +0000 (UTC)
Date: Fri, 20 Aug 2021 23:32:26 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20210820233226.677ff169@windsurf>
In-Reply-To: <20210820054419.439633-1-troglobit@gmail.com>
References: <20210820054419.439633-1-troglobit@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/smcroute: bump version to v2.5.0
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Joachim,

On Fri, 20 Aug 2021 07:44:19 +0200
Joachim Wiberg <troglobit@gmail.com> wrote:

> diff --git a/package/smcroute/smcroute.hash b/package/smcroute/smcroute.hash
> index f79ce167ed..01d5eafd59 100644
> --- a/package/smcroute/smcroute.hash
> +++ b/package/smcroute/smcroute.hash
> @@ -1,5 +1,5 @@
>  # Locally generated
> -sha256	431be94c46646767f69c85fee445277b7e765a55177d3ee29522416cfe2cc067  smcroute-2.4.4.tar.xz
> +sha256	fa0a496ee4258c286814b789e1dc4d0be2cc4788adba23e8484ff5d0a65f6cc5  smcroute-2.5.0.tar.gz
>  sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> -# From https://github.com/troglobit/smcroute/releases/download/2.4.4/smcroute-2.4.4.tar.xz.md5
> -md5	a1dc8c54c684e8c8de139444f73a0ba3  smcroute-2.4.4.tar.xz
> +# From https://github.com/troglobit/smcroute/releases/download/2.5.0/smcroute-2.5.0.tar.gz.md5
> +md5	285a2765a4366e7d5ba07139a9f56bd5  smcroute-2.5.0.tar.gz
> diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
> index 0db0e084f6..16197e6f68 100644
> --- a/package/smcroute/smcroute.mk
> +++ b/package/smcroute/smcroute.mk
> @@ -4,16 +4,13 @@
>  #
>  ################################################################################
>  
> -SMCROUTE_VERSION = 2.4.4
> -SMCROUTE_SOURCE = smcroute-$(SMCROUTE_VERSION).tar.xz
> +SMCROUTE_VERSION = 2.5.0
>  SMCROUTE_SITE = https://github.com/troglobit/smcroute/releases/download/$(SMCROUTE_VERSION)
>  SMCROUTE_LICENSE = GPL-2.0+
>  SMCROUTE_LICENSE_FILES = COPYING
>  SMCROUTE_CPE_ID_VENDOR = troglobit
>  
> -SMCROUTE_CONF_OPTS = ac_cv_func_setpgrp_void=yes
> -#BUG:The package Makefile uses CC?= even though the package is autotools based
> -SMCROUTE_MAKE_ENV = $(TARGET_CONFIGURE_OPTS)
> +SMCROUTE_CONF_OPTS = --enable-mrdisc CFLAGS=-std=gnu99

Thanks for the update. However, passing CFLAGS=-std=gnu99 is not
correct, as it means other Buildroot CFLAGS are no longer passed.

Instead, it should be:

SMCROUTE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS -std=gnu99"

could you see if that works for you, and send an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
