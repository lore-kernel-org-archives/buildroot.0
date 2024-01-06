Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C098DC46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 14:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FC9860BAD;
	Sat,  6 Jan 2024 14:05:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FC9860BAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ipr_HIiwnbvQ; Sat,  6 Jan 2024 14:05:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DC2A60B90;
	Sat,  6 Jan 2024 14:05:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DC2A60B90
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5AFE91BF362
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 14:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3331C42096
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 14:05:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3331C42096
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uRw7P-0JGPsb for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 14:05:25 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0917542091
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 14:05:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0917542091
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C61A3B0055E;
 Sat,  6 Jan 2024 15:05:16 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 Jan 2024 15:05:16 +0100
Date: Sat, 6 Jan 2024 15:05:16 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <ZZleHINROrv0de6H@landeda>
References: <20231024144256.2708299-1-giulio.benetti@benettiengineering.com>
 <20231024144256.2708299-3-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231024144256.2708299-3-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704549923;
 bh=4vod8rkbglcNYe8DZNx767DJ/cD/sBmcMt2UGy+tIUE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V3osC9sCaXMNIK8cSZ69el2kNFRvNXnktKtW+COllIR+vrvUZ7cK1wBBvBDhuR/9O
 0ig1ihBK5WqfY5HHJqD/RflfIKBTzCzgccKfoB7T7OcW3YPtGqMVa55nnAV+b95MCq
 cBaHGPoTj0mc34bY7jRkmk9a2KfHW7SwW4hviN6UeoywYWRDUFb5uD2uqseo41Jl1s
 +7lcdTyiBXiTVIcLfmsFaO2c9DaAtOHi9r5cfrJnBNJZi5coIm83RYo0idZ1CGCsr4
 Z11LgG75qB+NDZWrtC/VHkrMW6780mxkOmsftchjfJyxDRSIr+LBrWXalqpsojdONP
 g8/1Z0UklcZMg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=V3osC9sC
Subject: Re: [Buildroot] [PATCH v5 3/4] package/linux-tools: add rtla
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Pierre Floury <pierre.floury@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andreas Ziegler <br015@umbiko.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2023-10-24 16:42 +0200, Giulio Benetti spake thusly:
> From: Maxime Chevallier <maxime.chevallier@bootlin.com>
> 
> The RealTime Linux Analysis tool includes a set of commands that relies
> on the osnoise and timerlat tracers from the ftrace kernel subsystem,
> allowing to analyze the lantency sources coming from the hardware and
> the kernel itself.
> 
> This tool was introduced in v5.17 but until v5.19 it relied on libprocps
> that has been deprecated soon. So let's make it available for v5.19+.
> Rtla relies on libtracefs and libtraceevent, although libtraceevent itself
> is already a dependency for libtracefs.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> [Giulio: fix install on recent Linux versions]
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> [Andreas: deal with Linux Fixups, musl, SSP]
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>
> ---
[--SNIP--]
> diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
> index 451b0eeff5..4df73159be 100644
> --- a/package/linux-tools/Config.in
> +++ b/package/linux-tools/Config.in
> @@ -102,6 +102,16 @@ config BR2_PACKAGE_LINUX_TOOLS_PERF_NEEDS_HOST_PYTHON3
>  
>  endif
>  
> +config BR2_PACKAGE_LINUX_TOOLS_RTLA
> +	bool "rtla"
> +	select BR2_PACKAGE_LINUX_TOOLS
> +	select BR2_PACKAGE_LIBTRACEFS
> +	help
> +	  Linux 5.19 and later has 2 new tracers, osnoise and timerlat.
> +	  Linux 6.3 has new tracer hwnoise. These tracers allow performing
> +	  latency analysis, for which the rtla tool provides wrapper
> +	  commands to visualize and extract latency traces and reports.

Re-reading that now, with the feedback from Andreas in my mind, I think
it is still quite confusing. So I rewrote that help text to make it more
explicit what happens.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
>  	bool"selftests"
>  	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
> diff --git a/package/linux-tools/linux-tool-rtla.mk.in b/package/linux-tools/linux-tool-rtla.mk.in
> new file mode 100644
> index 0000000000..603d86722d
> --- /dev/null
> +++ b/package/linux-tools/linux-tool-rtla.mk.in
> @@ -0,0 +1,55 @@
> +################################################################################
> +#
> +# rtla
> +#
> +################################################################################
> +
> +LINUX_TOOLS += rtla
> +
> +RTLA_DEPENDENCIES = host-pkgconf libtracefs
> +RTLA_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
> +	CC=$(TARGET_CC) \
> +	EXTRA_CFLAGS="-D_GNU_SOURCE" \
> +	LDFLAGS="$(TARGET_LDFLAGS)" \
> +	PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
> +define RTLA_DISABLE_STACK_PROTECTOR
> +	$(SED) 's/-fstack-protector.* //' $(LINUX_DIR)/tools/tracing/rtla/Makefile
> +endef
> +endif
> +
> +define RTLA_LINUX_CONFIG_FIXUPS
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_FTRACE)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_TIMERLAT_TRACER)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_HIST_TRIGGERS)
> +endef
> +
> +define RTLA_BUILD_CMDS
> +	$(Q)if ! grep install $(LINUX_DIR)/tools/tracing/rtla/Makefile >/dev/null 2>&1 ; then \
> +		echo "Your kernel version is too old and does not implement the rtla tool." ; \
> +		echo "At least kernel 5.19 must be used." ; \
> +		exit 1 ; \
> +	fi
> +
> +	$(RTLA_DISABLE_STACK_PROTECTOR)
> +
> +	$(TARGET_MAKE_ENV) \
> +	$(MAKE) $(RTLA_MAKE_OPTS) \
> +	-C $(LINUX_DIR)/tools/tracing rtla
> +endef
> +
> +# make rtla_install build and install by default documentation using rst2man
> +# but it's not available in Buildroot and we don't want manual files in target
> +# folder so let's simply install the resulting rtla binary and create symlinks
> +# like Linux does in its tools/tracing/rtla/Makefile
> +define RTLA_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 -D $(LINUX_DIR)/tools/tracing/rtla/rtla $(TARGET_DIR)/usr/bin
> +	ln -sf rtla $(TARGET_DIR)/usr/bin/osnoise
> +	ln -sf rtla $(TARGET_DIR)/usr/bin/timerlat
> +
> +	# Check if hwnoise is provided or not
> +	if grep -q hwnoise $(LINUX_DIR)/tools/tracing/rtla/Makefile; then \
> +		ln -sf rtla $(TARGET_DIR)/usr/bin/hwnoise ; \
> +	fi
> +endef
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
