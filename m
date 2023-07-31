Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5466FC001DF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 10:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCAB561052;
	Mon, 31 Jul 2023 10:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCAB561052
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1QmDBAFzmKzH; Mon, 31 Jul 2023 10:56:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E679D60B32;
	Mon, 31 Jul 2023 10:56:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E679D60B32
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 90B1E1BF384
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 10:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6730540364
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 10:56:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6730540364
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9LT0gRucJJkc for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 10:56:22 +0000 (UTC)
X-Greylist: delayed 463 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 31 Jul 2023 10:56:21 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D1CC4012D
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D1CC4012D
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 10:56:21 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id B06B5440787;
 Mon, 31 Jul 2023 13:48:25 +0300 (IDT)
References: <20230731104009.1071930-1-robimarko@gmail.com>
User-agent: mu4e 1.9.21; emacs 28.2
To: Robert Marko <robimarko@gmail.com>
Date: Mon, 31 Jul 2023 13:45:00 +0300
In-reply-to: <20230731104009.1071930-1-robimarko@gmail.com>
Message-ID: <874jlk2w72.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1690800505;
 bh=hk4hXQsL5LfQ2vgARQYxSrU9et/OC6NCqVjNdJDpQOY=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=qH2J4tBptDAYGoyMspiNkqwQ0CQ39qm5Th2/UD3n4AROBLAbFHrfkbQncqC59CTjG
 KIlqbaOdAZWCbxgm9QOed6rGDW2YOqAVw8QbRrppQU1JtWNgjkrAm4EzO25FoxoR35
 TcPQcC/Vg0un1cau5p2Vo+wjo7fw/a/nNZDff0lFZB+qKBS8m5jiMQS4dvwbBB/5Ad
 kaL3mQLjw2Hgrr45kKNi32kYxNeS+3EXmMb1EHc2Jg/A8Jo/Ktf5OpM/Hxz9HKmcUM
 Xo04M9ixlmUy2CpASQFEhP7asduVqPegrcokjuIs1CEEvhET0ImuopvfA/aeUjrI9P
 hmaFtSiO6gDKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=qH2J4tBp
Subject: Re: [Buildroot] [PATCH] package/mhz: add new package
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Robert,

On Mon, Jul 31 2023, Robert Marko wrote:
> mhz is a tool to mathematically calculate the real running CPU frequency
> and as such has proved as invaluable tool for developing CPUFreq and
> similar features in the kernel.
>
> Its source finally got a license recently so it can be packaged.
>
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>  package/Config.in     |  1 +
>  package/mhz/Config.in |  6 ++++++
>  package/mhz/mhz.hash  |  2 ++
>  package/mhz/mhz.mk    | 21 +++++++++++++++++++++
>  4 files changed, 30 insertions(+)
>  create mode 100644 package/mhz/Config.in
>  create mode 100644 package/mhz/mhz.hash
>  create mode 100644 package/mhz/mhz.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index a60a1a8858..b9b6dd2580 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -549,6 +549,7 @@ endmenu
>  	source "package/memtest86/Config.in"
>  	source "package/memtester/Config.in"
>  	source "package/memtool/Config.in"
> +	source "package/mhz/Config.in"
>  	source "package/minicom/Config.in"
>  	source "package/msr-tools/Config.in"
>  	source "package/nanocom/Config.in"
> diff --git a/package/mhz/Config.in b/package/mhz/Config.in
> new file mode 100644
> index 0000000000..2f4af5026e
> --- /dev/null
> +++ b/package/mhz/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_MHZ
> +	bool "mhz"
> +	help
> +	  CPU frequency measurement utility.
> +
> +	  https://github.com/wtarreau/mhz.git
> diff --git a/package/mhz/mhz.hash b/package/mhz/mhz.hash
> new file mode 100644
> index 0000000000..6b39eb4bb7
> --- /dev/null
> +++ b/package/mhz/mhz.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  1e07bb0d455d63fd33fb87a24f65a803c7c2d920fde4e5b5378b8c1b07de3b47  mhz-11aac2399780a1f7ea9f007b14af0464797d5cf1-br1.tar.gz
> diff --git a/package/mhz/mhz.mk b/package/mhz/mhz.mk
> new file mode 100644
> index 0000000000..c2485995cc
> --- /dev/null
> +++ b/package/mhz/mhz.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# mhz
> +#
> +################################################################################
> +
> +MHZ_VERSION = 11aac2399780a1f7ea9f007b14af0464797d5cf1
> +MHZ_SITE = https://github.com/wtarreau/mhz.git
> +MHZ_SITE_METHOD = git
> +MHZ_LICENSE = MIT/X11
> +MHZ_LICENSE_FILES = LICENSE
> +
> +define MHZ_BUILD_CMDS
> +	$(TARGET_CC) $(TARGET_CFLAGS) -o $(@D)/mhz $(@D)/mhz.c

Have you tried to use the package Makefile? It looks like you only need
to override the 'CC' and 'CFLAGS' variables.

baruch

> +endef
> +
> +define MHZ_INSTALL_TARGET_CMDS
> +	$(INSTALL) $(@D)/mhz $(TARGET_DIR)/usr/bin/mhz
> +endef
> +
> +$(eval $(generic-package))


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
