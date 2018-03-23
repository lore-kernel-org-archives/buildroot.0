From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Mar 2018 21:17:35 +0100
Subject: [Buildroot] [At91Bootstrap3] Overriding dtb chosen arguments
 for kernel command line
In-Reply-To: <CAHnuF30hwkJAypbz6hLiGq=oVmZ2aYH0Yu6Vpp89xG69rNgXTQ@mail.gmail.com>
References: <CAHnuF30hwkJAypbz6hLiGq=oVmZ2aYH0Yu6Vpp89xG69rNgXTQ@mail.gmail.com>
Message-ID: <20180323211735.32c114db@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 23 Mar 2018 16:15:32 -0300, Alejandro Ariel Fachini wrote:

> I have been using at91bootstrap3 to directly load kernel, using dtb on
> sam9x35ek, this kernel is mounting UBI RFS file.
> Wel i need to mount another file JFFS2 and i want to change parameters in
> Kernel Command Line.
> I treid from inside at91bootstrap3-v3.8.6 terminal using make menuconfig
> and selecting override kernel comand line but got error.
> Also tried manually changing arguments in linux menu config and still get
> the arguments inside DTB.
> How can i do this? Thank you very much.
> Note: I am not using U-Boot, using U-Boot is working ok.

Do you have CONFIG_ARM_ATAG_DTB_COMPAT enabled in your kernel
configuration ?

I suppose when you boot with U-Boot, U-Boot patches the DTB before
passing it to the kernel.

However, I don't think at91bootstrap3 patches the DTB, it probably just
passes an old style ATAGS, which the kernel will only pick up if
CONFIG_ARM_ATAG_DTB_COMPAT=y.

Note: this is just an hypothesis, I haven't actually checked the
at91bootstrap3 code.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
