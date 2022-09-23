Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CF1C07E9D
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 21:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2717C41951;
	Fri, 23 Sep 2022 21:55:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2717C41951
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QvayX232akcM; Fri, 23 Sep 2022 21:55:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F41C41959;
	Fri, 23 Sep 2022 21:55:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F41C41959
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 28DC01BF82C
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 035D28426D
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:55:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 035D28426D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uduHPPytQdNQ for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 21:55:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A251E8405F
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A251E8405F
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 21:55:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 785F520005;
 Fri, 23 Sep 2022 21:55:48 +0000 (UTC)
Date: Fri, 23 Sep 2022 23:55:47 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220923235547.65ee6181@windsurf>
In-Reply-To: <20220830124423.164957-1-yann.morin.1998@free.fr>
References: <20220830124423.164957-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663970148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qrdLETa2BuPdnY9bxuRRC9TSp8YWfg94TkTb2m0qcEc=;
 b=ZWeVHNELy2VQIMAUEb2Al1XJ0MTtvx8fBLqGu0/rnefN9ScWsvy3Co8qbxt1wYHiqGJEon
 tFcY0sZG6rp0HXK1oNhHQD9fY/wWhbxoDZeS94i0Nyn5eq6SCl6i7JFqShW29jxatT+7Vk
 WfjXhBNb5JNHCZJrGUQnHbE+BOljlRFexxju/sajM/wA+/cr0AKCQ8nCsUs1dzgWI5cK4Q
 PmaEAlXwLUsSg3wWO1jRRpa3kJjKExaYrtgLPMbRGI4uNV4dWmzVkPPJFVPpZtjSVB6Dk4
 i0G4H9OD4XoVFcIc6/OnlYhugEWKLwPYig+2UCk4hpZ8vOzUQaoaBV+jZZ05yQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZWeVHNEL
Subject: Re: [Buildroot] [PATCH] package/ncurses: drop our custom host build
 commands
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

On Tue, 30 Aug 2022 14:44:23 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Commit bf446513e7e7 (ncurses: fix hanging installation due to old
> version of tic) introduced the build of the host tic, to be used by the
> target ncurses. That commit purportedly built a static tic, but that is
> (at least now) wrong: there is nothing that makes the build of tic
> static.
> 
> Initially, host-ncurses was configured with --without-shared, but that
> only drives whether to generate shared libs or not, it does not drive
> whether to do a shared or static link of executables.
> 
> And in any case, in af23d762e51b (ncurses: enable shared library build
> on the host) we explicitly stopped requesting the build of a static
> library, to instead require the build of a shared library.
> 
> So, we never had a statically linked tic ever.
> 
> Furthermore, we override the _BUKLLD_CMDS, but we do not provide any
> _INSTALL_CMDS. As a consequence, the full ncurses is installed, not just
> tic. And since we override the _BUILD_CMDS, the libraries are not built,
> so they get built during the install step.
> 
> And we do indeed need the libraries (host-gettext needs them), and not
> just tic.
> 
> So, just drop our custom _BUILD_CMDS and just build the whole package
> with the default settings. We keep the explicit use of --with-shared,
> as this is not the standard flag (--enable-shared) and it is not obvious
> what the default is.
> 
> The set of files installed before and after this change is exactly the
> same, and tic still is an "ELF 64-bit LSB shared object" with a RUNPATH
> that still correctly points to $(HOST_DIR)/lib
> 
> To be noted: there is no regressin in build time either, since we were
> already building everything anyway.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/ncurses/ncurses.mk | 10 ----------
>  1 file changed, 10 deletions(-)

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
