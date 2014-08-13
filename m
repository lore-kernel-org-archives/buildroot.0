From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Aug 2014 19:37:46 +0200
Subject: [Buildroot] [PATCH 1/1] fio: (bugfix) add libaio dependency
In-Reply-To: <1407940257-5722-1-git-send-email-Matthew.Weber@rockwellcollins.com>
References: <1407940257-5722-1-git-send-email-Matthew.Weber@rockwellcollins.com>
Message-ID: <20140813193746.4c14b789@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

Could you repost with a more descriptive commit log that explains what
this patch is actually fixing?

Thanks,

Thomas

On Wed, 13 Aug 2014 09:30:57 -0500, Matt Weber wrote:
> Signed-off-by: Matt Weber <Matthew.Weber@rockwellcollins.com>
> ---
>  package/fio/Config.in | 1 +
>  package/fio/fio.mk    | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/package/fio/Config.in b/package/fio/Config.in
> index 8cbbf6c..b907fb9 100644
> --- a/package/fio/Config.in
> +++ b/package/fio/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_FIO
>  	depends on BR2_USE_MMU # fork()
>  	depends on BR2_LARGEFILE
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_LIBAIO #ioengine libaio
>  	# fio uses posix_madvise(), which is not part of any official
>  	# release of uClibc, but is part of uClibc Git, and backported
>  	# in Buildroot patch set of uClibc 0.9.33. Therefore, we
> diff --git a/package/fio/fio.mk b/package/fio/fio.mk
> index f9a690e..e0c79e8 100644
> --- a/package/fio/fio.mk
> +++ b/package/fio/fio.mk
> @@ -8,6 +8,7 @@ FIO_VERSION = fio-2.1.4
>  FIO_SITE = git://git.kernel.dk/fio.git
>  FIO_LICENSE = GPLv2 + special obligations
>  FIO_LICENSE_FILES = LICENSE
> +FIO_DEPENDENCIES = libaio
>  
>  define FIO_CONFIGURE_CMDS
>  	(cd $(@D); ./configure --cc="$(TARGET_CC)" --extra-cflags="$(TARGET_CFLAGS)")



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
