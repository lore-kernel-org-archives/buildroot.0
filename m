From: Gervais, Francois <FGervais@distech-controls.com>
Date: Wed, 25 Nov 2020 17:05:11 +0000
Subject: [Buildroot] [PATCH 1/1] Revert "package/systemd: disable
 portabled"
In-Reply-To: <CADYdroNf18UG_dm9rWqLaW5morJm=5kz6LUZ-rMVmC--ixS8pA@mail.gmail.com>
References: <20201125152717.1984-1-fgervais@distech-controls.com>,
 <CADYdroNf18UG_dm9rWqLaW5morJm=5kz6LUZ-rMVmC--ixS8pA@mail.gmail.com>
Message-ID: <DM6PR01MB3755A13BD450506C5E7312BEF3FA0@DM6PR01MB3755.prod.exchangelabs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm not sure, it's been stated as moved in 
https://github.com/systemd/systemd/blob/master/NEWS:

* portablectl is now officially supported and has thus moved to
   /usr/bin/.

At least since version v240 from what I can see.

Other than that, I'm not against the option to enable it but I mean,
it was blindly disabled in the first place right?


From: Norbert Lange <nolange79@gmail.com>
Sent: November 25, 2020 11:25 AM
To: Gervais, Francois <FGervais@distech-controls.com>
Cc: buildroot <buildroot@buildroot.org>; Maxime Hadjinlian <maxime.hadjinlian@gmail.com>; Yann E . MORIN <yann.morin.1998@free.fr>
Subject: Re: [PATCH 1/1] Revert "package/systemd: disable portabled" 
?
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
>? package/systemd/systemd.mk | 1 -
>? 1 file changed, 1 deletion(-)
>
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index cb12f667d6..e24c357ccf 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -33,7 +33,6 @@ SYSTEMD_CONF_OPTS += \
>???????? -Dman=false \
>???????? -Dmount-path=/usr/bin/mount \
>???????? -Dnss-systemd=true \
> -?????? -Dportabled=false \
>???????? -Dquotacheck-path=/usr/sbin/quotacheck \
>???????? -Dquotaon-path=/usr/sbin/quotaon \
>???????? -Drootlibdir='/usr/lib' \
> --
> 2.17.1
>

Better than blindly enabling it, please add an option for doing so.
Also, it's still in libexec as of 246 (current release) so the comment is wrong.

Norbert
