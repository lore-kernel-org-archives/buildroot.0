From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Feb 2021 18:38:56 +0100
Subject: [Buildroot] [PATCH v1 1/2] package/irqbalance: fix sysv startup
 script (add mkdir /run/irqbalance)
In-Reply-To: <20210220163349.25244-1-ps.report@gmx.net>
References: <20210220163349.25244-1-ps.report@gmx.net>
Message-ID: <20210220173856.GQ2276@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-02-20 17:33 +0100, Peter Seiderer spake thusly:
> - add mkdir -p /run/irqbalance to sysv startup script needed to
>   create socket /run/irqbalance/irqbalance<pid>.sock
> 
> Fixes:
> 
>   - Bug 13541 [1]
> 
>   daemon.warn /usr/sbin/irqbalance: Daemon couldn't be bound to the file-based socket.
> 
> [1] https://bugs.busybox.net/show_bug.cgi?id=13541
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Series of 2 applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/irqbalance/S13irqbalance | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/irqbalance/S13irqbalance b/package/irqbalance/S13irqbalance
> index b06a3372e9..d0f6adda71 100644
> --- a/package/irqbalance/S13irqbalance
> +++ b/package/irqbalance/S13irqbalance
> @@ -7,6 +7,9 @@ EXEC="/usr/sbin/irqbalance"
>  ARGS=""
>  PID="/var/run/irqbalance.pid"
>  
> +# for irqbalance socket /run/irqbalance/irqbalance<pid>.sock
> +mkdir -p /run/irqbalance
> +
>  case "$1" in
>      start)
>  	printf "Starting irqbalance: "
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
