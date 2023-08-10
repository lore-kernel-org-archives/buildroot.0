Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A35FC001B0
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 21:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0F0940B55;
	Thu, 10 Aug 2023 21:16:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0F0940B55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xv8BiIW7c1Zo; Thu, 10 Aug 2023 21:16:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7B84408D4;
	Thu, 10 Aug 2023 21:16:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7B84408D4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 28D5F1BF379
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 21:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4550661042
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 21:16:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4550661042
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1PTZoRSw-qYL for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 21:16:17 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 328B460F6C
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 21:16:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 328B460F6C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F801E0005;
 Thu, 10 Aug 2023 21:16:15 +0000 (UTC)
Date: Thu, 10 Aug 2023 23:16:14 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230810231614.530378e4@windsurf>
In-Reply-To: <20230207220941.58066-3-ju.o@free.fr>
References: <20230207220941.58066-1-ju.o@free.fr>
 <20230207220941.58066-3-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691702175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tWCzfKhJPuJi4waeG5fGmngnetT5YLlaxfUY9NA337o=;
 b=WSbrnt+a64H8PzWNZW+Uem4ZTXNXCZjWTeT1gqw02CWAXqbbx4MXXD8KJ8EOAaP4NpK8cG
 /Hb4VBZ4FUTNOjqO0R83zmEvUzJp/qMwpu4Dqk6VLJAf7uL7J6AHPC0T8DaeOLATYTFdj7
 0QklCfcEj3+WuE0vNPqX9RgQqrOk9WxsjvTe6rhf59CUbtscRMDbZqUVcXsm0OQNfU1ZiU
 I51jvv0yWuW+8XSzbx+P6MZQHXrNwOxzmmKAuQGl6aS6+F7FLVg4NlIXeH4FAkPlGj16kQ
 HwhocHfQe2e+CFEXT/MQLDdAkQjUjhC7scfI3DI2O62EB2p/0tkxCmRa9bPdxw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WSbrnt+a
Subject: Re: [Buildroot] [PATCH 3/5] package/openmpi: enable mpi compiler
 wrapper scripts
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Julien,

Unless I missed it, you never replied to the feedback I gave on PATCH
3/5 and 4/5 in this series, so I've marked patches 3/5, 4/5 and 5/5 as
Changes Requested. Patches 1/5 and 2/5 had already been applied a while
ago.

Best regards,

Thomas Petazzoni

On Tue,  7 Feb 2023 23:09:39 +0100
Julien Olivain <ju.o@free.fr> wrote:

> openmpi normally includes compiler wrapper binary programs (e.g. mpicc,
> mpicxx, etc...). Those programs are inconvenient when cross compiling.
> Those target binary wrappers are useless in Buildroot, as the target
> root filesystem does not include compilers. For cross compilation,
> openmpi also ships Perl scripts providing a subset of those functions.
> With those compiler wrappers, openmpi programs can now be cross
> compiled properly in Buildroot. This patch enables those wrappers.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/openmpi/openmpi.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/openmpi/openmpi.mk b/package/openmpi/openmpi.mk
> index f14b55ced5..e6f5cd0250 100644
> --- a/package/openmpi/openmpi.mk
> +++ b/package/openmpi/openmpi.mk
> @@ -17,7 +17,9 @@ OPENMPI_INSTALL_STAGING = YES
>  # found. This makes the configuration fail. See:
>  # https://github.com/open-mpi/ompi/blob/v4.1.4/config/ompi_check_ime.m4#L35
>  # Disable explicitly to avoid the issue.
> -OPENMPI_CONF_OPTS = --without-ime
> +OPENMPI_CONF_OPTS = \
> +	--enable-script-wrapper-compilers \
> +	--without-ime
>  
>  # Enabling Fortran support requires pre-seeding the configure script
>  # with various values that cannot be guessed, so we provide cache



-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
