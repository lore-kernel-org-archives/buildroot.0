From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 13 Oct 2010 09:06:19 -0300
Subject: [Buildroot] mkfs.jffs2 image is not usable
In-Reply-To: <0D753D10438DA54287A00B02708426976450A64C87@AUSP01VMBX24.collaborationhost.net>
References: <0D753D10438DA54287A00B02708426976450A64C87@AUSP01VMBX24.collaborationhost.net>
Message-ID: <4CB5A0BB.2040106@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/13/10 01:53, H Hartley Sweeten wrote:

> I also tried installing the mtd utils locally on my Debian system and then
> created the jffs2 image using /usr/sbin/mkfs.jffs2.  This image is the
> same size as the one manually created using the $(HOST_DIR) one, but the
> files are very different.  When I boot with that image I don't get any
> error messages by the kernel boot hangs after:
> 
> Freeing init memory: 208K
> 
> Can anyone offer some ideas of suggestions?
> 
> Thanks,
> Hartley

Did you check that the flash geometry (page size / erase size) match the
flash device on your board? That would make the jffs2 image different in
content but not much in size as you see.
It's the "flash type" option in buildroot.
Parallel flash = NOR.
AT45 = SPI DataFlash from Atmel.
NAND flash = the usual these days.
Or you can go the custom way if one of the predetermined values doesn't
match your flash device.
Regards.
