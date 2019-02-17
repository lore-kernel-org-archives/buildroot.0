From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Feb 2019 23:12:34 +0100
Subject: [Buildroot] [PATCH v4 6/7] configs/qemu_armv7a_tz_virt: Armv7-A
 emulation with TrustZone services
In-Reply-To: <1548845249-28201-6-git-send-email-etienne.carriere@linaro.org>
References: <1548845249-28201-1-git-send-email-etienne.carriere@linaro.org>
 <1548845249-28201-6-git-send-email-etienne.carriere@linaro.org>
Message-ID: <20190217231234.321ec6e4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Jan 2019 11:47:28 +0100
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> This change introduces a Qemu board for an Armv7-A target executing
> with OP-TEE secure world services.
> 
> The target Linux based normal world embeds the standard minimal
> filesystem with OP-TEE non-secure components embedded files from
> OP-TEE test, examples and benchmark packages.
> 
> The Linux custom configuration is dumped from the vexpress_defconfig
> with few added fragments: OP-TEE driver and 9p for virtual filesystem to
> ease file manipulation and exchanges through Qemu virtfs support.
> 
> The standard way for booting OP-TEE with a non-secure world companion
> use the Arm Trusted Firmware-A as bootloader. OP-TEE OS provides the
> BL32 image and U-boot the BL33 image. The proposed board enables OP-TEE
> and U-boot build for this. However package boot/arm-trusted-firmware
> needs few change support building Armv7-A targets.
> 
> Therefore the proposed board allows one to build the images but not
> yet to run the target with the built Qemu host tool.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>

I don't know what is the opinion of Peter, Arnout and Yann, but I think
this PATCH 6/7 and PATCH 7/7, instead of adding more defconfigs should
instead add test cases to our runtime test infrastructure in
support/testing/. Indeed:

 - We probably don't want to have Qemu defconfigs for every possible
   feature in Buildroot

 - A runtime test case, even if it's indeed a bit less visible than a
   defconfig, still documents a configuration that "works" for a given
   feature.

 - A runtime test case allows to really runtime test the feature by
   booting Qemu.

Etienne, would you be willing to convert those two configurations to
the runtime test infrastructure ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
