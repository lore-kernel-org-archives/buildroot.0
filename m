From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 Sep 2017 20:33:19 +0200
Subject: [Buildroot] [PATCH 2/2] fs/iso9660: remove support for grub
In-Reply-To: <59a8a7979c191_5721ce62d87080@ultri3.mail>
References: <89462d4b3d365f2c6585eefeb35175813b5a8af2.1504194830.git.yann.morin.1998@free.fr>
 <59a8a7979c191_5721ce62d87080@ultri3.mail>
Message-ID: <20170901183319.GB2866@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2017-08-31 21:19 -0300, Ricardo Martincoski spake thusly:
> On Thu, Aug 31, 2017 at 12:54 PM, Yann E. MORIN wrote:
> > grub has just been removed.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ---
> >  fs/iso9660/Config.in  | 16 ++++------------
> >  fs/iso9660/grub.cfg   |  7 -------
> >  fs/iso9660/iso9660.mk | 32 +-------------------------------
> >  3 files changed, 5 insertions(+), 50 deletions(-)
> >  delete mode 100644 fs/iso9660/grub.cfg
> Don't remove it. Despite the name it is used by grub2 ...

Arg. OK.

> > diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
> > index d162586f38..842c987f21 100644
> > --- a/fs/iso9660/Config.in
> > +++ b/fs/iso9660/Config.in
> [snip]
> > @@ -48,13 +42,11 @@ endchoice
> >  
> >  config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
> >  	string "Boot menu config file"
> > -	default "fs/iso9660/menu.lst" if BR2_TARGET_ROOTFS_ISO9660_GRUB
> >  	default "fs/iso9660/grub.cfg" if BR2_TARGET_ROOTFS_ISO9660_GRUB2
> ... here. Instead you can remove
> fs/iso9660/menu.lst

Ah, now I remember that I was thinking that the naming was weird, and
that I had to remove the "other" file.

Which I did not... Sigh... ;-)

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
