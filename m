From: Jeff Krasky <jeff.krasky@dspcg.com>
Date: Fri, 2 Dec 2011 12:02:48 -0600
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <1322847199.55324.YahooMailNeo@web161204.mail.bf1.yahoo.com>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98><001c01ccb07c$85e85190$0400a8c0@dspcgrnzks9p98><CAAXf6LUnHUAQk_4j2fyjE_tYum+U-i08aUKksK__tLOu0XgMeA@mail.gmail.com><201112020734.00122.minimod@morethan.org><001201ccb10b$22c23010$0400a8c0@dspcgrnzks9p98>
 <CAAu5YTas_VmvbHEkwOZqVZ3iD+sy4nYdmykMKZAagtAEYViYHA@mail.gmail.com>
 <001601ccb112$a16043b0$0400a8c0@dspcgrnzks9p98>
 <1322847199.55324.YahooMailNeo@web161204.mail.bf1.yahoo.com>
Message-ID: <002f01ccb11c$9a835280$0400a8c0@dspcgrnzks9p98>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> "Attempted to kill init" means the init process died.  Kernel must panic
because init cannot terminate.

> There's something preventing init from running, or it is dying during
execution.

> 

> Is your userland correctly have an init?  normally /sbin/init is called.
If your init is somewhere else, use

> the init= paramater to kernel append

 

How do I know where init is if I can't bring the board up and run any linux
commands?

 

>you may have a mounted jffs2 filesystem but not directly usable (think
squashfs), is it loaded to

> ramdisk?  if so, root=/dev/ram0 init=/sbin/init

 

When I successfully ran 2.6.33 built from Buildroot-2011.05, in U-boot the
setting for root was root=/dev/mtdblock1.  I am not sure what squashfs is.
How can the filesystem not be usable?

 

Thanks.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111202/62bb2304/attachment-0001.html>
