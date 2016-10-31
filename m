From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 31 Oct 2016 10:57:35 +0100
Subject: [Buildroot] [PATCH v3 5/9] lttng-modules: bump to version 2.8.3
In-Reply-To: <20161031074624.7576-6-eeppeliteloop@gmail.com>
References: <20161031074624.7576-1-eeppeliteloop@gmail.com>
 <20161031074624.7576-6-eeppeliteloop@gmail.com>
Message-ID: <20161031095735.GE3389@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Philippe, All,

On 2016-10-31 03:46 -0400, Philippe Proulx spake thusly:
> LTTng-modules, starting from v2.8, has a mechanism to be built directly
> into a Linux kernel image, that is, not as loadable kernel modules. For
> this the `CONFIG_LTTNG_CLOCK_PLUGIN_TEST` and `CONFIG_LTTNG` Make
> variables were introduced. They need to be explicitly set to `m` here to
> build the project as loadable kernel modules.
> 
> Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Changes v2 -> v3:
>   - Go back to kernel-module infra, but with custom Make options.
> 
> Changes v1 -> v2:
>   - Detailed commit message.
> 
>  package/lttng-modules/lttng-modules.hash | 6 ++++--
>  package/lttng-modules/lttng-modules.mk   | 3 ++-
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/package/lttng-modules/lttng-modules.hash b/package/lttng-modules/lttng-modules.hash
> index 2d50287..81e2d5c 100644
> --- a/package/lttng-modules/lttng-modules.hash
> +++ b/package/lttng-modules/lttng-modules.hash
> @@ -1,2 +1,4 @@
> -# from http://lttng.org/files/lttng-tools/lttng-modules-2.7.1.tar.bz2.sha1
> -sha1  38c42ec89b4966c7a4cc04aea75f5841634d8d66  lttng-modules-2.7.1.tar.bz2
> +# From http://lttng.org/files/lttng-modules/lttng-modules-2.8.3.tar.bz2.{md5,sha1}
> +md5   424354c4834d20235dacd9a1fd7653b6  lttng-modules-2.8.3.tar.bz2
> +sha1  862705784a54962f70226004f1fd0bf77f73f10f  lttng-modules-2.8.3.tar.bz2
> +
> diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
> index 5d0c422..9ecf572 100644
> --- a/package/lttng-modules/lttng-modules.mk
> +++ b/package/lttng-modules/lttng-modules.mk
> @@ -4,11 +4,12 @@
>  #
>  ################################################################################
> 
> -LTTNG_MODULES_VERSION = 2.7.1
> +LTTNG_MODULES_VERSION = 2.8.3
>  LTTNG_MODULES_SITE = http://lttng.org/files/lttng-modules
>  LTTNG_MODULES_SOURCE = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
>  LTTNG_MODULES_LICENSE = LGPLv2.1/GPLv2 (kernel modules), MIT (lib/bitfield.h, lib/prio_heap/*)
>  LTTNG_MODULES_LICENSE_FILES = lgpl-2.1.txt gpl-2.0.txt mit-license.txt LICENSE
> +LTTNG_MODULES_MODULE_MAKE_OPTS = CONFIG_LTTNG=m CONFIG_LTTNG_CLOCK_PLUGIN_TEST=m
> 
>  $(eval $(kernel-module))
>  $(eval $(generic-package))
> --
> 2.9.3
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
