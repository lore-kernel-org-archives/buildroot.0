From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 8 May 2021 12:13:53 +0200
Subject: [Buildroot] [PATCH 1/2] package/qemu: bump version to 6.0.0
In-Reply-To: <20210507170102.1896972-1-aduskett@rivian.com>
References: <20210507170102.1896972-1-aduskett@rivian.com>
Message-ID: <aaf70db3-b977-f575-878a-4d0ade95531c@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

Le 07/05/2021 ? 19:01, Adam Duskett a ?crit?:
> From: Adam Duskett <aduskett@gmail.com>
> 
> Other changes:
>   - Drop patch 0003-hw-usb-host-libusb.c-fix-build-with-kernel-5.0.patch as it
>     is part of 6.0.0.
>   - Rename 0004-meson-add-tests-option.patch to
>     0003-meson-add-tests-option.patch and refresh it for 6.0.0

I can be useful to add the link to the release changelog:
https://wiki.qemu.org/ChangeLog/6.0

You can also do a runtime testing with gitlab-ci with all qemu defconfig and add
the link to your pipeline.
I'm using gitlab-ci for such testing (qemu, toolchain, kernel update) :)

> 
> Signed-off-by: Adam Duskett <aduskett@rivian.com>
> ---

[...]

> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index b552ea139e..e0f722cf42 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -QEMU_VERSION = 5.2.0
> +QEMU_VERSION = 6.0.0
>  QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
>  QEMU_SITE = http://download.qemu.org
>  QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
> 

I had a look at qemu 6.0.0 but haven't had the time to finish the testing.

I noticed some new build options:

--disable-fuse
--disable-fuse-lseek
--disable-gettext
--disable-lto
--disable-cfi

and a lot of options conversion to meson.
Indded, qemu project is working on meson build system but it's not yet ready.
This is why we still use generic-package and not meson-package infra.

Best regards,
Romain
