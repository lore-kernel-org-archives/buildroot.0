Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9AB2ECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 20:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2992141C98;
	Sat, 17 Sep 2022 20:49:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2992141C98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p_t5GVKrflm0; Sat, 17 Sep 2022 20:49:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E010941C14;
	Sat, 17 Sep 2022 20:49:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E010941C14
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A90FB1BF39A
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 20:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82B2D41C14
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 20:49:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82B2D41C14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DKNEv9zDR_Ww for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 20:49:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D814841C0B
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D814841C0B
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 20:49:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C866D200003;
 Sat, 17 Sep 2022 20:49:36 +0000 (UTC)
Date: Sat, 17 Sep 2022 22:49:34 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20220917224934.01388da4@windsurf>
In-Reply-To: <20220821160143.16646-1-ju.o@free.fr>
References: <20220821160143.16646-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663447777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xsu8UfSSeESJmFKtK0cPbj5NX5j2/7OQ3APovGDJrf0=;
 b=MLZrGnisEjwo5UfMrJ25+bXnoqdDvVHtEmq30wLnuoPNQqFUvWMd0J/7+nKIDm0NDOp8nx
 0h5SBP5A4mXk++wN9Czch+d4tCc63h8gyo4uDuB3E2Pb+oZZ+i+YGFwdi71UmP0XvH1V5D
 JLrJJ0po1qI/ONMiVhWNWLQy91rKEkpnI+SSJAV4SLCfeKXkbKRB3SAW0rm0jrlrHF6COf
 zI8qe774bUn0kdf1acxbxU21+62BRzfb7RrdcDk6U1bEgIZfQoioenExZjLv5g2y9fEfpj
 c1PsMPLdOIUUHKmbdO6e6hGYOacbkNnqTxibVfbSzxqtPMd+wVexM5bM/HEyxg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MLZrGnis
Subject: Re: [Buildroot] [PATCH next 1/1] package/rdma-core: new package
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

Hello Julien,

On Sun, 21 Aug 2022 18:01:43 +0200
Julien Olivain <ju.o@free.fr> wrote:

> This is the userspace components for the Linux Kernel's
> drivers/infiniband subsystem.
> 
> https://github.com/linux-rdma/rdma-core
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Thanks for this patch. It looks really good. I have just a few
questions and one super minor comment, see below.

> diff --git a/package/rdma-core/readme.txt b/package/rdma-core/readme.txt
> new file mode 100644
> index 0000000000..4f90720ca3
> --- /dev/null
> +++ b/package/rdma-core/readme.txt
> @@ -0,0 +1,74 @@
> +Testing rdma-core userspace tools
> +=================================
> +
> +Testing rdma-core using Linux software RoCE implementation:
> +https://en.wikipedia.org/wiki/RDMA_over_Converged_Ethernet
> +
> +Using two systems with working TCP/IP conficutation, for example:

                                         ^^^^^^^ minor typo here

> +Kernel configuration
> +--------------------
> +
> +The Linux Kernel needs some Infiniband configuration. In this example
> +the kernel "rdma_rxe" driver is needed (CONFIG_RDMA_RXE=y). See the
> +example fragment file provided:
> +
> +    package/rdma-core/linux-rdma.fragment

Did you consider using the <pkg>_LINUX_CONFIG_FIXUPS variable instead?
This would make sure these configuration options are always enabled in
the kernel. Or is your fragment just an example?

> +Buildroot package configuration
> +-------------------------------
> +
> +For setting up a software RoCE link, the "rdma" program is needed. It
> +is provided by the "iproute2" package, when "libmnl" is also
> +selected. Make sure to have in your Buildroot configuration:
> +
> +    BR2_PACKAGE_IPROUTE2=y
> +    BR2_PACKAGE_LIBMNL=y
> +    BR2_PACKAGE_RDMA_CORE=y

Then is there a reason to not select iproute2 and libmnl? Or is it just
that they are needed only for specific use cases?

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
