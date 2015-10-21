From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 09:25:53 +0200
Subject: [Buildroot] [PATCH v5] board: add support for Synopsys VDK
 Software Development Platform
In-Reply-To: <5626B5DE.3020201@mind.be>
References: <7cfe6681e738e9696eba42b8128eea1da7d3eb30.1444642014.git.jpinto@synopsys.com>
 <5626B5DE.3020201@mind.be>
Message-ID: <20151021092553.708d4dd8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Tue, 20 Oct 2015 23:45:02 +0200, Arnout Vandecappelle wrote:

> > +CONFIG_INPUT_EVDEV=y
> > +CONFIG_INPUT_MISC=y
> > +CONFIG_INPUT_UINPUT=y
> > +CONFIG_SERIO_AMBAKMI=y
> > +CONFIG_SERIAL_8250=y
> > +CONFIG_SERIAL_8250_CONSOLE=y
> > +CONFIG_SERIAL_AMBA_PL011=y
> > +CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
> > +CONFIG_SERIAL_OF_PLATFORM=y
> 
>  Err, I thought OpenFirmware was a PowerPC thing?

Yes, originally. But OF is now used more or less as a synonym for
"Device Tree", i.e all the kernel functions to parse the Device Tree
are prefixed with of_*().

If you don't have CONFIG_SERIAL_OF_PLATFORM=y and your hardware is
described by a Device Tree, then your 8250 serial driver will not probe.

However, what is a bit weird is to enable both the 8250 driver and the
pl011 driver.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
