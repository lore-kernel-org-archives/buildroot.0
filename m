From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Dec 2010 08:27:40 +0100
Subject: [Buildroot] oprofile "requires" gmp???
In-Reply-To: <9AC3F0E75060224C8BBC5BA2DDC8853A1EA26053@EXV1.corp.adtran.com>
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1EA26053@EXV1.corp.adtran.com>
Message-ID: <20101223082740.3a8e44c4@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Dec 2010 22:47:17 -0600
ANDY KENNEDY <ANDY.KENNEDY@adtran.com> wrote:

> buildroot v2011.02-git Configuration:
> 
> MIPS-32r2 using native toolchain, uclibc-0.9.31.x, gcc-4.5.x, binutils
> 2.20.1.
> 
> When I select oprofile from packages -> debug utils, gmp is selected,
> though the .config file reports # BR2_PACKAGE_LIBGMP is not set,
> though buildroot attempts to build it.
> 
> There are no dependencies for gmp listed in the oprofile help section.
> 
> What gives?

oprofile needs binutils on target, which in turns requires gmp on
target. So the fact that gmp gets compiled is normal.

However, the fact that BR2_PACKAGE_LIBGMP is not set is indeed
incorrect. But Gustavo has a patch series that rewrites how binutils,
gmp, mpfr are handled, so presumably he could fix that particular
problem as part of this patch set.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
