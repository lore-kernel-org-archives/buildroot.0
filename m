From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Oct 2016 22:24:07 +0100
Subject: [Buildroot] [PATCH v2 3/5] lttng-tools: remove dependency on
 host-lttng-babeltrace
In-Reply-To: <20161030195649.6415-4-eeppeliteloop@gmail.com>
References: <20161030195649.6415-1-eeppeliteloop@gmail.com>
 <20161030195649.6415-4-eeppeliteloop@gmail.com>
Message-ID: <20161030212407.GH18077@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Philippe, All,

On 2016-10-30 15:56 -0400, Philippe Proulx spake thusly:
> We don't need to build Babeltrace for the host here. Any host running a
> major Linux distribution can get a recent version of Babeltrace.

The LTS entreprise-class distribution may have a quite old version of
babeltrace. For example, on Ubuntu Precise (14.04):

    $ apt-cache policy babeltrace
    babeltrace:
      Installed: (none)
      Candidate: 1.0.0~rc1-0ubuntu1
      Version table:
         1.0.0~rc1-0ubuntu1 0
            500 http://archive.ubuntu.com/ubuntu/ precise/universe i386 Packages

Is this recent enough to deal with traces from today?

If not, then maybe add an entry in the "Host utilities" sub-menu?

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> See <http://diamon.org/babeltrace/>.
> 
> Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Changes v1 -> v2:
>   - Add Reviewed-by tag.
> 
>  package/lttng-tools/lttng-tools.mk | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
> index 3d884d3..9d9cb1c 100644
> --- a/package/lttng-tools/lttng-tools.mk
> +++ b/package/lttng-tools/lttng-tools.mk
> @@ -10,12 +10,7 @@ LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
>  LTTNG_TOOLS_LICENSE = GPLv2+, LGPLv2.1+ (include/lttng/*, src/lib/lttng-ctl/*)
>  LTTNG_TOOLS_LICENSE_FILES = gpl-2.0.txt lgpl-2.1.txt LICENSE
>  LTTNG_TOOLS_CONF_OPTS += --with-xml-prefix=$(STAGING_DIR)/usr --disable-man-pages
> -
> -# The host-lttng-babeltrace technically isn't a required build
> -# dependency. However, having the babeltrace utilities built for the
> -# host is very useful, since those tools allow to convert the binary
> -# trace format into an human readable format.
> -LTTNG_TOOLS_DEPENDENCIES = liburcu libxml2 popt host-lttng-babeltrace util-linux
> +LTTNG_TOOLS_DEPENDENCIES = liburcu libxml2 popt util-linux
> 
>  ifeq ($(BR2_PACKAGE_LTTNG_LIBUST),y)
>  LTTNG_TOOLS_CONF_OPTS += --with-lttng-ust
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
