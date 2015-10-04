From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Oct 2015 14:03:23 +0200
Subject: [Buildroot] [PATCHv2] package/freerdp: fix missing define
In-Reply-To: <1443954155-4505-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 4 Oct 2015 11:22:35 +0100")
References: <1443954155-4505-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87vbamq1ro.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > FreeRDP uses CMSPAR, which is defined by glibc in bits/termios.h .
 > glibc has two flavours of bits/termios.h: a genmeric one and an
 > architecture-specific one. When installing, glibc will install the
 > architecture-specific file if it exists, otherwise it installs the
 > generic file. Only Alpha, MIPS, PPC and Sparc have their own
 > bits/termios.h.

 > The generic bits/termios.h, as well as the Alpha, PPC and Sparc flavours
 > do define CMSPAR. However, the MIPS flavour does not define it.

 > We add a patch to FreeRDP that defines CMSPAR to the value from the
 > generic value, which is also the value known to the Linux kernel for
 > MIPS.

 > Fixes:
 >     http://autobuild.buildroot.org/results/0b4/0b4793f0bf9f4c57933897f3480054a4e06528ad/
 >     http://autobuild.buildroot.org/results/7a2/7a2284d0a2987158fa2e78f789b07c8c6fcdb974/
 >     http://autobuild.buildroot.org/results/387/3874088c3ccd4bbf76ea0c911ca1ef64c7dc9d1c/
 >     ...

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Peter Korsgaard <jacmet@uclibc.org>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 > ---
 > Changes v1 -> v2:
 >   - add commit log and sob to the patch

Committed, thanks.

Don't forget to send it upstream as well.

-- 
Bye, Peter Korsgaard
