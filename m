From: Belisko Marek <marek.belisko@gmail.com>
Date: Mon, 21 Feb 2011 21:57:36 +0100
Subject: [Buildroot] No response after "Freeing init memory"
In-Reply-To: <AANLkTimNjQwt1HtqQLCcnsVWtSp7=3Mb2M_00EMsdOzS@mail.gmail.com>
References: <AANLkTimNjQwt1HtqQLCcnsVWtSp7=3Mb2M_00EMsdOzS@mail.gmail.com>
Message-ID: <AANLkTikh9tw-PuERGodGqC+aVS0dfkiyR11RGghcx=E2@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2011/2/21 Zden?k Materna <zdenek.materna@gmail.com>:
> Hello,
>
> I have problem with init. Kernel boots ok, but after message "Freeing init
> memory: 120K" there is no response (*), but system seems to be up (it
> responds to ping). I tried to change init=/linuxrc to init=/hello which is
> statically compiled hello world and after that I got kernel panic (**). I
> double checked all configuration, but I couldn't find nothing weird. I have
> Generic serial port configured and console is also configured in inittab.
> All is compiled with same toolchain with EABI. Where might be problem?
> Thanks for any advice.
>
> My kernel command line: mem=64M console=ttyS0,115200 root=/dev/nfs rw
> nfsroot=192.168.1.37:/home/zdenal/nfsroot/,proto=tcp ip=dhcp init=/linuxrc.
Try to add to bootargs also: user_debug=31 to see why it hangs (wrong
mcu selection ....)
>
> Buildroot from git, kernel 2.6.33.7, uClibc 0.9.31, Busybox 1.18.
>
> * with init=/linuxrc
>
> VFS: Mounted root (nfs filesystem) on device 0:13.
>
> Freeing init memory: 120K
>
> eth0: link up (100/Full)
>
> ** With init=/hello
>
> VFS: Mounted root (nfs filesystem) on device 0:13.
>
> Freeing init memory: 120K
>
> Kernel panic - not syncing: Attempted to kill init!
>
> [<c002c934>] (unwi
>
> nd_backtrace+0x0/0xd0) from [<c0244c04>] (panic+0x44/0x120)
>
> [<c0244c04>] (panic+0x44/0x120) from [<c003e840>] (do_exit+0x68/0x5c8)
>
> [<c003e840>] (do_exit+0x68/0x5c8) from [<c003f080>]
> (do_group_exit+0x90/0xc4)
>
> [<c003f080>] (do_group_exit+0x90/0xc4) from [<c0048c54>]
> (get_signal_to_deliver+0x30c/0x344)
>
> [<c0048c54>] (get_signal_to_deliver+0x30c/0x344) from [<c00296ac>]
> (do_signal+0x78/0x5f0)
>
> [<c00296ac>] (do_signal+0x78/0x5f0) from [<c002a110>]
> (do_notify_resume+0x18/0x4c)
>
> [<c002a110>] (do_notify_resume+0x18/0x4c) from [<c0026f68>]
> (work_pending+0x1c/0x20)
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

thanks,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
icq: 290551086
web: http://open-nandra.com
