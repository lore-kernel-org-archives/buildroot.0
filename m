From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 4 Nov 2015 10:52:10 +0100
Subject: [Buildroot] [PATCH v3 02/13] package/dhcp: systemd: rename
	environment file
In-Reply-To: <1445734779-7212-2-git-send-email-benoit.thebaudeau.dev@gmail.com>
References: <1445734779-7212-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <1445734779-7212-2-git-send-email-benoit.thebaudeau.dev@gmail.com>
Message-ID: <CAGduivynxFaA8G90N8B+E2pbSVWvMryWev80-r2_Z=gKzvjC5g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Benoit, all

On Sun, Oct 25, 2015 at 2:59 AM, Beno?t Th?baudeau <
benoit.thebaudeau.dev@gmail.com> wrote:

> Use the same EnvironmentFile name as the SysV init script for
> consistency. The filenames under /etc/default/ are usually just the
> package/daemon/service/feature name without any extension, so remove the
> ".conf" extension from EnvironmentFile.
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
> index 7b265cb..5989506 100644
> --- a/package/dhcp/dhcpd.service
> +++ b/package/dhcp/dhcpd.service
> @@ -7,7 +7,7 @@ Type=forking
>  PIDFile=/run/dhcpd.pid
>  ExecStart=/usr/sbin/dhcpd -q -pf /run/dhcpd.pid $INTERFACES
>  KillSignal=SIGINT
> -EnvironmentFile=/etc/default/dhcpd.conf
> +EnvironmentFile=/etc/default/dhcpd
>
Maybe this should be:
EnvironmentFile-=/etc/default/dhcpd

Notice the '-' before the '=', in case the file doesn't exists, it won't
print a warning or error the whole service.

When I build dhcp, I did not find a /etc/default folder in my target
directory, am I missing something there ?

>
>  [Install]
>  WantedBy=multi-user.target
> --
> 2.1.4
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151104/2651351d/attachment.html>
