Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7362AECAAD3
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 21:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C0BA81339;
	Sun,  4 Sep 2022 21:04:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C0BA81339
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z8nf0j0F0hsN; Sun,  4 Sep 2022 21:04:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3D3880DCC;
	Sun,  4 Sep 2022 21:04:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3D3880DCC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9F0BD1BF38B
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 21:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 861B5402C2
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 21:04:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 861B5402C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cUVs_9bKWAsd for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 21:04:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58035402BD
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58035402BD
 for <buildroot@buildroot.org>; Sun,  4 Sep 2022 21:04:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a5dc:9bd4:48b0:8ef0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id EC9E5B00714;
 Sun,  4 Sep 2022 23:04:02 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 04 Sep 2022 23:04:02 +0200
Date: Sun, 4 Sep 2022 23:04:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@paral.in>
Message-ID: <20220904210402.GB1490660@scaer>
References: <20220904190940.200587-1-christian@paral.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220904190940.200587-1-christian@paral.in>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662325446;
 bh=jRone9geX1LxJ7s8m+IZLhkyOEVnlqhMDEWATcT3a0I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dsp+uB7jRGEQlWrU2YwsDyjYFgBAjqhDIm3LAznAjwpU6hOc4pHmaRqvrEQNspsBm
 1vYDyu/APQwxZ/6gc4h2bawFjQ8uwjjVCEob4J4L9698Z4Hl79Ot+TZCsqgk8AGXtM
 YiK71bUelscJ2BEZJHYMyp86uFUwz6jEAJh+WwpwcvOyRsIQzafCPha2GESVkGKWN4
 tHOk40Sc+Lx/00v9E1oTjuS/XMgCpZbR4BlW62seearJqkVkDReFk+MYvT0GTY47/9
 pk0uadh4oxeNhK+E+7YDMyaIFld+nSthI83i7+4bNFC2GoOapwrI/0Et7diU8UbPHR
 cfgb8b/lzw3Xw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dsp+uB7j
Subject: Re: [Buildroot] [PATCH v1 1/1] boot/refind: new package
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

Christian, All,

On 2022-09-04 12:09 -0700, Christian Stewart via buildroot spake thusly:
> rEFInd is a user-friendly EFI GUI for boot selection.
> https://www.rodsbooks.com/refind/

Thanks, but again, I believe a commit log should really also include
notes about how the package has been integrated in Buildroot.

[--SNIP--]
> diff --git a/boot/refind/0001-refind-install-copy-to-target-directory-only.patch b/boot/refind/0001-refind-install-copy-to-target-directory-only.patch
> new file mode 100644
> index 0000000000..87c102ec41
> --- /dev/null
> +++ b/boot/refind/0001-refind-install-copy-to-target-directory-only.patch
> @@ -0,0 +1,88 @@
> +From 4476e664a6cb251924f6a61160c72e0fdc0d56fb Mon Sep 17 00:00:00 2001
> +From: Christian Stewart <christian@paral.in>
> +Date: Thu, 1 Sep 2022 20:32:30 -0700
> +Subject: [PATCH] refind-install: copy to target directory only
> +
> +Comment all commands which require root or access the host system.
> +
> +Designed to be run in Buildroot:
> +
> +	OSTYPE="linux" \
> +	Platform="$(REFIND_PLATFORM)" \
> +	InstallDir="$(BINARIES_DIR)/refind" \
> +	RootDir="$(BINARIES_DIR)/refind" \
> +    ./refind-install

