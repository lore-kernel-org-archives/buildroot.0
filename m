From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Apr 2014 11:41:05 +0200
Subject: [Buildroot] [PATCH 2/2] liblogging: enable systemd
 compatibility libs
In-Reply-To: <1397467537-22766-3-git-send-email-eric.le.bihan.dev@free.fr>
References: <1397467537-22766-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1397467537-22766-3-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20140414094105.GB3199@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, All,

On 2014-04-14 11:25 +0200, Eric Le Bihan spake thusly:
> If systemd is chosen as init system, liblogging will enable the
> installation of compatibility libraries in systemd.
> 
> When liblogging will be updated to depend on libsystemd.so, this
> selection will have to be removed.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/liblogging/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/liblogging/Config.in b/package/liblogging/Config.in
> index 23c3c1a..12ee950 100644
> --- a/package/liblogging/Config.in
> +++ b/package/liblogging/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LIBLOGGING
>  	bool "liblogging"
> +	select BR2_PACKAGE_SYSTEMD_COMPAT if BR2_INIT_SYSTEMD
>  	help
>  	  Liblogging is an easy to use library for
>  	  logging. It offers an enhanced replacement
> -- 
> 1.9.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
