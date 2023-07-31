Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14869C001DE
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 12:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6A488164B;
	Mon, 31 Jul 2023 12:27:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6A488164B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k_aPNSJwxP0g; Mon, 31 Jul 2023 12:27:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDF198161D;
	Mon, 31 Jul 2023 12:27:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDF198161D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D40EF1BF3CA
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 12:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD06A8164A
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 12:27:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD06A8164A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Thn3uZRtPpv for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 12:27:46 +0000 (UTC)
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 16135815CC
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 12:27:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16135815CC
Received: from tarshish (unknown [10.0.8.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 446694405F1;
 Mon, 31 Jul 2023 15:27:33 +0300 (IDT)
References: <20230731122022.1686951-1-robimarko@gmail.com>
User-agent: mu4e 1.9.21; emacs 28.2
To: Robert Marko <robimarko@gmail.com>
Date: Mon, 31 Jul 2023 15:24:14 +0300
In-reply-to: <20230731122022.1686951-1-robimarko@gmail.com>
Message-ID: <87zg3c1d1e.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1690806453;
 bh=8Y/Dw/rffdzRpQqcNvxzNuZ3e6bJ/zGBTFJ36+PA1uk=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=BtlO9XuZv23dxb5jEHGc07YcJQMYCX0V8XLqECZsxrKuWDjTEPQCtrzWKs3wKES+4
 cy+9WMey7IgWCY3YZE88NHG0lo84xZiC/cktwCF6QEJZBIH+AgqFewr4Y6Upwn8Vp0
 SyvhBW9jdoTO8Ohi193FD22XTCsfCUzWbvQqXdiuDsXaxIxkZSXL2pZkyRLxwq9yh1
 yvllCDevtWia5Ywt/KwQFx1GyM6s+8DXB/B7BuD9d745ytq5PRYZUIE0j0IKbkvQE+
 JKKz672alTCdbERkgHWj7kpq8htT7U0QFF7X2gjkSrk2yq8PAWCAdgo/XWlnJg7HlI
 7x7CDRNVsgLGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=BtlO9XuZ
Subject: Re: [Buildroot] [PATCH v2] package/mhz: add new package
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
> Changes in v2:
> * Use the Makefile from source and override CC and CFLAGS
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

License file hash is missing here.

> diff --git a/package/mhz/mhz.mk b/package/mhz/mhz.mk
> new file mode 100644
> index 0000000000..924bf0793e
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

You should use the github helper instead. Something like

  MHZ_SITE = $(call github,wtarreau,mhz,$(MHZ_VERSION))

> +MHZ_LICENSE = MIT/X11
> +MHZ_LICENSE_FILES = LICENSE
> +
> +define MHZ_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS) $(TARGET_LDFLAGS)" -C $(@D)

Are you sure you need TARGET_LDFLAGS here?

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
