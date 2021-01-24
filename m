From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2021 17:05:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/sysklogd: install syslogd to
 /sbin and logger to /usr/bin
In-Reply-To: <20210124153409.4041717-1-troglobit@gmail.com>
References: <20210124153409.4041717-1-troglobit@gmail.com>
Message-ID: <20210124160549.GD2325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joachim, All,

On 2021-01-24 16:34 +0100, Joachim Wiberg spake thusly:
> Replace --exec-prefix, which applies to both sbin and bin, with the more
> granular --bindir for logger and --sbindir for syslogd.  This because
> BusyBox installs its syslgod in /sbin and its logger in /usr/bin.
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sysklogd/sysklogd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
> index 18d30400e1..de5ae17227 100644
> --- a/package/sysklogd/sysklogd.mk
> +++ b/package/sysklogd/sysklogd.mk
> @@ -10,7 +10,7 @@ SYSKLOGD_LICENSE = BSD-3-Clause
>  SYSKLOGD_LICENSE_FILES = LICENSE
>  SYSKLOGD_CPE_ID_VALID = YES
>  SYSKLOGD_CONF_OPTS = \
> -	--exec-prefix=/ \
> +	--bindir=/usr/bin --sbindir=/sbin \
>  	--with-suspend-time=$(BR2_PACKAGE_SYSKLOGD_REMOTE_DELAY)
>  
>  # Disable/Enable utilities
> -- 
> 2.25.1
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
