From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Feb 2014 17:09:14 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <53022D70.8090908@imgtec.com>
References: <20140207073009.C5A85100E3A@stock.ovh.net>
 <20140207135324.4c7cbe3f@skate> <53022D70.8090908@imgtec.com>
Message-ID: <20140217170914.07839699@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Mon, 17 Feb 2014 15:40:32 +0000, Vicente Olivert Riera wrote:

> > You'll find below a quick analysis of the build failures. If you are in
> > Cc, it means that there is a question for you below, or a request to
> > help debugging a specific problem. Thanks!
> >
> > On Fri,  7 Feb 2014 08:30:09 +0100 (CET), Thomas Petazzoni wrote:
> 
> >>      mipsel |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/05d3186bcb74c905bbc689859522b88db78c2f68/
> >
> > /home/test/test/3/output/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/4.7.3/../../../../mipsel-buildroot-linux-uclibc/bin/ld: BFD (GNU Binutils) 2.21 assertion fail elfxx-mips.c:3416
> > /home/test/test/3/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libasound.a(rawmidi_symbols.o):(.data.rel+0x4): undefined reference to `_snd_module_rawmidi_virt'
> >
> > Looks like a MIPS toolchain problem, maybe? The toolchain used is a
> > Buildroot toolchain built with Buildroot 2013.11. If the problem no
> > longer occurs with the internal toolchain backend, then it will be
> > fixed once I rebuild the external Buildroot toolchains of the Buildroot
> > (when -rc1 is released). Vicente, can you test if this works with the
> > internal toolchain?
> 
> No, it doesn't work. There is the same problem with the internal 
> toolchain, but only fails when BR2_PREFER_STATIC_LIB is selected.

To be investigated, then :-)

> >>       nios2 |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/9aca518bf53aea62bc4bb437976f0223113c26ce/
> >
> > Would be good to see if the bump of ltp-testsuite proposed by Vicente
> > fixes this problem. Peter, can you apply
> > http://patchwork.ozlabs.org/patch/317112/ ?
> 
> I have received an email from Peter saying "Committed to next, thanks."
> What that means? To next what?

When -rc1 of version N is released, we no longer commit "big changes"
to the master branch, as we have entered the "bug fixing period", until
the final release of version N to take place.

But during that time, we do not want to completely stop the merging of
the "big changes", so Peter opens up a branch, called "next", whose
starting point is the -rc1 of version N. And the contents of this
branch will be merged into master as soon as the final release of
version N is done, which means that the changes merged in the
next branch will be part release N+1.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
