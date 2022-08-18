Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38535C28B2B
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 21:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D01B160784;
	Thu, 18 Aug 2022 21:09:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D01B160784
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aImir9oVx96H; Thu, 18 Aug 2022 21:09:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C60E6607C1;
	Thu, 18 Aug 2022 21:09:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C60E6607C1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 600901BF315
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 21:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AEDE83E37
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 21:09:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AEDE83E37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xBrCyeeZ2eus for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 21:09:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A38CB83E6E
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A38CB83E6E
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 21:09:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b502:d67d:6967:6fb1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 6731D78050E;
 Thu, 18 Aug 2022 23:09:39 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 18 Aug 2022 23:09:39 +0200
Date: Thu, 18 Aug 2022 23:09:39 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20220818210939.GW2854108@scaer>
References: <20220815111710.1459820-1-arnout@mind.be>
 <20220815111710.1459820-2-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220815111710.1459820-2-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660856983;
 bh=+x8EWzPqq+ICNfUNmqWBzLxG4stIrrzMKthej29/edU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NHlJ9YaM4rg34wKWIhco/50Oo/V9QCQRziz3c6i+xPK+TK/zc98M0eLincrfloLsq
 iRIEc+vlh7kNHMjagmjRCV4duYElWah0Crc0hVZiDTXElUHsomy4QZFjgRboAxttpn
 cIREnxyzNTtlEa58Lp4md8zHQzhz96CW9fo0Ls1M8y8E+xvdtUSupWocS0VIZUiMkX
 kyKX8usSvvY3Oj2NWYL2ribYjgel4Xt+Rb085eSWzmrO0Xg9ie/vOufvcM9c89LQVM
 Yx3uwNP5NoHhMnTs/pyin6BVdzvIdSbz2MSP5YJEuVcWsI7nLypSTAwK73u9DwsH/J
 /19KR2pBAFj/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NHlJ9YaM
Subject: Re: [Buildroot] [PATCH next v5 2/3] fs/cpio: new option to use
 dracut tool
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
Cc: Adam Duskett <aduskett@gmail.com>,
 Thierry Bultel <thierry.bultel@linatsea.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, Thierry, All,

