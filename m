From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 May 2010 18:33:21 +0200
Subject: [Buildroot] endian issue
In-Reply-To: <201005151726.58323.korgull@home.nl>
References: <201005151547.02656.korgull@home.nl>
	<1273933182.28330.87.camel@coalu.atr>
	<hsmbug$d0p$1@dough.gmane.org> <201005151726.58323.korgull@home.nl>
Message-ID: <20100515183321.34ffff64@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 15 May 2010 17:26:57 +0200
Marcel <korgull@home.nl> wrote:

> If I wish to do that, how do I detect the endianness of a sytem and
> do I need to reformat my data in my drivers for this ? If so, isn't
> that a pure waste of cpu cycles for the sake of reusable code ?
> If I can do this without any speed sacrifice than I will do it, if
> not....than it's simply not an option for this system.

If your driver is in the kernel, tust use the kernel functions
be16_to_cpu(), be32_to_cpu(), etc. They will automatically do the
appropriate conversion depending on the CPU endianess.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
