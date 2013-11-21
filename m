From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Nov 2013 16:05:12 +0100
Subject: [Buildroot] [PATCH 1/1] Added stage2 ldscripts
In-Reply-To: <528E1CFD.2070000@wanadoo.fr>
References: <1384986808-24363-1-git-send-email-thierry.bultel@wanadoo.fr>
 <20131121091316.16816a89@skate> <528DDAA9.20309@wanadoo.fr>
 <20131121114731.3623f716@skate> <528E1CFD.2070000@wanadoo.fr>
Message-ID: <20131121160512.2d4d7a37@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thierry Bultel,

On Thu, 21 Nov 2013 15:47:25 +0100, Thierry Bultel wrote:

> Yes that's the point. I have attempted to debug:
> grub_open fails on /boot/grub/menu.lst
> 
> But when I mount my iso image, it is there:
> 
> $ ls /mnt/boot/grub/
> menu.lst         stage2_eltorito
> 
> I finally found out that it is grub does not support the iso9660
> filesystem.

Aah!

> I have added it to the list of supported ones and it works.
> That is a little bit annoying to have to do it manually.
> 
> On your branch it is explicitly deselected when configured, whereas
> it was configured by default on mainstream.
> 
> I think it could be could to :
> 1) Set the supported FS as choices in xconfig

Did you realize that such an option exists, and is added by my patch
set ? :-)

See:

  http://git.free-electrons.com/users/thomas-petazzoni/buildroot/commit/?h=x86-stuff&id=b01db75a6d7165005f9fb069c340f4206160c7f5

which adds the BR2_TARGET_GRUB_FS_SUPPORT option. You simply need to
change it from "ext2fs fat" to "ext2fs fat iso9660" and that's it.

Can you confirm that it works for you?

Also, could you share how you build your ISO image with Grub ? I would
be interested in adding these details to the Config.in help text, as I
did to explain how to create a disk image that has grub installed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
