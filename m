From: Matthew Starr <mstarr@hedonline.com>
Date: Tue, 28 Jul 2015 17:44:18 -0500
Subject: [Buildroot] Using buildroot generated toolchain as external
	toolchain issues
Message-ID: <64CA5C49A43E314D9F7DAE05370E2F7B06771147@hed-dc01.hed.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have several buildroot instances I use for different hardware.    To
speed up
compile time I am trying to take a compiled buildroot toolchain and
reuse it
as an external toolchain for all my instances of buildroot.  I did this
by not
selecting any packages, kernel, or u-boot and not to generate a rootfs.
When building the toolchain I selected ARM and EABIhf for Cortex A8.

I then take the contents of the output/host/usr directory and put it in
a tar
file that is then used as the external toolchain in the other buildroot
instances.  When I try to build with the instances of buildroot using
this
external toolchain I get the following error:

output/host/opt/ext-toolchain/bin/../libexec/gcc/arm-buildroot-linux-gnu
eabihf/4.9.2/cc1: error while loading shared libraries:
libcloog-isl.so.4: cannot open shared object file: No such file or
directory
Incorrect ABI setting: EABI selected, but toolchain is incompatible

I have done some searching online and everywhere I look it says I
should be able to use a buildroot toolchain as an external toolchain.
Am I missing something or is there some extra step I should do?

Best regards,
 
Matthew Starr
