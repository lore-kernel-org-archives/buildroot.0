From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 14 Sep 2015 11:50:15 +0100
Subject: [Buildroot] [PATCH 3/3] gupnp-av: new package
In-Reply-To: <1442226095-4316-4-git-send-email-rahul.bedarkar@imgtec.com>
References: <1442226095-4316-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1442226095-4316-4-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <55F6A667.4040608@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rahul Bedarkar,

On 09/14/2015 11:21 AM, Rahul Bedarkar wrote:
[snip]
> diff --git a/package/gupnp-av/gupnp-av.mk b/package/gupnp-av/gupnp-av.mk
> new file mode 100644
> index 0000000..e377b6b
> --- /dev/null
> +++ b/package/gupnp-av/gupnp-av.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# gupnp-av
> +#
> +################################################################################
> +
> +GUPNP_AV_VERSION = 0.11.6
> +GUPNP_AV_SOURCE = gupnp-av-$(GUPNP_AV_VERSION).tar.xz
> +GUPNP_AV_SITE = http://ftp.gnome.org/pub/gnome/sources/gupnp-av/0.11

same here:

GUPNP_AV_VERSION_MAJOR = 0.11
GUPNP_AV_VERSION = $(GUPNP_AV_VERSION_MAJOR).6
GUPNP_AV_SOURCE = gupnp-av-$(GUPNP_AV_VERSION).tar.xz
GUPNP_AV_SITE =
http://ftp.gnome.org/pub/gnome/sources/gupnp-av/$(GUPNP_AV_VERSION_MAJOR)

Regards,

Vincent.

> +GUPNP_AV_LICENSE = LGPLv2+
> +GUPNP_AV_LICENSE_FILES = COPYING
> +GUPNP_AV_INSTALL_STAGING = YES
> +GUPNP_AV_DEPENDENCIES = host-pkgconf libglib2 libxml2 gupnp
> +
> +$(eval $(autotools-package))
> 
