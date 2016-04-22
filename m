From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Apr 2016 22:25:10 +0200
Subject: [Buildroot] [PATCH 1/1] Preliminary support for Raspberry Pi 3.
In-Reply-To: <20160422170114.1d505a64@armant.core.local.os.greenbone.net>
 (=?utf-8?Q?=22Beno=C3=AEt?= Allard"'s message of "Fri, 22 Apr 2016 17:01:14
 +0200")
References: <1461150240-23107-1-git-send-email-ubaldo@eja.it>
 <20160422170114.1d505a64@armant.core.local.os.greenbone.net>
Message-ID: <87y485s861.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Beno?t" == Beno?t Allard <benoit.allard@greenbone.net> writes:

 > Hi Ubaldo,
 > I updated a bit your defconfig (see below), and I was able to boot the
 > generated image. Weirdly I get no getty on the HDMI, just the kernel
 > boot log. Have I done something wrong ?

>> +++ b/configs/raspberrypi3_defconfig
 >> @@ -0,0 +1,36 @@
 >> +BR2_arm=y
 >> +BR2_cortex_a7=y

 > Raspberry3 are using A8 processors.

Not it uses A53, which is only selectable when building in 64bit
mode. The A7 is afaik the closest 32bit equivalent, so that's ok.



 >> +BR2_ARM_EABIHF=y
 >> +BR2_ARM_FPU_NEON_VFPV4=y
 >> +
 >> +BR2_TOOLCHAIN_BUILDROOT_CXX=y
 >> +
 >> +BR2_SYSTEM_DHCP="eth0"
 >> +
 >> +# Linux headers same as kernel, a 4.1 series
 >> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
 >> +
 >> +BR2_LINUX_KERNEL=y
 >> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
 >> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
 >> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="20fe468af4bb40fec0f81753da4b20a8bfc259c9"

 > Better use the branch name to allow shallow clones. in this case: 
 > "rpi-4.1.y"

No, please only use tags or git hashes, not branches. We want builds to
be reproducable, and new commits may get pushed to the branch in the
future, breaking that.

 > Why don't you use a more recent branch ?

Yes, that sounds odd.

-- 
Bye, Peter Korsgaard
