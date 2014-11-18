From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Nov 2014 20:37:00 +0100
Subject: [Buildroot] [PATCH 2/9] debianutils: new package
In-Reply-To: <1416330117-4458-3-git-send-email-gustavo@zacarias.com.ar>
References: <1416330117-4458-1-git-send-email-gustavo@zacarias.com.ar>
 <1416330117-4458-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <546B9FDC.4070207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/11/14 18:01, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

 You didn't carry my

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

but anyway here's an

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  package/Config.in                    |  1 +
>  package/debianutils/Config.in        |  7 +++++++
>  package/debianutils/debianutils.hash |  2 ++
>  package/debianutils/debianutils.mk   | 14 ++++++++++++++
>  4 files changed, 24 insertions(+)
>  create mode 100644 package/debianutils/Config.in
>  create mode 100644 package/debianutils/debianutils.hash
>  create mode 100644 package/debianutils/debianutils.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 0dbb788..278134d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1199,6 +1199,7 @@ endif
>  	source "package/cpuload/Config.in"
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	source "package/dcron/Config.in"
> +	source "package/debianutils/Config.in"
>  endif
>  	source "package/dsp-tools/Config.in"
>  	source "package/ftop/Config.in"
> diff --git a/package/debianutils/Config.in b/package/debianutils/Config.in
> new file mode 100644
> index 0000000..f865868
> --- /dev/null
> +++ b/package/debianutils/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_DEBIANUTILS
> +	bool "debianutils"
> +	depends on BR2_USE_MMU # fork()
> +	help
> +	  Miscellaneous utilities specific to Debian.
> +
> +	  https://tracker.debian.org/pkg/debianutils
> diff --git a/package/debianutils/debianutils.hash b/package/debianutils/debianutils.hash
> new file mode 100644
> index 0000000..089dd42
> --- /dev/null
> +++ b/package/debianutils/debianutils.hash
> @@ -0,0 +1,2 @@
> +# From http://ftp.de.debian.org/debian/pool/main/d/debianutils/debianutils_4.4.dsc
> +sha256	190850cdd6b5302e0a1ba1aaed1bc7074d67d3bd8d04c613f242f7145afa53a6	debianutils_4.4.tar.gz
> diff --git a/package/debianutils/debianutils.mk b/package/debianutils/debianutils.mk
> new file mode 100644
> index 0000000..43d7cf3
> --- /dev/null
> +++ b/package/debianutils/debianutils.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# debianutils
> +#
> +################################################################################
> +
> +DEBIANUTILS_VERSION = 4.4
> +DEBIANUTILS_SOURCE = debianutils_$(DEBIANUTILS_VERSION).tar.gz
> +DEBIANUTILS_SITE = http://snapshot.debian.org/archive/debian/20130728T034252Z/pool/main/d/debianutils
> +DEBIANUTILS_CONF_OPTS = --exec-prefix=/
> +DEBIANUTILS_LICENSE = GPLv2+, SMAIL (savelog)
> +DEBIANUTILS_LICENSE_FILES = debian/copyright
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
