From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 4 Nov 2015 11:09:10 +0100
Subject: [Buildroot] [PATCH v3 04/13] package/dhcp: systemd: support
	extra options
In-Reply-To: <1445734779-7212-4-git-send-email-benoit.thebaudeau.dev@gmail.com>
References: <1445734779-7212-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <1445734779-7212-4-git-send-email-benoit.thebaudeau.dev@gmail.com>
Message-ID: <CAGduivyXrg+T=PhPkVKm-F+Bx6NCfyvETQEzpiihe=1nnJPOKQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 25, 2015 at 2:59 AM, Beno?t Th?baudeau <
benoit.thebaudeau.dev@gmail.com> wrote:

> Add an OPTIONS configuration variable in order to make it possible to
> pass custom extra options to dhcpd. This keeps the systemd support
> consistent with the SysV init script.
>
> Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com>
>
> ---
> Changes v2 -> v3: new patch.
> ---
>  package/dhcp/dhcpd.service | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/dhcp/dhcpd.service b/package/dhcp/dhcpd.service
> index 5989506..ad1300c 100644
> --- a/package/dhcp/dhcpd.service
> +++ b/package/dhcp/dhcpd.service
> @@ -5,7 +5,7 @@ After=network.target
>  [Service]
>  Type=forking
>  PIDFile=/run/dhcpd.pid
> -ExecStart=/usr/sbin/dhcpd -q -pf /run/dhcpd.pid $INTERFACES
> +ExecStart=/usr/sbin/dhcpd -q -pf /run/dhcpd.pid $OPTIONS $INTERFACES
>  KillSignal=SIGINT
>  EnvironmentFile=/etc/default/dhcpd
>

Reviewed-by:  "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>

>
> --
> 2.1.4
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151104/104b6aa5/attachment.html>
