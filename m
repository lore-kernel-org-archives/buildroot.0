From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 20 Feb 2021 17:47:34 +0100
Subject: [Buildroot] [PATCH v1 2/2] package/irqbalance: fix systemd
 startup script (add RuntimeDirectory)
In-Reply-To: <20210220163349.25244-2-ps.report@gmx.net>
References: <20210220163349.25244-1-ps.report@gmx.net>
 <20210220163349.25244-2-ps.report@gmx.net>
Message-ID: <20210220174734.0c93291f@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 20 Feb 2021 17:33:49 +0100, Peter Seiderer <ps.report@gmx.net> wrote:

> - add RuntimeDirectory=irqbalance to create /run/irqbalanace needed to
>   create socket /run/irqbalance/irqbalance<pid>.sock
>
> Fixes:
>
>   - Bug 13541 [1]
>
>   /usr/sbin/irqbalance[158]: Daemon couldn't be bound to the file-based socket.
>
> [1] https://bugs.busybox.net/show_bug.cgi?id=13541
>

Reported-by: Alfredo Pons Menargues <alfredo.pons@gmail.com>

Regards,
Peter

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/irqbalance/irqbalance.service | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/irqbalance/irqbalance.service b/package/irqbalance/irqbalance.service
> index 9ba3be43bb..39574877fb 100644
> --- a/package/irqbalance/irqbalance.service
> +++ b/package/irqbalance/irqbalance.service
> @@ -3,6 +3,7 @@ Description=irqbalance daemon
>  After=syslog.target
>
>  [Service]
> +RuntimeDirectory=irqbalance
>  ExecStart=/usr/sbin/irqbalance --foreground
>
>  [Install]
