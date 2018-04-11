From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Apr 2018 23:27:54 +0200
Subject: [Buildroot] [PATCH v2 6/6] squashfs: add zstd support
In-Reply-To: <20180409200429.22650-6-ps.report@gmx.net>
References: <20180409200429.22650-1-ps.report@gmx.net>
 <20180409200429.22650-6-ps.report@gmx.net>
Message-ID: <20180411212754.GH2328@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2018-04-09 22:04 +0200, Peter Seiderer spake thusly:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[--SNIP--]
> diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
> index 67025ac68a..bec867d676 100644
> --- a/package/squashfs/squashfs.mk
> +++ b/package/squashfs/squashfs.mk
> @@ -9,7 +9,7 @@ SQUASHFS_SITE = https://git.kernel.org/pub/scm/fs/squashfs/squashfs-tools.git
>  SQUASHFS_SITE_METHOD = git
>  SQUASHFS_LICENSE = GPL-2.0+
>  SQUASHFS_LICENSE_FILES = COPYING
> -SQUASHFS_MAKE_ARGS = XATTR_SUPPORT=1 ZSTD_SUPPORT=0
> +SQUASHFS_MAKE_ARGS = XATTR_SUPPORT=1
>  
>  ifeq ($(BR2_PACKAGE_SQUASHFS_LZ4),y)
>  SQUASHFS_DEPENDENCIES += lz4
> @@ -46,6 +46,13 @@ else
>  SQUASHFS_MAKE_ARGS += GZIP_SUPPORT=0
>  endif
>  
> +ifeq ($(BR2_PACKAGE_SQUASHFS_ZSTD),y)
> +SQUASHFS_DEPENDENCIES += zstd
> +SQUASHFS_MAKE_ARGS += ZSTD_SUPPORT=1 COMP_DEFAULT=zstd
> +else
> +SQUASHFS_MAKE_ARGS += ZSTD_SUPPORT=0
> +endif

Please, keep the gzip case last, so that it stays the default. Add the
zstd case first.

Regards,
Yann E. MORIN.

>  HOST_SQUASHFS_DEPENDENCIES = host-zlib host-lz4 host-lzo host-xz host-zstd
>  
>  HOST_SQUASHFS_MAKE_ARGS = \
> -- 
> 2.16.3
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
