Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C0EC6FD18
	for <buildroot@archiver.kernel.org>; Tue, 28 Mar 2023 19:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC64B41C73;
	Tue, 28 Mar 2023 19:57:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC64B41C73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4mpgCR_VE8DD; Tue, 28 Mar 2023 19:57:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF79441C7F;
	Tue, 28 Mar 2023 19:57:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF79441C7F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 30A931BF23C
 for <buildroot@lists.busybox.net>; Tue, 28 Mar 2023 19:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 168FC41C89
 for <buildroot@lists.busybox.net>; Tue, 28 Mar 2023 19:57:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 168FC41C89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fVufghSfzSmp for <buildroot@lists.busybox.net>;
 Tue, 28 Mar 2023 19:57:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C46041C7F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C46041C7F
 for <buildroot@buildroot.org>; Tue, 28 Mar 2023 19:57:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 406D15FF88;
 Tue, 28 Mar 2023 21:57:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 28 Mar 2023 21:56:59 +0200
Date: Tue, 28 Mar 2023 21:56:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Message-ID: <20230328195659.GC3204460@scaer>
References: <20230327135948.90710-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230327135948.90710-1-luca.ceresoli@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1680033424;
 bh=GdD9hOVFhJXq/XnshygWW9SUMdrwFVLZnOkWJgi4kQQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QcZlW6F956CJqev8DQyNX+URxjuCYFRWQkgFhh+mNG2I4U7TIYDZFBC/m4xqxLs+r
 73DIqNb5972FLIkpyVZsscqpF7KoqtD8aVdwe6GL+XCct26V1FcZjNmbuVzvV47BJF
 HULrn0Shb0tKBXOiTI61DGWXscvVojCdkI34Bwzff7sU6zUYeJBa7gLCqjAZ9JjJvd
 WvQ90zGzFGccSOGsk3BW0TNsVA1tRX0CFVfaqCnLMDC/OesHGfrZPF31r/rDaGI+RT
 wylQsRa0rpEEGAx07s27m1HpUh+I+9+Bu5uYahtQL18T6duc1Rw8xbD6LjhhzH1oav
 rJXRzx8flZNmQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QcZlW6F9
Subject: Re: [Buildroot] [PATCH v2] package/linux-tools: add USB tools
 (testusb and ffs-test)
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
Cc: Herve Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Luca, All,

On 2023-03-27 15:59 +0200, Luca Ceresoli spake thusly:
> Extend the linux-tools package to also build the userspace USB tools, which
> currently include testusb and ffs-test.
> 
> These tools are in the kernel tree since a long time, but a Makefile was
> added only in 5.9 to allow building in the same way as other tools provided

That is not entirely correct.

The Makefile itself has been present since 2.6.39, but indeed only
gained an install rule for 5.9:

    4f22ce7045c1  2011-02-17  USB: tools: Add a Makefile
    9ca325ffcac4  2020-08-19  tools: usb: move to tools buildsystem

So I've tweaked the commit log accordingly.

> with the kernel. Here we use the Makefile and thus version >= 5.9 is
> required. Support for older kernels may be added later if needed.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> 
> Changes in v2:
> 
>  - Use ALL_TARGETS to select tools to build and install instead of the ugly
>    removal logic
> ---
>  DEVELOPERS                                    |  1 +
>  package/linux-tools/Config.in                 | 26 ++++++++++++++
>  package/linux-tools/linux-tool-usbtools.mk.in | 34 +++++++++++++++++++
>  3 files changed, 61 insertions(+)
>  create mode 100644 package/linux-tools/linux-tool-usbtools.mk.in
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index b6d288c54fa9..67c6004ddf2e 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1874,6 +1874,7 @@ F:	configs/zynqmp_zcu106_defconfig
>  F:	package/agentpp/
>  F:	package/exim/
>  F:	package/libpjsip/
> +F:	package/linux-tools/linux-tool-usbtools.mk.in
>  F:	package/qpid-proton/
>  F:	package/rtl8188eu/
>  F:	package/snmppp/
> diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
> index 8a0b6d5802cc..451b0eeff5bb 100644
> --- a/package/linux-tools/Config.in
> +++ b/package/linux-tools/Config.in
> @@ -135,6 +135,32 @@ comment "selftests needs BR2_PACKAGE_BUSYBOX_SHOW_OTHERS and a toolchain w/ dyna
>  	depends on !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS || \
>  		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
>  
> +config BR2_PACKAGE_LINUX_TOOLS_USBTOOLS
> +	bool "USB test programs"
> +	select BR2_PACKAGE_LINUX_TOOLS
> +	help
> +	  Build and install the USB test tools.
> +
> +	  These tools exist since Linux 2.6.35, but Buildroot can build
> +	  them only with kernel versions 5.9 and later.
> +
> +if BR2_PACKAGE_LINUX_TOOLS_USBTOOLS
> +
> +config BR2_PACKAGE_LINUX_TOOLS_USBTOOLS_TESTUSB
> +	bool "testusb"
> +	help
> +	  testusb issues ioctls to perform the tests implemented by the
> +	  kernel driver.  It can generate a variety of transfer
> +	  patterns.
> +
> +	  See http://www.linux-usb.org/usbtest/
> +
> +config BR2_PACKAGE_LINUX_TOOLS_USBTOOLS_FFSTEST
> +	bool "ffs-test"
> +	help
> +	  User mode filesystem api for usb composite function
> +endif
> +
>  config BR2_PACKAGE_LINUX_TOOLS_TMON
>  	bool "tmon"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/linux-tools/linux-tool-usbtools.mk.in b/package/linux-tools/linux-tool-usbtools.mk.in
> new file mode 100644
> index 000000000000..797758adce51
> --- /dev/null
> +++ b/package/linux-tools/linux-tool-usbtools.mk.in
> @@ -0,0 +1,34 @@
> +################################################################################
> +#
> +# usbtools
> +#
> +################################################################################
> +
> +LINUX_TOOLS += usbtools
> +
> +USBTOOLS_MAKE_OPTS = $(LINUX_MAKE_FLAGS) LDFLAGS="$(TARGET_LDFLAGS)"
> +
> +LINUX_TOOLS_USBTOOLS_LIST = \
> +	$(if $(BR2_PACKAGE_LINUX_TOOLS_USBTOOLS_TESTUSB),testusb) \
> +	$(if $(BR2_PACKAGE_LINUX_TOOLS_USBTOOLS_FFSTEST),ffs-test)
> +
> +define USBTOOLS_BUILD_CMDS
> +	$(Q)if ! grep install $(LINUX_DIR)/tools/usb/Makefile >/dev/null 2>&1 ; then \
> +		echo "Your kernel version is too old to build the USB tools." ; \
> +		echo "At least kernel 5.9 must be used." ; \
> +		exit 1 ; \
> +	fi
> +
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/usb \
> +		ALL_TARGETS="$(LINUX_TOOLS_USBTOOLS_LIST)" \
> +		$(USBTOOLS_MAKE_OPTS) \
> +		all
> +endef
> +
> +define USBTOOLS_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/usb \
> +		ALL_TARGETS="$(LINUX_TOOLS_USBTOOLS_LIST)" \
> +		$(USBTOOLS_MAKE_OPTS) \
> +		DESTDIR=$(TARGET_DIR) \
> +		install
> +endef
> -- 
> 2.34.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
