From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Aug 2016 23:53:57 -0700
Subject: [Buildroot] [PATCH 1/1] package/libvpx: Fix compilation when
	__uClinux__ is defined
In-Reply-To: <1469954504-31016-1-git-send-email-bernd.kuhls@t-online.de>
References: <1469954504-31016-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <D26F367F-EE90-4A2D-8603-7EBE04E9E2BD@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On Jul 31, 2016, at 1:41 AM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> 
> The buildroot toolchains do not contain lddk.h
> 
> Fixes
> http://autobuild.buildroot.net/results/ae7/ae7ba1d5979ebe39aace628fa8ff2c8f08a70a98/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> ...mem-vpx_mem.h-Fix-compilation-with-uClibc.patch | 27 ++++++++++++++++++++++
> 1 file changed, 27 insertions(+)
> create mode 100644 package/libvpx/0001-vpx_mem-vpx_mem.h-Fix-compilation-with-uClibc.patch
> 
> diff --git a/package/libvpx/0001-vpx_mem-vpx_mem.h-Fix-compilation-with-uClibc.patch b/package/libvpx/0001-vpx_mem-vpx_mem.h-Fix-compilation-with-uClibc.patch
> new file mode 100644
> index 0000000..76b6fcf
> --- /dev/null
> +++ b/package/libvpx/0001-vpx_mem-vpx_mem.h-Fix-compilation-with-uClibc.patch
> @@ -0,0 +1,27 @@
> +From 90845a3a263e0f37b9c756c0b01377b9d1a225c9 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd.kuhls@t-online.de>
> +Date: Sun, 31 Jul 2016 10:37:05 +0200
> +Subject: [PATCH 1/1] vpx_mem/vpx_mem.h: Fix compilation with uClibc
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +---
> + vpx_mem/vpx_mem.h | 3 ---
> + 1 file changed, 3 deletions(-)
> +
> +diff --git a/vpx_mem/vpx_mem.h b/vpx_mem/vpx_mem.h
> +index c14f288..82df745 100644
> +--- a/vpx_mem/vpx_mem.h
> ++++ b/vpx_mem/vpx_mem.h
> +@@ -12,9 +12,6 @@
> + #define VPX_MEM_VPX_MEM_H_
> +
> + #include "vpx_config.h"
> +-#if defined(__uClinux__)
> +-# include <lddk.h>
> +-#endif

better to use

if defined(__uClinux__) && defined(CHIP_DM642)

may be if someone is using BR for ti_c6x


> +
> + #include <stdlib.h>
> + #include <stddef.h>
> +--
> +2.8.1
> +
> --
> 2.8.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 204 bytes
Desc: Message signed with OpenPGP using GPGMail
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160803/56168dc2/attachment.asc>
