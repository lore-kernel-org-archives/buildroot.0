Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B58C433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 20:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03537408F9;
	Tue,  8 Feb 2022 20:26:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v1ctDZsd4BW8; Tue,  8 Feb 2022 20:26:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7164409BA;
	Tue,  8 Feb 2022 20:26:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 757AE1BF390
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 20:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63031409BA
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 20:26:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uw17VNLG57dY for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 20:26:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D861408F9
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 20:26:10 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id co28so859010edb.1
 for <buildroot@buildroot.org>; Tue, 08 Feb 2022 12:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qd2fjebBtOR6ck4cJqizyU1ZUbHZQ50HGgRJY0FEL20=;
 b=Zhh4C8viOWx9x18BQG1Fc4NO7//nFgUUfKs4Cw0xEy4kAfJJNrZb+jcu52OjTlyN74
 L2HZ8MYXVM00HwRghv6+7kFFywqrqHIIWHuv7WeZQOc8kjaJvRs0zEAWKf6182pA0GvI
 WznIX/lrZmWPE+6KL91L+7S3bMp8qjCip/FxVSiuPNxBuDim49fQA7peVoKQCSnLTNwm
 DJsUfoXrXIfV/clb7jF/j9+quA+scHRmA1+hm4oDiHxxPLb0TdP63xpZKNP2dunNaB93
 lrs9gProBzVPHt8YshFH3aWWCw84lyGxe7yJ1MlDqHisF9bAJAwoECSQaJQTOyRaH0kT
 7kdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qd2fjebBtOR6ck4cJqizyU1ZUbHZQ50HGgRJY0FEL20=;
 b=Z1PmpG9GyiY7mXQKH4PHA3jUm+/Mm0q7bsJ6S664GqfdcQRsuIb4ijecjGz2QrXhGU
 MrOYFdt3C9QpVLd6dmfVlT97xC0EZwGT1A1+kn9WZv+X0qLWv5Y/MAnhyw2aPvCLyPoO
 x0PaqqA4219JTjW9foLS0KXWXfoxrvStVxaUM2S5rLlu/Eqrotn+Lj6XekDE7sTv8IQE
 463znLX4tSxz3R6dY8o8yoUXusJUUd9eKb/V3e0fnX0UOFEtvcQV5o0n6D2t+prDbG1h
 j+bzr5o5BmWZKFBcy9hgYotIo8w5j9n9+YpjCJ28gcCzh+Nv816Wupp5SSv6JUEK163D
 l/iA==
X-Gm-Message-State: AOAM533rI0bkrGN5GYOmLEM5itHuvbnOwyYmUr+dc/UyK0V4pnAkohz2
 Vb0swC5b0b+6Zc/kjV+/mg5cyw==
X-Google-Smtp-Source: ABdhPJxnvVb5Ofa5FDi/Z+Q+K/44rieLCHUgvYEX5ZEjVFz0ubg1i5NejQWDm3aNBjmp45VmOaT6rQ==
X-Received: by 2002:a05:6402:524b:: with SMTP id
 t11mr6386050edd.161.1644351969029; 
 Tue, 08 Feb 2022 12:26:09 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id v26sm2785530ejr.15.2022.02.08.12.26.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 12:26:08 -0800 (PST)
Message-ID: <c34f8a14-9dfe-1b1a-980f-3e5013c0d685@mind.be>
Date: Tue, 8 Feb 2022 21:26:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Thomas De Schampheleire <patrickdepinguin@gmail.com>,
 buildroot@buildroot.org
References: <20220115200306.14037-1-patrickdepinguin@gmail.com>
 <20220115200306.14037-3-patrickdepinguin@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220115200306.14037-3-patrickdepinguin@gmail.com>
Subject: Re: [Buildroot] [PATCHv2 2/7] core: introduce NORMALIZED_ARCH as
 non-kernel replacement for KERNEL_ARCH
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 romain.naour@gmail.com, Clayton Shotwell <clayton.shotwell@collins.com>,
 Matt Weber <matthew.weber@collins.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/01/2022 21:03, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> The variable 'KERNEL_ARCH' is actually a normalized version of
