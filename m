From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue, 11 Mar 2014 21:23:58 +0100
Subject: [Buildroot] [PATCH v2 3/4] liblogging: new package
In-Reply-To: <1394560632-1923-3-git-send-email-clshotwe@rockwellcollins.com>
References: <1394560632-1923-1-git-send-email-clshotwe@rockwellcollins.com>
 <1394560632-1923-3-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <531F70DE.8080009@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Clayton,

> Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
>
> ---
> Changes v1 -> v2:
>    - No changes.
> ---
>   package/Config.in                |    1 +
>   package/liblogging/Config.in     |    8 ++++++++
>   package/liblogging/liblogging.mk |   20 ++++++++++++++++++++
>   3 files changed, 29 insertions(+), 0 deletions(-)
>   create mode 100644 package/liblogging/Config.in
>   create mode 100644 package/liblogging/liblogging.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 42c21d8..caaafa1 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -776,6 +776,7 @@ source "package/libffi/Config.in"
>   source "package/libglib2/Config.in"
>   source "package/libical/Config.in"
>   source "package/liblog4c-localtime/Config.in"
> +source "package/liblogging/Config.in"
>   source "package/libnspr/Config.in"
>   source "package/libpfm4/Config.in"
>   source "package/libplist/Config.in"
> diff --git a/package/liblogging/Config.in b/package/liblogging/Config.in
> new file mode 100644
> index 0000000..23c3c1a
> --- /dev/null
> +++ b/package/liblogging/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_LIBLOGGING
> +	bool "liblogging"
> +	help
> +	  Liblogging is an easy to use library for
> +	  logging. It offers an enhanced replacement
> +	  for the syslog() call, but retains its ease of use.
> +
> +	  http://www.liblogging.org/
> diff --git a/package/liblogging/liblogging.mk b/package/liblogging/liblogging.mk
> new file mode 100644
> index 0000000..6b8217a
> --- /dev/null
> +++ b/package/liblogging/liblogging.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# liblogging
> +#
> +################################################################################
> +
> +LIBLOGGING_VERSION = 1.0.2
> +LIBLOGGING_SITE = http://download.rsyslog.com/liblogging
> +LIBLOGGING_LICENSE = BSD-2c
> +LIBLOGGING_LICENSE_FILE = COPYING

LIBLOGGING_LICENSE_FILES = COPYING


Regards,
Jerzy

> +LIBLOGGING_INSTALL_STAGING = YES
> +LIBLOGGING_CONF_OPT = --enable-cached-man-pages
> +
> +ifeq ($(BR2_INIT_SYSTEMD),y)
> +LIBLOGGING_CONF_OPT += --enable-journal
> +else
> +LIBLOGGING_CONF_OPT += --disable-journal
> +endif
> +
> +$(eval $(autotools-package))
