From: Jorge S. <jorgesolla@gmail.com>
Date: Thu, 18 Oct 2007 14:59:56 +0200
Subject: [Buildroot] Fwd: (AT91RM9200/DATAFLASH) Unable to create a
	*working* jffs2 rootfs.
In-Reply-To: <6090c5eb0710180557u2c3a7c53m9afd6000015f2fba@mail.gmail.com>
References: <941891.99466.qm@web26206.mail.ukl.yahoo.com>
	<6090c5eb0710180557u2c3a7c53m9afd6000015f2fba@mail.gmail.com>
Message-ID: <6090c5eb0710180559g5c4cedd4o95f4da4e876e7bc1@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I always forget to add the list e-mail address on the CC, sorry...

---------- Forwarded message ----------
From: Jorge S. <jorgesolla@gmail.com>
Date: 18-oct-2007 14:57
Subject: Re: [Buildroot] (AT91RM9200/DATAFLASH) Unable to create a *working*
jffs2 rootfs.
To: Michael Trimarchi <trimarchimichael@yahoo.it>

I think my alignment is OK:

I'm using an AT45DB642B wich has a 1056 bytes pagesize

This is the MTD commandline for the kernel:

 mtdparts=AT45DB642.spi0:168960(boot),2162688(kernel),224400(raiz)
root=/dev/mtdblock2 rootfstype=jffs2

So we have:

(boot) 168960 bytes      -> (160 blocks of 1056 bytes)
(kernel) 2162688 bytes ->  (2048 blocks of 1056 bytes)
(raiz/root) rest of available space ...

I assume alinment to pagesize and *not* eraseblock, i am right? what do you
think?



2007/10/18, Michael Trimarchi <trimarchimichael@yahoo.it>:
>
>
> Hi
>
> >at91_rtc at91_rtc: setting the system clock to 1998-01-01 00:06:50
> (883613210)
> >JFFS2 write-buffering enabled buffer (1056) erasesize (8448)
> >jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00223ae4:
> 0x2001 instead
> >jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00223ae8:
> 0x3c00 instead
> >jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00223aec:
> 0x2000 instead
> >jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00223af0:
> 0x2bf4 instead
> >jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00223af4:
> 0x3000 instead
> >jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00223af8:
> 0x3001 instead
>
> Check if your partition is alignment, but I think so :)
> regards
> Michael
>
>
>
> ------------------------------
> L'email della prossima generazione? Puoi averla con la Nuova Yahoo! Mail<http://us.rd.yahoo.com/mail/it/taglines/gmail/nowyoucan/nextgen/*http://it.docs.yahoo.com/nowyoucan.html>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071018/ebdec944/attachment.htm 
