Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C834C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 10:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10B8E81DA3;
	Thu,  6 Jan 2022 10:31:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n2teRgDVmTUr; Thu,  6 Jan 2022 10:31:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42DF181DB2;
	Thu,  6 Jan 2022 10:31:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8CE6B1BF47D
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 10:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AAE1402E8
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 10:31:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t0mxbIDuIFzI for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 10:31:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 64B15402D8
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 10:31:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:91d2:d1c6:5626:51cd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 5C1C178032A;
 Thu,  6 Jan 2022 11:31:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641465112;
 bh=3r2lPoziqfvxilwebvTWp4vfLYdiBYfi3X55XI7FdlI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vRB5OJIgtCHLOGW2CEyqneN+mLyID4b3OIvSGBiq3PJQk/D/b5GkpvgHNfZX3Ortr
 slAMlNJkvQknTPcwKg7mp5lChIL0jThxa9DuXFVjIRW/TqXhCHviVtLezzu+RoEfB0
 CW8ZehzbNfjiQ6gnCbaHiz5FdljVvPI99Q2UFWRSJYWkGQxkF96C7HEtB3+OzVNg37
 IYax93BJpvxDvpIdBxPNWyc9UBOxsI2+zIO9rzp5FTMkRxU5z2mU1De/qc9lQ7LU5G
 JvTzoRkKPI6dKYBViGA8AGFPkO7M6dBFRzoM8CWJDMOYHFPprpQFW76p6BQVmK/GV3
 b63KHnD0rmDBA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 06 Jan 2022 11:31:49 +0100
Date: Thu, 6 Jan 2022 11:31:49 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thierry Bultel <thierry.bultel@linatsea.fr>
Message-ID: <20220106103149.GN614810@scaer>
References: <20211223111348.3532601-1-thierry.bultel@linatsea.fr>
 <20211223111348.3532601-3-thierry.bultel@linatsea.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211223111348.3532601-3-thierry.bultel@linatsea.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 3/3] fs/cpio: new option to use dracut
 tool
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thierry, All,

On 2021-12-23 12:13 +0100, Thierry Bultel spake thusly:
> Adds an option to invoke the dracut host tool, providing
> a configuration file, instead of having a full cpio archive
> of the whole target directory.
> 
> Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
[--SNIP--]
> diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
> index c1151a2881..3d0f963a8d 100644
> --- a/fs/cpio/Config.in
> +++ b/fs/cpio/Config.in
> @@ -7,6 +7,33 @@ config BR2_TARGET_ROOTFS_CPIO
>  
>  if BR2_TARGET_ROOTFS_CPIO
>  
> +choice
> +	prompt "cpio type"

Missing empty line between the choice prompt and the first choice entry.

> +config BR2_TARGET_ROOTFS_CPIO_FULL
> +	bool "cpio the whole root filesystem (ie the content of 'target')"
> +	help
> +	  Build a cpio archive containing the whole the root filesystem.
> +
> +config BR2_TARGET_ROOTFS_CPIO_DRACUT
> +	bool "Invoke dracut to make an initramfs"
> +	select BR2_PACKAGE_HOST_DRACUT
> +	select BR2_PACKAGE_HOST_UBOOT_TOOLS
> +	help
> +	  Builds an additional initramfs using dracut.
> +	  This can be useful to create a recovery system,
> +	  for instance.
> +
> +if BR2_TARGET_ROOTFS_CPIO_DRACUT
> +config BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE
> +	string "configuration file"
> +endif

Don't add the option in the choice, but outside of it.

> diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
> index 81f8c393d1..e0e0eb2b1e 100644
> --- a/fs/cpio/cpio.mk
> +++ b/fs/cpio/cpio.mk
> @@ -29,6 +29,41 @@ endif # BR2_ROOTFS_DEVICE_CREATION_STATIC
>  
>  ROOTFS_CPIO_PRE_GEN_HOOKS += ROOTFS_CPIO_ADD_INIT
>  
> +ifeq ($(BR2_TARGET_ROOTFS_CPIO_DRACUT),y)
> +
> +export TARGET_CROSS

Don't do such a global export. If you need it in the environment, then
do so when calling the utility, like:

    TARGET_CROSS="$(TARGET_CROSS)" \
    $(HOST_DIR)/bin/dracut \
        blabla other options...

