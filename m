From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 May 2017 22:26:05 +0200
Subject: [Buildroot] [1/1] speex: bump version to 1.2.0
In-Reply-To: <20170529162146.29207-1-Adamduskett@outlook.com>
References: <20170529162146.29207-1-Adamduskett@outlook.com>
Message-ID: <20170529222605.527a9e4e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 29 May 2017 12:21:46 -0400, Adam Duskett wrote:
> Patch is no longer needed and has been merged with upstream.

Have you actually tested that the patch is no longer needed? I applied
your patch, and tried building Speex on ARM/Thumb2 and it fails
miserably:

  CC       ltp.lo
  CC       speex.lo
  CC       stereo.lo
/tmp/ccR4oAiE.s: Assembler messages:
/tmp/ccR4oAiE.s:262: Error: thumb conditional instruction should be in IT block -- `rsbmi r2,r2,#0'
/tmp/ccR4oAiE.s:264: Error: thumb conditional instruction should be in IT block -- `rsbmi r0,r0,#0'
/tmp/ccR4oAiE.s:267: Error: thumb conditional instruction should be in IT block -- `orrpl r3,r3,r4,asl#14'
/tmp/ccR4oAiE.s:268: Error: thumb conditional instruction should be in IT block -- `movpl r2,r1'
/tmp/ccR4oAiE.s:270: Error: thumb conditional instruction should be in IT block -- `orrpl r3,r3,r4,asl#13'
/tmp/ccR4oAiE.s:271: Error: thumb conditional instruction should be in IT block -- `movpl r2,r1'
/tmp/ccR4oAiE.s:273: Error: thumb conditional instruction should be in IT block -- `orrpl r3,r3,r4,asl#12'
/tmp/ccR4oAiE.s:274: Error: thumb conditional instruction should be in IT block -- `movpl r2,r1'
/tmp/ccR4oAiE.s:276: Error: thumb conditional instruction should be in IT block -- `orrpl r3,r3,r4,asl#11'
/tmp/ccR4oAiE.s:277: Error: thumb conditional instruction should be in IT block -- `movpl r2,r1'
/tmp/ccR4oAiE.s:279: Error: thumb conditional instruction should be in IT block -- `orrpl r3,r3,r4,asl#10'
/tmp/ccR4oAiE.s:280: Error: thumb conditional instruction should be in IT block -- `movpl r2,r1'
/tmp/ccR4oAiE.s:282: Error: thumb conditional instruction should be in IT block -- `orrpl r3,r3,r4,asl#9'
/tmp/ccR4oAiE.s:283: Error: thumb conditional instruction should be in IT block -- `movpl r2,r1'
/tmp/ccR4oAiE.s:285: Error: thumb conditional instruction should be in IT block -- `orrpl r3,r3,r4,asl#8'
/tmp/ccR4oAiE.s:286: Error: thumb conditional instruction should be in IT block -- `movpl r2,r1'
/tmp/ccR4oAiE.s:288: Error: thumb conditional instruction should be in IT block -- `orrpl r3,r3,r4,asl#7'
/tmp/ccR4oAiE.s:289: Error: thumb conditional instruction should be in IT block -- `movpl r2,r1'
[...]

You can reproduce with:

BR2_arm=y
BR2_cortex_a8=y
BR2_ARM_EABI=y
BR2_ARM_INSTRUCTIONS_THUMB2=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_SPEEX=y
# BR2_TARGET_ROOTFS_TAR is not set

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
