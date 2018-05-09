From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 9 May 2018 17:49:30 +0300
Subject: [Buildroot] [PATCH] xfsprogs: bump to 4.16.1
In-Reply-To: <1525876323-62495-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1525876323-62495-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180509144929.gl66sxuweg7lytsg@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

On Wed, May 09, 2018 at 09:32:03AM -0500, Matt Weber wrote: 
> diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
> index dffcc28..6411d74 100644
> --- a/package/xfsprogs/xfsprogs.mk
> +++ b/package/xfsprogs/xfsprogs.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XFSPROGS_VERSION = 4.15.1
> +XFSPROGS_VERSION = 4.16.1
>  XFSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/fs/xfs/xfsprogs
>  XFSPROGS_SOURCE = xfsprogs-$(XFSPROGS_VERSION).tar.xz
>  XFSPROGS_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1 (libhandle, few headers)
> @@ -20,10 +20,6 @@ XFSPROGS_CONF_OPTS = \
>  	INSTALL_GROUP=root \
>  	--enable-static
>  
> -ifeq ($(BR2_PACKAGE_LIBUNISTRING),y)
> -XFSPROGS_DEPENDENCIES += libunistring
> -endif
> -
>  XFSPROGS_INSTALL_TARGET_OPTS = DIST_ROOT=$(TARGET_DIR) install
>  
>  $(eval $(autotools-package))

libicu should be an optional dependency instead of libunistring.

Have you tested build with libicu?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
