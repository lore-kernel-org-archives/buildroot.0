From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 9 Sep 2015 16:04:54 +0100
Subject: [Buildroot] [PATCH] package/texinfo: remove package
In-Reply-To: <1441810885-58227-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1441810885-58227-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <55F04A96.6050100@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard, Thomas Petazzoni,

On 09/09/2015 04:01 PM, Vicente Olivert Riera wrote:
> Having checked that binutils doesn't need to depend on host-texinfo...
> 
>   http://patchwork.ozlabs.org/patch/515914/
> 
> ...and having fixed gdb to not build the documentation...
> 
>   http://patchwork.ozlabs.org/patch/515821/
> 
> ...we can now safely remove this host package since there aren't any
> packages depending on it.
> 
> [Note: this patch needs on http://patchwork.ozlabs.org/patch/515821/]

s/needs/depends/

Anyway, this is only a note for the maintainer who will apply this
patch, so please remove it from the commit log.

Regards,

Vincent.

> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/texinfo/texinfo.hash |    2 --
>  package/texinfo/texinfo.mk   |   17 -----------------
>  2 files changed, 0 insertions(+), 19 deletions(-)
>  delete mode 100644 package/texinfo/texinfo.hash
>  delete mode 100644 package/texinfo/texinfo.mk
> 
> diff --git a/package/texinfo/texinfo.hash b/package/texinfo/texinfo.hash
> deleted file mode 100644
> index 656c390..0000000
> --- a/package/texinfo/texinfo.hash
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# Locally calculated after checking pgp signature
> -sha256	1303e91a1c752b69a32666a407e9fbdd6e936def4b09bc7de30f416301530d68	texinfo-4.13a.tar.gz
> diff --git a/package/texinfo/texinfo.mk b/package/texinfo/texinfo.mk
> deleted file mode 100644
> index 184288b..0000000
> --- a/package/texinfo/texinfo.mk
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -################################################################################
> -#
> -# texinfo
> -#
> -################################################################################
> -
> -# We are intentionally not using the latest version 5.x, because it
> -# causes issues with the documentation building process when creating
> -# a toolchain with the Crosstool-NG backend.
> -
> -TEXINFO_VERSION = 4.13a
> -TEXINFO_SITE = $(BR2_GNU_MIRROR)/texinfo
> -TEXINFO_LICENSE = GPLv3+
> -TEXINFO_LICENSE_FILES = COPYING
> -TEXINFO_DEPENDENCIES = ncurses
> -
> -$(eval $(host-autotools-package))
> 
