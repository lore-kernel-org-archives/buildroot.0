From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 18 Jun 2014 17:04:35 +0200
Subject: [Buildroot] [PATCH] configs: add lego_ev3_defconfig
In-Reply-To: <1402840597-485-1-git-send-email-vincent.stehle@laposte.net>
 ("Vincent =?utf-8?Q?Stehl=C3=A9=22's?= message of "Sun, 15 Jun 2014
 15:56:37 +0200")
References: <1402840597-485-1-git-send-email-vincent.stehle@laposte.net>
Message-ID: <8738f22r98.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vincent" == Vincent Stehl? <vincent.stehle@laposte.net> writes:

 > Add initial support for the Lego Mindstorms EV3 programmable brick.
 > The Lego Mindstorms EV3 brick comprises a Texas Instruments AM1808 SoC, with
 > an ARM 926EJ-S main processor running at 300 MHz.
 > https://en.wikipedia.org/wiki/Lego_Mindstorms_EV3

 > This configuration uses the Linux kernel of the ev3dev project.
 > https://github.com/mindboards/ev3sources

 > More info is available in the board/lego/ev3/readme.txt file, shamelessly
 > documented in the same way as the SoCkit folks did.

 > Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>

Nice, if somebody wants to sponsor me a EV3, I (and my son) will happily
accept ;)


 > diff --git a/configs/lego_ev3_defconfig b/configs/lego_ev3_defconfig
 > new file mode 100644
 > index 0000000..c7bf857
 > --- /dev/null
 > +++ b/configs/lego_ev3_defconfig
 > @@ -0,0 +1,23 @@
 > +# architecture
 > +BR2_arm=y
 > +BR2_arm926t=y
 > +
 > +# toolchain
 > +# Use gcc 4.7, as gcc 4.8 breaks the boot.
 > +BR2_GCC_VERSION_4_7_X=y
 > +
 > +# system
 > +BR2_TARGET_GENERIC_GETTY=y
 > +BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
 > +
 > +# Kernel
 > +BR2_LINUX_KERNEL=y
 > +BR2_LINUX_KERNEL_CUSTOM_GIT=y
 > +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/mindboards/ev3dev-kernel.git"
 > +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="v3.3.0-2-ev3dev_0"
 > +BR2_LINUX_KERNEL_DEFCONFIG="ev3dev"

We should also lock the kernel headers to 3.3.x to match the kernel.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
