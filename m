From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 4 Sep 2020 22:15:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/systemd: disable zstd for
 host-systemd
In-Reply-To: <20200904152633.198288-1-titouan.christophe@railnova.eu>
References: <20200904152633.198288-1-titouan.christophe@railnova.eu>
Message-ID: <20200904201502.GK14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Titouan, All,

On 2020-09-04 17:26 +0200, Titouan Christophe spake thusly:
> systemd 246 added support for zstd compression of large fields in
> journal files [1]. Since zstd is only used at runtime, we don't
> need it to enable its support in host-systemd.
> 
> [1] https://github.com/systemd/systemd/blob/v246/NEWS#L323-L331
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/systemd/systemd.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index c132f36663..d72cb58693 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -700,7 +700,8 @@ HOST_SYSTEMD_CONF_OPTS = \
>  	-Dkernel-install=false \
>  	-Dsystemd-analyze=false \
>  	-Dlibcryptsetup=false \
> -	-Daudit=false
> +	-Daudit=false \
> +	-Dzstd=false
>  
>  HOST_SYSTEMD_DEPENDENCIES = \
>  	$(BR2_COREUTILS_HOST_DEPENDENCY) \
> -- 
> 2.25.3
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