It is very sad that this patch is absolutely not upstreamable. :-(

> +Signed-off-by: Christian Stewart <christian@paral.in>
> +---
> + refind-install | 31 +++++++++++--------------------
> + 1 file changed, 11 insertions(+), 20 deletions(-)
> +
> +diff --git a/refind-install b/refind-install
> +index dfb8781..ec01f2e 100755
> +--- a/refind-install
> ++++ b/refind-install
> +@@ -1443,11 +1443,11 @@ InstallOnLinux() {
> +       exit 1
> +    fi
> +    echo "Installing rEFInd on Linux...."
> +-   modprobe efivars &> /dev/null
> ++   # modprobe efivars &> /dev/null

Don't comment the code; just remove it.

[--SNIP--]
> diff --git a/boot/refind/0002-Make.common-use-environment-variables-for-toolchain.patch b/boot/refind/0002-Make.common-use-environment-variables-for-toolchain.patch
> new file mode 100644
> index 0000000000..45b462b962
> --- /dev/null
> +++ b/boot/refind/0002-Make.common-use-environment-variables-for-toolchain.patch
> @@ -0,0 +1,58 @@
> +From 1ab4b8b448f87167d512222e0de92c0fb2e73b0e Mon Sep 17 00:00:00 2001
> +From: Christian Stewart <christian@paral.in>
> +Date: Fri, 2 Sep 2022 00:41:13 -0700
> +Subject: [PATCH] Make.common: use environment variables for toolchain
> +
> +Use the environment specified CC, LD, etc.

I think this patch could be made to be upstreamable, though.

Do you think you could try and look with upstream on a way to make
cross-compilation and out-of-tree install possible without patching?

> +Signed-off-by: Christian Stewart <christian@paral.in>
> +---
> + Make.common | 30 ------------------------------
> + 1 file changed, 30 deletions(-)
> +
> +diff --git a/Make.common b/Make.common
> +index 95a3a97..62c1059 100644
> +--- a/Make.common
> ++++ b/Make.common
> +@@ -17,38 +17,8 @@
> + # used to compile rEFInd....
> + #
> + 
> +-EFIINC          = /usr/include/efi
> +-GNUEFILIB       = /usr/lib
> +-EFILIB          = /usr/lib
> +-EFICRT0         = /usr/lib

Here, this could be something like:

    EFIINC      ?= /usr/include/efi
    GNUEFILIB   ?= usr/lib

and so on...

However, if you pass them as arguments to the make command line, then
the values form the args should already take precendence over those in
the Makefile, and (see below), you _are_ passing them as arguments.

So, why is this patch neede? Did I miss something?

[--SNIP--]
> diff --git a/boot/refind/Config.in b/boot/refind/Config.in
> new file mode 100644
> index 0000000000..683ac4c771
> --- /dev/null
> +++ b/boot/refind/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_REFIND_ARCH_SUPPORTS

BR2_TARGET_REFIND_ARCH_SUPPORTS  (TARGET, not PACKAGE)

> +	bool
> +	default y if BR2_i386
> +	default y if BR2_x86_64
> +	default y if BR2_aarch64
> +	depends on BR2_USE_MMU
> +
> +config BR2_TARGET_REFIND
> +	bool "refind"
> +	depends on BR2_PACKAGE_REFIND_ARCH_SUPPORTS
> +	select BR2_PACKAGE_GNU_EFI

Even if BR2_PACKAGE_REFIND_ARCH_SUPPORTS is stricter than
BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS, you still need to depend on the
latter because you select gnu-efi.

> diff --git a/boot/refind/readme.txt b/boot/refind/readme.txt
> new file mode 100644
> index 0000000000..d4bc326e6f
> --- /dev/null
> +++ b/boot/refind/readme.txt
> @@ -0,0 +1,42 @@
> +Notes on using rEFInd
> +=============================================
[--SNIP--]

I can see the parallel with the grub2 readme. ;-)

However, nothing in there looks like it really need to be root so, like
for grub2, add a section on how to use genimage to implement the above
without needing to become root.

[--SNIP--]
> diff --git a/boot/refind/refind.mk b/boot/refind/refind.mk
> new file mode 100644
> index 0000000000..3daeb1a8c9
> --- /dev/null
> +++ b/boot/refind/refind.mk
> @@ -0,0 +1,66 @@
> +################################################################################
> +#
> +# refind
> +#
> +################################################################################
> +
> +REFIND_VERSION = 0.13.3.1
> +REFIND_SITE = http://downloads.sourceforge.net/project/refind/$(REFIND_VERSION)
> +REFIND_SOURCE = refind-src-$(REFIND_VERSION).tar.gz
> +REFIND_LICENSE = GPL-3.0+, GFDL-1.3+ (docs)
> +REFIND_LICENSE_FILES = COPYING.txt LICENSE.txt docs/refind/FDL-1.3.txt
> +REFIND_DEPENDENCIES = gnu-efi
> +REFIND_INSTALL_IMAGES = YES

As far as I could see, it also installs nothing in TAGET_DIR so, it also
needs to state so:
    REFIND_INSTALL_TARGET = NO

(note: even though this is a generic-pacjage that provides no install
commands, it still needs to explicitly state it installs nothing).

> +REFIND_TARGET = all_gnuefi
> +REFIND_EFI_ARGS = \
> +	EFICRT0=$(STAGING_DIR)/usr/lib \
> +	EFIINC=$(STAGING_DIR)/usr/include/efi \
> +	EFILIB=$(STAGING_DIR)/usr/lib \
> +	GNUEFILIB=$(STAGING_DIR)/usr/lib \
> +	LIBDIR=$(STAGING_DIR)/usr/lib \
> +	LIBEFI=$(STAGING_DIR)/usr/lib/libefi.a

You are passing these variables as arguments on the make command line,
so why is patch 2 needed?

> +ifeq ($(BR2_x86_64),y)
> +REFIND_ARCH = x86_64
> +REFIND_PLATFORM = x64
> +else ifeq ($(BR2_aarch64),y)
> +REFIND_ARCH = aarch64
> +REFIND_PLATFORM = aa64
> +else
> +REFIND_ARCH = ia32
> +REFIND_PLATFORM = ia32
> +endif

Sometimes, it is easier to write this in Config.in, let's see:

    config BR2_TARGET_REFIND_ARCH
        string
        default "x86_64" if BR2_x86_64
        default "ia32" if BR2_i386
        default "aarch64" if BR2_aarch64

    config BR2_TARGET_REFIND_PLATFORM
        string
        default "x64" if BR2_x86_64
        default "ia32" if BR2_i386
        default "aa64" if BR2_aarch64

And then in the .mk:

    REFIND_ARCH = $(call qstrip,$(BR2_TARGET_REFIND_ARCH))
    REFIND_PLATFORM = $(call qstrip,$(BR2_TARGET_REFIND_PLATFORM))

> +REFIND_BINARIES_DIR = $(BINARIES_DIR)/refind
> +REFIND_INSTALL_ARGS = \
> +		InstallDir="$(REFIND_BINARIES_DIR)" \
> +		OSTYPE="linux" \
> +		Platform="$(REFIND_PLATFORM)" \
> +		RootDir="$(REFIND_BINARIES_DIR)"
> +
> +define REFIND_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE1) \
> +		ARCH="$(REFIND_ARCH)" \
> +		AS="$(TARGET_AS)" \
> +		CC="$(TARGET_CC)" \
> +		LD="$(TARGET_LD)" \
> +		OBJCOPY="$(TARGET_OBJCOPY)" \
> +		RANLIB="$(TARGET_RANLIB)" \

