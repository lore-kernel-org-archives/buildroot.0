From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 14 Sep 2015 11:43:21 +0100
Subject: [Buildroot] [PATCH 1/3] gssdp: new package
In-Reply-To: <1442226095-4316-2-git-send-email-rahul.bedarkar@imgtec.com>
References: <1442226095-4316-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1442226095-4316-2-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <55F6A4C9.4090201@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rahul Bedarkar,

On 09/14/2015 11:21 AM, Rahul Bedarkar wrote:
[snip]
> diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
> new file mode 100644
> index 0000000..d4b1db1
> --- /dev/null
> +++ b/package/gssdp/gssdp.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# gssdp
> +#
> +################################################################################
> +
> +GSSDP_VERSION = 0.13.2
> +GSSDP_SOURCE = gssdp-$(GSSDP_VERSION).tar.xz
> +GSSDP_SITE = http://ftp.gnome.org/pub/gnome/sources/gssdp/0.13

I think this would be better:

GSSDP_VERSION_MAJOR = 0.13
GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).2
GSSDP_SOURCE = gssdp-$(GSSDP_VERSION).tar.xz
GSSDP_SITE =
http://ftp.gnome.org/pub/gnome/sources/gssdp/$(GSSDP_VERSION_MAJOR)

Regards,

Vincent.

> +GSSDP_LICENSE = LGPLv2+
> +GSSDP_LICENSE_FILES = COPYING
> +GSSDP_INSTALL_STAGING = YES
> +GSSDP_DEPENDENCIES = host-pkgconf libglib2 libsoup
> +
> +$(eval $(autotools-package))
> 
