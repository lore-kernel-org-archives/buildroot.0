From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 20 Feb 2021 17:47:14 +0100
Subject: [Buildroot] [PATCH v1 1/2] package/irqbalance: fix sysv startup
 script (add mkdir /run/irqbalance)
In-Reply-To: <20210220163349.25244-1-ps.report@gmx.net>
References: <20210220163349.25244-1-ps.report@gmx.net>
Message-ID: <20210220174714.2f08e952@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 20 Feb 2021 17:33:48 +0100, Peter Seiderer <ps.report@gmx.net> wrote:

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

Reported-by: Alfredo Pons Menargues <alfredo.pons@gmail.com>

Regards,
Peter

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
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