On 2022-08-15 13:17 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> From: Thierry Bultel <thierry.bultel@linatsea.fr>
> 
> Adds an option to invoke the dracut host tool, providing
> a configuration file, instead of having a full cpio archive
> of the whole target directory.
> 
> A default configuration file is provided. It assumes busybox init.
> ideally, a different default should be used in case of systemd init, but
> that's left for future work.
> 
> Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Applied to next, with all the changes we discussed in this thread and
on IRC, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2 (suggested by Arnout and Yann)
>   - was a new fs type, now an option of cpio
>   - deals with the case of a build with no kernel
>   - gets the kernel name in a smarter way
>   - checks for the name of dracut configuration file
> Changes v2 -> v3
>   - fixed a typo on the --no-kernel option for dracut
>   - removed the unneeded dependency to kernel
>   - added tests for cpio, for both full, and dracut modes
> Changes v3 -> v4
>   - Config.in: applied Yann's comments on syntax and option in choice
>   - do no export TARGET_CROSS but give it in command line instead
>   - use $(ROOTFS_CPIO_DIR) as base for tmp directory
>   - let original, full cpio, first in the code, and dracut mode after
>   - removed unwanted comment in dracut.conf (in tests)
> Changes v4 -> v5 (Arnout)
>   - move runtime test to separate patch;
>   - fix check-package errors;
>   - add default dracut.conf file, the one from the runtime test;
>   - remove bash from dracut.conf;
>   - remove dependency on busybox or systemd init;
>   - add help text to BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE;
>   - use our compression instead of dracut's;
>   - still allow uimage;
>   - add --sysroot option in dracut call;
>   - adapt paths and environment according to changes in previous commit;
>   - use : instead of . to separate ifeq conditions;
>   - add support for reproducible (shared with cpio);
>   - use ROOTFS_CPIO_OPTS instead of ROOTFS_CPIO_DRACUT_CMD_OPTS;
>   - remove --keep option, isn't needed.
> ---
>  fs/cpio/Config.in   | 34 +++++++++++++++++
>  fs/cpio/cpio.mk     | 33 ++++++++++++++++
>  fs/cpio/dracut.conf | 93 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 160 insertions(+)
>  create mode 100644 fs/cpio/dracut.conf
> 
> diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
> index c1151a2881..de83aaad65 100644
> --- a/fs/cpio/Config.in
> +++ b/fs/cpio/Config.in
> @@ -7,6 +7,40 @@ config BR2_TARGET_ROOTFS_CPIO
>  
>  if BR2_TARGET_ROOTFS_CPIO
>  
> +choice
> +	prompt "cpio type"
> +	default BR2_TARGET_ROOTFS_CPIO_FULL
> +
> +config BR2_TARGET_ROOTFS_CPIO_FULL
> +	bool "cpio the whole root filesystem"
> +	help
> +	  Build a cpio archive containing the whole the root filesystem.
> +
> +config BR2_TARGET_ROOTFS_CPIO_DRACUT
> +	bool "Invoke dracut to make a partial initramfs"
> +	select BR2_PACKAGE_HOST_DRACUT
> +	select BR2_PACKAGE_HOST_UBOOT_TOOLS
> +	help
> +	  Build an additional initramfs using dracut. This only contains
> +	  a subset of the rootfs, as determined by the configuration
> +	  file.
> +	  This can be useful to create a recovery system, for instance.
> +
> +endchoice
> +
> +if BR2_TARGET_ROOTFS_CPIO_DRACUT
> +config BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE
> +	string "dracut configuration file"
> +	default "fs/cpio/dracut.conf"
> +	help
> +	  Dracut configuration file. It determines which parts of the
> +	  rootfs get included in the cpio image. See dracut.conf(5) or
> +	  https://github.com/dracutdevs/dracut/blob/master/man/dracut.conf.5.asc
> +
> +	  The default configuration file is suitable for busybox init.
> +	  It doesn't, however, pivot_root into a full rootfs.
> +endif
> +
>  choice
>  	prompt "Compression method"
>  	default BR2_TARGET_ROOTFS_CPIO_NONE
> diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
> index 81f8c393d1..b62d804ad8 100644
> --- a/fs/cpio/cpio.mk
> +++ b/fs/cpio/cpio.mk
> @@ -36,6 +36,8 @@ ROOTFS_CPIO_DEPENDENCIES += host-cpio
>  ROOTFS_CPIO_OPTS += --reproducible
>  endif
>  
> +ifeq ($(BR2_TARGET_ROOTFS_CPIO_FULL),y)
> +
>  define ROOTFS_CPIO_CMD
>  	cd $(TARGET_DIR) && \
>  	find . \
> @@ -44,6 +46,37 @@ define ROOTFS_CPIO_CMD
>  	> $@
>  endef
>  
> +else ifeq ($(BR2_TARGET_ROOTFS_CPIO_DRACUT),y)
> +
> +ROOTFS_CPIO_DEPENDENCIES += host-dracut
> +
> +ifeq ($(BR_BUILDING):$(BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE),y:)
> +$(error No dracut config file name specified, check your BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE setting)
> +endif
> +
> +ifeq ($(BR2_LINUX_KERNEL),y)
> +ROOTFS_CPIO_DEPENDENCIES += linux
> +ROOTFS_CPIO_OPTS += --kver $(LINUX_VERSION_PROBED)
> +else
> +ROOTFS_CPIO_OPTS += --no-kernel
> +endif
> +
> +define ROOTFS_CPIO_CMD
> +	mkdir -p $(ROOTFS_CPIO_DIR)/tmp
> +
> +	$(HOST_DIR)/bin/dracut \
> +		$(ROOTFS_CPIO_OPTS) \
> +		-c $(BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE) \
> +		--sysroot $(TARGET_DIR) \
> +		--tmpdir $(ROOTFS_CPIO_DIR)/tmp \
> +		-M \
> +		--force \
> +		--no-compress \
> +		$@
> +endef
> +
> +endif #BR2_TARGET_ROOTFS_CPIO_DRACUT
> +
>  ifeq ($(BR2_TARGET_ROOTFS_CPIO_UIMAGE),y)
>  ROOTFS_CPIO_DEPENDENCIES += host-uboot-tools
>  define ROOTFS_CPIO_UBOOT_MKIMAGE
> diff --git a/fs/cpio/dracut.conf b/fs/cpio/dracut.conf
> new file mode 100644
> index 0000000000..6184457723
> --- /dev/null
> +++ b/fs/cpio/dracut.conf
> @@ -0,0 +1,93 @@
> +#Simple dracut config for a system without systemd
> +
> +#Dracut configuration
> +
> +show_modules=yes
> +i18n_install_all=no
> +lvmconf=no
> +mdadmconf=no
> +early_microcode=no
> +hostonly=no
> +hostonly_cmdline=no
> +use_fstab=no
> +kernel_cmdline="rd.break=initqueue"
> +do_strip=no
> +
> +# Dracut modules needed
> +add_dracutmodules+=" \
> +busybox-init
> +"
> +
> +# Modules to ignore
> +omit_dracutmodules+=" \
> +bash \
> +biosdevname \
> +btrfs \
> +bluetooth \
> +busybox \
> +caps \
> +cifs \
> +crypt \
> +crypt-gpg \
> +dash \
> +dbus-broker \
> +dbus-daemon \
> +dm \
> +dmraid \
> +dmsquash-live-ntfs \
> +dracut-systemd \
> +fcoe \
> +fcoe-uefi \
> +fs-lib \
> +iscsi \
> +i18n \
> +lvmmerge \
> +lvm \
> +lunmask \
> +mdraid \
> +memstrack \
> +mksh \
> +modsign \
> +mount-root \
> +multipath \
> +nbd \
> +network-legacy \
> +network-wicked \
> +nfs \
> +nvdimm \
> +nvmf \
> +parse-lunmask \
> +qemu \
> +qemu-net \
> +resume \
> +rootfs-block \
> +rngd \
> +systemd \
> +systemd-udevd \
> +systemd-coredump \
> +systemd-ask-password \
> +systemd-timedated \
> +systemd-rfkill \
> +systemd-resolved \
> +systemd-hostnamed \
> +systemd-initrd \
> +systemd-journald \
> +systemd-ldconfig \
> +systemd-networkd \
> +systemd-timesyncd \
> +systemd-veritysetup \
> +systemd-modules-load \
> +systemd-sysctl \
> +systemd-repart \
> +systemd-sysext \
> +systemd-sysusers \
> +systemd-tmpfiles \
> +squash \
> +ssh-client \
> +stratis \
> +tpm2-tss \
> +udev-rules \
> +url-lib \
> +usrmount \
> +"
> +
> -- 
> 2.37.1
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
