From: Matthew Starr <mstarr@hedonline.com>
Date: Thu, 24 May 2018 18:05:02 +0000
Subject: [Buildroot] lrzsz package missing X and Y modem support binaries
In-Reply-To: <20180524175822.d5r3ne6b5onv3bxd@tarshish>
References: <3C8219BAE02B894A9C69304A12E8AA06CA23E97B@HED-Exchange.hed.local>
 <20180524175822.d5r3ne6b5onv3bxd@tarshish>
Message-ID: <3C8219BAE02B894A9C69304A12E8AA06CA23EA77@HED-Exchange.hed.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: Baruch Siach [mailto:baruch at tkos.co.il]
> Sent: Thursday, May 24, 2018 12:58 PM
> 
> Hi Matthew,
> 
> On Thu, May 24, 2018 at 05:04:32PM +0000, Matthew Starr wrote:
> > In Linux distributions the lrzsz package would install not only Zmodem (rz,
> > sz) support binaries but also Xmodem (rx, sx) and Ymodem (rb, sb) support
> > binaries too.
> >
> > Why does buildroot's package not also include X and Y modem support
> > binaries?  Is there a way to add this support?
> 
> I posted a patch adding the XMODEM and YMODEM invocation names.
> 
> http://patchwork.ozlabs.org/patch/920028/
> 
> > Based on a quick glance of the source of lrzsz I could not spot where the X
> > and Y modem binaries would come from like in the Linux distributions.
> 
> The code checked the invocation name to set the default protocol choice.
> See
> the chkinvok() routines in lrz.c and lsz.c.
> 
> The binaries that your distro provides are hard-links to the same file. This
> is what I get on my system:
> 
> ls -i /usr/bin/r{x,b,z}
> 48730274 /usr/bin/rb  48730274 /usr/bin/rx  48730274 /usr/bin/rz
> 
> That is, all names point to the same inode number.
> 

Baruch,

Thank you for the information. I was looking in the Makefile content for where the other binaries were made or copied from and didn't think to look in the source code for the invocation name changing functionality.

Best regards,
 
Matthew Starr
