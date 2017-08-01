From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Aug 2017 13:26:48 +0200
Subject: [Buildroot] squashfs-fuse: new package
In-Reply-To: <CAETHaKrtrPZDs7TjXdK1zrQKjC29pbPduvyspWF1_tM37c7RHw@mail.gmail.com>
References: <CAETHaKp82wP9fk=hFVp2--GBauJBoefW5VD=zVpp-7nJojJZGA@mail.gmail.com>
 <20170731204927.06eeb004@windsurf.home>
 <CAETHaKrtrPZDs7TjXdK1zrQKjC29pbPduvyspWF1_tM37c7RHw@mail.gmail.com>
Message-ID: <20170801132648.1a30d81e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm not sure what you have sent below. Is this supposed to be a new
iteration? If so:

 - It should be sent as a separate e-mail, with [PATCHv2] as the title
   prefix ;

 - It should take into account all the comments that have been made
   during the review. Many of the comments I made in the review have
   been ignored.

Best regards,

Thomas

On Tue, 1 Aug 2017 06:25:56 -0400, Dave Bender wrote:
> Added FUSE squashfs utilities
> 
> Signed-off-by: David Bender <codehero@gmail.com>
> ---
>  package/Config.in                        |  1 +
>  package/squashfs-fuse/Config.in          | 10 ++++++++++
>  package/squashfs-fuse/squashfs-fuse.hash |  2 ++
>  package/squashfs-fuse/squashfs-fuse.mk   | 14 ++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/squashfs-fuse/Config.in
>  create mode 100644 package/squashfs-fuse/squashfs-fuse.hash
>  create mode 100644 package/squashfs-fuse/squashfs-fuse.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 86d714dae..34cb75238 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -191,6 +191,7 @@ menu "Filesystem and flash utilities"
>   source "package/sunxi-tools/Config.in"
>   source "package/unionfs/Config.in"
>   source "package/xfsprogs/Config.in"
> + source "package/squashfs-fuse/Config.in"
>  endmenu
> 
>  menu "Fonts, cursors, icons, sounds and themes"
> diff --git a/package/squashfs-fuse/Config.in b/package/squashfs-fuse/Config.in
> new file mode 100644
> index 000000000..753d78883
> --- /dev/null
> +++ b/package/squashfs-fuse/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_SQUASHFS_FUSE
> + bool "squashfs (FUSE)"
> + depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
> + depends on BR2_USE_MMU # libfuse
> + depends on !BR2_STATIC_LIBS # libfuse
> + select BR2_PACKAGE_LIBFUSE
> + help
> +  A userspace squashfs implementation.
> +
> +  https://github.com/vasi/squashfuse
> diff --git a/package/squashfs-fuse/squashfs-fuse.hash
> b/package/squashfs-fuse/squashfs-fuse.hash
> new file mode 100644
> index 000000000..28b9d4175
> --- /dev/null
> +++ b/package/squashfs-fuse/squashfs-fuse.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha512 f7d62e23186c8f4ab52186ea5d0c0dc02db106ef6e1a9958a83ab87e05aca068ff94f75f26b8ee31b7d7359de3cc8c569ac5c604f87bd638c561d1cdaaa9177c
> squashfs-fuse-1f980303b89c779eabfd0a0fdd36d6a7a311bf92.tar.gz
> diff --git a/package/squashfs-fuse/squashfs-fuse.mk
> b/package/squashfs-fuse/squashfs-fuse.mk
> new file mode 100644
> index 000000000..bb3ce2305
> --- /dev/null
> +++ b/package/squashfs-fuse/squashfs-fuse.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# squashfs-fuse
> +#
> +################################################################################
> +
> +SQUASHFS_FUSE_VERSION = 1f980303b89c779eabfd0a0fdd36d6a7a311bf92
> +SQUASHFS_FUSE_SITE = $(call github,vasi,squashfuse,$(SQUASHFS_FUSE_VERSION))
> +SQUASHFS_FUSE_DEPENDENCIES = libfuse host-pkgconf
> +SQUASHFS_FUSE_LICENSE = BSD-2-Clause
> +SQUASHFS_FUSE_LICENSE_FILES = LICENSE
> +SQUASHFS_FUSE_AUTORECONF = YES
> +
> +$(eval $(autotools-package))



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
