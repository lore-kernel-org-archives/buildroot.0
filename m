From: Jeff Krasky <jeff.krasky@dspcg.com>
Date: Fri, 2 Dec 2011 12:30:14 -0600
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <CABkKHSbDDD8rFU5UhYpR7tCcJWNXtbUNNNbmHU2yfjt23zzgWg@mail.gmail.com>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <001c01ccb07c$85e85190$0400a8c0@dspcgrnzks9p98>
 <CAAXf6LUnHUAQk_4j2fyjE_tYum+U-i08aUKksK__tLOu0XgMeA@mail.gmail.com>
 <201112020734.00122.minimod@morethan.org>
 <001201ccb10b$22c23010$0400a8c0@dspcgrnzks9p98>
 <CAAu5YTas_VmvbHEkwOZqVZ3iD+sy4nYdmykMKZAagtAEYViYHA@mail.gmail.com>
 <001601ccb112$a16043b0$0400a8c0@dspcgrnzks9p98>
 <1322847199.55324.YahooMailNeo@web161204.mail.bf1.yahoo.com>
 <002f01ccb11c$9a835280$0400a8c0@dspcgrnzks9p98>
 <CABkKHSbDDD8rFU5UhYpR7tCcJWNXtbUNNNbmHU2yfjt23zzgWg@mail.gmail.com>
Message-ID: <003e01ccb120$6f8f16a0$0400a8c0@dspcgrnzks9p98>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> afair this message could be because of lack of dev/console and/or
dev/null.
> You must run "mknod -m 660 dev/console c 5 1" and "mknod -m
> 660dev/null c 1 3" in root partition.
>
> How to do it? I have my on usb stick, so i
> simply mount usb drive, and do some changes. If youre using yaffs2 and
> NAND memory, you can use
> 
> System configuration --> Custom script to run before creating filesystem
> images
> 
> to invoke those commands or just find unyaffs script (somewhere on the
> Internet, on google code
> afair), unyaffs your rootfs, make changes and make yaffs image one
> more time.

Ok, I ran 'make menuconfig' and went into "System configuration -> Custom
script to run before creating filesystem images" and I entered this string:

mknod -m 660 dev/console c 5 1; mknod -m 660 dev/null c 1 3

and I got this when running 'make':

echo 2011.11 > /home/user1/buildroot-2011.11/output/target/etc/br-version
"mknod -m 660 dev/console c 5 1; mknod -m 660 dev/null c 1 3"
/home/user1/buildroot-2011.11/output/target
/bin/sh: mknod -m 660 dev/console c 5 1; mknod -m 660 dev/null c 1 3: No
such file or directory
make: *** [target-finalize] Error 127
user1 at dhcppc15:~/buildroot-2011.11>


> You have output/target folder with your rootfs, so you can make changes
> there :)

How to do it to a already built .jffs2 file?  Can I just open a terminal
window on the linux PC that buildroot is on and run some commands?
