From: Tim Judd <tjudd2k@yahoo.com>
Date: Fri, 2 Dec 2011 10:24:38 -0800 (PST)
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <002f01ccb11c$9a835280$0400a8c0@dspcgrnzks9p98>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98><001c01ccb07c$85e85190$0400a8c0@dspcgrnzks9p98><CAAXf6LUnHUAQk_4j2fyjE_tYum+U-i08aUKksK__tLOu0XgMeA@mail.gmail.com><201112020734.00122.minimod@morethan.org><001201ccb10b$22c23010$0400a8c0@dspcgrnzks9p98>
 <CAAu5YTas_VmvbHEkwOZqVZ3iD+sy4nYdmykMKZAagtAEYViYHA@mail.gmail.com>
 <001601ccb112$a16043b0$0400a8c0@dspcgrnzks9p98>
 <1322847199.55324.YahooMailNeo@web161204.mail.bf1.yahoo.com>
 <002f01ccb11c$9a835280$0400a8c0@dspcgrnzks9p98>
Message-ID: <1322850278.66242.YahooMailNeo@web161206.mail.bf1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"usable" on the filesystem is maybe not the perfect word to use, it is more meant in terms of what is read-write and freely accessible on the root device.? A mtdblock is an embedded flash memory area who often times has a read-only compressed filesystem such as squashfs (google it).? squashfs is not directly usable like ext2 on a hard disk is.

You might have to hack 'n slash your way in (this is my limited linux knowledge.? I'm not claiming to be an expert).
use an additional append= argument: "init=/bin/sh" or "init=/bin/bash" or "init=/bin/ash" to try to get into a usable shell to see what's there.? This argument overrides the traditional init that runs so you can look in the directories trying to find where your init is supposed to be.? Remember that init itself is never supposed to terminate/end like you can close Firefox.? So if you leave the shell, linux kernel WILL panic (same error you started this thread with)

I'm not very confident mtdblock1 is supposed to be a read-write filesystem, but may have some kind of read-only squashfs kind of filesystem on it.


you're still welcome to try "root=/dev/ram0 init=/bin/ash" and related combinations trying to get a usable root filesystem and working shell.? This is where the headaches for me start.


I'm just knowledgeable enough to know basics, others here are guaranteed to be more experienced.





?
If opportunity doesn't knock, build a door.
"I can" is a way of life.
More and Bigger is not always Better.
The road to success is always uphill.
Life isn't about finding yourself, it's about creating yourself.


________________________________
 From: Jeff Krasky <jeff.krasky@dspcg.com>
To: buildroot at busybox.net 
Sent: Friday, December 2, 2011 11:02 AM
Subject: Re: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
 

 
> "Attempted
to kill init" means the init process died.? Kernel must panic because
init cannot terminate.
> There's
something preventing init from running, or it is dying during execution.
> 
> Is
your userland correctly have an init?? normally /sbin/init is
called.? If your init is somewhere else, use
> the
init= paramater to kernel append
?
How do I know
where init is if I can?t bring the board up and run any linux commands?
?
>you
may have a mounted jffs2 filesystem but not directly usable (think squashfs),
is it loaded to
> ramdisk??
if so, root=/dev/ram0 init=/sbin/init
?
When I
successfully ran 2.6.33 built from Buildroot-2011.05, in U-boot the setting for
root was root=/dev/mtdblock1. ?I am not sure what squashfs
is.? How can the filesystem not be usable?
?
Thanks.
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111202/c9e38a49/attachment.html>
