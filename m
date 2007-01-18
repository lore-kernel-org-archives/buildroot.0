From: Daniel Laird <danieljlaird@hotmail.com>
Date: Thu, 18 Jan 2007 08:34:50 +0000
Subject: [Buildroot] mtd broken with 2.6.19 headers
Message-ID: <BAY124-W223C68B2C8461BEC697DF0DCAA0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I myself ran into this problem. (yesterday)
 
Please find attached the mtd.mk file and the mtd patch file.  This seemed to build fine with the 2.6.19.2 headers in buildroot.
 
The patch was based on a patch that was on internet, and i believe is now in mainline for mtd but no newer release yet with it in. 
 
Hope this helps (and gets in to mainline)
Daniel Laird



> Date: Wed, 17 Jan 2007 22:16:15 +0100> From: ulf at atmel.com> To: buildroot at uclibc.org> Subject: [Buildroot] mtd broken with 2.6.19 headers> > > Looks like a real mess.> oobblock is renamed to writesize and this kills nanddump.c> other things kills mkfs.jffs2> Seems like some of the compression algorithms are gone (LZO,LZARI).> > Tried downloading mtd_20061007.orig.tar.gz from the debian site,> and this is not any better.> <sys/acl.h> is gone, but I think that <linux/posix_acl.h> contains> missing info.> > Anyone got anything ready to fly with 2.6.19 headers?> > Best Regards> Ulf Samuelsson> > > > > _______________________________________________> buildroot mailing list> buildroot at uclibc.org> http://busybox.net/mailman/listinfo/buildroot
_________________________________________________________________
Be one of the first to try Windows Live Mail.
http://ideas.live.com/programpage.aspx?versionId]21c51a-b161-4314-9b0e-4911fb2b2e6d
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070118/56bc4c9f/attachment.htm 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: mtd.patch
Type: application/octet-stream
Size: 2819 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070118/56bc4c9f/attachment.obj 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: mtd.mk
Type: application/octet-stream
Size: 3789 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070118/56bc4c9f/attachment-0001.obj 
