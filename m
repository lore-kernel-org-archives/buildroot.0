From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Nov 2019 09:29:41 +0100
Subject: [Buildroot] [PATCH/next v2,1/1] package/tftpd: add license
In-Reply-To: <20191123230528.968209-1-fontaine.fabrice@gmail.com>
References: <20191123230528.968209-1-fontaine.fabrice@gmail.com>
Message-ID: <20191124082941.GE32494@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2019-11-24 00:05 +0100, Fabrice Fontaine spake thusly:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Set license to BSD-4-Clause as specified in tftpd.c instead of
>    BSD-like
> 
>  package/tftpd/tftpd.hash | 3 +++
>  package/tftpd/tftpd.mk   | 2 ++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/package/tftpd/tftpd.hash b/package/tftpd/tftpd.hash
> index 247b757fa6..c876b2edc2 100644
> --- a/package/tftpd/tftpd.hash
> +++ b/package/tftpd/tftpd.hash
> @@ -1,2 +1,5 @@
>  # From https://www.kernel.org/pub/software/network/tftp/tftp-hpa/sha256sums.asc
>  sha256	afee361df96a2f88344e191f6a25480fd714e1d28d176c3f10cc43fa206b718b	tftp-hpa-5.2.tar.xz
> +
> +# Hash for license file
> +sha256	5efef82650b8ece733e37790fc70f05e426c9e1ef9640d4ebcb04867bd3f5e28	tftpd/tftpd.c
> diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
> index c42456afd1..57905fda05 100644
> --- a/package/tftpd/tftpd.mk
> +++ b/package/tftpd/tftpd.mk
> @@ -8,6 +8,8 @@ TFTPD_VERSION = 5.2
>  TFTPD_SOURCE = tftp-hpa-$(TFTPD_VERSION).tar.xz
>  TFTPD_SITE = $(BR2_KERNEL_MIRROR)/software/network/tftp/tftp-hpa
>  TFTPD_CONF_OPTS = --without-tcpwrappers
> +TFTPD_LICENSE = BSD-4-Clause
> +TFTPD_LICENSE_FILES = tftpd/tftpd.c
>  
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
