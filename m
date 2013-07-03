From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Jul 2013 19:13:01 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-07-02
In-Reply-To: <20130703165041.GB3268@free.fr>
References: <20130703063004.ABFF552C4E3@lolut.humanoidz.org>
 <20130703165041.GB3268@free.fr>
Message-ID: <20130703191301.26fbb872@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 3 Jul 2013 18:50:41 +0200, Yann E. MORIN wrote:

> On 2013-07-03 08:30 +0200, Thomas Petazzoni spake thusly:
> > Detail of failures
> > ===================
> > 
> >    powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/bda11786649e8dd6f7d644bbe39c3d278fa37f9e/
> 
> Toolchain used is too old, and lacks up-to-date DVB headers for w_scan
> to build:
>     checking for linux/dvb/frontend.h presence... yes
>     checking for linux/dvb/frontend.h usability (FE_CAN_2G_MODULATION)... yes
>     checking for linux/dvb/frontend.h usability (DVB-T2, DVB API >= v5.3)... no
> 
> Toolchain is:
>     freescale-2011.03-38-powerpc-linux-gnu-i686-pc-linux-gnu

Two options:

 * Modify the package source code so that it detects if the kernel
   headers are present or not, and if not, uses a local copy of said
   headers.

 * Blacklist the build of w_scan with this toolchain in the autobuilder
   script.

Pick your choice :)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
