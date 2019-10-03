From: Carlos Santos <unixmania@gmail.com>
Date: Thu, 3 Oct 2019 15:16:19 -0300
Subject: [Buildroot] [PATCH 1/1] package/rpcbind: fix rpcbind path
In-Reply-To: <20191003144504.47060-1-james.hilliard1@gmail.com>
References: <20191003144504.47060-1-james.hilliard1@gmail.com>
Message-ID: <CAJ4jsad14ArBEB4SEpi2VOZ17mpVEDgsLAAZ3jK1KY97+QGrew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 3, 2019 at 11:45 AM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> Per upstream commit 9afccfcd5ab350d6bc72622f3d1ccfb9e54652b0
> https://git.linux-nfs.org/?p=steved/rpcbind.git;a=commit;h=9afccfcd5ab350d6bc72622f3d1ccfb9e54652b0
>
> The rpcbind binary was moved from bin to sbin.
>
> As such we must update the path in our service/init files.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/rpcbind/S30rpcbind      | 2 +-
>  package/rpcbind/rpcbind.service | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/rpcbind/S30rpcbind b/package/rpcbind/S30rpcbind
> index 532d3f8866..b224322e1f 100644
> --- a/package/rpcbind/S30rpcbind
> +++ b/package/rpcbind/S30rpcbind
> @@ -6,7 +6,7 @@
>  start() {
>         printf "Starting rpcbind: "
>         umask 077
> -       start-stop-daemon -S -q -p /var/run/rpcbind.pid --exec /usr/bin/rpcbind
> +       start-stop-daemon -S -q -p /var/run/rpcbind.pid --exec /usr/sbin/rpcbind
>         echo "OK"
>  }
>  stop() {
> diff --git a/package/rpcbind/rpcbind.service b/package/rpcbind/rpcbind.service
> index b7a32a19d0..e41931df4a 100644
> --- a/package/rpcbind/rpcbind.service
> +++ b/package/rpcbind/rpcbind.service
> @@ -4,7 +4,7 @@ Requires=rpcbind.socket
>
>  [Service]
>  Type=forking
> -ExecStart=/usr/bin/rpcbind
> +ExecStart=/usr/sbin/rpcbind
>
>  [Install]
>  Also=rpcbind.socket
> --
> 2.20.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Tested-by: Carlos Santos <unixmania@gmail.com>