TARGET_CONFIGURE_OPTS basically contains all those settings; can't we
use it instead, on the off chance we ever change/extend those in the
future?

Also, as you pass it as arguments, it should override the variables form
the pacakge's Makefile...

> +		MAKEWITH="GNUEFI" \
> +		PYTHON=$(HOST_DIR)/bin/python3 \

I did not see host-python in the _DEPENDENCIES... ;-)

> +		$(REFIND_EFI_ARGS) -C $(@D) $(REFIND_TARGET)
> +endef
> +
> +define REFIND_INSTALL_IMAGES_CMDS
> +	if [ -d $(REFIND_BINARIES_DIR) ]; then \
> +		rm -rf $(REFIND_BINARIES_DIR); \
> +	fi

Why is it necessary to remove the destination directory? We usually do
not do that. In fact, we very seldom do that, and not unless there is a
good reason.

If there is a reason, then no need to test the existence before
removinf, as 'rm 'rf' will not complain if the directory to remove does
not exists

    $ [ -d bar ] || echo Nope
    Nope
    $ rm -rf bar
    $ echo $?
    0

> +	cd $(@D) && $(REFIND_INSTALL_ARGS) ./refind-install --yes --alldrivers
> +	mv $(REFIND_BINARIES_DIR)/EFI/refind/ $(REFIND_BINARIES_DIR)/EFI/BOOT/

If $(REFIND_BINARIES_DIR)/EFI/BOOT/  does not already exists,
this is going to error out, so it must be created first.

If it already exists, refind will be moved as a sub-directory of it, is
this what is expected?

> +	mv $(REFIND_BINARIES_DIR)/EFI/BOOT/refind_$(REFIND_PLATFORM).efi \
> +		$(REFIND_BINARIES_DIR)/EFI/BOOT/boot$(REFIND_PLATFORM).efi
> +	echo "boot$(REFIND_PLATFORM).efi" > $(REFIND_BINARIES_DIR)/startup.nsh

In 3efb5e31fc05 (board, boot, package: remove usage of startup.nsh in
EFI partition) we actually droped use of startup.nsh, so I would not
favour reinstroducng it, and instead follow the EFI naming conventions
as explained in that commit.

Regards,
Yann E. MORIN.

> +endef
> +
> +$(eval $(generic-package))
> -- 
> 2.37.3
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
