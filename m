From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Feb 2013 22:52:31 +0100
Subject: [Buildroot] [PATCH] new package: gconf
In-Reply-To: <1361471945-23337-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1361471945-23337-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <201302212252.31948.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan, All,

On Thursday 21 February 2013 Stefan Fr?berg wrote:
> GConf
  ^^^
Useless line.

[--SNIP--]
> diff --git a/package/gconf/Config.in b/package/gconf/Config.in
> new file mode 100644
> index 0000000..4da199a
> --- /dev/null
> +++ b/package/gconf/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_GCONF
> +	bool "gconf"
> +	select BR2_PACKAGE_INTLTOOL

We do never select intltool, since it is a host-only package.

I'm not versed enough in these i18n and l10n thingies, so I'll refer to
our esteemed maintainer as to what the proper thing to do is.

Peter?

> +	select BR2_PACKAGE_DBUS_GLIB

Inherit dbus-glib dependencies (see my reply to console-kit).

[--SNIP--]
> diff --git a/package/gconf/gconf.mk b/package/gconf/gconf.mk
> new file mode 100644
> index 0000000..73b112f
> --- /dev/null
> +++ b/package/gconf/gconf.mk
> @@ -0,0 +1,25 @@
> +#############################################################
> +#
> +# GConf
> +#
> +#############################################################
> +
> +GCONF_MAJOR_VERSION = 3.2
> +GCONF_MINOR_VERSION = 0
> +GCONF_VERSION = $(GCONF_MAJOR_VERSION).$(GCONF_MINOR_VERSION)
> +GCONF_SOURCE = GConf-$(GCONF_VERSION).tar.xz
> +GCONF_SITE = http://ftp.gnome.org/pub/gnome/sources/GConf/$(GCONF_MAJOR_VERSION)
> +GCONF_DEPENDENCIES = dbus-glib intltool libxml2

No intltool here either.

Regards,
Yann E. MORIN, only three reviews left. :-]

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