> +ROOTFS_CPIO_DEPENDENCIES += host-dracut
> +
> +ifeq ($(BR2_LINUX_KERNEL),y)
> +ROOTFS_CPIO_DEPENDENCIES += linux
> +endif
> +
> +ifeq ($(BR_BUILDING).$(BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE),y.)
> +$(error No dracut config file name specified, check your BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE setting)
> +endif
> +
> +ifeq ($(BR2_LINUX_KERNEL),y)
> +ROOTFS_CPIO_DRACUT_CMD_OPTS += --kver $(LINUX_VERSION_PROBED)
> +else
> +ROOTFS_CPIO_DRACUT_CMD_OPTS += --no-kernel
> +endif
> +
> +define ROOTFS_CPIO_CMD
> +	mkdir -p $(@D)/tmp
> +	rm -rf $(@D)/tmp/*

The $(@D) for ROOTFS_*_CMD is $(BINARIES_DIR), i.e. output/images/ and
so creating a te,mporary directory in there is not so nice. You should
use $(ROOTFS_CPIO_DIR)/tmp

Also, if I understand correctly, you are doing this mkdir+rm trick to
ensure you have an empty tmp directory to start with. By using
$(ROOTFS_CPIO_DIR) as base, this will be guaranteed, because
$(ROOTFS_CPIO_DIR) is removed and recreated before running the fs
commands.

> +	$(HOST_DIR)/usr/bin/dracut_wrapper.sh \
> +		$(ROOTFS_CPIO_DRACUT_CMD_OPTS) \
> +		-c $(BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE) \
> +		--tmpdir $(@D)/tmp \
> +		-M \
> +		--force \
> +		--keep \
> +		$@
> +endef
> +
> +else ifeq ($(BR2_TARGET_ROOTFS_CPIO_FULL),y)

Please, keep the original, plain cpio first in the code, and add the
dracut specificities after.

>  # --reproducible option was introduced in cpio v2.12, which may not be
>  # available in some old distributions, so we build host-cpio
>  ifeq ($(BR2_REPRODUCIBLE),y)
> @@ -53,4 +88,6 @@ endef
>  ROOTFS_CPIO_POST_GEN_HOOKS += ROOTFS_CPIO_UBOOT_MKIMAGE
>  endif
>  
> +endif #BR2_TARGET_ROOTFS_CPIO_DRACUT
> +
>  $(eval $(rootfs))
> diff --git a/support/testing/conf/dracut.conf b/support/testing/conf/dracut.conf
> new file mode 100644
> index 0000000000..eb793a3562
> --- /dev/null
> +++ b/support/testing/conf/dracut.conf
> @@ -0,0 +1,93 @@
> +#Yuco dracut config

"Yuco"?

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
> +# Dracut modules need
> +add_dracutmodules+=" \
> +busybox-buildroot \
> +bash
> +"
> +
> +# Modules to ignore
> +omit_dracutmodules+=" \
[--SNIP big list of stuff--]
> +"

Rather than remove select stuff, can't we just start from an empty set
and add just what is needed?

Regards,
Yann E. MORIN.

> +
> diff --git a/support/testing/tests/fs/test_cpio.py b/support/testing/tests/fs/test_cpio.py
> new file mode 100644
> index 0000000000..5570693dc2
> --- /dev/null
> +++ b/support/testing/tests/fs/test_cpio.py
> @@ -0,0 +1,44 @@
> +import os
> +import infra.basetest
> +
> +CHECK_FS_CMD = "mount | grep 'rootfs on / type rootfs'"
> +
> +def boot_img(emulator, builddir):
> +    img = os.path.join(builddir, "images", "rootfs.cpio")
> +    emulator.boot(arch="armv7",
> +                  kernel="builtin",
> +                  options=["-initrd", "{}".format(img)])
> +    emulator.login()
> +    _, exit_code = emulator.run(CHECK_FS_CMD)
> +    return exit_code
> +
> +class TestCpioDracut(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_INIT_BUSYBOX=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        BR2_TARGET_ROOTFS_CPIO_DRACUT=y
> +        BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE="{}"
> +        """.format(infra.filepath("conf/dracut.conf"))
> +
> +    def test_run(self):
> +
> +        exit_code = boot_img(self.emulator,
> +                             self.builddir)
> +        self.assertEqual(exit_code, 0)
> +
> +class TestCpioFull(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_INIT_BUSYBOX=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        BR2_TARGET_ROOTFS_CPIO_FULL=y
> +        """
> +
> +    def test_run(self):
> +
> +        exit_code = boot_img(self.emulator,
> +                             self.builddir)
> +        self.assertEqual(exit_code, 0)
> +
> +
> -- 
> 2.25.1
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
