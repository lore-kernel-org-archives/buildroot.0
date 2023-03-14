Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A18BC6FD1D
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 22:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14BA840B65;
	Tue, 14 Mar 2023 22:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14BA840B65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kMjqqisME3WC; Tue, 14 Mar 2023 22:33:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D41A40B62;
	Tue, 14 Mar 2023 22:33:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D41A40B62
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D5ECF1BF3A4
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 22:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAA1B40B62
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 22:33:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAA1B40B62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 17rrZHcecs7h for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 22:33:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 353BB40B61
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 353BB40B61
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 22:33:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ACA581C0002;
 Tue, 14 Mar 2023 22:33:37 +0000 (UTC)
Date: Tue, 14 Mar 2023 23:33:36 +0100
To: Roman Passler <roman.passler@gmail.com>
Message-ID: <20230314233336.648cfa0f@windsurf>
In-Reply-To: <20230314121332.250268-1-roman.passler@gmail.com>
References: <20230313183235.2665-1-roman.passler@gmail.com>
 <20230314121332.250268-1-roman.passler@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678833218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LfADl2ZEoXxFH00gCBnsUJjgDnzaJKP9D23wUoOD8C0=;
 b=WUBTzouerEavF2y+KJ402LgVgcC8d8qxhcg+JDemMSGsz/Lumg6nY3IkrK4V8CkyDeL8QX
 DTTcFWidxohh2NKmRc5iXIXG9X+jfDx/0d4UWdgwmWJaJJEl9r9hONHDtSVqQ+LYFr1D4a
 KaMI7h6YtehaOd8tSmWLwGP/GFf7jmiJcGJk/JRg/UBTlHhHqreSoqSCbsR9xoR3RSZU78
 7ji4QgT6gUhHAhrHo+DKSV22CNWhlmHaodEd/bmlK8isa8GeJVzgrlcZacga/1nQZ1Juxr
 x5T6oly51wkLjiiWeKvjwuabUSZCJwbpjEg4a29YLywmQEM3ajYDCOgleiD5kg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WUBTzoue
Subject: Re: [Buildroot] [PATCH v2 1/1] package/openocd: bump to 0.12.0
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Roman,

Thanks for this new iteration. I still have some concern about the
licensing, so I've added other maintainers in Cc.

On Tue, 14 Mar 2023 13:13:32 +0100
Roman Passler <roman.passler@gmail.com> wrote:

> diff --git a/package/openocd/openocd.hash b/package/openocd/openocd.hash
> index 91eb56d930..7f828172f1 100644
> --- a/package/openocd/openocd.hash
> +++ b/package/openocd/openocd.hash
> @@ -1,3 +1,15 @@
> -# From http://sourceforge.net/projects/openocd/files/openocd/0.11.0/
> -sha256  43a3ce734aff1d3706ad87793a9f3a5371cb0e357f0ffd0a151656b06b3d1e7d  openocd-0.11.0.tar.bz2
> -sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> +# From http://sourceforge.net/projects/openocd/files/openocd/0.12.0/
> +sha256  af254788be98861f2bd9103fe6e60a774ec96a8c374744eef9197f6043075afa  openocd-0.12.0.tar.bz2
> +sha256  1b8f7e37ee5afbbf95c2a4d62b12b25232e29538692663b434318503a9a88419  COPYING
> +sha256  0a37155eb8bc0cb94477a0cae4f030e39da9317374e8a9f597e9229fd09aff78  LICENSES/license-rules.txt
> +sha256  034da732b4f3079b8783fff756613c1cff89dec5ac80c5cdd90532b7539922a1  LICENSES/exceptions/eCos-exception-2.0
> +sha256  f3ba76203a7b6993db31f987559cc4c621ae1ff78119ced2a669756c2c5fd3b1  LICENSES/preferred/BSD-1-Clause
> +sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  LICENSES/preferred/BSD-2-Clause
> +sha256  1483f15e9fddc73b5df0acab1c42d21ecd0bf6ade8a79179fb90c09f13d03dcd  LICENSES/preferred/BSD-2-Clause-Views
> +sha256  7a83b1aeb460458db9a4bd521d7f237c45b1650f6e60ea5ffc71e49472454de3  LICENSES/preferred/BSD-3-Clause
> +sha256  5cf024f6e3611d5c6fb98748d1a0ad99b8cf9ffe46f2d60fa10c299cd29e0a75  LICENSES/preferred/BSD-Source-Code
> +sha256  f35396f4095619f986736ca5e2976b313d381463a35c921c9ae677cc7eb83e28  LICENSES/preferred/GFDL-1.2
> +sha256  76515be2d7334a1a038f775238c9a4c2b37e19514248e5eea0434cdfee526f9d  LICENSES/preferred/gfdl-1.2.texi.readme
> +sha256  7d35bc44da7bb763022e3c2c32cfc0125dd222060bc50992420599d8e65f6c0a  LICENSES/preferred/GPL-2.0
> +sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  LICENSES/preferred/MIT
> +sha256  9a41b56594cd89743ca72f188318c9871661847074dd16497ae0c695fe3ab9c9  LICENSES/stand-alone/GPL-3.0
> diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
> index 37a06ca848..95a7fd3c2a 100644
> --- a/package/openocd/openocd.mk
> +++ b/package/openocd/openocd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -OPENOCD_VERSION = 0.11.0
> +OPENOCD_VERSION = 0.12.0
>  OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
>  OPENOCD_SITE = http://sourceforge.net/projects/openocd/files/openocd/$(OPENOCD_VERSION)
>  OPENOCD_LICENSE = GPL-2.0+

Roman: one thing that isn't good is that you are not adding the new
license files in the OPENOCD_LICENSE_FILES variable, it makes the new
hashes quite useless.

Arnout, Peter, Yann: the COPYING file states that overall the OpenOCD
license is GPL-2.0+.

The doc is GFDL.

There are 3 files in contrib/ (apparently not installed in the
Buildroot context) which are under GPL-3.0+.

So, do we list all license files in <pkg>_LICENSE_FILES ? Even if in
fact we don't install anything that's under GFDL or GPL-3.0+ ? I'm
particularly concerned by the GPL-3.0+ of course, which is seen by some
companies as a red flag (for good or bad reasons, that's not the point
here). If our installation of OpenOCD does not include GPL-3.0+ code, I
think we should not mention that GPL-3.0+ code is distributed.

Your opinion?

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
