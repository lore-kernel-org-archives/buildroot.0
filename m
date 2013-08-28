From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Aug 2013 13:49:45 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <521DE03E.2060708@zacarias.com.ar>
References: <20130828063005.74A7952C1BE@lolut.humanoidz.org>
 <20130828090812.43a7f849@skate> <521DD858.4060105@zacarias.com.ar>
 <20130828133005.3e63a718@skate> <521DE03E.2060708@zacarias.com.ar>
Message-ID: <20130828134945.17351cba@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 28 Aug 2013 08:34:22 -0300, Gustavo Zacarias wrote:
> On 08/28/2013 08:30 AM, Thomas Petazzoni wrote:
> >>>>    powerpc |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/9daf0f46642020591731e20d3bf9041ff6259846/
> >>>
> >>> /home/test/test/3/output/host/usr/bin/powerpc-linux-gnu-gcc   example.o lib/libpci.so.3.2.0  -o example
> >>> /home/test/test/3/output/host/usr/powerpc-buildroot-linux-gnu/sysroot/usr/lib/libkmod.so: undefined reference to `_Static_assert'
> >>>
> >>> No idea, I haven't investigated.
> >>
> >> Old gcc again.
> >> We need the GCC_AT_LEAST_X_Y for these cases or just kill old gcc versions.
> > 
> > _Static_assert was added in gcc 4.6, I don't think gcc 4.4 or 4.5 are
> > "too old". I'll cook a patch for kmod.
> 
> IIRC that's what gcc says but i think i've tested it and it was in >=4.4

The particular toolchain that caused the build failure is
BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103, which is based on
gcc 4.5.2.

And according to the gcc documentation, it was added in 4.6, see
http://gcc.gnu.org/gcc-4.6/changes.html. It's also confirmed by
http://forums.gentoo.org/viewtopic-t-947998-start-0.html, which says
that the undefined reference to _Static_assert disappeared when moving
from 4.5 to 4.6.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