> 'ARCH'/'BR2_ARCH'. For example, 'arcle' and 'arceb' both become 'arc', just
> as all powerpc variants become 'powerpc'.
> 
> It is presumably called 'KERNEL_ARCH' because the Linux kernel is typically
> the first place where support for a new architecture is added, and thus is
> the entity that defines the normalized name.
> 
> However, the term 'KERNEL_ARCH' can also be interpreted as 'the architecture
> used by the kernel', which need not be exactly the same as 'the normalized
> name for a certain arch'. In particular, for cases where a 64-bit
> architecture is running a 64-bit kernel but 32-bit userspace. Examples
> include:
>      * aarch64 architecture, with aarch64 kernel and 32-bit (ARM) userspace
>      * x86_64 architecture, with x86_64 kernel and 32-bit (i386) userspace
> 
> In such cases, the 'architecture used by the kernel' needs to refer to the
> 64-bit name (aarch64, x86_64), whereas all userspace applications need to
> refer the, potentially normalized, 32-bit name.
> 
> This means that there need to be two different variables:
> 
> KERNEL_ARCH:     the architecture used by the kernel
> NORMALIZED_ARCH: the normalized name for the current userspace architecture
> 
> At this moment, both will actually have the same content. But a subsequent
> patch will add basic support for situations described above, in which
> KERNEL_ARCH may become overwritten to the 64-bit architecture, while
> NORMALIZED_ARCH needs to remain the same (32-bit) case.
> 
> This commit replaces use of KERNEL_ARCH where actually the userspace arch is
> needed.  Places that use KERNEL_ARCH in combination with building of kernel
> modules are not touched.
> There may be cases where a package builds both a kernel module as userspace,
> in which case it may need to know about both KERNEL_ARCH and
> NORMALIZED_ARCH, for the case where they differ. But this is to be fixed on
> a per-need basis.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> Reviewed-by: Romain Naour <romain.naour@gmail.com>

  I also renamed BR2_KERNEL_ARCH introduced in the previous patch to 
BR2_NORMALIZED_ARCH.


  Applied to master, thanks.

  Regards,
  Arnout


