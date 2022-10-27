Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE686C38A2D
	for <buildroot@archiver.kernel.org>; Thu, 27 Oct 2022 09:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AD668138E;
	Thu, 27 Oct 2022 09:55:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AD668138E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cgSARjZ1gMiQ; Thu, 27 Oct 2022 09:55:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A59FA8136F;
	Thu, 27 Oct 2022 09:55:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A59FA8136F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A5CEF1BF2CB
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 09:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D99C40150
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 09:55:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D99C40150
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5lpYltepK5Wf for <buildroot@lists.busybox.net>;
 Thu, 27 Oct 2022 09:55:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F27E740140
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F27E740140
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 09:55:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 653801C0002;
 Thu, 27 Oct 2022 09:55:31 +0000 (UTC)
Date: Thu, 27 Oct 2022 11:55:29 +0200
To: Robert Marko <robimarko@gmail.com>
Message-ID: <20221027115529.0ac5cb5d@windsurf>
In-Reply-To: <20221027085628.102086-1-robimarko@gmail.com>
References: <20221027085628.102086-1-robimarko@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666864531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yWEd2EHjVdFO+F9dcAzY2hjJzFrUiy2gf0shJC5wl2g=;
 b=JEXt+Yne75mD4+fw3DV9M0uLeFiOqjlMPfxdo5aLYQqz3PWHZhpqWOYmB4fnJ8cXmpZoWC
 OdI7r21aaoRGnui+bf81HPxfHQS5xWyHOnwyhUTlltrj3TmkUzzXZDCn3WHFOAEXrBsm45
 SHTGrbZfsvXCdnX5Kr5yMLlW0SvktqGwwDMkRFj9w41a5qpzKcSN2RV54KVekZ3U8s7wMi
 7dFsSkJCVBBt5REhDynwQKG/U6nFb0jqzXyzR+NllDfTVwbu7u6z+F2IEUizlFAAoObrKC
 0HhlWSB9Opww/nKLK5PkmmFiarh9H/2W5lT00KxVty9bo52nWhLSEG/TaRJBMw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JEXt+Yne
Subject: Re: [Buildroot] [PATCH v3] package/mdio-tools: new package
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
Cc: angelo@amarulasolutions.com, yann.morin.1998@free.fr,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Robert,

On Thu, 27 Oct 2022 10:56:28 +0200
Robert Marko <robimarko@gmail.com> wrote:

> mdio-tools are kernel module and accompanying tools for low-level
> debugging of devices attached on MDIO bus like PHY-s, switches etc.
> 
> Userspace tools provide C22 or C45 reads and writes, benchmarking
> and even dedicated Marvell Link Street tools via the included
> kernel module.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Thanks, I have applied your patch, with two small changes. See below.

>  package/Config.in                  |  1 +
>  package/mdio-tools/Config.in       | 10 ++++++++++
>  package/mdio-tools/mdio-tools.hash |  3 +++
>  package/mdio-tools/mdio-tools.mk   | 20 ++++++++++++++++++++
>  4 files changed, 34 insertions(+)

The entry in the DEVELOPERS file was missing, so I've added it.

> diff --git a/package/mdio-tools/Config.in b/package/mdio-tools/Config.in
> new file mode 100644
> index 0000000000..8a09bf19a7
> --- /dev/null
> +++ b/package/mdio-tools/Config.in
> @@ -0,0 +1,10 @@
> +comment "mdio-tools needs a Linux kernel to be built"
> +	depends on !BR2_LINUX_KERNEL
> +
> +config BR2_PACKAGE_MDIO_TOOLS
> +	bool "mdio-tools"
> +	depends on BR2_LINUX_KERNEL
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1

We like to have a Config.in comment corresponding to this dependency,
so I've added it:

+comment "mdio-tools needs a toolchain w/ headers >= 5.1"
+       depends on !BR2_LINUX_KERNEL
+       depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1

And I know I realize that the depends on !BR2_LINUX_KERNEL should have
been a depends on BR2_LINUX_KERNEL. I will fix that up.

Thanks for the contribution!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
