From: lemonoje <lemonoje@gmail.com>
Date: Thu, 11 May 2017 12:51:09 -0700 (PDT)
Subject: [Buildroot] Altera SoC Buildroot external toolchain incompatible
	error
Message-ID: <1494532269551-164744.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have been trying to find an answer for this error and I found something
close posted here, but I don't understand fully the problem/solution.  I am
building a Linux system for my Altera Arria 10 SoC Cortex-A9.  I'm new to
Buildroot, and building Linux in general, so I have been pretty closely
following the instructions on Rocketboards.org (except now I am trying to
get newer versions of buildroot and gcc toolchain).

More spcifically for my question I am on part 9. (Building rootfs) in this
guide:  
https://rocketboards.org/foswiki/Documentation/EmbeddedLinuxBeginnerSGuide
<https://rocketboards.org/foswiki/Documentation/EmbeddedLinuxBeginnerSGuide>  

When I try to make buildroot I am selecting an external toolchain
(pre-downloaded from releases.linaro.org), and configuring accordingly.  I
then run  

*make -C buildroot ARCH=ARM BR2_TOOLCHAIN_EXTERNAL_PATH=$TOOLCHAIN all*

and I get the error:
>>> toolchain-external  Configuring
/sf/ArriaX/ltsi_4_1_33/gcc-linaro-5.4.1-2017.01-x86_64_arm-linux-gnueabihf/bin/../lib/gcc/arm-linux-gnueabihf/5.4.1/../../../../arm-linux-gnueabihf/bin/ld:
error: /sf/ArriaX/ltsi_4_1_33/buildroot/output/build/.br-toolchain-test.tmp
uses VFP register arguments, /tmp/ccbU9FJ0.o does not
/sf/ArriaX/ltsi_4_1_33/gcc-linaro-5.4.1-2017.01-x86_64_arm-linux-gnueabihf/bin/../lib/gcc/arm-linux-gnueabihf/5.4.1/../../../../arm-linux-gnueabihf/bin/ld:
failed to merge target specific data of file /tmp/ccbU9FJ0.o
collect2: error: ld returned 1 exit status
Incorrect ABI setting: EABI selected, but toolchain is incompatible
package/pkg-generic.mk:206: recipe for target
'/sf/ArriaX/ltsi_4_1_33/buildroot/output/build/toolchain-external/.stamp_configured'
failed
make: ***
[/sf/ArriaX/ltsi_4_1_33/buildroot/output/build/toolchain-external/.stamp_configured]
Error 1
make: Leaving directory '/sf/ArriaX/ltsi_4_1_33/buildroot'


Thanks in advance for any help!!



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Altera-SoC-Buildroot-external-toolchain-incompatible-error-tp164744.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
