From: Heiko Zuerker <heiko@zuerker.org>
Date: Sun, 5 Dec 2010 09:07:19 -0600
Subject: [Buildroot] [PATCH] add zisofs-tools to support compressed
	iso	images
In-Reply-To: <53a3d1a63baa70d2c39832718ebed3bc8ffcbe3f.1291561405.git.smiley73@users.sourceforge.net>
References: <53a3d1a63baa70d2c39832718ebed3bc8ffcbe3f.1291561405.git.smiley73@users.sourceforge.net>
Message-ID: <002901cb948e$1c73d050$555b70f0$@zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Oops.
I was sitting in the packages directory and accidentally also sent too much.
Please use only the latest one I sent (Sun 12/5/2010 9:06 AM CST).

Sorry for that!

-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org


> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of heiko at zuerker.org
> Sent: Sunday, December 05, 2010 9:04 AM
> To: buildroot at busybox.net
> Subject: [Buildroot] [PATCH] add zisofs-tools to support compressed iso
> images
> 
> From: Heiko Zuerker <smiley73@users.sourceforge.net>
> 
> 
> Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
> ---
>  package/zisofs-tools/Config.in       |   11 +++++++++++
>  package/zisofs-tools/zisofs-tools.mk |   17 +++++++++++++++++
>  2 files changed, 28 insertions(+), 0 deletions(-)  create mode 100644
> package/zisofs-tools/Config.in  create mode 100644 package/zisofs-
> tools/zisofs-tools.mk
> 
> diff --git a/package/zisofs-tools/Config.in
b/package/zisofs-tools/Config.in
> new file mode 100644 index 0000000..ed88646
> --- /dev/null
> +++ b/package/zisofs-tools/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_ZISOFSTOOLS
> +	bool "zisofstools"
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  The zisofs filesystem is an extension to the ISO9660 filesystem
that
> +	  allows files, on a file-by-file basis, to be stored compressed and
> +	  decompressed in real time. The zisofs filesystem is supported by
> recent
> +	  versions of Linux (2.4.14 or later). Legacy systems can still read
> +	  uncompressed files. zisofs-tools contains the tools necessary to
> create
> +	  such a compressed ISO9660 filesystem and to read compressed files
> on a
> +	  legacy system.
> diff --git a/package/zisofs-tools/zisofs-tools.mk b/package/zisofs-
> tools/zisofs-tools.mk
> new file mode 100644
> index 0000000..e81b31c
> --- /dev/null
> +++ b/package/zisofs-tools/zisofs-tools.mk
> @@ -0,0 +1,17 @@
> +#########################################################
> ####
> +#
> +# zisofs-tools
> +#
> +#########################################################
> ####
> +ZISOFS_TOOLS_VERSION = 1.0.8
> +ZISOFS_TOOLS_SOURCE = zisofs-tools-$(ZISOFS_TOOLS_VERSION).tar.bz2
> +ZISOFS_TOOLS_SITE = http://www.kernel.org/pub/linux/utils/fs/zisofs
> +
> +ZISOFS_TOOLS_INSTALL_TARGET_OPT = INSTALLROOT=$(TARGET_DIR)
> +ZISOFS_TOOLS_INSTALL_HOST_OPT = INSTALLROOT=$(HOST_DIR)
> +
> +ZISOFS_TOOLS_DEPENDENCIES=zlib
> +HOST_ZISOFS_TOOLS_DEPENDENCIES=host-zlib
> +
> +$(eval $(call AUTOTARGETS,package,zisofs-tools))
> +$(eval $(call AUTOTARGETS,package,zisofs-tools,host))
> --
> 1.7.3.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
