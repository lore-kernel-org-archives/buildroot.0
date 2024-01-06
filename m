Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C179C46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 10:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15BB1608A6;
	Sat,  6 Jan 2024 10:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15BB1608A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JTZVtFn8N0HF; Sat,  6 Jan 2024 10:12:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F22D60B01;
	Sat,  6 Jan 2024 10:12:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F22D60B01
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C0751BF861
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 10:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B549E4055D
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 10:12:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B549E4055D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qwkvizzc7Uhh for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 10:12:40 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01A0D40488
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 10:12:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01A0D40488
Received: by mail.gandi.net (Postfix) with ESMTPSA id 14AFCFF803;
 Sat,  6 Jan 2024 10:12:36 +0000 (UTC)
Date: Sat, 6 Jan 2024 11:12:36 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240106111236.6269f39d@windsurf>
In-Reply-To: <20240103191151.2777684-1-bernd@kuhls.net>
References: <20240103191151.2777684-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704535957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3HXCcCYdbUGtCM8/uqGgiESlwYGhp817NmUwRI8CKQE=;
 b=nSdQyf12qvJOGfkkLqZscO4Wgi+jXGGUA4CAH3LxYiv3MVgNkv24Zu+DeW4AdvvODMXjfd
 R1jFY8GUaZX8NILkh6xUKxEf7uZ+TxdvtlsUE4yv27VlzLdds/iCt5l8kysxJ7i+VtwIji
 0u/BzaEwC8ATzP44DTmUEkgfwMMXM4wHJRjC2Qax4I4vPTszKUH4hgR39KjdsOcBvcfIy7
 ejuHBgopwpZs8ccBPSR70/qVyi8YmhZOJOt99pl/7FPc3Ed4S0IprTgW5RlkQcAZ8hJ5Oa
 8steiJqRo6BFGWedyveX0AAidABlfjp53ft6oL+jtRLk+9RZd8ri0ivwnrTvWQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nSdQyf12
Subject: Re: [Buildroot] [PATCH v2 1/2] package/exim: fix build with
 libexecinfo
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed,  3 Jan 2024 20:11:50 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> diff --git a/package/exim/exim.mk b/package/exim/exim.mk
> index fb9eecd71b..25d171875d 100644
> --- a/package/exim/exim.mk
> +++ b/package/exim/exim.mk
> @@ -104,6 +104,7 @@ define EXIM_CONFIGURE_TOOLCHAIN
>  	$(call exim-config-add,HOSTCC,$(HOSTCC))
>  	$(call exim-config-add,HOSTCFLAGS,$(HOSTCFLAGS))
>  	$(EXIM_FIX_IP_OPTIONS_FOR_MUSL)
> +	$(EXIM_EXTRALIBS)

I've changed this to:

+       $(call exim-config-add,EXTRALIBS,$(EXIM_EXTRALIBS))

> +ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
> +EXIM_DEPENDENCIES += libexecinfo
> +define EXIM_EXTRALIBS
> +$(call exim-config-add,EXTRALIBS,-lexecinfo)
> +endef
> +else ifneq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
> +EXIM_C_FLAGS = -DNO_EXECINFO
> +endif

And changed this to:

+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+EXIM_DEPENDENCIES += libexecinfo
+EXIM_EXTRALIBS += -lexecinfo
+else ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
+EXIM_CFLAGS = -DNO_EXECINFO
+endif

so EXIM_EXTRALIBS becomes really the list of extra libraries, and the
exim-config-add call is inside EXIM_CONFIGURE_TOOLCHAIN. This means
that we can add more things to EXIM_EXTRALIBS for other reasons if
needed in the future.

Also, I've used EXIM_CFLAGS instead of EXIM_C_FLAGS, and used a
slightly different construct for the glibc condition.

Applied with those changes, thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
