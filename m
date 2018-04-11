From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Apr 2018 23:20:16 +0200
Subject: [Buildroot] [PATCH v2 3/6] squashfs: add host zstd support
In-Reply-To: <20180409200429.22650-3-ps.report@gmx.net>
References: <20180409200429.22650-1-ps.report@gmx.net>
 <20180409200429.22650-3-ps.report@gmx.net>
Message-ID: <20180411212016.GF2328@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2018-04-09 22:04 +0200, Peter Seiderer spake thusly:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - split off host zstd support (suggested by Yann E. MORIN)
> ---
>  package/squashfs/squashfs.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
> index e656218f97..67025ac68a 100644
> --- a/package/squashfs/squashfs.mk
> +++ b/package/squashfs/squashfs.mk
> @@ -46,7 +46,7 @@ else
>  SQUASHFS_MAKE_ARGS += GZIP_SUPPORT=0
>  endif
>  
> -HOST_SQUASHFS_DEPENDENCIES = host-zlib host-lz4 host-lzo host-xz
> +HOST_SQUASHFS_DEPENDENCIES = host-zlib host-lz4 host-lzo host-xz host-zstd
>  
>  HOST_SQUASHFS_MAKE_ARGS = \
>  	XATTR_SUPPORT=1 \
> @@ -55,7 +55,7 @@ HOST_SQUASHFS_MAKE_ARGS = \
>  	LZ4_SUPPORT=1 \
>  	LZO_SUPPORT=1 \
>  	LZMA_XZ_SUPPORT=1 \
> -	ZSTD_SUPPORT=0
> +	ZSTD_SUPPORT=1
>  
>  define SQUASHFS_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) \
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
