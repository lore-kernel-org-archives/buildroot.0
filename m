From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 4 Nov 2015 10:02:08 +0100
Subject: [Buildroot] [PATCH] package/rng-tools: systemd: support extra
	options
In-Reply-To: <1445381008-5165-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
References: <1445381008-5165-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
Message-ID: <CAGduivxQyGtK3BaXYwDwS9AGYC_x3Ax1pNGkjeMX_ov0if7_LQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Benoit, all

On Wed, Oct 21, 2015 at 12:43 AM, Beno?t Th?baudeau <
benoit.thebaudeau.dev@gmail.com> wrote:

> Add a DAEMON_ARGS configuration variable in order to make it possible to
> pass custom extra options to rngd. This environment variable must
> defined in /etc/default/rngd if needed, like with the SysV init script.
> This file does not have to be present if not needed.
>
> Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com>
> ---
>  package/rng-tools/rngd.service | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/package/rng-tools/rngd.service
> b/package/rng-tools/rngd.service
> index 3bdc4c1..c0bcffe 100644
> --- a/package/rng-tools/rngd.service
> +++ b/package/rng-tools/rngd.service
> @@ -2,8 +2,9 @@
>  Description=Hardware RNG Entropy Gatherer Daemon
>
>  [Service]
> -ExecStart=/usr/sbin/rngd -f
> +ExecStart=/usr/sbin/rngd -f $DAEMON_ARGS
>  SuccessExitStatus=66
> +EnvironmentFile=-/etc/default/rngd
>
>  [Install]
>  WantedBy=multi-user.target
>
Everything's fine by me on this patch, just a quick question, would it be
nice to have a default file with an empty DAEMON_ARGS ? Maybe that would be
easier for users to understand ? Since it's used by both init system.

Other than that
Reviewed-by "Maxime Hadjinlian <maxime.hadjinlian@gmail.com>"

--
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151104/816eec58/attachment.html>
