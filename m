From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Jun 2013 00:04:30 +0200
Subject: [Buildroot] [PATCH] libunwind:  new pacakge
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C639A6F98F@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C639A6F946@ex-mb1.corp.adtran.com>
 <20130625235022.75b13738@skate>
 <F9C551623D2CBB4C9488801D14F864C639A6F98F@ex-mb1.corp.adtran.com>
Message-ID: <20130626000430.502a306a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear ANDY KENNEDY,

On Tue, 25 Jun 2013 21:57:14 +0000, ANDY KENNEDY wrote:

> >  1) Did you check that it builds fine with uClibc? This kind of library
> >  tend to use some funky C library features, sometimes not available in
> >  uClibc.
> 
> Nope, I didn't.

Then just do a build with a uClibc toolchain. If you don't want to wait
for the toolchain to build, you can use
http://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2013.05-1.tar.bz2
as an external toolchain. It's a basic ARM uClibc toolchain (with no
option enabled: no WCHAR, no largefile, no IPv6, no RPC, no locales).

> >  2) The libunwind code seems to contain some architecture-specific
> >  code. While aarch64, arm, mips, ppc, sh, x86 and x86-64 are supported,
> >  some other architectures that Buildroot supports are not supported. So
> >  maybe this package should have a "depends on BR2_aarch64 || BR2_arm ||
> >  BR2_armeb || ..."
> 
> That is possible as well.  I'm really not devoted to owning this
> package that much.  I was merely attempting to push it back as I
> added it to our usage of BuildRoot.  To that end, shall I abandon
> the process (as I clearly am not willing to do it justice)?

No, you shouldn't abandon the process. Your contributions are very
welcome! I think you're very close to have something that can be
merged, just keep sending new revisions of your patch that takes into
account the comments from contributors.

> It is no skin off my nose whether it gets put into BuildRoot, I was
> only pushing it back as I didn't know it was there until someone else
> I work with pointed out that this *seems* to be the basic library GDB
> is based off of, thus could be useful in our embedded system.

Yes, it would certainly be useful.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
