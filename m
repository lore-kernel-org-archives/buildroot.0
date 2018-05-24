From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 24 May 2018 20:58:22 +0300
Subject: [Buildroot] lrzsz package missing X and Y modem support binaries
In-Reply-To: <3C8219BAE02B894A9C69304A12E8AA06CA23E97B@HED-Exchange.hed.local>
References: <3C8219BAE02B894A9C69304A12E8AA06CA23E97B@HED-Exchange.hed.local>
Message-ID: <20180524175822.d5r3ne6b5onv3bxd@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matthew,

On Thu, May 24, 2018 at 05:04:32PM +0000, Matthew Starr wrote:
> In Linux distributions the lrzsz package would install not only Zmodem (rz, 
> sz) support binaries but also Xmodem (rx, sx) and Ymodem (rb, sb) support 
> binaries too.
> 
> Why does buildroot's package not also include X and Y modem support 
> binaries?  Is there a way to add this support?

I posted a patch adding the XMODEM and YMODEM invocation names.

http://patchwork.ozlabs.org/patch/920028/

> Based on a quick glance of the source of lrzsz I could not spot where the X 
> and Y modem binaries would come from like in the Linux distributions.

The code checked the invocation name to set the default protocol choice. See 
the chkinvok() routines in lrz.c and lsz.c.

The binaries that your distro provides are hard-links to the same file. This 
is what I get on my system:

ls -i /usr/bin/r{x,b,z}
48730274 /usr/bin/rb  48730274 /usr/bin/rx  48730274 /usr/bin/rz

That is, all names point to the same inode number.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
