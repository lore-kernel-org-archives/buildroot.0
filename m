Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12C0C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 22:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B9DC4EEE0;
	Wed,  1 Nov 2023 22:39:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B9DC4EEE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jCIpaCh-0ZNb; Wed,  1 Nov 2023 22:39:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3AB14EED9;
	Wed,  1 Nov 2023 22:39:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3AB14EED9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 864081BF2F1
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 22:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CF1D432A5
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 22:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CF1D432A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RClufXgtIO5w for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 22:39:34 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 072D4432A2
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 22:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 072D4432A2
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4120760002;
 Wed,  1 Nov 2023 22:39:32 +0000 (UTC)
Date: Wed, 1 Nov 2023 23:39:31 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231101233931.25d66334@windsurf>
In-Reply-To: <20231015204753.5775-1-bernd@kuhls.net>
References: <20231015204753.5775-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698878372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PhonWgymoiANkD/30J6nY4ulJNz4h/hZ+/xdntvWaVI=;
 b=oYssOFFgaqTixlTQOk0qS36P6WLExjPD1SXBP+jJBf1dwJwPya/6HYuZqnhpgqFykdn6y+
 qFzlqKzdoofbOT3c+Lk21x7x7EHe7Qc1zkiL9Lx31VtQzg+4brjTOse/uSlghRv90DLFns
 N1+Lyj9d+Wpr6C7e8iNsmNw7yuvcQIjHaOfjD66j0Tgd0C6MrLBwluTYPXBgKVX4H/ONet
 YtTrK0Ywvgte5VwsPXJ2cyZqGdTUOs8byhVK7gM/Tcd7GblomyvLuEPwJWVKkTba76qg2T
 dK/ow+Kncrc4joU7f0XJpiknAJjakBS6UsxSXSwiIeGkIHyTHHUyitPifFAAyg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oYssOFFg
Subject: Re: [Buildroot] [PATCH 1/1] package/pppd: disable for sparc and
 sparc64 architectures
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

On Sun, 15 Oct 2023 22:47:53 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> diff --git a/package/pppd/Config.in b/package/pppd/Config.in
> index 88c2180a9b..3ff8123aab 100644
> --- a/package/pppd/Config.in
> +++ b/package/pppd/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_PPPD
>  	bool "pppd"
> +	depends on !BR2_sparc64 && !BR2_sparc

If we wanted to merge that, it should be:

config BR2_PACKAGE_PPPD_ARCH_SUPPORTS
	bool
	default y if !BR2_sparc64 && !BR2_sparc

However, it's never nice to have to do something like this. Has this
issue been reported to upstream pppd?

Also, it seems like the ppp package in Debian builds on sparc64, see
https://packages.debian.org/sid/ppp. How do they achieve this? I
haven't spotted a particular patch/quirk (but I looked quickly).

In
https://github.com/ppp-project/ppp/blob/master/pppd/termios_linux.h#L14,
the pppd code base is definitely playing with fire. I'm not sure what
they are trying to do, but they know that the inclusion of kernel
headers will cause some redefinition... Perhaps something to discuss
with ppp upstream first.

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
