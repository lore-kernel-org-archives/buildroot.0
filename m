From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 31 Oct 2016 11:14:54 +0100
Subject: [Buildroot] [PATCH v3 7/9] lttng-babeltrace: add host
 Babeltrace as host utility
In-Reply-To: <20161031074624.7576-8-eeppeliteloop@gmail.com>
References: <20161031074624.7576-1-eeppeliteloop@gmail.com>
 <20161031074624.7576-8-eeppeliteloop@gmail.com>
Message-ID: <20161031101454.GG3389@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Philippe, All,

On 2016-10-31 03:46 -0400, Philippe Proulx spake thusly:
> Although Babeltrace is available for all major Linux distributions, some
> of them have a quite old version of this project.
> 
> Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, small nit, see below...

[--SNIP--]
> diff --git a/package/lttng-babeltrace/Config.in.host b/package/lttng-babeltrace/Config.in.host
> new file mode 100644
> index 0000000..5da482e
> --- /dev/null
> +++ b/package/lttng-babeltrace/Config.in.host
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_HOST_LTTNG_BABELTRACE
> +	bool "host lttng-babeltrace"
> +	help
> +	  The Babeltrace project provides trace read and write
> +	  libraries, as well as a trace converter application. Plugins
> +	  can be created for any trace format to allow its conversion
> +	  to/from another trace format.
> +
> +	  Babeltrace is the reference implementation of the Common
> +	  Trace Format (see <http://diamon.org/ctf/>). Babeltrace
> +	  can decode and display LTTng traces, since the latter are
> +	  written using the CTF format.
> +
> +	  Having this tool on the target is not mandatory. You can
> +	  transfer the binary trace output from the target to your
> +	  development workstation, and use babeltrace here.

You can probably get rid of this paragraph, as this is the host variant
of the package.

Regards,
Yann E. MORIN.

> +	  http://diamon.org/babeltrace
> diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
> index da18f88..30c5f6e 100644
> --- a/package/lttng-babeltrace/lttng-babeltrace.mk
> +++ b/package/lttng-babeltrace/lttng-babeltrace.mk
> @@ -13,6 +13,7 @@ LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2 host-pkgconf
>  LTTNG_BABELTRACE_CONF_OPTS += --disable-debug-info
>  HOST_LTTNG_BABELTRACE_DEPENDENCIES = \
>  	host-popt host-util-linux host-libglib2 host-pkgconf
> +HOST_LTTNG_BABELTRACE_CONF_OPTS += --disable-debug-info
> 
>  # For 0001-configure.ac-remove-elfutils-version-test-for-Buildr.patch
>  LTTNG_BABELTRACE_AUTORECONF = YES
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
