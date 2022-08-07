Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28D6C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 14:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18BD781A23;
	Sun,  7 Aug 2022 14:22:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18BD781A23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jxRAmR7cP7qJ; Sun,  7 Aug 2022 14:22:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2312581A18;
	Sun,  7 Aug 2022 14:22:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2312581A18
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A44A11BF3C0
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 14:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69C4C404C7
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 14:22:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69C4C404C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tBJCCHE6itZb for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 14:22:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD8CE400B9
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD8CE400B9
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 14:22:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 765D5240004;
 Sun,  7 Aug 2022 14:22:24 +0000 (UTC)
Date: Sun, 7 Aug 2022 16:22:23 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20220807162223.3b7f0268@windsurf>
In-Reply-To: <20220725000111.683564-1-christian@paral.in>
References: <20220725000111.683564-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659882144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RzBnq0mIY1OF7o8iYZs1VRReFppA7dcbOJ5uGbjL7ps=;
 b=ZugWiZSJ54jnouk6Lds1xqCwOLhsrg+boa7TWxOZJ4VnjiAoFAPvSPVHOHHe2wDG2pmMZf
 qKG36dWiOPc6YstfatNau99238NvFuQRLqST/rnMrBB16CqVxzHj7vaMrdLJ16Vp0QUBUZ
 taTUChQ6NmVZ2O4ISUx9QEBb/4j1vxYH3Id+ewW9xJQyhDT2EiRSDn0BWK6Bq7AheM+lJR
 nqf5RWkW4hRXZ2DjzCQDZ9c5umhjYuoaz+4uFKqcX/NZioK/JFenLCcWYPnE6CQnuXn3+L
 0OfWfSduWd2ctP+UA+2zv1uU8l/cVUxI0cvfC87EV+X08/IWuT6ENAnclOih3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZugWiZSJ
Subject: Re: [Buildroot] [PATCH v1 1/1] package/rtl8821cu: new package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

On Sun, 24 Jul 2022 17:01:11 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Adds support for USB rtl8821cu wifi cards.
> 
> Similar to rtl8821au and rtl8812au-aircrack-ng packages.
> 
> https://github.com/morrownr/8821cu-20210118
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/Config.in                             |    1 +
>  ...platform-specific-and-build-on-targe.patch | 1225 +++++++++++++++++
>  ...ate-time-remove-date-and-time-macros.patch |   30 +
>  package/rtl8821cu/Config.in                   |   10 +
>  package/rtl8821cu/rtl8821cu.hash              |    3 +
>  package/rtl8821cu/rtl8821cu.mk                |   19 +
>  6 files changed, 1288 insertions(+)

Entry in DEVELOPERS file is missing.

> diff --git a/package/rtl8821cu/0001-makefile-remove-platform-specific-and-build-on-targe.patch b/package/rtl8821cu/0001-makefile-remove-platform-specific-and-build-on-targe.patch
> new file mode 100644
> index 0000000000..ec838eb1b8
> --- /dev/null
> +++ b/package/rtl8821cu/0001-makefile-remove-platform-specific-and-build-on-targe.patch
> @@ -0,0 +1,1225 @@
> +From de579638554590973ce0086f39be4bd6a8ef1c15 Mon Sep 17 00:00:00 2001
> +From: Christian Stewart <christian@paral.in>
> +Date: Mon, 7 Mar 2022 11:33:23 -0800
> +Subject: [PATCH] makefile: remove platform-specific and build-on-target
> + sections
> +
> +Simplify the makefile, removing broken platform-specific sections.
> +
> + - unset platform i386-pc
> + - remove all platform sections
> + - remove sections assuming build-on-target
> +
> +Signed-off-by: Christian Stewart <christian@paral.in>
> +
> +makefile: remove sections assuming build-on-target
> +
> +Removed all sections which assume the driver is being built on the target.
> +
> +Signed-off-by: Christian Stewart <christian@paral.in>

Why this patch seems to have 2 commits logs one after the other?

Also, can we find a change that is acceptable by upstream, instead of this huge patch?

> diff --git a/package/rtl8821cu/0002-error-date-time-remove-date-and-time-macros.patch b/package/rtl8821cu/0002-error-date-time-remove-date-and-time-macros.patch
> new file mode 100644
> index 0000000000..d51c11fa64
> --- /dev/null
> +++ b/package/rtl8821cu/0002-error-date-time-remove-date-and-time-macros.patch
> @@ -0,0 +1,30 @@
> +From aece6cb25704d86bfea9a4ad8b79970471ac5059 Mon Sep 17 00:00:00 2001
> +From: Christian Stewart <christian@paral.in>
> +Date: Mon, 7 Mar 2022 11:44:38 -0800
> +Subject: [PATCH] error date-time: remove date and time macros
> +
> +Fixes: -Werror=date-time
> +
> +error: macro "__TIME__" might prevent reproducible builds
> +
> +Signed-off-by: Christian Stewart <christian@paral.in>
> +---
> + core/rtw_debug.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/core/rtw_debug.c b/core/rtw_debug.c
> +index d1a41e1..e16efa5 100755
> +--- a/core/rtw_debug.c
> ++++ b/core/rtw_debug.c
> +@@ -42,7 +42,7 @@ const char *rtw_log_level_str[] = {
> + void dump_drv_version(void *sel)
> + {
> + 	RTW_PRINT_SEL(sel, "%s %s\n", DRV_NAME, DRIVERVERSION);
> +-	RTW_PRINT_SEL(sel, "build time: %s %s\n", __DATE__, __TIME__);
> ++	RTW_PRINT_SEL(sel, "build time: [unset] [unset]\n");
> + }
> + 
> + #ifdef CONFIG_PROC_DEBUG
> +-- 
> +2.35.1
> +

It would be nice to not force -Werror=date-time, because in Buildroot,
when BR2_REPRODUCIBLE=y, we make sure that the __DATE__ and __TIME__
macros from gcc expand to a well-defined and constant value.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
