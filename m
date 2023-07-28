Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39589EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 21:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADAC1421C8;
	Fri, 28 Jul 2023 21:35:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADAC1421C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UhiFkcyL2aen; Fri, 28 Jul 2023 21:35:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98564421CA;
	Fri, 28 Jul 2023 21:35:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98564421CA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 28C971BF38A
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 21:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED8F440423
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 21:35:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED8F440423
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O2oeRoOjInbH for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 21:35:39 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B8AC4032B
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 21:35:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B8AC4032B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E61D20002;
 Fri, 28 Jul 2023 21:35:36 +0000 (UTC)
Date: Fri, 28 Jul 2023 23:35:34 +0200
To: jonringle@gmail.com
Message-ID: <20230728233534.5dca9be4@windsurf>
In-Reply-To: <20230526184707.53781-1-jonringle@gmail.com>
References: <20230526184707.53781-1-jonringle@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690580136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hFE9pFWyuH8gTDLr0grjsMsQeyiFVVnu33Cl9HxgjTU=;
 b=ppfA3GDSSU9guqFpAwmkBaPs4kwB1bTDwfYSXlf91JQaEFovjjt+dEpRL5x+k9hHz5bubB
 vqnAybN50sIpneB4zWjpX3HViKbw1EyadEfA0CWF4AXhWufdDTlI9qF/aXYrdHHHNxr/HP
 T3+fBuoKtCONW1tB2YrbXVvI7+J7s0QFUJ4QaFi5PAk3wHX9wRPnVP7+U/FnfiGKrlXhIB
 ufRsULsWouh+eiskZbLJj0/yc3r7L87wBHIcH0SzeMUvXAlxIN9p1DfzsnuN6nP9peJt1I
 uOTWUl71hQEEBs3BPk37stIchK2YRs0RQTuJTfh6wEdiyhQeWcsrDbTn12VL5Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ppfA3GDS
Subject: Re: [Buildroot] [PATCH 1/1] package/mbpoll: new package
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
Cc: Jon Ringle <jringle@gridpoint.com>, Samuel Martin <s.martin49@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jon,

On Fri, 26 May 2023 14:47:07 -0400
jonringle@gmail.com wrote:

> From: Jon Ringle <jringle@gridpoint.com>
> 
> mbpoll is a tool that can be used to test communication
> with modbus slave devices
> 
> Signed-off-by: Jon Ringle <jringle@gridpoint.com>

Sorry for the long delay in providing feedback to your patch. The good
news is that I have applied it, with a few changes (see below).

> ---
>  package/Config.in          |  1 +
>  package/mbpoll/Config.in   |  5 +++++
>  package/mbpoll/mbpoll.hash |  3 +++
>  package/mbpoll/mbpoll.mk   | 11 +++++++++++
>  4 files changed, 20 insertions(+)

An entry in the DEVELOPERS file was missing... and I forgot about it
myself, so I fixed that up in a follow-up commit.

> diff --git a/package/mbpoll/Config.in b/package/mbpoll/Config.in
> new file mode 100644
> index 0000000000..b0d7be1c4d
> --- /dev/null
> +++ b/package/mbpoll/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_MBPOLL
> +	bool "mbpoll"
> +	select BR2_PACKAGE_LIBMODBUS
> +	help
> +	  mbpoll utility to test modbus

I improved this a little bit: slightly extended description taken from
the github homepage, and more importantly, URL of the upstream project,
which is required in Buildroot Config.in help text.

> diff --git a/package/mbpoll/mbpoll.hash b/package/mbpoll/mbpoll.hash
> new file mode 100644
> index 0000000000..d72ebee7b8
> --- /dev/null
> +++ b/package/mbpoll/mbpoll.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  046fdac2d88eddb71a1091a87d0a4bb23fee39595a929cde50c546dae0fbcd6d  mbpoll-1.5.tar.gz
> +sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
> diff --git a/package/mbpoll/mbpoll.mk b/package/mbpoll/mbpoll.mk
> new file mode 100644
> index 0000000000..e1a71bed09
> --- /dev/null
> +++ b/package/mbpoll/mbpoll.mk
> @@ -0,0 +1,11 @@
> +################################################################################
> +#
> +# mbpoll
> +#
> +################################################################################
> +
> +MBPOLL_VERSION = 1.5
> +MBPOLL_SITE = $(call github,epsilonrt,mbpoll,v$(MBPOLL_VERSION))
> +MBPOLL_DEPENDENCIES = libmodbus

You forgot host-pkgconf in the dependencies, which is needed for mbpoll
to find libmodbus.

Also, you properly added the hash of COPYING in the hash file, but you
forgot MBPOLL_LICENSE and MBPOLL_LICENSE_FILES.

As said, I fixed up those minor details when applying.

Thanks a lot for your contribution!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
