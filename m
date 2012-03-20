From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 20 Mar 2012 21:48:03 +0100
Subject: [Buildroot] Microblaze - UBoot Bootloader Support
In-Reply-To: <CAEBucnBJ88bpFaoVvp6fuU1aUZySOp+BFdY1=9Eq3h06tg+BPw@mail.gmail.com>
References: <CAEBucnBJ88bpFaoVvp6fuU1aUZySOp+BFdY1=9Eq3h06tg+BPw@mail.gmail.com>
Message-ID: <201203202148.03682.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 19 March 2012 22:55:14 Spenser Gilliland wrote:
> I'm looking into a boot loader and will be testing u-boot over the
> next few days.  The Xilinx u-boot repo appears stagnant, so I'm going
> to try to use the upstream u-boot support.  It looks like the
> following will be necessary to support u-boot in Microblaze.
> 
> 1. Copy a xparameters.h file.
> Would be similar to the kernels dts copy routine.

 I would prefer to see this as a patch (configured with 
BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR) rather than modifications to the
uboot.mk file.  The dts copy is something that should be useable
by other architectures as well in the long term.  But copying
random files into the u-boot source tree isn't.


> 2. Update the  CONFIG_SYS_BASE_ADDR variable.
> Can be pulled from the kernel configuration, based on DTS or manual?
> (I'll produce a manual patch for now but automating this in the future
> seems appropriate)

 Up to now, buildroot doesn't do anything to automagically derive
U-boot configurations from kernel configurations and vice versa.  I
also don't see a driving reason to do that.  So here as well, I would
prefer a patch.

 A separate patch file for each 'feature' is probably the best.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
