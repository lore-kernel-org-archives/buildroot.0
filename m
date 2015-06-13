From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Jun 2015 16:00:24 +0200
Subject: [Buildroot] Major update of autobuild.buildroot.org toolchains
Message-ID: <20150613160024.002ac051@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've just done a fairly significant update of the toolchain
configurations used by the autobuilders:

 * The MIPS Sourcery toolchain used is now 2015.05

 * All the Buildroot external toolchains have been rebuilt with
   Buildroot 2015.05, including the SH4 one which hadn't been rebuilt
   since almost two years due to SH4 toolchain build being broken until
   2015.05.

 * Re-enabled the Buildroot ARM musl toolchain, also built with 2015.05.

 * Re-added a Buildroot ARM basic (i.e no uClibc options enabled) and
   Buildroot PowerPC basic C++ (i.e no uClibc options enabled, but with
   C++). They had to be disabled during the 2015.05 development cycle
   since largefile and IPv6 support is now mandatory, and they were
   built without.

 * Added a bunch of new Buildroot external toolchains:

   - AArch64 glibc
   - ARM uClibc toolchain built with BR2_STATIC_LIBS=y (i.e it
     shouldn't have libdl)
   - MIPS64 glibc
   - NIOS2 glibc
   - Sparc glibc
   - x86-64 musl

As usual, see http://autobuild.buildroot.org/toolchains/configs/ for
the complete list of toolchains currently tested.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
