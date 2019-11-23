From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 Nov 2019 22:07:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/tftpd: add license
In-Reply-To: <20191123182855.966365-1-fontaine.fabrice@gmail.com>
References: <20191123182855.966365-1-fontaine.fabrice@gmail.com>
Message-ID: <20191123210736.GY32494@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2019-11-23 19:28 +0100, Fabrice Fontaine spake thusly:
> Set tftpd license to BSD-like as the source code contains only:

Well, tftpd.c contains the exact BSD-4-clause license.

> Copyright 2001 H. Peter Anvin - All Rights Reserved
> 
> This program is free software available under the same license
> as the "OpenBSD" operating system, distributed at
> http://www.openbsd.org/.
> 
> License: BSD
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/tftpd/tftpd.hash | 3 +++
>  package/tftpd/tftpd.mk   | 2 ++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/package/tftpd/tftpd.hash b/package/tftpd/tftpd.hash
> index 247b757fa6..cd865dcd24 100644
> --- a/package/tftpd/tftpd.hash
> +++ b/package/tftpd/tftpd.hash
> @@ -1,2 +1,5 @@
>  # From https://www.kernel.org/pub/software/network/tftp/tftp-hpa/sha256sums.asc
>  sha256	afee361df96a2f88344e191f6a25480fd714e1d28d176c3f10cc43fa206b718b	tftp-hpa-5.2.tar.xz
> +
> +# Hash for license file
> +sha256	08e400bfc2484d34b12fd2c13926cc8f609f1b5001c942b8bc47b80e7a709daa	tftpd/tftpd.h
> diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
> index c42456afd1..911029505e 100644
> --- a/package/tftpd/tftpd.mk
> +++ b/package/tftpd/tftpd.mk
> @@ -8,6 +8,8 @@ TFTPD_VERSION = 5.2
>  TFTPD_SOURCE = tftp-hpa-$(TFTPD_VERSION).tar.xz
>  TFTPD_SITE = $(BR2_KERNEL_MIRROR)/software/network/tftp/tftp-hpa
>  TFTPD_CONF_OPTS = --without-tcpwrappers
> +TFTPD_LICENSE = BSD-like
> +TFTPD_LICENSE_FILES = tftpd/tftpd.h

In this case, I think it is reasonable to not provide a license file,
but I would not mind that we list tftpd/tftpd.c either.

Care to respin, please?

Regards,
Yann E. MORIN.

>  define TFTPD_INSTALL_TARGET_CMDS
>  	$(INSTALL) -D $(@D)/tftp/tftp $(TARGET_DIR)/usr/bin/tftp
> -- 
> 2.24.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
