From: Tim Judd <tjudd2k@yahoo.com>
Date: Fri, 2 Dec 2011 09:33:19 -0800 (PST)
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <001601ccb112$a16043b0$0400a8c0@dspcgrnzks9p98>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98><001c01ccb07c$85e85190$0400a8c0@dspcgrnzks9p98><CAAXf6LUnHUAQk_4j2fyjE_tYum+U-i08aUKksK__tLOu0XgMeA@mail.gmail.com><201112020734.00122.minimod@morethan.org><001201ccb10b$22c23010$0400a8c0@dspcgrnzks9p98>
 <CAAu5YTas_VmvbHEkwOZqVZ3iD+sy4nYdmykMKZAagtAEYViYHA@mail.gmail.com>
 <001601ccb112$a16043b0$0400a8c0@dspcgrnzks9p98>
Message-ID: <1322847199.55324.YahooMailNeo@web161204.mail.bf1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Attempted to kill init" means the init process died.? Kernel must panic because init cannot terminate.
There's something preventing init from running, or it is dying during execution.

Is your userland correctly have an init?? normally /sbin/init is called.? If your init is somewhere else, use the init= paramater to kernel append

you may have a mounted jffs2 filesystem but not directly usable (think squashfs), is it loaded to ramdisk?? if so, root=/dev/ram0 init=/sbin/init

I'm trying to rework an OEM userland and have come up on many attempts to kill init.? It sucks for diagnostics.




?
If opportunity doesn't knock, build a door.
"I can" is a way of life.
More and Bigger is not always Better.
The road to success is always uphill.
Life isn't about finding yourself, it's about creating yourself.


________________________________
 From: Jeff Krasky <jeff.krasky@dspcg.com>
To: buildroot at busybox.net 
Sent: Friday, December 2, 2011 9:51 AM
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
 

 
I?m giving things a try with 2011.11
and when booting the board I see this:
?
VFS: Mounted root (jffs2 filesystem) on
device 31:1.
Freeing init memory: 124K
Kernel panic - not syncing: Attempted to
kill init!
?
If anyone has a hint it would be
appreciated.? I think I?ve done the steps correctly, so if I can just get
it to boot?.
?
?
Thanks.
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111202/329157bd/attachment.html>
