From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 May 2021 09:32:33 +0200
Subject: [Buildroot] [PATCH v2 6/6] configs/beaglev: enable building of
 low-level firmware
In-Reply-To: <20210503071832.GA367228@x1>
References: <20210502212141.934384-1-thomas.petazzoni@bootlin.com>
 <20210502212141.934384-14-thomas.petazzoni@bootlin.com>
 <20210503071832.GA367228@x1>
Message-ID: <20210503093233.3db3de87@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Drew,

On Mon, 3 May 2021 00:18:32 -0700
Drew Fustini <drew@beagleboard.org> wrote:

> > +Note that the reflashing mechanism itself relies on those low-level
> > +bootloaders, so if you flash non-working versions, you'll have to go
> > +through a recovery process. This requires wiring up to a separate
> > +debug UART, whose pins are located near the HDMI connector. See
> > +https://wiki.seeedstudio.com/BeagleV-Update-bootloader-ddr-init-boot-uboot-Recover-bootloader/
> > +section "Recover the bootloader" for more details.  
> 
> This is not something that needs to be noted in the patch, but I wanted
> to make people aware that the instructions currently recommed using
> SecureCRT as the terminal emulator.  I know many including myself would
> not want to use a trial version of commercial software.  
> 
> The author of the guide, Lakshantha, told me that he could not transfer
> the vic_second_boot.boot.bin using xmodem in minicom when connected via
> the debug header.  After he uploaded the file using minicom, he would
> type "do 0x18000000", but there would be no response. It did however
> work ok in SecureCRT.
> 
> Lakshantha will be back on May 6 but in the meantime I would welcome any
> suggestions. I figure there must be some difference in the default
> behavior of securecrt vs minicom.

Thanks for the additional detail. I indeed missed that the recovery
mechanism seems to not work with terminal emulator others than this
commercial software.

I have been lucky that for me the secondBoot and ddrInit just worked,
so I was able to reflash them using the normal flashing solution (from
the standard UART).

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
