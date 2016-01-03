From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Jan 2016 23:07:45 +0100
Subject: [Buildroot] [PATCH 1/1] disable reboot by ctrl-alt-del
In-Reply-To: <1451858433-7932-1-git-send-email-felten@vaxnet.de>
References: <1451858433-7932-1-git-send-email-felten@vaxnet.de>
Message-ID: <20160103220745.GB3551@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lothar, All,

On 2016-01-03 23:00 +0100, lothar felten spake thusly:
> From: lf <micro1183@gmail.com>

Be sure to configure your git with your real name, so authorship matches
your SoB line, below.

> Most embedded systems do not have a keyboard.
> If a keyboard is attached afterwards (e.g. to an accessible USB host port) 
> this allows the user to reboot the system by pressing Ctrl-Alt-Del, which
> might not be desired.
>  
> Signed-off-by: lothar felten <felten@vaxnet.de>

Except for the authorship that should be a real, full name:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/busybox/inittab  | 2 +-
>  package/sysvinit/inittab | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/busybox/inittab b/package/busybox/inittab
> index 24d9199..3f49f6b 100644
> --- a/package/busybox/inittab
> +++ b/package/busybox/inittab
> @@ -27,7 +27,7 @@
>  #ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
>  
>  # Stuff to do for the 3-finger salute
> -::ctrlaltdel:/sbin/reboot
> +#::ctrlaltdel:/sbin/reboot
>  
>  # Stuff to do before rebooting
>  ::shutdown:/etc/init.d/rcK
> diff --git a/package/sysvinit/inittab b/package/sysvinit/inittab
> index fc0c9b5..27eb4a6 100644
> --- a/package/sysvinit/inittab
> +++ b/package/sysvinit/inittab
> @@ -15,7 +15,7 @@ si6::sysinit:/etc/init.d/rcS
>  # S0:1:respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
>  
>  # Stuff to do for the 3-finger salute
> -ca::ctrlaltdel:/sbin/reboot
> +#ca::ctrlaltdel:/sbin/reboot
>  
>  # Stuff to do before rebooting
>  shd0:06:wait:/etc/init.d/rcK
> -- 
> 1.9.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
