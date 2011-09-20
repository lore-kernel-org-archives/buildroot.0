From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 20 Sep 2011 11:48:20 +0200
Subject: [Buildroot] df returns nothing
In-Reply-To: <201109201114.07295.dargaud@lpsc.in2p3.fr>
References: <201109201114.07295.dargaud@lpsc.in2p3.fr>
Message-ID: <CAAXf6LW-TQKxmjs4xdLhHzimWO76E6e2NpHGZHq6-aW4mdEQnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Sep 20, 2011 at 11:14 AM, Guillaume Dargaud
<dargaud@lpsc.in2p3.fr> wrote:
> Hello all,
> it's not really a problem as my buildroot system is working fine, but df returns nothing. I'm using a cpio ramdisk
> embedded in the kernel, so that's probably the reason, still I'm curious as to why I can't get an answer:
>
> # df
> Filesystem ? ? ? ? ? ? ? ?Size ? ? ?Used Available Use% Mounted on
>
> # df /
> Filesystem ? ? ? ? ? ? ? ?Size ? ? ?Used Available Use% Mounted on
> df: /: can't find mount point
>
> # mount
> rootfs on / type rootfs (rw,relatime)
> proc on /proc type proc (rw,relatime)
> devpts on /dev/pts type devpts (rw,relatime,gid=5,mode=620)
> sysfs on /sys type sysfs (rw,relatime)
>

Just FYI, on my system, with an ext2 rootfs, I see:

# df
Filesystem                Size      Used Available Use% Mounted on
/dev/root                16.3M     14.6M    879.0K  94% /
tmpfs                   977.1M     36.0K    977.0M   0% /tmp
# mount
rootfs on / type rootfs (rw)
/dev/root on / type ext2 (rw,relatime)
proc on /proc type proc (rw,relatime)
devpts on /dev/pts type devpts (rw,relatime,gid=5,mode=620)
tmpfs on /tmp type tmpfs (rw,relatime)
sysfs on /sys type sysfs (rw,relatime)

Best regards,
Thomas
