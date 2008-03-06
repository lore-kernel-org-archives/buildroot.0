From: Tim Barr <tbarr@multitech.com>
Date: Thu, 6 Mar 2008 08:14:21 -0600
Subject: [Buildroot] I really need some help
Message-ID: <1CD05B980C94AC408B37C82BBABAA3E60A91DE9E@mtsexchange.dc.multitech.prv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
> > I have been trying for the past 2+ months to successfully 
> complete a 
> > buildroot session for a AT91SAM9260EK. I first installed 
> buildroot via 
> > svn. Then I then did a "make at91sam9260pf_defconfig" to 
> get baseline 
> > config files.
> 
> The "pf" is for parallel flash and will not work on the EK 
> since it does not have any parallel flash. You should use 
> "make at91sam9260dfc_defconfig" and a dataflash card for this board.
> 
> If you want to use the internal dataflash, then you need to 
> fix U-Boot and at91bootstrap, but it might be easier to 
> download the binaries from www.linux4sam.org

Right now I have been working with the free BSP package from Timesys and
the binaries from linux4sam.

Firstly, I guess I don't understand what is referred to by "parallel
flash". Is the NAND flash on the EK board not considered parallel flash?
Or is the issue because the 9260 has a bug that won't allow it to boot
from NAND Flash. We are planning to switch development efforts to the
9G20 when the EK is available in April, and that part supposedly has the
NAND boot issue fixed.

Secondly, considering what you are saying about the internal dataflash,
can I assume that the Uboot and bootstrap files I got from both Timesys
and linux4sam have the internal dataflash fix, since I am able to boot
the boards without a dataflash card?

And thirdly, which binaries are stored on the dataflash and which can be
on the NAND Flash of the 9260EK board? Is the linux kernel stored on the
dataflash or the NAND flash typically?

> 
> Is "SuperModem-2.6.22.1" your project name?

Yes, name with kernel version

> 
> 
> For: "atd.c:498:2: error: #error "No mail command specified." 
> error message:
> 
> If you do not need the "at" package, you can just disable it 
> in menuconfig. If you need it, then you need to look at 
> "atd.c" somewhere in the build_arm_wchar/at-3.1.10 to find 
> out why you get the error message.

What is this AT package? Do I disable it in the busy box or the kernel
config? I am an kernel building newbie so I am not familiar with all the
options. I really need a "Building Linux kernels for Dummies" book. :)

> 
> Best Regards
> Ulf Samuelsson                ulf at atmel.com
> 
> 
