From: Whitney, Scott <scwhitn@amazon.com>
Date: Thu, 10 Oct 2019 13:56:45 +0000
Subject: [Buildroot] Buildroot for Texas Instruments AM65X - add 2nd
 toolchain?
Message-ID: <1570715805181.62328@amazon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We are trying to set up Buildroot to create our cross-compilation toolchain, Linux image, and root filesystem for the Texas Instruments AM65X family.


We'd also like to create U-Boot, but for the AM65X, U-Boot has at least one piece (tiboot3.bin) that runs on a 32-bit ARM R5 core, requiring a 32-bit ARM cross-compiler.  That piece configures some hardware like the DRAM controller and then loads some 64-bit code U-Boot code into DRAM, after which an A53 64-bit core starts running it.


The rest of our project and the remainder of U-Boot can be built using the AArch64 ARM compiler, which we have selected as our Buildroot toolchain, along with glibc.


Has anyone used Buildroot with the AM65X?  Is it feasible to build/configure a 2nd toolchain (32-bit ARM) within Buildroot, possibly as an additional host package?


We are also trying to create everything using a br2-external tree so that all of Buildroot does not need to be checked in.  We would only have to check out our br2-external tree, copy a specific version of Buildroot into it the same top-level directory as the location of our br2-external tree, and then use "make BR2_EXTERNAL=<path to our br2-external tree> our_defconfig", followed by the usual "make" to build everything.


Examples of how to go about this (e.g. Config.in.host, *.mk files, etc.) if it's feasible would be greatly appreciated.


Many thanks,


Scott
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191010/e46561bb/attachment.html>
