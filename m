From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Oct 2014 21:10:24 +0200
Subject: [Buildroot] Question about native tools.
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C698E46CB3@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C698E46BA4@ex-mb1.corp.adtran.com>
 <5449488C.4070901@vanguardiasur.com.ar>
 <F9C551623D2CBB4C9488801D14F864C698E46CB3@ex-mb1.corp.adtran.com>
Message-ID: <20141023211024.3a55df13@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andy,

On Thu, 23 Oct 2014 18:42:36 +0000, ANDY KENNEDY wrote:

> Is it that difficult to cross-build gcc and binutils for a target?
> Thinking back to when I have natively built a newer version of gcc
> and binutils for my systems, it was as simple as ./configure &&
> make.  Now, I understand that the build/host/target would need to
> be set, but this doesn't seem that hard.  Am I over trivializing
> this process?

Yes, you are :-)

Basically, you believe that building a native toolchain is just about
cross-building gcc and binutils, which indeed isn't that hard.

But actually, building a native toolchain means that you want to enable
people to do development on the target. Which means you also need to
install header files on the target, static libraries, pkg-config files,
and also tools like make, autoconf, automake, libtool, pkg-config and
many, many, many other tools, depending on what you want to build.

Yes, gcc and binutils are sufficient to build a simple Hello World
application on the target (assuming of course you also have installed
the C library and kernel headers). But to do real development on the
target, you need much, much more than just gcc and binutils on the
target. It's really this "much more" thing that nobody was taking care
of, and that we believe doesn't really belong to Buildroot, as
Buildroot is here to do cross-compilation: so why would you need a
compiler for the target? Just create a Buildroot package, and build
things at build-time, on a fast build machine.

If you target is fast enough, powerful enough, and has enough storage
space to afford a complete development system, then most likely
Buildroot doesn't make much sense, and you could just as well install a
real Linux distribution.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
