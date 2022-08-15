Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F39C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 10:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC30481CE9;
	Mon, 15 Aug 2022 10:14:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC30481CE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3bJkCBhX-dut; Mon, 15 Aug 2022 10:14:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D592681C93;
	Mon, 15 Aug 2022 10:14:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D592681C93
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B3D191BF3C4
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 10:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81F0060C0D
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 10:14:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81F0060C0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yyOXguUEANSZ for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 10:14:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00D8260AF7
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 00D8260AF7
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 10:14:15 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 919DB60003;
 Mon, 15 Aug 2022 10:14:13 +0000 (UTC)
Date: Mon, 15 Aug 2022 12:14:12 +0200
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20220815121412.3be64939@windsurf>
In-Reply-To: <20220809100602.2fb39e1c@windsurf>
References: <20220807210317.9415-1-heiko.thiery@gmail.com>
 <20220808104133.6479c0a5@windsurf>
 <CAEyMn7Y+2=+2ruq-4+kvHqX2YXVNoGYLskYrYpjKfAxPfY2XOw@mail.gmail.com>
 <20220809100602.2fb39e1c@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660558453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=de9XslYW2N300aWMXhEolHIz/SK3G0z4cWA8m0D8J4g=;
 b=ToeNR7YNyEukROYrZr64AqXopPoYgMdCGMBS0YsV8o0hJxUN9Web2A4R/Pgt82Jfps3SQZ
 uX9thO+YfeO80F900NB9ZgPjaAqqvyZsTpEDplAFSEy8rvogLoGoAYo6whXV6chVTn1ufI
 9g0SNE0BYjLYBR4TzlqJ/7hJf1l9Gwr4cj9ypuYWlNM16yVGpty6/cyht7P9PsgIeag1uX
 aFiQ0QYIppKqg2IJwP+JyXckX9S88xC9P7CAYvEgkeuqMB6cJic/3P6CJIRjXyUnd2lm+3
 bisKIiPMUGZQavr/OAtwAd4uLIkz2/CKtWIqVWaV37X9W9ORUwF/PA6DwfHMmQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ToeNR7YN
Subject: Re: [Buildroot] [PATCH] configs/kontron_bl_imx8mm_defconfig: fix
 build failure with u-boot 2022.04
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Heiko,

On Tue, 9 Aug 2022 10:06:02 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> But this is not normal, because:
> 
> UBOOT_MAKE_OPTS += \
>         CROSS_COMPILE="$(TARGET_CROSS)" \
>         ARCH=$(UBOOT_ARCH) \
>         HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))" \
>         HOSTLDFLAGS="$(HOST_LDFLAGS)" \
>         $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS))
> 
> see we're passing HOSTLDFLAGS here? It contains -L$(HOST_DIR)/lib. So
> it means there is also something wrong in U-Boot in that it doesn't use
> $(HOSTLDFLAGS).

Could you try this change in U-Boot:

diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index 69983a19a44..7624304e3e9 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -89,7 +89,7 @@ hostcxx_flags  = -Wp,-MD,$(depfile) $(__hostcxx_flags)
 # Create executable from a single .c file
 # host-csingle -> Executable
 quiet_cmd_host-csingle         = HOSTCC  $@
-      cmd_host-csingle = $(HOSTCC) $(hostc_flags) -o $@ $< \
+      cmd_host-csingle = $(HOSTCC) $(hostc_flags) $(KBUILD_HOSTLDFLAGS) -o $@ $< \
                $(KBUILD_HOSTLDLIBS) $(HOSTLDLIBS_$(@F))
 $(host-csingle): $(obj)/%: $(src)/%.c FORCE
        $(call if_changed_dep,host-csingle)

(without your pkg-config patch, of course).

Indeed, scripts/Makefile.host is a copy of the kernel's
scripts/Makefile.host, and the kernel copy does use KBUILD_HOSTLDFLAGS
when building host tools that are based on a single source file, but
for some reason the U-Boot copy does not have it, which doesn't make
much sense.

I think it doesn't mean your pkg-config patch is bogus: it still makes
sense to use pkg-config when possible, but I also think not passing
KBUILD_HOSTLDFLAGS is incorrect.

Of course, if it works, I think both patches should be submitted to
U-Boot upstream.

Could you have a look?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
