Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969E2CDB465
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 12:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C782E42DFD;
	Thu, 19 Oct 2023 12:33:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C782E42DFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dcv-e2e086ux; Thu, 19 Oct 2023 12:33:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D203E42DFE;
	Thu, 19 Oct 2023 12:33:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D203E42DFE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8FF071BF588
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 12:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6796842F0B
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 12:32:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6796842F0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q1kCC98l_Ka7 for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 12:32:57 +0000 (UTC)
X-Greylist: delayed 19624 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 19 Oct 2023 12:32:57 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 877B8401F1
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 877B8401F1
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 12:32:57 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 65111BDEAEE0;
 Thu, 19 Oct 2023 14:32:54 +0200 (CEST)
MIME-Version: 1.0
Date: Thu, 19 Oct 2023 12:32:54 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <mailman.9571.1697362018.35217.buildroot@buildroot.org>
References: <mailman.9571.1697362018.35217.buildroot@buildroot.org>
Message-ID: <be45c0d3f882a072e054632ae086413b@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.10 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1697718774; bh=wSBHY10SciE8KvIVzX8MYMKkblQ1Kq8fX3DynLEqrZ0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=sMdj/bMh3frbLvOXyDbJWg/a2kN/jzjclsE7Zn4sDL9dtLBr2WaHehGV/8q2E0V4h
 KEgfWZlTNFr3P90/LyMr/n9e4EBf5ksX4pNMKVnfhOIivhgW9WfPYt3oHgo8hMJpA4
 TDFnxRB/CmaCJTH0/QT8kpB+mHMdojUogaTDUEfo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=umbiko.net header.i=@umbiko.net
 header.a=rsa-sha256 header.s=mail header.b=sMdj/bMh
Subject: Re: [Buildroot] [PATCH v4 3/4] package/linux-tools: add rtla
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio, *

On 2023-10-14 23:57, Giulio Benetti wrote:
> 
> From: Maxime Chevallier <maxime.chevallier@bootlin.com>
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
> [Giulio: fix install on recent Linux versions]
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * fix install with recent Linux versions
> V2->V3:
> * deal with hwnoise presence as suggested by Yann Morin
> * change Config.in comment according to the point above
> ---
>  DEVELOPERS                                |  2 ++
>  package/linux-tools/Config.in             | 10 ++++++
>  package/linux-tools/linux-tool-rtla.mk.in | 40 +++++++++++++++++++++++
>  3 files changed, 52 insertions(+)
>  create mode 100644 package/linux-tools/linux-tool-rtla.mk.in
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 5c4bc87e16..8f76d471ee 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1223,6 +1223,7 @@ F:	package/libnss/
>  F:	package/libnvme/
>  F:	package/libtraceevent/
>  F:	package/libtracefs
> +F:	package/linux-tools/linux-tool-rtla.mk.in
>  F:	package/mali-driver/
>  F:	package/minicom/
>  F:	package/mmc-utils/
> @@ -2116,6 +2117,7 @@ F:	package/timescaledb/
>  N:	Maxime Chevallier <maxime.chevallier@bootlin.com>
>  F:	package/libtraceevent/
>  F:	package/libtracefs
> +F:	package/linux-tools/linux-tool-rtla.mk.in
> 
>  N:	Michael Durrant <mdurrant@arcturusnetworks.com>
>  F:	board/arcturus/
> diff --git a/package/linux-tools/Config.in 
> b/package/linux-tools/Config.in
> index 451b0eeff5..4df73159be 100644
> --- a/package/linux-tools/Config.in
> +++ b/package/linux-tools/Config.in
> @@ -102,6 +102,16 @@ config 
> BR2_PACKAGE_LINUX_TOOLS_PERF_NEEDS_HOST_PYTHON3
> 
>  endif
> 
> +config BR2_PACKAGE_LINUX_TOOLS_RTLA
> +	bool "rtla"

Since there is a kernel header dependency:
	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17

> +	select BR2_PACKAGE_LINUX_TOOLS
> +	select BR2_PACKAGE_LIBTRACEFS
> +	help
> +	  Linux 5.19 and later has 2 new tracers, osnoise and timerlat.

RTLA seems to have been introduced with 5.17-rc1.

> +	  Linux 6.3 has new tracer hwnoise. These tracers allow performing
> +	  latency analysis, for which the rtla tool provides wrapper
> +	  commands to visualize and extract latency traces and reports.
> +
>  config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
>  	bool"selftests"
>  	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
> diff --git a/package/linux-tools/linux-tool-rtla.mk.in 
> b/package/linux-tools/linux-tool-rtla.mk.in
> new file mode 100644
> index 0000000000..04b98f443d
> --- /dev/null
> +++ b/package/linux-tools/linux-tool-rtla.mk.in
> @@ -0,0 +1,40 @@
> +################################################################################
> +#
> +# rtla
> +#
> +################################################################################
> +
> +LINUX_TOOLS += rtla
> +

Linux kernel needs FTRACE, TIMERLAT_TRACER, HIST_TRIGGERS for RTLA to 
work:

ifeq ($(BR2_PACKAGE_LINUX_TOOLS_RTLA),y)
define RTLA_LINUX_CONFIG_FIXUPS
	$(call KCONFIG_ENABLE_OPT,CONFIG_FTRACE)
	$(call KCONFIG_ENABLE_OPT,CONFIG_TIMERLAT_TRACER)
	$(call KCONFIG_ENABLE_OPT,CONFIG_HIST_TRIGGERS)
endef
endif

> +RTLA_DEPENDENCIES = host-pkgconf libtracefs
> +RTLA_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
> +	CC=$(TARGET_CC) \

libtrace{event,fs} are compiled with _GNU_SOURCE enabled; in the rtla 
build the symbol may be missing, depending on the C library used. Define 
_GNU_SOURCE unconditionally to prevent build failures with musl:

	EXTRA_CFLAGS="-D_GNU_SOURCE" \

> +	LDFLAGS="$(TARGET_LDFLAGS)" \
> +	PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
> +

Build fails if BR2_TOOLCHAIN_BUILDROOT_USE_SSP is set to 'n', so 
introduce a workaround, similar to linux-tool-tmon.mk.in:

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
> +		echo "At least kernel 5.19 must be used." ; \
> +		exit 1 ; \
> +	fi
> +

	$(RTLA_DISABLE_STACK_PROTECTOR)

> +	$(TARGET_MAKE_ENV) \
> +	$(MAKE) $(RTLA_MAKE_OPTS) \
> +	-C $(LINUX_DIR)/tools/tracing rtla
> +endef
> +
> +# make rtla_install build and install by default documentation using 
> rst2man
> +# but it's not available in Buildroot and we don't want manual files 
> in target
> +# folder so let's simply install the resulting rtla binary and create 
> symlinks
> +# like Linux does in its tools/tracing/rtla/Makefile
> +define RTLA_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 -D $(LINUX_DIR)/tools/tracing/rtla/rtla 
> $(TARGET_DIR)/usr/bin
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

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
