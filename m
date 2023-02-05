Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94C0C636CC
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 08:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6375841805;
	Sun,  5 Feb 2023 08:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6375841805
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S-frVbHyTQfN; Sun,  5 Feb 2023 08:23:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C31041810;
	Sun,  5 Feb 2023 08:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C31041810
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CDCFF1BF20B
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 08:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6F4341810
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 08:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6F4341810
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jmtuVJ7plFaF for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 08:23:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 700E941805
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 700E941805
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 08:23:01 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id ACEFDBDE08EC;
 Sun,  5 Feb 2023 09:22:56 +0100 (CET)
MIME-Version: 1.0
Date: Sun, 05 Feb 2023 09:22:56 +0100
From: Andreas Ziegler <br015@umbiko.net>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <mailman.18015.1675100677.179342.buildroot@buildroot.org>
References: <mailman.18015.1675100677.179342.buildroot@buildroot.org>
Message-ID: <db5852a56a1ea7adb916e3831da75975@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.7 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1675585376; bh=iWWVU5YgtN72bIqykv6d3HWL4X9SZc3G/9hV0OrBZP0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=ZOcmWEV9DUs7rvRjLYqv7rD4Npqf7qJZshdJf9HMZ2adPrexUMie+PrqmMtcLuicM
 NPGrxN/wGmyhjGnraxXMMJYhNa6bmwUW+V8BHtd9tHU8pvXl9zhKjUwRaiSaBiQOqm
 q34gvnidTdFu7Sk8/HA/gMj0f8GeM3AaV6Led5ys=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=umbiko.net header.i=@umbiko.net
 header.a=rsa-sha256 header.s=mail header.b=ZOcmWEV9
Subject: Re: [Buildroot] [PATCH 3/4] package/linux-tools: add rtla
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
Cc: Pierre Floury <pierre.floury@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Maxime,

I was able to build RTLA after some adaptions, see below.

On 2023-01-30 18:44, Maxime Chevallier wrote:
> 
> The RealTime Linux Analysis tool includes a set of commands that relies
> on the osnoise and timerlat tracers from the ftrace kernel subsystem,
> allowing to analyze the lantency sources coming from the hardware and
> the kernel itself.
> 
> This tool was introduced in v5.17, and relies on libtracefs and
> libtraceevent, although libtraceevent itself is already a dependency 
> for
> libtracefs.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  DEVELOPERS                                |  1 +
>  package/linux-tools/Config.in             | 10 +++++++
>  package/linux-tools/linux-tool-rtla.mk.in | 32 +++++++++++++++++++++++
>  3 files changed, 43 insertions(+)
>  create mode 100644 package/linux-tools/linux-tool-rtla.mk.in
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index fe7194f817..8f459c796a 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2109,6 +2109,7 @@ F:	package/timescaledb/
>  N:	Maxime Chevallier <maxime.chevallier@bootlin.com>
>  F:	package/libtraceevent/
>  F:	package/libtracefs
> +F:	package/linux-tools/linux-tool-rtla.mk.in
> 
>  N:	Michael Durrant <mdurrant@arcturusnetworks.com>
>  F:	board/arcturus/
> diff --git a/package/linux-tools/Config.in 
> b/package/linux-tools/Config.in
> index 8a0b6d5802..186392b816 100644
> --- a/package/linux-tools/Config.in
> +++ b/package/linux-tools/Config.in
> @@ -102,6 +102,16 @@ config 
> BR2_PACKAGE_LINUX_TOOLS_PERF_NEEDS_HOST_PYTHON3
> 
>  endif
> 
> +config BR2_PACKAGE_LINUX_TOOLS_RTLA
> +	bool "rtla"

Since a version dependency exists, you might add:
	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17

> +	select BR2_PACKAGE_LINUX_TOOLS
> +	select BR2_PACKAGE_LIBTRACEFS
> +	help
> +	  Linux 5.17 and later has 2 new tracers, osnoise and timerlat.
> +	  There tracers allow performing latency analysis, for which
> +	  the rtla tool provides wrapper commands to visualize and
> +	  extrace latency traces and reports.
> +
>  config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
>  	bool"selftests"
>  	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
> diff --git a/package/linux-tools/linux-tool-rtla.mk.in 
> b/package/linux-tools/linux-tool-rtla.mk.in
> new file mode 100644
> index 0000000000..a736e3b785
> --- /dev/null
> +++ b/package/linux-tools/linux-tool-rtla.mk.in
> @@ -0,0 +1,32 @@
> +################################################################################
> +#
> +# rtla
> +#
> +################################################################################
> +
> +LINUX_TOOLS += rtla
> +
> +RTLA_DEPENDENCIES = host-pkgconf libtracefs

RTLA needs some kernel features; better to include them here, saves time 
experimenting:

# linux kernel needs FTRACE, TIMERLAT_TRACER, HIST_TRIGGERS for RTLA to 
work
ifeq ($(BR2_PACKAGE_LINUX_TOOLS_RTLA),y)
define RTLA_LINUX_CONFIG_FIXUPS
	$(call KCONFIG_ENABLE_OPT,CONFIG_FTRACE)
	$(call KCONFIG_ENABLE_OPT,CONFIG_TIMERLAT_TRACER)
	$(call KCONFIG_ENABLE_OPT,CONFIG_HIST_TRIGGERS)
endef
endif

> +RTLA_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
> +	CC=$(TARGET_CC) \
> +	LDFLAGS="$(TARGET_LDFLAGS)" \
> +	PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
> +

The RTLA Makefile unconditionally compiles with stack smashing 
protection; linking fails on builds configured without this feature:

# adapted from linux-tool-tmon.mk.in
ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
define RTLA_DISABLE_STACK_PROTECTOR
	$(SED) 's/-fstack-protector.* //' 
$(LINUX_DIR)/tools/tracing/rtla/Makefile
endef
endif

> +define RTLA_BUILD_CMDS
> +	$(Q)if ! grep install $(LINUX_DIR)/tools/tracing/rtla/Makefile 
> >/dev/null 2>&1 ; then \
> +		echo "Your kernel version is too old and does not implement the rtla 
> tool." ; \
> +		echo "At least kernel 5.17 must be used." ; \
> +		exit 1 ; \
> +	fi
> +

	$(RTLA_DISABLE_STACK_PROTECTOR)

> +	$(TARGET_MAKE_ENV) \
> +	$(MAKE) $(RTLA_MAKE_OPTS) \
> +	-C $(LINUX_DIR)/tools/tracing rtla
> +endef
> +
> +define RTLA_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/tracing \
> +	$(RTLA_MAKE_OPTS) \
> +	DESTDIR=$(TARGET_DIR) \
> +	rtla_install
> +endef

rtla_install fails with:
Makefile:34: *** NOTICE: rst2man required to generate man pages.  Stop.
because it tries to build and install man pages also. Better to use a 
custom install command:

# The rtla_install target tries to create and install manpages,
# which terminates with an error and cannot be disabled
define RTLA_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(LINUX_DIR)/tools/tracing/rtla/rtla \
		$(TARGET_DIR)/usr/bin/rtla
endef

Kind regards,
Andreas

> --
> 2.39.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
