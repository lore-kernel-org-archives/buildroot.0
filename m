From: Tim Judd <tjudd2k@yahoo.com>
Date: Fri, 2 Dec 2011 10:31:43 -0800 (PST)
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
Message-ID: <1322850703.54503.YahooMailNeo@web161204.mail.bf1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lack of dev/console or /dev/null should give a message something like "can't allocate initial tty!"
I was having those errors too.? his is unable to run/survive init


having dev/console and dev/null (and if necessary dev/tty*) so the console can be opened.? It's odd the kernel can spit the bootup on ttyS0 but complains when trying to run init.? one of the great mysteries of linux.



?

If opportunity doesn't knock, build a door.
"I can" is a way of life.
More and Bigger is not always Better.
The road to success is always uphill.
Life isn't about finding yourself, it's about creating yourself.


________________________________
 From: Aleksander Dutkowski <adutkowski@gmail.com>
To: buildroot at busybox.net 
Sent: Friday, December 2, 2011 11:21 AM
Subject: Re: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
 
afair this message could be because of lack of dev/console and/or dev/null.
You must run "mknod -m 660 dev/console c 5 1" and "mknod -m
660dev/null c 1 3" in root partition.

How to do it? I have my on usb stick, so i
simply mount usb drive, and do some changes. If youre using yaffs2 and
NAND memory, you can use

System configuration --> Custom script to run before creating filesystem images

to invoke those commands or just find unyaffs script (somewhere on the
Internet, on google code
afair), unyaffs your rootfs, make changes and make yaffs image one
more time.
You have output/target folder with your rootfs, so you can make changes there :)


On Fri, Dec 2, 2011 at 7:02 PM, Jeff Krasky <jeff.krasky@dspcg.com> wrote:
>> "Attempted to kill init" means the init process died.? Kernel must panic
>> because init cannot terminate.
>
>> There's something preventing init from running, or it is dying during
>> execution.
>
>>
>
>> Is your userland correctly have an init?? normally /sbin/init is called.
>> If your init is somewhere else, use
>
>> the init= paramater to kernel append
>
>
>
> How do I know where init is if I can?t bring the board up and run any linux
> commands?
>
>
>
>>you may have a mounted jffs2 filesystem but not directly usable (think
>> squashfs), is it loaded to
>
>> ramdisk?? if so, root=/dev/ram0 init=/sbin/init
>
>
>
> When I successfully ran 2.6.33 built from Buildroot-2011.05, in U-boot the
> setting for root was root=/dev/mtdblock1. ?I am not sure what squashfs is.
> How can the filesystem not be usable?
>
>
>
> Thanks.
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
pozdrawiam
Aleksander Dutkowski
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111202/b8eaca41/attachment.html>
