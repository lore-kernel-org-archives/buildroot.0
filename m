From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 15:32:49 +0100
Subject: [Buildroot] [PATCH 6/6] adwaita-icon-theme: new package
In-Reply-To: <1414833694-4236-7-git-send-email-eric.le.bihan.dev@free.fr>
References: <1414833694-4236-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1414833694-4236-7-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20141101153249.38b0188a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Sat,  1 Nov 2014 10:21:34 +0100, Eric Le Bihan wrote:

>  menu "Graphics"
> +	source "package/adwaita-icon-theme/Config.in"

At some point it would be great to find a good place for "data" such as
icon themes or fonts. We currently have no good place, and they end up
in "Libraries" -> "Graphics" or some other not very appropriate place.

> diff --git a/package/adwaita-icon-theme/adwaita-icon-theme.mk b/package/adwaita-icon-theme/adwaita-icon-theme.mk
> new file mode 100644
> index 0000000..ef797a2
> --- /dev/null
> +++ b/package/adwaita-icon-theme/adwaita-icon-theme.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# adwaita-icon-theme
> +#
> +################################################################################
> +
> +ADWAITA_ICON_THEME_VERSION_MAJOR = 3.14
> +ADWAITA_ICON_THEME_VERSION = $(ADWAITA_ICON_THEME_VERSION_MAJOR).0
> +ADWAITA_ICON_THEME_SITE = ftp://ftp.gnome.org/pub/gnome/sources/adwaita-icon-theme/$(ADWAITA_ICON_THEME_VERSION_MAJOR)
> +ADWAITA_ICON_THEME_SOURCE = adwaita-icon-theme-$(ADWAITA_ICON_THEME_VERSION).tar.xz
> +ADWAITA_ICON_THEME_LICENSE = LGPLv3

License is LGPLv3 or CC-BY-SA 3.0.

> +ADWAITA_ICON_THEME_LICENSE_FILES = COPYING_LGPL COPYING_CCBYSA3

I've also added the COPYING file, which clearly states that the license
is LGPLv3 or CC-BY-SA.

Committed with these issues fixed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
