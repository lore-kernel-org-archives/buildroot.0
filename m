From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Sep 2015 22:59:16 +0200
Subject: [Buildroot] [PATCH 2/2] skeleton: fix absence of /dev/shm on
 static, read-only systems
In-Reply-To: <1442852984-28452-3-git-send-email-luca@lucaceresoli.net>
References: <1442852984-28452-1-git-send-email-luca@lucaceresoli.net>
 <1442852984-28452-3-git-send-email-luca@lucaceresoli.net>
Message-ID: <20150921205916.GG3570@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2015-09-21 18:29 +0200, Luca Ceresoli spake thusly:
> /dev/shm is needed for systems using shared memory. On init-based systems
> this directory is usually created in the inittab along with /dev/pts, by
> the lines:
> 
> package/busybox/inittab:
>   ::sysinit:/bin/mkdir -p /dev/pts
>   ::sysinit:/bin/mkdir -p /dev/shm
> 
> package/sysvinit/inittab:
>   si2::sysinit:/bin/mkdir -p /dev/pts
>   si3::sysinit:/bin/mkdir -p /dev/shm
> 
> However this is broken when static /dev management is selected and the root
> filesystem is read-only, showing during boot the error:
> 
>   mkdir: can't create directory '/dev/shm': Read-only file system
> 
> Fix by creating the empth /dev/shm directory, just like /dev/pts.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  system/skeleton/dev/shm/.empty | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  create mode 100644 system/skeleton/dev/shm/.empty
> 
> diff --git a/system/skeleton/dev/shm/.empty b/system/skeleton/dev/shm/.empty
> new file mode 100644
> index 0000000..e69de29
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
