From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 8 Feb 2018 06:43:01 +0200
Subject: [Buildroot] [RFCv2 2/3] gobject-introspection: new package
In-Reply-To: <20180207212355.7464-3-aduskett@gmail.com>
References: <20180207212355.7464-1-aduskett@gmail.com>
 <20180207212355.7464-3-aduskett@gmail.com>
Message-ID: <20180208044301.jvbotpwg3rl4g6ry@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

Thanks for working on this hard problem.

On Wed, Feb 07, 2018 at 04:23:54PM -0500, Adam Duskett wrote: 
> diff --git a/package/gobject-introspection/Config.in b/package/gobject-introspection/Config.in
> new file mode 100644
> index 0000000000..42f58c8c0e
> --- /dev/null
> +++ b/package/gobject-introspection/Config.in
> @@ -0,0 +1,34 @@
> +config BR2_PACKAGE_GOBJECT_INTROSPECTION
> +	bool "gobject-introspection"
> +	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS #host-qemu
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libffi, libglib2
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	depends on BR2_USE_MMU # python3, libglib2
> +	depends on BR2_USE_WCHAR # python3, libglib2 -> gettext
> +	depends on !BR2_STATIC_LIBS
> +	depends on !BR2_MIPS_NABI32
> +	depends on BR2_LINUX_KERNEL # qemu-host

So the target board (not only architecture) must be one that qemu emulates. 
This is a pretty big limitation. Since GI does not require any specific 
hardware, would it be possible to use the qemu user space emulator[1] instead?

[1] https://qemu.weilnetz.de/doc/qemu-doc.html#QEMU-User-space-emulator

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
