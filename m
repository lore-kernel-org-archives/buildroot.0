From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jul 2015 18:55:00 +0200
Subject: [Buildroot] [PATCH 02/47] package/libplatform: new package
In-Reply-To: <1437597069-6448-3-git-send-email-bernd.kuhls@t-online.de>
References: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
 <1437597069-6448-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150725165500.GN3662@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-07-22 22:30 +0200, Bernd Kuhls spake thusly:
> Needed by libcec 3.x
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[--SNIP--]
> diff --git a/package/libplatform/libplatform.mk b/package/libplatform/libplatform.mk
> new file mode 100644
> index 0000000..77fbcec
> --- /dev/null
> +++ b/package/libplatform/libplatform.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# libplatform
> +#
> +################################################################################
> +
> +LIBPLATFORM_VERSION = 1.0.10
> +LIBPLATFORM_SITE = $(call github,Pulse-Eight,platform,$(LIBPLATFORM_VERSION))
> +LIBPLATFORM_LICENSE = GPLv3+

I could only see references to GPLv2+, not v+

Also, a file is under the PHP-3.0.1 licences: src/util/fstrcmp.c

> +LIBPLATFORM_LICENSE_FILES = COPYING

There's no COPYING file. There's in fact no file with the licensing
information.

> +LIBPLATFORM_INSTALL_STAGING = YES
> +
> +LIBPLATFORM_CONF_OPTS += \
> +	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi

Why do you hard-code the path to the kodi directory? Can't libplatform
be used for anything else?

Regards,
Yann E. MORIN.

> +$(eval $(cmake-package))
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
