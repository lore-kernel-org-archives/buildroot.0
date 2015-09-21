From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Sep 2015 22:57:08 +0200
Subject: [Buildroot] [PATCH 1/2] busybox: inittab: don't redirect output
 to /dev/null
In-Reply-To: <1442852984-28452-2-git-send-email-luca@lucaceresoli.net>
References: <1442852984-28452-1-git-send-email-luca@lucaceresoli.net>
 <1442852984-28452-2-git-send-email-luca@lucaceresoli.net>
Message-ID: <20150921205708.GF3570@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2015-09-21 18:29 +0200, Luca Ceresoli spake thusly:
> Several inittab steps are redirected to /dev/null. This means any error or
> warning printed by these crucial commands would be hidden from the user.
> There is no evident reason to hide this output, so stop doing that.
> 
> Suggested by Thomas Petazzoni:
> http://lists.busybox.net/pipermail/buildroot/2015-September/139146.html
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/busybox/inittab | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/busybox/inittab b/package/busybox/inittab
> index b1892c1..24d9199 100644
> --- a/package/busybox/inittab
> +++ b/package/busybox/inittab
> @@ -14,12 +14,12 @@
>  # process   == program to run
>  
>  # Startup the system
> -null::sysinit:/bin/mount -t proc proc /proc
> -null::sysinit:/bin/mount -o remount,rw /
> -null::sysinit:/bin/mkdir -p /dev/pts
> -null::sysinit:/bin/mkdir -p /dev/shm
> -null::sysinit:/bin/mount -a
> -null::sysinit:/bin/hostname -F /etc/hostname
> +::sysinit:/bin/mount -t proc proc /proc
> +::sysinit:/bin/mount -o remount,rw /
> +::sysinit:/bin/mkdir -p /dev/pts
> +::sysinit:/bin/mkdir -p /dev/shm
> +::sysinit:/bin/mount -a
> +::sysinit:/bin/hostname -F /etc/hostname
>  # now run any rc scripts
>  ::sysinit:/etc/init.d/rcS
>  
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
