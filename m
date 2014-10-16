From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Oct 2014 10:41:45 +0200
Subject: [Buildroot] [PATCH 1/4] libshout: new package
In-Reply-To: <1413408231-31696-1-git-send-email-jkrause@posteo.de>
References: <1413408231-31696-1-git-send-email-jkrause@posteo.de>
Message-ID: <20141016104145.603ff284@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Wed, 15 Oct 2014 23:23:48 +0200, J?rg Krause wrote:

> diff --git a/package/libshout/Config.in b/package/libshout/Config.in
> new file mode 100644
> index 0000000..36c8531
> --- /dev/null
> +++ b/package/libshout/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_LIBSHOUT
> +  bool "libshout"
> +  select BR2_PACKAGE_LIBOGG
> +  select BR2_PACKAGE_LIBVORBIS
> +  help
> +    Libshout is a library for communicating with and sending data to an
> +    icecast server.  It handles the socket connection, the timing of the
> +    data, and prevents bad data from getting to the icecast server.
> +
> +    http://icecast.org/download/

Indentation is wrong: one tab for everything, except the help text that
should be indented with one tab + two spaces.

> diff --git a/package/libshout/libshout.mk b/package/libshout/libshout.mk
> new file mode 100644
> index 0000000..9d7f39c
> --- /dev/null
> +++ b/package/libshout/libshout.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# libshout
> +#
> +################################################################################
> +
> +LIBSHOUT_VERSION = 2.3.1
> +LIBSHOUT_SITE = http://downloads.xiph.org/releases/libshout
> +LIBSHOUT_LICENSE = LGPLv2

License is LGPLv2+.

Other than that, looks good, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
