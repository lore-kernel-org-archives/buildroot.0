From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 15:32:59 +0200
Subject: [Buildroot] Update of toolchains used in the autobuilders
Message-ID: <20151018153259.0bd5eaca@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've rebuilt all pre-built Buildroot toolchains used for the
autobuilders with the latest Buildroot, and deployed them in the
autobuilders.

Things worth mentioning:

 - the br-arm-full-static and br-x86-64-core2-full toolchains are
   built with 3.14 kernel headers instead of the default (latest) ones,
   in order to test a bit some older kernel headers. Note that the
   br-arm-full configuration was already built with 3.10 headers for the
   same reason, and continues to be built with 3.10 headers.

 - the br-mips64-n64-full toolchain could not be built. It used to use
   glibc, but now that uClibc support for MIPS64 has been enabled, it
   tried to build with uClibc, and the build fails (I'll report the
   problem separately to Waldemar and Vicente)

 - the pre-built musl toolchains have not been updated, because due to
   commit bb41933d3642f44c8d2db07886b2e5bf18b97fad, there is no longer
   a libc.a generated in the musl toolchains, which breaks the external
   toolchain logic to find the sysroot.

 - I've added a br-sparc64-glibc configuration, following the addition
   of Sparc64 support by Waldemar. Hopefully this configuration will
   give less issues than the 32 bits Sparc v8 configuration we have.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
