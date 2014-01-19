From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jan 2014 16:32:41 +0100
Subject: [Buildroot] [PATCH v2 07/12] libshairplay: new package
In-Reply-To: <1389831355-19983-8-git-send-email-maxime.hadjinlian@gmail.com>
References: <1389831355-19983-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1389831355-19983-8-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20140119153241.GC3387@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2014-01-16 01:15 +0100, Maxime Hadjinlian spake thusly:
> libshairplay is a client library that emulates an airplay server
[--SNIP--]
> diff --git a/package/libshairplay/Config.in b/package/libshairplay/Config.in
> new file mode 100644
> index 0000000..dd94ef2
> --- /dev/null
> +++ b/package/libshairplay/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_LIBSHAIRPLAY
> +  bool "libshairplay"
> +  select BR2_PACKAGE_OPENSSL
> +  depends on BR2_INET_IPV6
> +  help
> +    libshairplay is a client library that emulates an airplay
> +    server
> +
> +    https://github.com/juhovh/shairplay
> +
> +comment "libshairplay needs a toolchain w/ IPv6"
> +	depends on !BR2_INET_IPV6
> diff --git a/package/libshairplay/libshairplay.mk b/package/libshairplay/libshairplay.mk
> new file mode 100644
> index 0000000..3488c24
> --- /dev/null
> +++ b/package/libshairplay/libshairplay.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# libshairplay
> +#
> +################################################################################
> +
> +LIBSHAIRPLAY_VERSION = 139d5ef55564514c31f02dd82cef91236c9ff523
> +LIBSHAIRPLAY_SITE = $(call github,juhovh,shairplay,$(LIBSHAIRPLAY_VERSION))
> +LIBSHAIRPLAY_INSTALL_STAGING = YES
> +LIBSHAIRPLAY_INSTALL_TARGET = YES
> +LIBSHAIRPLAY_AUTORECONF = YES
> +LIBSHAIRPORT_LICENSE = MIT

Licensing is a bit more complicated, as explained in the LICENSE file:

    ---8<---
    Following licenses apply:

    src/lib/alac/* - MIT License
    src/lib/crypto/* - New BSD License
    src/lib/http_parser.* - MIT License
    src/lib/* - LGPLv2.1+ License
    src/bindings/* - MIT License
    src/* - MIT License
    AirTV-Qt/* - LGPLv2.1+ License

    Also the following files are used, although not necessary:

    AirTV-Qt/qtsingleapplication/src/* - New BSD License
    ---8<---

So I'd say:
    LIBSHAIRPLAY_LICENSE = MIT, BSD-3c, LGPLv2.1+
    LIBSHAIRPLAY_LICENSE_FILES = LICENSE

You also forgot:
    LIBSHAIRPLAY_DEPENDENCIES = openssl


-,
Yann E. MORIN. 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
