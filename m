From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 May 2014 20:31:19 +0200
Subject: [Buildroot] [PATCH v9 11/29] libglu: new package
In-Reply-To: <1400618488-6995-12-git-send-email-bernd.kuhls@t-online.de>
References: <1400618488-6995-1-git-send-email-bernd.kuhls@t-online.de>
 <1400618488-6995-12-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140524183119.GE3491@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-05-20 22:41 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[--SNIP--]
> diff --git a/package/libglu/libglu.mk b/package/libglu/libglu.mk
> new file mode 100644
> index 0000000..f4c47a0
> --- /dev/null
> +++ b/package/libglu/libglu.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# libglu
> +#
> +################################################################################
> +
> +LIBGLU_VERSION = 9.0.0
> +LIBGLU_SITE = http://cgit.freedesktop.org/mesa/glu/snapshot
> +LIBGLU_SOURCE = glu-$(LIBGLU_VERSION).tar.gz
> +LIBGLU_LICENSE = SGI-B-2.0
> +LIBGLU_LICENSE_FILES = include/GL/glu.h
> +LIBGLU_INSTALL_STAGING = YES
> +LIBGLU_AUTORECONF = YES

Please state why autoreconf is needed.

Regards,
Yann E. MORIN.

> +LIBGLU_DEPENDENCIES = libgl
> +
> +$(eval $(autotools-package))
> -- 
> 1.7.10.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
