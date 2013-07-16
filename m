From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 16 Jul 2013 15:19:04 +0200
Subject: [Buildroot] [PATCHv3 08/14] configs: use new EABIhf option for
	beaglebone_defconfig
In-Reply-To: <1373961805-3901-9-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 16 Jul 2013 10:03:19 +0200")
References: <1373961805-3901-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1373961805-3901-9-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8761wa1w3b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  configs/beaglebone_defconfig | 3 +--
 Thomas>  1 file changed, 1 insertion(+), 2 deletions(-)

Did you test build this? I had a beaglebone derived config (but with
latest linaro), and u-boot failed to build with:

/home/peko/source/buildroot/output/host/usr/bin/arm-linux-gnueabihf-gcc -DDO_DEPS_ONLY \
		-g  -Os   -fno-common -ffixed-r8 -msoft-float  -D__KERNEL__ -I/home/peko/source/buildroot/output/build/uboot-2013.04/include -fno-builtin -ffreestanding -nostdinc -isystem /home/peko/source/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/4.8.2/include -pipe  -DCONFIG_ARM -D__ARM__ -marm -mno-thumb-interwork -mabi=aapcs-linux -march=armv7-a -Wall -Wstrict-prototypes       \
			-o arch/arm/cpu/armv7/am33xx/asm-offsets.s arch/arm/cpu/armv7/am33xx/asm-offsets.c -c -S; \
	else \
		touch arch/arm/cpu/armv7/am33xx/asm-offsets.s; \
	fi
arm-linux-gnueabihf-gcc: error: -mfloat-abi=soft and -mfloat-abi=hard may not be used together
make[1]: *** [lib/asm-offsets.s] Error 1

Because of the hard/soft float mixup. It might not happen with the
internal toolchain as we're not forcing -mfloat-abi=hard on the command
line, but I haven't tried yet.

-- 
Bye, Peter Korsgaard
