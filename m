From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Jun 2021 22:17:44 +0200
Subject: [Buildroot] [PATCH 3/5] package/nginx-naxsi: bump version to 1.3
In-Reply-To: <20210628161610.3197763-4-aduskett@gmail.com>
References: <20210628161610.3197763-1-aduskett@gmail.com>
 <20210628161610.3197763-4-aduskett@gmail.com>
Message-ID: <20210629201744.GQ2829@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2021-06-28 09:16 -0700, Adam Duskett spake thusly:
> Other changes:
>   - Change license to GPL-3.0
>   - Change license file to LICENSE
>   - Update license hash in nginx-naxsi.hash
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/nginx-naxsi/nginx-naxsi.hash | 4 ++--
>  package/nginx-naxsi/nginx-naxsi.mk   | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/nginx-naxsi/nginx-naxsi.hash b/package/nginx-naxsi/nginx-naxsi.hash
> index 1f289c56cd..bd3fcd1ae9 100644
> --- a/package/nginx-naxsi/nginx-naxsi.hash
> +++ b/package/nginx-naxsi/nginx-naxsi.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256	0a66dcadd32432460fab180be9f2efe24e911e3798917b2787ee710e02901eb4	nginx-naxsi-0.56.tar.gz
> -sha256	046812ddc8f250f85b5d6e04218c185849c618b309271ef9d8b01e92c6f7a6ac	naxsi_src/naxsi_json.c
> +sha256  439c8677372d2597b4360bbcc10bc86490de1fc75695b193ad5df154a214d628  nginx-naxsi-1.3.tar.gz
> +sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
> diff --git a/package/nginx-naxsi/nginx-naxsi.mk b/package/nginx-naxsi/nginx-naxsi.mk
> index 7cfa94a5d4..3de1f684f9 100644
> --- a/package/nginx-naxsi/nginx-naxsi.mk
> +++ b/package/nginx-naxsi/nginx-naxsi.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -NGINX_NAXSI_VERSION = 0.56
> +NGINX_NAXSI_VERSION = 1.3
>  NGINX_NAXSI_SITE = $(call github,nbs-system,naxsi,$(NGINX_NAXSI_VERSION))
> -NGINX_NAXSI_LICENSE = GPL-2.0+ with OpenSSL exception
> -NGINX_NAXSI_LICENSE_FILES = naxsi_src/naxsi_json.c
> +NGINX_NAXSI_LICENSE = GPL-3.0 with OpenSSL exception

Where did you see the OpennSSL exception?

There is also part of bundled code that is BSD-3c, in
naxsi_src/ext/libinjection

> +NGINX_NAXSI_LICENSE_FILES = LICENSE

... and so we'd need naxsi_src/ext/libinjection/COPYING axs well.

Also, from README:

    [Naxsi] depends on libpcre for its regexp support

So maybe a dependency on libpcre (or libpcre2?) is missing?

Regards,
Yann E. MORIN.

>  $(eval $(generic-package))
> -- 
> 2.31.1
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
