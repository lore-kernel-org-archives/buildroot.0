From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 20 Jun 2012 13:00:01 +0200
Subject: [Buildroot] [PATCH] sound-theme-freedesktop: new package
In-Reply-To: <1340187652-8209-1-git-send-email-spdawson@gmail.com>
References: <1340187652-8209-1-git-send-email-spdawson@gmail.com>
Message-ID: <4FE1AD31.3010600@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Simon,

spdawson at gmail.com wrote:
> From: Simon Dawson<spdawson@gmail.com>
>
> Signed-off-by: Simon Dawson<spdawson@gmail.com>
> ---
>   package/Config.in                                  |    1 +
>   package/sound-theme-freedesktop/Config.in          |    6 ++++++
>   .../sound-theme-freedesktop.mk                     |   11 +++++++++++
>   3 files changed, 18 insertions(+)
>   create mode 100644 package/sound-theme-freedesktop/Config.in
>   create mode 100644 package/sound-theme-freedesktop/sound-theme-freedesktop.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 1044e9f..c79c6a6 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -492,6 +492,7 @@ source "package/collectd/Config.in"
>   source "package/empty/Config.in"
>   source "package/mobile-broadband-provider-info/Config.in"
>   source "package/shared-mime-info/Config.in"
> +source "package/sound-theme-freedesktop/Config.in"
>   endmenu
>
>   menu "Networking applications"
> diff --git a/package/sound-theme-freedesktop/Config.in b/package/sound-theme-freedesktop/Config.in
> new file mode 100644
> index 0000000..8fd763f
> --- /dev/null
> +++ b/package/sound-theme-freedesktop/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_SOUND_THEME_FREEDESKTOP
> +	bool "sound-theme-freedesktop"
> +	help
> +	  Default theme for the XDG Sound Theme Specification.
> +
> +	  http://cgit.freedesktop.org/sound-theme-freedesktop/

I would link to a web page, rather than to a cgit which is much less
informative.

>
> diff --git a/package/sound-theme-freedesktop/sound-theme-freedesktop.mk b/package/sound-theme-freedesktop/sound-theme-freedesktop.mk
> new file mode 100644
> index 0000000..99bbb34
> --- /dev/null
> +++ b/package/sound-theme-freedesktop/sound-theme-freedesktop.mk
> @@ -0,0 +1,11 @@
> +#############################################################
> +#
> +# sound-theme-freedesktop
> +#
> +#############################################################
> +SOUND_THEME_FREEDESKTOP_VERSION = 0.7
> +SOUND_THEME_FREEDESKTOP_SITE = \
> +	http://cgit.freedesktop.org/sound-theme-freedesktop/snapshot
> +SOUND_THEME_FREEDESKTOP_AUTORECONF = YES

Why downloading via git? They have a tarball at
http://freedesktop.org/wiki/Specifications/sound-theme-spec, which would
download faster and most probably would not require autoreconf (and thus
build more quickly).

Luca