> 
> ---
>   Makefile                                       |  1 +
>   boot/barebox/barebox.mk                        | 10 +++++-----
>   boot/uboot/uboot.mk                            |  6 +++---
>   package/busybox/busybox.mk                     |  2 +-
>   package/environment-setup/environment-setup.mk |  2 +-
>   package/kvmtool/kvmtool.mk                     |  4 ++--
>   package/libselinux/libselinux.mk               |  2 +-
>   package/linux-tools/linux-tool-perf.mk.in      |  4 ++--
>   package/linux-tools/linux-tool-selftests.mk.in |  6 +++---
>   package/olsr/olsr.mk                           |  4 ++--
>   package/pciutils/pciutils.mk                   |  2 +-
>   package/uboot-tools/uboot-tools.mk             | 10 +++++-----
>   12 files changed, 27 insertions(+), 26 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index e012d121b9..c130eb61c6 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -437,6 +437,7 @@ QUIET := $(if $(findstring s,$(filter-out --%,$(MAKEFLAGS))),-q)
>   
>   # Strip off the annoying quoting
>   ARCH := $(call qstrip,$(BR2_ARCH))
> +NORMALIZED_ARCH := $(call qstrip,$(BR2_KERNEL_ARCH))
>   KERNEL_ARCH := $(call qstrip,$(BR2_KERNEL_ARCH))
>   
>   ZCAT := $(call qstrip,$(BR2_ZCAT))
> diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
> index 8f02f9f9e1..6506294d6d 100644
> --- a/boot/barebox/barebox.mk
> +++ b/boot/barebox/barebox.mk
> @@ -59,16 +59,16 @@ ifneq ($$(BR2_TARGET_$(1)_BAREBOXENV),y)
>   $(1)_INSTALL_TARGET = NO
>   endif
>   
> -ifeq ($$(KERNEL_ARCH),i386)
> +ifeq ($$(NORMALIZED_ARCH),i386)
>   $(1)_ARCH = x86
> -else ifeq ($$(KERNEL_ARCH),x86_64)
> +else ifeq ($$(NORMALIZED_ARCH),x86_64)
>   $(1)_ARCH = x86
> -else ifeq ($$(KERNEL_ARCH),powerpc)
> +else ifeq ($$(NORMALIZED_ARCH),powerpc)
>   $(1)_ARCH = ppc
> -else ifeq ($$(KERNEL_ARCH),arm64)
> +else ifeq ($$(NORMALIZED_ARCH),arm64)
>   $(1)_ARCH = arm
>   else
> -$(1)_ARCH = $$(KERNEL_ARCH)
> +$(1)_ARCH = $$(NORMALIZED_ARCH)
>   endif
>   
>   $(1)_MAKE_FLAGS = ARCH=$$($(1)_ARCH) CROSS_COMPILE="$$(TARGET_CROSS)"
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 574fc7089a..49ebf42800 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -143,12 +143,12 @@ endif
>   
>   # The kernel calls AArch64 'arm64', but U-Boot calls it just 'arm', so
>   # we have to special case it. Similar for i386/x86_64 -> x86
> -ifeq ($(KERNEL_ARCH),arm64)
> +ifeq ($(NORMALIZED_ARCH),arm64)
>   UBOOT_ARCH = arm
> -else ifneq ($(filter $(KERNEL_ARCH),i386 x86_64),)
> +else ifneq ($(filter $(NORMALIZED_ARCH),i386 x86_64),)
>   UBOOT_ARCH = x86
>   else
> -UBOOT_ARCH = $(KERNEL_ARCH)
> +UBOOT_ARCH = $(NORMALIZED_ARCH)
>   endif
>   
>   UBOOT_MAKE_OPTS += \
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 60ebc4985f..75e57ba53f 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -95,7 +95,7 @@ BUSYBOX_MAKE_OPTS = \
>   	NM="$(TARGET_NM)" \
>   	RANLIB="$(TARGET_RANLIB)" \
>   	CC="$(TARGET_CC)" \
> -	ARCH=$(KERNEL_ARCH) \
> +	ARCH=$(NORMALIZED_ARCH) \
>   	PREFIX="$(TARGET_DIR)" \
>   	EXTRA_LDFLAGS="$(BUSYBOX_LDFLAGS)" \
>   	CROSS_COMPILE="$(TARGET_CROSS)" \
> diff --git a/package/environment-setup/environment-setup.mk b/package/environment-setup/environment-setup.mk
> index f4c52921f7..29ec5a9a95 100644
> --- a/package/environment-setup/environment-setup.mk
> +++ b/package/environment-setup/environment-setup.mk
> @@ -11,7 +11,7 @@ define HOST_ENVIRONMENT_SETUP_INSTALL_CMDS
>   	for var in $(TARGET_CONFIGURE_OPTS); do \
>   		printf "export \"$$var\"\n" >> $(ENVIRONMENT_SETUP_FILE); \
>   	done
> -	printf "export \"ARCH=$(KERNEL_ARCH)\"\n" >> $(ENVIRONMENT_SETUP_FILE)
> +	printf "export \"ARCH=$(NORMALIZED_ARCH)\"\n" >> $(ENVIRONMENT_SETUP_FILE)
>   	printf "export \"CROSS_COMPILE=$(TARGET_CROSS)\"\n" >> $(ENVIRONMENT_SETUP_FILE)
>   	printf "export \"CONFIGURE_FLAGS=--target=$(GNU_TARGET_NAME) \
>   		--host=$(GNU_TARGET_NAME) \
> diff --git a/package/kvmtool/kvmtool.mk b/package/kvmtool/kvmtool.mk
> index 2984817c7e..df6ae7e0f1 100644
> --- a/package/kvmtool/kvmtool.mk
> +++ b/package/kvmtool/kvmtool.mk
> @@ -25,11 +25,11 @@ KVMTOOL_MAKE_OPTS = \
>   	WERROR=0
>   
>   define KVMTOOL_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) ARCH=$(KERNEL_ARCH) $(MAKE) -C $(@D) $(KVMTOOL_MAKE_OPTS)
> +	$(TARGET_MAKE_ENV) ARCH=$(NORMALIZED_ARCH) $(MAKE) -C $(@D) $(KVMTOOL_MAKE_OPTS)
>   endef
>   
>   define KVMTOOL_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) ARCH=$(KERNEL_ARCH) $(MAKE) -C $(@D) \
> +	$(TARGET_MAKE_ENV) ARCH=$(NORMALIZED_ARCH) $(MAKE) -C $(@D) \
>   		$(KVMTOOL_MAKE_OPTS) install DESTDIR=$(TARGET_DIR) prefix=/usr
>   endef
>   
> diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
> index c1e90130d2..5790e79040 100644
> --- a/package/libselinux/libselinux.mk
> +++ b/package/libselinux/libselinux.mk
> @@ -18,7 +18,7 @@ LIBSELINUX_INSTALL_STAGING = YES
>   # we won't have to use a relative path in 0002-revert-ln-relative.patch
>   LIBSELINUX_MAKE_OPTS = \
>   	$(TARGET_CONFIGURE_OPTS) \
> -	ARCH=$(KERNEL_ARCH) \
> +	ARCH=$(NORMALIZED_ARCH) \
>   	SHLIBDIR=/usr/lib
>   
>   LIBSELINUX_MAKE_INSTALL_TARGETS = install
> diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
> index efa747cf8d..4e28129f50 100644
> --- a/package/linux-tools/linux-tool-perf.mk.in
> +++ b/package/linux-tools/linux-tool-perf.mk.in
> @@ -8,10 +8,10 @@ LINUX_TOOLS += perf
>   
>   PERF_DEPENDENCIES = host-flex host-bison
>   
> -ifeq ($(KERNEL_ARCH),x86_64)
> +ifeq ($(NORMALIZED_ARCH),x86_64)
>   PERF_ARCH=x86
>   else
> -PERF_ARCH=$(KERNEL_ARCH)
> +PERF_ARCH=$(NORMALIZED_ARCH)
>   endif
>   
>   PERF_MAKE_FLAGS = \
> diff --git a/package/linux-tools/linux-tool-selftests.mk.in b/package/linux-tools/linux-tool-selftests.mk.in
> index c4e5bf0fea..b824c11bd6 100644
> --- a/package/linux-tools/linux-tool-selftests.mk.in
> +++ b/package/linux-tools/linux-tool-selftests.mk.in
> @@ -6,13 +6,13 @@
>   
>   LINUX_TOOLS += selftests
>   
> -ifeq ($(KERNEL_ARCH),x86_64)
> +ifeq ($(NORMALIZED_ARCH),x86_64)
>   SELFTESTS_ARCH=x86
>   else
> -ifeq ($(KERNEL_ARCH),i386)
> +ifeq ($(NORMALIZED_ARCH),i386)
>   SELFTESTS_ARCH=x86
>   else
> -SELFTESTS_ARCH=$(KERNEL_ARCH)
> +SELFTESTS_ARCH=$(NORMALIZED_ARCH)
>   endif
>   endif
>   
> diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
> index b2c8e7e001..4ad88991f2 100644
> --- a/package/olsr/olsr.mk
> +++ b/package/olsr/olsr.mk
> @@ -27,10 +27,10 @@ OLSR_PLUGINS += pud
>   endif
>   
>   define OLSR_BUILD_CMDS
> -	$(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) \
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(NORMALIZED_ARCH) \
>   		CFLAGS="$(OLSR_CFLAGS)" -C $(@D) olsrd
>   	$(foreach p,$(OLSR_PLUGINS), \
> -		$(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) \
> +		$(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(NORMALIZED_ARCH) \
>   			CFLAGS="$(OLSR_CFLAGS)" -C $(@D)/lib/$(p)
>   	)
>   endef
> diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
> index 9b83b62b55..67defcc743 100644
> --- a/package/pciutils/pciutils.mk
> +++ b/package/pciutils/pciutils.mk
> @@ -12,7 +12,7 @@ PCIUTILS_LICENSE = GPL-2.0+
>   PCIUTILS_LICENSE_FILES = COPYING
>   PCIUTILS_MAKE_OPTS = \
>   	CROSS_COMPILE="$(TARGET_CROSS)" \
> -	HOST="$(KERNEL_ARCH)-linux" \
> +	HOST="$(NORMALIZED_ARCH)-linux" \
>   	OPT="$(TARGET_CFLAGS)" \
>   	LDFLAGS="$(TARGET_LDFLAGS)" \
>   	DNS=no \
> diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
> index 37e329a2af..26450b7adf 100644
> --- a/package/uboot-tools/uboot-tools.mk
> +++ b/package/uboot-tools/uboot-tools.mk
> @@ -224,14 +224,14 @@ $(eval $(host-generic-package))
>   MKIMAGE = $(HOST_DIR)/bin/mkimage
>   
>   # mkimage supports alpha arc arm arm64 blackfin ia64 invalid m68k microblaze mips mips64 nds32 nios2 or1k powerpc riscv s390 sandbox sh sparc sparc64 x86 x86_64 xtensa
> -# KERNEL_ARCH can be arm64 arc arm blackfin m68k microblaze mips nios2 powerpc sh sparc i386 x86_64 xtensa
> +# NORMALIZED_ARCH can be arm64 arc arm blackfin m68k microblaze mips nios2 powerpc sh sparc i386 x86_64 xtensa
>   # For i386, we need to convert
>   # For openrisc, we need to convert
> -# For others, we'll just keep KERNEL_ARCH
> -ifeq ($(KERNEL_ARCH),i386)
> +# For others, we'll just keep NORMALIZED_ARCH
> +ifeq ($(NORMALIZED_ARCH),i386)
>   MKIMAGE_ARCH = x86
> -else ifeq ($(KERNEL_ARCH),openrisc)
> +else ifeq ($(NORMALIZED_ARCH),openrisc)
>   MKIMAGE_ARCH = or1k
>   else
> -MKIMAGE_ARCH = $(KERNEL_ARCH)
> +MKIMAGE_ARCH = $(NORMALIZED_ARCH)
>   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
