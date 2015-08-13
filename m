From: Jan Viktorin <viktorin@rehivetech.com>
Date: Thu, 13 Aug 2015 09:36:19 +0200
Subject: [Buildroot] [PATCH v1] olimex_a20_olinuxino_lime2: new board
In-Reply-To: <CAB0FRsvu_5be0gdt5LxQ1xidUzY6uf1sCiQkeCZahzBk1jdTJQ@mail.gmail.com>
References: <1439391491-4383-1-git-send-email-viktorin@rehivetech.com>
 <CAB0FRsvu_5be0gdt5LxQ1xidUzY6uf1sCiQkeCZahzBk1jdTJQ@mail.gmail.com>
Message-ID: <20150813093619.6f360727@pcviktorin.fit.vutbr.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 12 Aug 2015 20:40:41 +0200
Fran?ois Perrad <francois.perrad@gadz.org> wrote:

> > --- /dev/null
> > +++ b/board/olimex/a20_olinuxino/boot-lime2.cmd
> > @@ -0,0 +1,6 @@
> > +setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
> > +setenv fdtfile sun7i-a20-olinuxino-lime2.dtb  
> 
> With the board Lime (and Micro), U-Boot 2015.07 (or 2015.04) set the
> variable 'fdtfile' with the expected value.
> So, the file board/olimex/a20_olinuxino/boot.cmd could be common for
> all A20-Olinuxino boards.
> 
> Fran?ois.

OK, I didn't notice the fdtfile is already set in the default U-Boot environment.
So the fdtfile does not have to be set at all. I will resend the fixed patch.

Jan

> 
> > +ext4load mmc 0 0x49000000 /boot/${fdtfile}
> > +ext4load mmc 0 0x46000000 /boot/zImage
> > +env set fdt_high ffffffff
> > +bootz 0x46000000 - 0x49000000
> > diff --git a/board/olimex/a20_olinuxino/readme.txt b/board/olimex/a20_olinuxino/readme.txt
> > index 7e9af84..7998aa1 100644


-- 
   Jan Viktorin                  E-mail: Viktorin at RehiveTech.com
   System Architect              Web:    www.RehiveTech.com
   RehiveTech
   Brno, Czech Republic
