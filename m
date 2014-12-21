From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Dec 2014 11:02:41 +0100
Subject: [Buildroot] [PATCH 1/1] intel-gpu-tools: new package
References: <1419105512-4136-1-git-send-email-tallubko@yahoo.com>
Message-ID: <XnsA40A705DB13B4berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Tal Lubko <tallubko@yahoo.com> wrote in 
news:1419105512-4136-1-git-send-email-tallubko at yahoo.com:

> +     select BR2_PACKAGE_LIBDRM

libdrm package depends on BR2_LARGEFILE & BR2_TOOLCHAIN_HAS_THREADS, please 
propagate this dependency to your new package.

> +     select BR2_PACKAGE_LIBDRM_INTEL
> +     select BR2_PACKAGE_CAIRO

Cairo depends on BR2_ARCH_HAS_ATOMICS

> +     select BR2_PACKAGE_CAIRO_PNG
> +     select BR2_PACKAGE_LIBGLIB2

Libglib2 depends on BR2_USE_WCHAR, BR2_TOOLCHAIN_HAS_THREADS & BR2_USE_MMU

> +     select BR2_PACKAGE_LIBPCIACCESS

Libpciaccess depends on BR2_LARGEFILE.

> +INTEL_GPU_TOOLS_VERSION = 1.8

Version 1.9 was released on Dec, 12th ;)

Regards, Bernd
