Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F0BC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 16:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27847409FD;
	Mon,  1 Aug 2022 16:54:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27847409FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RUYh0w9HOrHt; Mon,  1 Aug 2022 16:54:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 002A9409ED;
	Mon,  1 Aug 2022 16:54:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 002A9409ED
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E7E181BF315
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 16:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFBD2404F3
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 16:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFBD2404F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ryk2WXvW7gsO for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 16:54:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6559D4018B
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6559D4018B
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 16:54:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 89D921C0003;
 Mon,  1 Aug 2022 16:54:45 +0000 (UTC)
Date: Mon, 1 Aug 2022 18:54:44 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220801185444.0f41358e@windsurf>
In-Reply-To: <20220729154637.11397-1-fontaine.fabrice@gmail.com>
References: <20220729154637.11397-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659372886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lkofra8zJQVjJhfiydD4LBxEIFjiAGCFB6cHlTLkXUo=;
 b=h1EEELzCPIoKIwzeAf9JKkeAFBGkDXVLrcMaGoSzmLJdeGChkjTe+XfNqSInvujak3EW6L
 lZPWTAlGAQgcbv98NZ4i+VCLtaNkw/U93voUTgUM79v8NDoOw4HPs/j0f+q16mTBH8N75T
 sRGZHEZzob72gik++Ms+rO8bSRRrfzJ/P0NQpUdrN5vA3SsrXz67YAY/qdAYuNnWdIk2Zg
 R25WhOvfO8YwZschtkXjOmgz3Ql8WppBkpx4SQ2to1PNMc5xIZ9Uo+Ar7cG6xh0Waog+eC
 mwO1RIhcj05Mve+HUUAU//wcnOLNvl8pdwd7MBOA2Fkl3fxohkyCZMfoDgrWMQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h1EEELzC
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/pkg-autotools: fix runtime path
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
Cc: nolange79@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, 29 Jul 2022 17:46:37 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index 548f69cbb8..b6224b349d 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -187,7 +187,7 @@ define $(2)_CONFIGURE_CMDS
>  		--exec-prefix=/usr \
>  		--sysconfdir=/etc \
>  		--localstatedir=/var \
> -		--runstatedir=/run \
> +		runstatedir=/run \

I am afraid this is causing some other problems:

  http://autobuild.buildroot.net/results/c6f/c6fa72802a3d74fe95720eeff836514a5863b3f2/build-end.log

configure: warning: runstatedir=/run: invalid host type
loading site script /dev/null
creating cache ./config.cache
configure: error: can only configure for one host and one target at a time

So I believe we will have to revert this patch, and pass --runstatedir
individually to those packages that understand this option.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
