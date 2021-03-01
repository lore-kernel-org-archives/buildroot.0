From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 1 Mar 2021 22:40:28 +0100
Subject: [Buildroot] [PATCH v1] package/util-linux: disable runuser for
 the host build
In-Reply-To: <20210227155413.15809-1-ps.report@gmx.net>
References: <20210227155413.15809-1-ps.report@gmx.net>
Message-ID: <20210301214028.GC2275@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-02-27 16:54 +0100, Peter Seiderer spake thusly:
> Fixes host build in case unsuitable libs are found on the system
> (see [1]).
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2021-February/304261.html

I would contend that this problem is a badly configured host, and if
such hosts have libraries installed that incompatible with their native
compiler, then those host should be fixed.

However, runuser really is a non-necessary tool for the Buildroot case,
so disabling it is still a good idea.

> Reported-by: GA K <guyarkam@gmail.com>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, with a commit log expanded to provide a more
fundamental reason why we disable runuser. Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/util-linux/util-linux.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index 0178c52bac..09acaca1a7 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -211,6 +211,7 @@ HOST_UTIL_LINUX_CONF_OPTS += \
>  	--disable-nsenter \
>  	--disable-pg \
>  	--disable-rfkill \
> +	--disable-runuser \
>  	--disable-schedutils \
>  	--disable-setpriv \
>  	--disable-setterm \
> -- 
> 2.30.1
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
