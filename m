From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Mar 2015 16:01:35 +0100
Subject: [Buildroot] [PATCH 5/8] package/openjpeg: New package openjpeg
 1.5.2
In-Reply-To: <1427033449-20179-5-git-send-email-olivier.schonken@gmail.com>
References: <1427033449-20179-1-git-send-email-olivier.schonken@gmail.com>
 <1427033449-20179-5-git-send-email-olivier.schonken@gmail.com>
Message-ID: <550ED94F.9040905@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/03/15 15:10, Olivier Schonken wrote:
> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> ---
>  package/Config.in              |  1 +
>  package/openjpeg/Config.in     |  6 ++++++
>  package/openjpeg/openjpeg.hash |  2 ++
>  package/openjpeg/openjpeg.mk   | 17 +++++++++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/openjpeg/Config.in
>  create mode 100644 package/openjpeg/openjpeg.hash
>  create mode 100644 package/openjpeg/openjpeg.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 93fde92..e9f362d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -739,6 +739,7 @@ menu "Graphics"
>  	source "package/libvips/Config.in"
>  	source "package/opencv/Config.in"
>  	source "package/opengl/Config.in"
> +	source "package/openjpeg/Config.in"
>  	source "package/pango/Config.in"
>  	source "package/pixman/Config.in"
>  	source "package/poppler/Config.in"
> diff --git a/package/openjpeg/Config.in b/package/openjpeg/Config.in
> new file mode 100644
> index 0000000..3fa7553
> --- /dev/null
> +++ b/package/openjpeg/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_OPENJPEG
> +	bool "openjpeg"
> +	help
> +	  The OpenJPEG library is an open-source JPEG 2000 codec written in C
> +
> +          http://www.openjpeg.org
> diff --git a/package/openjpeg/openjpeg.hash b/package/openjpeg/openjpeg.hash
> new file mode 100644
> index 0000000..5ac8a00
> --- /dev/null
> +++ b/package/openjpeg/openjpeg.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +md5	c41772c30fb1c272358b3707233134a1  openjpeg-1.5.2.tar.gz

 When locally computed, use sha256.

> diff --git a/package/openjpeg/openjpeg.mk b/package/openjpeg/openjpeg.mk
> new file mode 100644
> index 0000000..8cb3c80
> --- /dev/null
> +++ b/package/openjpeg/openjpeg.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# openjpeg
> +#
> +################################################################################
> +
> +OPENJPEG_VERSION = 1.5.2
> +OPENJPEG_SITE = http://downloads.sourceforge.net/project/openjpeg
> +OPENJPEG_LICENSE = MIT
> +OPENJPEG_LICENSE_FILES = COPYING
> +OPENJPEG_AUTORECONF = YES

 Add a comment why autoreconf is necessary.

> +OPENJPEG_SOURCE = openjpeg-$(OPENJPEG_VERSION).tar.gz

 We typically put this jusb below _VERSION. But in this case it's redundant
since this is the default.

> +OPENJPEG_INSTALL_STAGING = YES
> +
> +OPENJPEG_CONF_OPTS = \

 Remove this.

 Regards,
 Arnout

> +
> +$(eval $(autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
