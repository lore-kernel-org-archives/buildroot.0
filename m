From: Charles Krinke <charles.krinke@gmail.com>
Date: Mon, 21 Feb 2011 13:23:37 -0800
Subject: [Buildroot] No response after "Freeing init memory"
In-Reply-To: <AANLkTimNjQwt1HtqQLCcnsVWtSp7=3Mb2M_00EMsdOzS@mail.gmail.com>
References: <AANLkTimNjQwt1HtqQLCcnsVWtSp7=3Mb2M_00EMsdOzS@mail.gmail.com>
Message-ID: <AANLkTi=MvzvzNPOMm+3xq8Y_H72PmYC5KV7Gb2gQ5=t-@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Zdenek:

Usually when the terminal is quiet (no characters) after printing "Freeing
init memory", it means the init process and its associated /etc/inittab is
not quite setup completely.

So, in looking at this, I would look at your definitions of ttyS0, the
"getty" in /etc/inittab and maybe enable generic console support in
buildroot on ttyS0.

Charles

2011/2/21 Zden?k Materna <zdenek.materna@gmail.com>

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
> nfsroot=192.168.1.37:/home/zdenal/nfsroot/,proto=tcp ip=dhcp
> init=/linuxrc.
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
>
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
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110221/917cd3ca/attachment.html>
