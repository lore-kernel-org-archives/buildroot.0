From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Jul 2021 23:19:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/qemu: virtfs needs system
In-Reply-To: <20210710155409.1333292-1-fontaine.fabrice@gmail.com>
References: <20210710155409.1333292-1-fontaine.fabrice@gmail.com>
Message-ID: <20210716231934.18eb81ee@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 10 Jul 2021 17:54:09 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

>  config BR2_PACKAGE_HOST_QEMU_VIRTFS
>  	bool "Virtual filesystem support"
> +	depends on BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS
> +	select BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE

I think a:

	depends on BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE

made more sense here. Indeed, if the user wants the "user mode", it's a
bit weird to force the user to also have the "system mode". I believe a
"depends on" in this case is more appropriate.

Applied with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
