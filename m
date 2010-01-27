From: Julien Boibessot <julien.boibessot@free.fr>
Date: Wed, 27 Jan 2010 14:59:55 +0100
Subject: [Buildroot] PATCH: Add more config options to alsa, bump version
In-Reply-To: <4B603125.6070002@carallon.com>
References: <4B603125.6070002@carallon.com>
Message-ID: <4B6046DB.9000503@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Will Wagner a ?crit :
> This patch adds a lot of extra config options to alsa-lib (default
> should be the same as before options existed), with these you can
> substantially reduce the size of the alsa-lib library.
>
> It also changes alsa-utils to only depend on ncurses if you have
> alsa-mixer selected.
>
> Finally it bumps the version of alsa-lib and alsa-utils to 1.0.22
<cut>

> +ifneq ($(BR2_PACKAGE_ALSA_LIB_ALOAD),y)
> +ALSA_LIB_CONF_OPT += --disable-aload
> +endif
> +ifneq ($(BR2_PACKAGE_ALSA_LIB_MIXER),y)
> +ALSA_LIB_CONF_OPT += --disable-mizer
--disable-mixer, no ?

Regards,
Julien
