From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 30 Jan 2012 23:43:25 +0100
Subject: [Buildroot] [PATCH] New package: libical
In-Reply-To: <1327676345-8958-1-git-send-email-yegorslists@googlemail.com>
References: <1327676345-8958-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <201201302343.26186.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 27 January 2012 15:59:05 yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

[snip]
> diff --git a/package/libical/Config.in b/package/libical/Config.in
> new file mode 100644
> index 0000000..12abdb2
> --- /dev/null
> +++ b/package/libical/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_LIBICAL
> +	bool "libical"
> +	depends on BR2_USE_WCHAR
> +	help
> +	  libical is an Open Source (MPL/LGPL) implementation of the IETF's 
> +	  iCalendar Calendaring and Scheduling protocols.
> +
> +	  http://www.citadel.org/doku.php/documentation:featured_projects:libical
> +
> +comment "libical requires a toolchain with WCHAR support"
> +	depends on !(BR2_USE_WCHAR)
 I think the brackets are redundant here.

> diff --git a/package/libical/libical.mk b/package/libical/libical.mk
> new file mode 100644
> index 0000000..63311eb
> --- /dev/null
> +++ b/package/libical/libical.mk
> @@ -0,0 +1,12 @@
> +#############################################################
> +#
> +# libical
> +#
> +#############################################################
> +
> +LIBICAL_VERSION = 0.48
> +LIBICAL_SITE = http://heanet.dl.sourceforge.net/project/freeassociation/libical/libical-$(LIBICAL_VERSION)
 Please use $(BR2_SOURCEFORGE_MIRROR)

> +LIBICAL_INSTALL_STAGING = YES
> +
> +$(eval $(call AUTOTARGETS))
> +
> 

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
