Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E8BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 20:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C03BA416A3;
	Sat, 23 Jul 2022 20:28:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C03BA416A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hMHtRsYwa3yf; Sat, 23 Jul 2022 20:28:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B23924048D;
	Sat, 23 Jul 2022 20:28:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B23924048D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8ADE11BF59C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 658BF84C2E
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:28:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 658BF84C2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6RbOUraeNJ7N for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 20:28:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BB7B84BB1
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2BB7B84BB1
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:28:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E799160003;
 Sat, 23 Jul 2022 20:28:10 +0000 (UTC)
Date: Sat, 23 Jul 2022 22:28:09 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220723222809.67e0b9b8@windsurf>
In-Reply-To: <20220128205201.2798205-1-fontaine.fabrice@gmail.com>
References: <20220128205201.2798205-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658608091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5eGnu8Nb1LeGJaPmI0gXh+aU+9QFEjm2Y++IOxDgrso=;
 b=MG14XX74LZnXDQRRE1PDISO2hkYgO+Bs3y89DffkMnLAzmvRB1euwnbu7NrHO3hQ2R1O6L
 BHfQhKxdg2TmWslZvj+z2/R44nSaAwbm4hx8HCqp9rt8bRjICY5vSEsZC8ESmnq6mnG+Ko
 IDR19/Wuz1tqAAUiP0tDBJSZVGkdbK7BAVSXdOdva+GVVaR4Wyhejf2vZgfmLDu6S7Uqj7
 Hsgv4rGBSeqOl5ZVUGonr4FmxiNiB1CA9lHtZUu72t7d1r4ifaMyT+dvQez59XetF7dOsT
 UMHs5BUdUl4a2c+nsgxbZ4Yp7otbq5f4GdC8g7BdFRfZLxRSwY8tYdGqwlFCcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MG14XX74
Subject: Re: [Buildroot] [PATCH 1/2] package/glslsandbox: kms needs gbm
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 28 Jan 2022 21:52:00 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Obviously, KMS/DRM/GBM needs gbm so add a dependency on libgbm which was
> added by commit 4a541ee93242e67f7fab625607f5501c6925d451:
> 
> checking for gbm... no
> configure: error: Package requirements (gbm) were not met:
> 
> Package 'gbm', required by 'virtual:world', not found
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/31b3fff9748300e293b4efb5615176ccce48dd15
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/glslsandbox-player/Config.in             | 1 +
>  package/glslsandbox-player/glslsandbox-player.mk | 4 +---
>  2 files changed, 2 insertions(+), 3 deletions(-)

So, I finally applied this patch, but to address the issue I had
pointed out, and thanks to the input from Julien, I did the following:

 (1) Added support for the nullws windowing system, which doesn't need
     any extra dependency other than EGL/GLES.

     https://git.buildroot.org/buildroot/commit/?id=81ad39d62f660a1409e96d1dbd405d6dab16c0f6

 (2) Dropped the "depends on BR2_TOOLCHAIN_HAS_THREADS" from the
     top-level option, which was a work-around to make sure at least one
     windowing system is selectable.

     https://git.buildroot.org/buildroot/commit/?id=624f2e658d09d13cb9e61a8a52f2227d2a60d7f7

 (3) Applied your patch

    https://git.buildroot.org/buildroot/commit/?id=e88cb1038d3a3691621d0fe14bc9f13d6c9b7389

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
