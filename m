From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Sep 2010 08:20:10 +0200
Subject: [Buildroot] AVR32 kernel install bug
In-Reply-To: <1283923886.18866.7.camel@joachim-laptop>
References: <op.vinvdkgksev97k@joachim-lappis> <20100907150948.4de996e3@surf>
	<op.viny90lpsev97k@joachim-lappis> <20100907165650.7cf10d65@surf>
	<1283923886.18866.7.camel@joachim-laptop>
Message-ID: <20100908082010.7a27de42@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 08 Sep 2010 07:31:26 +0200
Joachim Pihl <joachim.pihl@sensordevelopments.com> wrote:

> Again, I really can't remember, I had my mind focused elsewhere...
> For a test, I set up a virtual machine for linux (with virtualbox). I
> am not doing that again, it is _dead slow_. Building Buildroot takes
> ~2 hours - on an i7!

Yes, in a virtual machine, it is very slow. On a machine such as an i7,
it should be relatively quick, it really depends on the number of
packages you enabled.

The thing I'm doing to greatly speed up the compilation process is to
generate a toolchain once for all, and then instruct Buildroot to use
it as an external toolchain. It saves the time of producing the
toolchain, which is quite significant.

> > The best is if you could provide a .config file for Buildroot
> > 2010.08 that shows the failure.
> 
> This config file fails on kernel image installation. You should get
> the other failures by setting uClibc to 0.9.31, by adding gdbserver
> (the avr32-patched version) to target, and setting U-boot to latest.

Thanks, I'll have a look into it.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
