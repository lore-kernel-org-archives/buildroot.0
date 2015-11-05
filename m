From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 5 Nov 2015 11:18:16 +0100
Subject: [Buildroot] [PATCH 1/1] dcron: startup fails with setpgid:
 Operation not permitted
In-Reply-To: <1439494436-944-1-git-send-email-daleg@omniti.com>
References: <1439494436-944-1-git-send-email-daleg@omniti.com>
Message-ID: <CAGduivz65d7zBHtmu0567CTgE-W_73aTR+haz3-wWTeitXgeeg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dale, all

On Thu, Aug 13, 2015 at 9:33 PM, Dale Ghent <daleg@omniti.com> wrote:

> Signed-off-by: Dale Ghent <daleg@omniti.com>
> ---
>  package/dcron/dcron.service | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/dcron/dcron.service b/package/dcron/dcron.service
> index b9fa489..924ed72 100644
> --- a/package/dcron/dcron.service
> +++ b/package/dcron/dcron.service
> @@ -3,8 +3,8 @@ Description=Task scheduler daemon
>  After=syslog.target
>
>  [Service]
> -ExecStart=/usr/sbin/crond -f -S
> -Restart=always
> +ExecStart=/usr/sbin/crond -S
> +Type=forking
>
>  [Install]
>  WantedBy=multi-user.target
>
Maybe the commit log should mention that's only a systemd issue ?
Other than that:

Reviewed-by: "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>

> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151105/7b9c2117/attachment.html>
