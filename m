From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 25 Nov 2020 17:25:35 +0100
Subject: [Buildroot] [PATCH 1/1] Revert "package/systemd: disable
 portabled"
In-Reply-To: <20201125152717.1984-1-fgervais@distech-controls.com>
References: <20201125152717.1984-1-fgervais@distech-controls.com>
Message-ID: <CADYdroNf18UG_dm9rWqLaW5morJm=5kz6LUZ-rMVmC--ixS8pA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mi., 25. Nov. 2020 um 16:28 Uhr schrieb Francois Gervais
<fgervais@distech-controls.com>:
>
> We depend on this feature to dynamically extend the capabilities of
> our embedded devices.
>
> Also if it makes any difference, portablectl is now in /usr/bin.
>
> This reverts commit b37fa74380557689f2309370c5bc1e770a1831eb.
>
> Signed-off-by: Francois Gervais <fgervais@distech-controls.com>
> ---
>  package/systemd/systemd.mk | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index cb12f667d6..e24c357ccf 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -33,7 +33,6 @@ SYSTEMD_CONF_OPTS += \
>         -Dman=false \
>         -Dmount-path=/usr/bin/mount \
>         -Dnss-systemd=true \
> -       -Dportabled=false \
>         -Dquotacheck-path=/usr/sbin/quotacheck \
>         -Dquotaon-path=/usr/sbin/quotaon \
>         -Drootlibdir='/usr/lib' \
> --
> 2.17.1
>

Better than blindly enabling it, please add an option for doing so.
Also, it's still in libexec as of 246 (current release) so the comment is wrong.

Norbert
