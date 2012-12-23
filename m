From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Dec 2012 22:51:10 +0100
Subject: [Buildroot] [PATCH 2/2] liblinebreak: new package
In-Reply-To: <CAOWBBJxG=-FBHe42_tm6RymLzgCTHy4vA6D5f25jvjJwuAYrmg@mail.gmail.com>
References: <CAOWBBJxG=-FBHe42_tm6RymLzgCTHy4vA6D5f25jvjJwuAYrmg@mail.gmail.com>
Message-ID: <201212232251.10490.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mikhail, All,

On Sunday 23 December 2012 Mikhail Boiko wrote:
> ---

SoB line.

[--SNIP--]
> diff --git a/package/liblinebreak/Config.in b/package/liblinebreak/Config.in
> new file mode 100644
> index 0000000..2787fe3
> --- /dev/null
> +++ b/package/liblinebreak/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_LIBLINEBREAK
> + bool "liblinebreak"
> + help
> +
> +  Liblinebreak is an implementation of the line breaking
> +  algorithm as described in Unicode 6.0.0 Standard. It
> +  breaks lines that contain Unicode characters. It is
> +  designed to be used in a generic text renderer.
> +
> +  http://vimgadgets.sourceforge.net/liblinebreak/

Ditto your other package: use leading TABs.

> diff --git a/package/liblinebreak/liblinebreak.mk b/package/liblinebreak/
> liblinebreak.mk
> new file mode 100644
> index 0000000..aaa6e33
> --- /dev/null
> +++ b/package/liblinebreak/liblinebreak.mk
> @@ -0,0 +1,14 @@
> +#############################################################
> +#
> +# liblinebreak
> +#
> +#############################################################
> +
> +LIBLINEBREAK_VERSION = 2.1
> +LIBLINEBREAK_SOURCE = liblinebreak-$(LIBLINEBREAK_VERSION).tar.gz

Not needed, that's the default.

> +LIBLINEBREAK_SITE =
> http://downloads.sourceforge.net/project/vimgadgets/liblinebreak/$(LIBLINEBREAK_VERSION)
> +LIBLINEBREAK_INSTALL_STAGING = YES
> +LIBLINEBREAK_CONF_OPT = --disable-docs

Ditto your other package: --disable-docs not needed.

> +LIBLINEBREAK_DEPENDENCIES = host-pkgconf
> +
> +$(eval $(autotools-package))

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
