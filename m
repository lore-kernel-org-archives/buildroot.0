From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Jan 2021 18:04:22 +0100
Subject: [Buildroot] [PATCH 1/9] package/uvw: drop cmake workaround
In-Reply-To: <20210125214817.1177142-1-fontaine.fabrice@gmail.com>
References: <20210125214817.1177142-1-fontaine.fabrice@gmail.com>
Message-ID: <20210126170422.GT2325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-01-25 22:48 +0100, Fabrice Fontaine spake thusly:
> Drop workaround for cmake < 3.10 (not needed since commit
> d4773b610a40be1d3ac7d793033abaf4eb2491ed)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Series of 9 applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/uvw/uvw.mk | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/package/uvw/uvw.mk b/package/uvw/uvw.mk
> index 39952caa11..f152d9f1cf 100644
> --- a/package/uvw/uvw.mk
> +++ b/package/uvw/uvw.mk
> @@ -13,8 +13,4 @@ UVW_DEPENDENCIES = libuv
>  UVW_LICENSE = MIT
>  UVW_LICENSE_FILES = LICENSE
>  
> -# The following CMake variable disables a TRY_RUN call in the -pthread
> -# test which is not allowed when cross-compiling (for cmake < 3.10)
> -UVW_CONF_OPTS = -DTHREADS_PTHREAD_ARG=OFF
> -
>  $(eval $(cmake-package))
> -- 
> 2.29.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
