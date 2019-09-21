From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Sep 2019 22:50:19 +0200
Subject: [Buildroot] [PATCH v6 03/25] package/kodi-vfs-rar: new package
In-Reply-To: <20190921192826.10143-4-bernd.kuhls@t-online.de>
References: <20190921192826.10143-1-bernd.kuhls@t-online.de>
 <20190921192826.10143-4-bernd.kuhls@t-online.de>
Message-ID: <6a465bee-d3f7-56c0-e138-4093512a252f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21/09/2019 21:28, Bernd Kuhls wrote:
> Internal rar support in Kodi was moved to this addon with the Kodi
> release 18.0-Leia, see upstream PR 11912.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi-vfs-rar/Config.in         |  7 +++++++
>  package/kodi-vfs-rar/kodi-vfs-rar.hash |  2 ++
>  package/kodi-vfs-rar/kodi-vfs-rar.mk   | 13 +++++++++++++
>  package/kodi/Config.in                 |  4 ++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/kodi-vfs-rar/Config.in
>  create mode 100644 package/kodi-vfs-rar/kodi-vfs-rar.hash
>  create mode 100644 package/kodi-vfs-rar/kodi-vfs-rar.mk
> 
> diff --git a/package/kodi-vfs-rar/Config.in b/package/kodi-vfs-rar/Config.in
> new file mode 100644
> index 0000000000..f855fb6c9f
> --- /dev/null
> +++ b/package/kodi-vfs-rar/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_KODI_VFS_RAR
> +	bool "kodi-vfs-rar"
> +	select BR2_PACKAGE_LIBPLATFORM
> +	help
> +	  RAR VFS addon for Kodi
> +
> +	  https://github.com/xbmc/vfs.rar
> diff --git a/package/kodi-vfs-rar/kodi-vfs-rar.hash b/package/kodi-vfs-rar/kodi-vfs-rar.hash
> new file mode 100644
> index 0000000000..b92a1f0b40
> --- /dev/null
> +++ b/package/kodi-vfs-rar/kodi-vfs-rar.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256 09a16bf0be13c7d9ed43c6608f662374cb3b8b35c05492ce1117f58270d8d005  kodi-vfs-rar-60f92ff28ee6c94211b628990696c60518bffcf6.tar.gz

 License file hash missing.

> diff --git a/package/kodi-vfs-rar/kodi-vfs-rar.mk b/package/kodi-vfs-rar/kodi-vfs-rar.mk
> new file mode 100644
> index 0000000000..ec00299d5e
> --- /dev/null
> +++ b/package/kodi-vfs-rar/kodi-vfs-rar.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# kodi-vfs-rar
> +#
> +################################################################################
> +
> +KODI_VFS_RAR_VERSION = 60f92ff28ee6c94211b628990696c60518bffcf6
> +KODI_VFS_RAR_SITE = $(call github,xbmc,vfs.rar,$(KODI_VFS_RAR_VERSION))
> +KODI_VFS_RAR_LICENSE = unrar

 The Kodi code is GPL-2.0+.

> +KODI_VFS_RAR_LICENSE_FILES = lib/UnrarXLib/license.txt

 I've added a random source file here for the GPL license.

 Applied to master with those fixes, thanks.

 Regards,
 Arnout

> +KODI_VFS_RAR_DEPENDENCIES = libplatform kodi
> +
> +$(eval $(cmake-package))
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index 626038e8c8..f62c2f4c9d 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -354,6 +354,10 @@ menu "Skins"
>  	source "package/kodi-skin-confluence/Config.in"
>  endmenu
>  
> +menu "Virtual file systems"
> +	source "package/kodi-vfs-rar/Config.in"
> +endmenu
> +
>  menu "Visualisations"
>  	source "package/kodi-visualisation-fishbmc/Config.in"
>  	source "package/kodi-visualisation-goom/Config.in"
> 
