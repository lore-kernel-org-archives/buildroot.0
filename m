From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Tue, 22 May 2018 11:35:46 -0400
Subject: [Buildroot] [PATCH 1/1] lttng-tools: Install to staging
In-Reply-To: <20180522152847.21479-1-jfaith@impinj.com>
References: <20180522152847.21479-1-jfaith@impinj.com>
Message-ID: <CAB4xu_0gSJpPWzEuCdQ6BQgncFPvq=0b0u6vVdiqR5+1o+agPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 22, 2018 at 11:28 AM, John Faith <jfaith@impinj.com> wrote:
>
> Install the LTTng control library headers and shared objects
> to staging.
>
> The C interface to LTTng described here:
> https://lttng.org/docs/v2.10/#doc-liblttng-ctl-lttng
> requires including <lttng/lttng.h> and linking against liblttng-ctl,
> but those parts are not available unless this package does a staging
> install.

Acked-by: Philippe Proulx <eeppeliteloop@gmail.com>

>
> Signed-off-by: John Faith <jfaith@impinj.com>
> ---
>  package/lttng-tools/lttng-tools.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
> index 59f64cc404..0898f09549 100644
> --- a/package/lttng-tools/lttng-tools.mk
> +++ b/package/lttng-tools/lttng-tools.mk
> @@ -7,6 +7,7 @@
>  LTTNG_TOOLS_VERSION = 2.10.1
>  LTTNG_TOOLS_SITE = http://lttng.org/files/lttng-tools
>  LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
> +LTTNG_TOOLS_INSTALL_STAGING = YES
>  LTTNG_TOOLS_LICENSE = GPL-2.0+, LGPL-2.1+ (include/lttng/*, src/lib/lttng-ctl/*)
>  LTTNG_TOOLS_LICENSE_FILES = gpl-2.0.txt lgpl-2.1.txt LICENSE
>  LTTNG_TOOLS_CONF_OPTS += --disable-man-pages
> --
> 2.14.1
>
