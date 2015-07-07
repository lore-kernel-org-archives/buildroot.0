From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jul 2015 23:28:12 +0200
Subject: [Buildroot] Autobuilder toolchain updates
Message-ID: <20150707232812.603af01f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've done some updates to the toolchains in the autobuilders:

 * All Buildroot external toolchains have been rebuilt with today's
   master (commit 85945aa). This means that the default compiler
   version used is gcc 4.9.x. Only toolchain,
   br-arm-cortex-a9-glibc-2015.05-496-g85945aa.tar.bz2, is using gcc
   5.1.x, so that we have at least one toolchain testing this new
   compiler version. One toolchain, the NIOS II, could not be rebuilt
   with the current master as the build fails (it was working on
   2015.05).

 * In my previous autobuilder toolchain updates, I announced that a
   number of new toolchain had been added. But in fact, due to a
   mistake on my side, the tarballs were indeed available, but the
   toolchains were not actually used by the autobuilders. This is now
   fixed, and means that the following new toolchains will be used by
   the autobuilders:

     br-aarch64-glibc.config
     br-arm-basic.config
     br-arm-full-static.config
     br-mip64-n64-glibc.config
     br-nios2-glibc.config
     br-powerpc-603e-basic-cpp
     br-sparc-glibc.config
     br-x86-64-musl.config

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
